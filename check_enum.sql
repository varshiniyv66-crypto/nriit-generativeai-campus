-- Check what values are allowed in the department_code enum
-- Run in Supabase SQL Editor

-- 1. Check the enum values
SELECT enumlabel AS allowed_value
FROM pg_enum e
JOIN pg_type t ON e.enumtypid = t.oid
WHERE t.typname = 'department_code'
ORDER BY enumsortorder;

-- 2. Alternative: Check what dept_codes exist in fee_master
SELECT DISTINCT dept_code FROM fee_master ORDER BY dept_code;

-- 3. Check what dept_codes exist in student_profiles
SELECT DISTINCT dept_code FROM student_profiles ORDER BY dept_code;
