
-- =========================================================
-- DIAGNOSTIC: Check Attendance & Marks Table Columns
-- =========================================================

-- 1. Period Attendance Columns
SELECT 'period_attendance' as table_name, column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'period_attendance' 
ORDER BY ordinal_position;

-- 2. Internal Marks Columns
SELECT 'internal_marks' as table_name, column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'internal_marks' 
ORDER BY ordinal_position;

-- 3. External Marks Columns
SELECT 'external_marks' as table_name, column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'external_marks' 
ORDER BY ordinal_position;
