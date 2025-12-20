-- STEP 1: View all PAN duplicates first (READ ONLY - safe to run)
-- ============================================================

SELECT 
    pan_number,
    COUNT(*) as duplicate_count,
    STRING_AGG(employee_id, ', ' ORDER BY date_of_joining DESC) as employee_ids,
    STRING_AGG(first_name || ' ' || last_name, ' | ' ORDER BY date_of_joining DESC) as names,
    STRING_AGG(designation, ' | ' ORDER BY date_of_joining DESC) as designations,
    STRING_AGG(TO_CHAR(date_of_joining, 'YYYY-MM-DD'), ' | ' ORDER BY date_of_joining DESC) as join_dates
FROM faculty_profiles
WHERE pan_number IS NOT NULL AND is_active = true
GROUP BY pan_number
HAVING COUNT(*) > 1
ORDER BY duplicate_count DESC;

-- STEP 2: For each duplicate PAN, identify which record to KEEP and which to DELETE
-- ==================================================================================

-- Create a temporary view to decide which records to keep
-- Priority: Dean & Professor > Professor > Associate Professor > Assistant Professor
-- Then by most recent join date

WITH ranked_faculty AS (
    SELECT 
        id,
        employee_id,
        first_name,
        last_name,
        designation,
        pan_number,
        date_of_joining,
        CASE 
            WHEN designation ILIKE '%Dean%' THEN 1
            WHEN designation ILIKE '%Professor%' AND designation NOT ILIKE '%Assistant%' AND designation NOT ILIKE '%Associate%' THEN 2
            WHEN designation ILIKE '%Associate%' THEN 3
            WHEN designation ILIKE '%Assistant%' THEN 4
            ELSE 5
        END as designation_rank,
        ROW_NUMBER() OVER (
            PARTITION BY pan_number 
            ORDER BY 
                CASE 
                    WHEN designation ILIKE '%Dean%' THEN 1
                    WHEN designation ILIKE '%Professor%' AND designation NOT ILIKE '%Assistant%' AND designation NOT ILIKE '%Associate%' THEN 2
                    WHEN designation ILIKE '%Associate%' THEN 3
                    WHEN designation ILIKE '%Assistant%' THEN 4
                    ELSE 5
                END,
                date_of_joining DESC
        ) as keep_rank
    FROM faculty_profiles
    WHERE pan_number IS NOT NULL AND is_active = true
)
SELECT 
    pan_number,
    id,
    employee_id,
    first_name || ' ' || last_name as full_name,
    designation,
    date_of_joining,
    CASE WHEN keep_rank = 1 THEN '✅ KEEP' ELSE '❌ DELETE' END as action
FROM ranked_faculty
WHERE pan_number IN (
    SELECT pan_number FROM faculty_profiles 
    WHERE pan_number IS NOT NULL AND is_active = true
    GROUP BY pan_number HAVING COUNT(*) > 1
)
ORDER BY pan_number, keep_rank;

-- STEP 3: DELETE DUPLICATES (CAREFUL - This modifies data!)
-- =========================================================
-- Run this ONLY after reviewing Step 2 output

/*
-- Option A: Soft delete (set is_active = false) - SAFER
WITH duplicates_to_delete AS (
    SELECT id
    FROM (
        SELECT 
            id,
            pan_number,
            ROW_NUMBER() OVER (
                PARTITION BY pan_number 
                ORDER BY 
                    CASE 
                        WHEN designation ILIKE '%Dean%' THEN 1
                        WHEN designation ILIKE '%Professor%' AND designation NOT ILIKE '%Assistant%' AND designation NOT ILIKE '%Associate%' THEN 2
                        WHEN designation ILIKE '%Associate%' THEN 3
                        WHEN designation ILIKE '%Assistant%' THEN 4
                        ELSE 5
                    END,
                    date_of_joining DESC
            ) as keep_rank
        FROM faculty_profiles
        WHERE pan_number IS NOT NULL AND is_active = true
    ) ranked
    WHERE keep_rank > 1
    AND pan_number IN (
        SELECT pan_number FROM faculty_profiles 
        WHERE pan_number IS NOT NULL AND is_active = true
        GROUP BY pan_number HAVING COUNT(*) > 1
    )
)
UPDATE faculty_profiles
SET is_active = false, updated_at = NOW()
WHERE id IN (SELECT id FROM duplicates_to_delete);
*/

/*
-- Option B: Hard delete (permanent) - USE WITH CAUTION
WITH duplicates_to_delete AS (
    SELECT id
    FROM (
        SELECT 
            id,
            pan_number,
            ROW_NUMBER() OVER (
                PARTITION BY pan_number 
                ORDER BY 
                    CASE 
                        WHEN designation ILIKE '%Dean%' THEN 1
                        WHEN designation ILIKE '%Professor%' AND designation NOT ILIKE '%Assistant%' AND designation NOT ILIKE '%Associate%' THEN 2
                        WHEN designation ILIKE '%Associate%' THEN 3
                        WHEN designation ILIKE '%Assistant%' THEN 4
                        ELSE 5
                    END,
                    date_of_joining DESC
            ) as keep_rank
        FROM faculty_profiles
        WHERE pan_number IS NOT NULL AND is_active = true
    ) ranked
    WHERE keep_rank > 1
    AND pan_number IN (
        SELECT pan_number FROM faculty_profiles 
        WHERE pan_number IS NOT NULL AND is_active = true
        GROUP BY pan_number HAVING COUNT(*) > 1
    )
)
DELETE FROM faculty_profiles
WHERE id IN (SELECT id FROM duplicates_to_delete);
*/

-- STEP 4: Verify cleanup
-- ======================

-- After running Step 3, run this to verify no more duplicates
SELECT 
    pan_number,
    COUNT(*) as count
FROM faculty_profiles
WHERE pan_number IS NOT NULL AND is_active = true
GROUP BY pan_number
HAVING COUNT(*) > 1;

-- Expected result: 0 rows (no duplicates)
