-- ============================================================
-- CHECK FOR NAME DUPLICATES (Same Full Name)
-- Run this in Supabase SQL Editor
-- ============================================================

-- Find all records where the same name appears more than once
WITH faculty_names AS (
    SELECT 
        employee_id,
        first_name || ' ' || last_name as full_name,
        -- Normalized: uppercase, no dots, single spaces
        UPPER(REGEXP_REPLACE(REGEXP_REPLACE(TRIM(first_name || ' ' || last_name), '\.', '', 'g'), '\s+', ' ', 'g')) as normalized_name,
        designation,
        pan_number,
        date_of_joining
    FROM faculty_profiles
    WHERE is_active = true
),
duplicate_names AS (
    SELECT normalized_name
    FROM faculty_names
    GROUP BY normalized_name
    HAVING COUNT(*) > 1
)
SELECT 
    f.normalized_name,
    f.employee_id,
    f.full_name,
    f.designation,
    f.pan_number,
    f.date_of_joining::date as join_date
FROM faculty_names f
WHERE f.normalized_name IN (SELECT normalized_name FROM duplicate_names)
ORDER BY f.normalized_name, f.employee_id;
