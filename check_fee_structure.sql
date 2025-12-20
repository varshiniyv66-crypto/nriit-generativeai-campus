-- Check fee data structure
-- Run in Supabase SQL Editor

-- 1. Check student_profiles columns
SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'student_profiles'
ORDER BY ordinal_position;

-- 2. Check fee_master data
SELECT * FROM fee_master LIMIT 10;

-- 3. Check fee_transactions data
SELECT * FROM fee_transactions LIMIT 10;

-- 4. Sample student
SELECT id, roll_number, dept_code
FROM student_profiles 
WHERE is_active = true
LIMIT 5;
