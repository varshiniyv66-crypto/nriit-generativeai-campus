-- ============================================================
-- SMART DUPLICATE ANALYSIS - KEEPS BETTER DATA
-- EXCLUDES: Y V RAGHAVA RAO (has valid dual roles)
-- Run this in Supabase SQL Editor
-- ============================================================

WITH all_faculty AS (
    SELECT 
        id,
        employee_id,
        first_name,
        last_name,
        first_name || ' ' || last_name as full_name,
        UPPER(REGEXP_REPLACE(REGEXP_REPLACE(TRIM(first_name || ' ' || last_name), '\.', '', 'g'), '\s+', ' ', 'g')) as normalized_name,
        designation,
        qualification,
        pan_number,
        date_of_joining,
        created_at,
        updated_at
    FROM faculty_profiles
    WHERE is_active = true
),

duplicate_pans AS (
    SELECT pan_number
    FROM all_faculty
    WHERE pan_number IS NOT NULL AND pan_number != ''
    GROUP BY pan_number
    HAVING COUNT(*) > 1
),

duplicate_names AS (
    SELECT normalized_name
    FROM all_faculty
    -- EXCLUDE Y V RAGHAVA RAO from name duplicates (valid dual roles)
    WHERE normalized_name != 'Y V RAGHAVA RAO'
    GROUP BY normalized_name
    HAVING COUNT(*) > 1
),

all_duplicates AS (
    SELECT 
        f.*,
        CASE WHEN f.pan_number IN (SELECT pan_number FROM duplicate_pans) THEN 'PAN' ELSE NULL END as dup_by_pan,
        CASE WHEN f.normalized_name IN (SELECT normalized_name FROM duplicate_names) THEN 'NAME' ELSE NULL END as dup_by_name
    FROM all_faculty f
    WHERE (f.pan_number IN (SELECT pan_number FROM duplicate_pans)
       OR f.normalized_name IN (SELECT normalized_name FROM duplicate_names))
       -- EXCLUDE Y V RAGHAVA RAO
       AND f.normalized_name != 'Y V RAGHAVA RAO'
),

ranked_duplicates AS (
    SELECT 
        d.*,
        COALESCE(dup_by_pan, '') || CASE WHEN dup_by_pan IS NOT NULL AND dup_by_name IS NOT NULL THEN '+' ELSE '' END || COALESCE(dup_by_name, '') as duplicate_type,
        COALESCE(
            CASE WHEN dup_by_pan IS NOT NULL THEN pan_number ELSE NULL END,
            normalized_name
        ) as group_key,
        -- SMART RANKING: Keep BEST DATA first
        ROW_NUMBER() OVER (
            PARTITION BY COALESCE(
                CASE WHEN pan_number IN (SELECT pan_number FROM duplicate_pans) THEN pan_number ELSE NULL END,
                normalized_name
            )
            ORDER BY 
                -- Priority 1: HIGHER DESIGNATION
                CASE 
                    WHEN designation ILIKE '%Dean%' THEN 1
                    WHEN designation = 'Professor' THEN 2
                    WHEN designation ILIKE '%Associate Professor%' THEN 3
                    WHEN designation ILIKE '%Assistant Professor%' THEN 4
                    ELSE 5
                END ASC,
                -- Priority 2: Ph.D > M.Tech
                CASE 
                    WHEN qualification ILIKE '%Ph.D%' OR qualification ILIKE '%PhD%' THEN 1
                    WHEN qualification ILIKE '%M.Tech%' THEN 2
                    ELSE 3
                END ASC,
                -- Priority 3: HAS PAN NUMBER
                CASE WHEN pan_number IS NOT NULL AND pan_number != '' THEN 0 ELSE 1 END ASC,
                -- Priority 4: HAS JOIN DATE
                CASE WHEN date_of_joining IS NOT NULL THEN 0 ELSE 1 END ASC,
                -- Priority 5: OLDER record
                date_of_joining ASC NULLS LAST,
                -- Priority 6: Created earlier
                created_at ASC NULLS LAST
        ) as rank_order
    FROM all_duplicates d
)

SELECT 
    CASE WHEN rank_order = 1 THEN '✅ KEEP' ELSE '❌ DELETE' END as action,
    duplicate_type as dup_type,
    group_key,
    employee_id,
    full_name,
    designation,
    qualification,
    pan_number,
    date_of_joining::date as join_date,
    created_at::date as created_date
FROM ranked_duplicates
ORDER BY group_key, rank_order;


-- ============================================================
-- NOTE: Y V RAGHAVA RAO is EXCLUDED (has valid dual roles):
--   - DEAN001: Dean & Professor
--   - cse-3: Associate Professor
-- Both records are KEPT intentionally.
-- ============================================================
