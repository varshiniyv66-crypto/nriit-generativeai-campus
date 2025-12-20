-- ============================================================
-- VIEW ONLY: Same Name+PAN duplicates AND Same PAN different Name
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
        date_of_joining
    FROM faculty_profiles
    WHERE is_active = true
      AND pan_number IS NOT NULL 
      AND pan_number != ''
),

-- Find PANs that appear more than once
duplicate_pans AS (
    SELECT pan_number
    FROM all_faculty
    GROUP BY pan_number
    HAVING COUNT(*) > 1
)

-- Show all records with duplicate PANs
SELECT 
    f.pan_number,
    f.employee_id,
    f.full_name,
    f.normalized_name,
    f.designation,
    f.qualification,
    f.date_of_joining::date as join_date,
    -- Check if name is also same
    CASE 
        WHEN COUNT(*) OVER (PARTITION BY f.pan_number, f.normalized_name) > 1 
        THEN '🟢 SAME NAME + SAME PAN'
        ELSE '🔴 SAME PAN, DIFFERENT NAME'
    END as duplicate_type
FROM all_faculty f
WHERE f.pan_number IN (SELECT pan_number FROM duplicate_pans)
ORDER BY 
    -- Show "Different Name" first (more concerning)
    CASE 
        WHEN COUNT(*) OVER (PARTITION BY f.pan_number, f.normalized_name) > 1 THEN 2
        ELSE 1 
    END,
    f.pan_number,
    f.full_name;
