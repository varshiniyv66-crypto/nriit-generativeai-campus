-- ============================================================
-- COMPLETE DUPLICATE NAME ANALYSIS FOR ALL FACULTY
-- Finds faculty with same/similar names (ignoring case, dots, spaces)
-- Run this in Supabase SQL Editor
-- ============================================================

-- STEP 1: Find all duplicate NAMES and show KEEP/DELETE decision
WITH normalized_names AS (
    -- Normalize names: uppercase, remove dots, extra spaces
    SELECT 
        id,
        employee_id,
        first_name,
        last_name,
        first_name || ' ' || last_name as full_name,
        -- Normalized name for comparison (uppercase, no dots, single spaces)
        UPPER(
            REGEXP_REPLACE(
                REGEXP_REPLACE(
                    TRIM(first_name || ' ' || last_name),
                    '\.', '', 'g'  -- Remove dots
                ),
                '\s+', ' ', 'g'  -- Single spaces
            )
        ) as normalized_name,
        designation,
        qualification,
        pan_number,
        date_of_joining,
        email
    FROM faculty_profiles
    WHERE is_active = true
),
duplicate_names AS (
    -- Find all normalized names that appear more than once
    SELECT normalized_name
    FROM normalized_names
    GROUP BY normalized_name
    HAVING COUNT(*) > 1
),
faculty_with_rank AS (
    SELECT 
        n.*,
        -- Rank: 1 = Keep (best record), 2+ = Delete
        ROW_NUMBER() OVER (
            PARTITION BY n.normalized_name 
            ORDER BY 
                -- Priority 1: Higher designation wins
                CASE 
                    WHEN n.designation ILIKE '%Dean%' THEN 1
                    WHEN n.designation = 'Professor' THEN 2
                    WHEN n.designation ILIKE '%Associate Professor%' THEN 3
                    WHEN n.designation ILIKE '%Assistant Professor%' THEN 4
                    ELSE 5
                END ASC,
                -- Priority 2: Ph.D wins over M.Tech
                CASE 
                    WHEN n.qualification ILIKE '%Ph.D%' THEN 1
                    WHEN n.qualification ILIKE '%M.Tech%' THEN 2
                    ELSE 3
                END ASC,
                -- Priority 3: Has PAN number wins
                CASE WHEN n.pan_number IS NOT NULL AND n.pan_number != '' THEN 0 ELSE 1 END ASC,
                -- Priority 4: More recent join date wins
                n.date_of_joining DESC NULLS LAST,
                -- Priority 5: Newer employee_id format wins
                n.employee_id DESC
        ) as rank_order
    FROM normalized_names n
    WHERE n.normalized_name IN (SELECT normalized_name FROM duplicate_names)
)
SELECT 
    CASE 
        WHEN rank_order = 1 THEN '✅ KEEP' 
        ELSE '❌ DELETE' 
    END as action,
    normalized_name,
    employee_id,
    full_name as original_name,
    designation,
    qualification,
    pan_number,
    date_of_joining::date as join_date,
    rank_order
FROM faculty_with_rank
ORDER BY normalized_name, rank_order;


-- ============================================================
-- STEP 2: Summary - How many duplicates?
-- ============================================================
/*
SELECT 
    COUNT(DISTINCT normalized_name) as total_duplicate_names,
    SUM(CASE WHEN rank_order > 1 THEN 1 ELSE 0 END) as records_to_delete
FROM faculty_with_rank;
*/


-- ============================================================
-- STEP 3: DELETE NAME DUPLICATES (Run ONLY after review)
-- Uncomment when ready
-- ============================================================
/*
UPDATE faculty_profiles
SET is_active = false, 
    updated_at = NOW()
WHERE id IN (
    SELECT id FROM (
        WITH normalized_names AS (
            SELECT 
                id,
                UPPER(REGEXP_REPLACE(REGEXP_REPLACE(TRIM(first_name || ' ' || last_name), '\.', '', 'g'), '\s+', ' ', 'g')) as normalized_name,
                designation,
                qualification,
                pan_number,
                date_of_joining,
                employee_id
            FROM faculty_profiles
            WHERE is_active = true
        ),
        duplicate_names AS (
            SELECT normalized_name
            FROM normalized_names
            GROUP BY normalized_name
            HAVING COUNT(*) > 1
        )
        SELECT 
            id,
            ROW_NUMBER() OVER (
                PARTITION BY normalized_name 
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
                    CASE WHEN pan_number IS NOT NULL AND pan_number != '' THEN 0 ELSE 1 END ASC,
                    date_of_joining DESC NULLS LAST,
                    employee_id DESC
            ) as rank_order
        FROM normalized_names
        WHERE normalized_name IN (SELECT normalized_name FROM duplicate_names)
    ) ranked
    WHERE rank_order > 1
);
*/
