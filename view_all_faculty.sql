-- ============================================================
-- VIEW ALL FACULTY WITH NAMES, IDs, AND PAN NUMBERS
-- Shows duplicates clearly marked
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
        created_at
    FROM faculty_profiles
    WHERE is_active = true
),

-- Find names that appear more than once
name_counts AS (
    SELECT 
        normalized_name,
        COUNT(*) as name_count
    FROM all_faculty
    GROUP BY normalized_name
),

-- Find PANs that appear more than once
pan_counts AS (
    SELECT 
        pan_number,
        COUNT(*) as pan_count
    FROM all_faculty
    WHERE pan_number IS NOT NULL AND pan_number != ''
    GROUP BY pan_number
)

SELECT 
    f.employee_id,
    f.full_name,
    f.designation,
    f.qualification,
    f.pan_number,
    f.date_of_joining::date as join_date,
    -- Mark duplicates
    CASE 
        WHEN nc.name_count > 1 AND pc.pan_count > 1 THEN '⚠️ DUP NAME+PAN'
        WHEN nc.name_count > 1 THEN '⚠️ DUP NAME'
        WHEN pc.pan_count > 1 THEN '⚠️ DUP PAN'
        ELSE '✅ OK'
    END as status,
    f.created_at::date as created_date
FROM all_faculty f
LEFT JOIN name_counts nc ON f.normalized_name = nc.normalized_name
LEFT JOIN pan_counts pc ON f.pan_number = pc.pan_number
ORDER BY 
    -- Show duplicates first
    CASE 
        WHEN nc.name_count > 1 OR pc.pan_count > 1 THEN 0 
        ELSE 1 
    END,
    f.normalized_name,
    f.employee_id;
