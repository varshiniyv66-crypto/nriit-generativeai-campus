-- ============================================================
-- COMPLETE DUPLICATE PAN ANALYSIS FOR ALL FACULTY
-- Run this in Supabase SQL Editor
-- ============================================================

-- STEP 1: Find all duplicate PANs and show KEEP/DELETE decision
WITH duplicate_pans AS (
    -- First, find all PAN numbers that appear more than once
    SELECT pan_number
    FROM faculty_profiles 
    WHERE pan_number IS NOT NULL 
      AND pan_number != ''
      AND is_active = true
    GROUP BY pan_number 
    HAVING COUNT(*) > 1
),
faculty_with_rank AS (
    SELECT 
        fp.id,
        fp.employee_id,
        fp.first_name,
        fp.last_name,
        fp.first_name || ' ' || fp.last_name as full_name,
        fp.designation,
        fp.qualification,
        fp.pan_number,
        fp.date_of_joining,
        fp.email,
        -- Rank: 1 = Keep (best record), 2+ = Delete
        ROW_NUMBER() OVER (
            PARTITION BY fp.pan_number 
            ORDER BY 
                -- Priority 1: Higher designation wins
                CASE 
                    WHEN fp.designation ILIKE '%Dean%' THEN 1
                    WHEN fp.designation = 'Professor' THEN 2
                    WHEN fp.designation ILIKE '%Associate Professor%' THEN 3
                    WHEN fp.designation ILIKE '%Assistant Professor%' THEN 4
                    ELSE 5
                END ASC,
                -- Priority 2: Ph.D wins over M.Tech
                CASE 
                    WHEN fp.qualification ILIKE '%Ph.D%' THEN 1
                    WHEN fp.qualification ILIKE '%M.Tech%' THEN 2
                    ELSE 3
                END ASC,
                -- Priority 3: More recent join date wins
                fp.date_of_joining DESC NULLS LAST,
                -- Priority 4: Newer employee_id format wins
                fp.employee_id DESC
        ) as rank_order
    FROM faculty_profiles fp
    WHERE fp.pan_number IS NOT NULL 
      AND fp.pan_number != ''
      AND fp.is_active = true
      AND fp.pan_number IN (SELECT pan_number FROM duplicate_pans)
)
SELECT 
    CASE 
        WHEN rank_order = 1 THEN '✅ KEEP' 
        ELSE '❌ DELETE' 
    END as action,
    pan_number,
    employee_id,
    full_name,
    designation,
    qualification,
    date_of_joining::date as join_date,
    rank_order
FROM faculty_with_rank
ORDER BY pan_number, rank_order;


-- ============================================================
-- STEP 2: Summary Statistics
-- ============================================================
/*
SELECT 
    'Total Duplicate PANs' as metric,
    COUNT(DISTINCT pan_number) as count
FROM faculty_profiles 
WHERE pan_number IS NOT NULL 
  AND pan_number != ''
  AND is_active = true
  AND pan_number IN (
      SELECT pan_number
      FROM faculty_profiles 
      WHERE pan_number IS NOT NULL AND is_active = true
      GROUP BY pan_number 
      HAVING COUNT(*) > 1
  )
UNION ALL
SELECT 
    'Records to Delete' as metric,
    COUNT(*) as count
FROM (
    SELECT ROW_NUMBER() OVER (PARTITION BY pan_number ORDER BY date_of_joining DESC) as rn
    FROM faculty_profiles 
    WHERE pan_number IS NOT NULL 
      AND pan_number != ''
      AND is_active = true
      AND pan_number IN (
          SELECT pan_number
          FROM faculty_profiles 
          WHERE pan_number IS NOT NULL AND is_active = true
          GROUP BY pan_number 
          HAVING COUNT(*) > 1
      )
) x
WHERE rn > 1;
*/


-- ============================================================
-- STEP 3: DELETE DUPLICATES (Run ONLY after reviewing Step 1)
-- Uncomment the query below when ready to delete
-- ============================================================
/*
-- Soft Delete (Recommended - sets is_active = false)
UPDATE faculty_profiles
SET is_active = false, 
    updated_at = NOW()
WHERE id IN (
    SELECT id FROM (
        SELECT 
            id,
            pan_number,
            ROW_NUMBER() OVER (
                PARTITION BY pan_number 
                ORDER BY 
                    CASE 
                        WHEN designation ILIKE '%Dean%' THEN 1
                        WHEN designation = 'Professor' THEN 2
                        WHEN designation ILIKE '%Associate Professor%' THEN 3
                        WHEN designation ILIKE '%Assistant Professor%' THEN 4
                        ELSE 5
                    END ASC,
                    CASE 
                        WHEN qualification ILIKE '%Ph.D%' THEN 1
                        WHEN qualification ILIKE '%M.Tech%' THEN 2
                        ELSE 3
                    END ASC,
                    date_of_joining DESC NULLS LAST,
                    employee_id DESC
            ) as rank_order
        FROM faculty_profiles
        WHERE pan_number IS NOT NULL 
          AND pan_number != ''
          AND is_active = true
          AND pan_number IN (
              SELECT pan_number
              FROM faculty_profiles 
              WHERE pan_number IS NOT NULL AND is_active = true
              GROUP BY pan_number 
              HAVING COUNT(*) > 1
          )
    ) ranked
    WHERE rank_order > 1
);
*/


-- ============================================================
-- STEP 4: Verify No Duplicates Remain
-- ============================================================
/*
SELECT pan_number, COUNT(*) as count
FROM faculty_profiles
WHERE pan_number IS NOT NULL 
  AND pan_number != ''
  AND is_active = true
GROUP BY pan_number
HAVING COUNT(*) > 1;
-- Expected: 0 rows
*/
