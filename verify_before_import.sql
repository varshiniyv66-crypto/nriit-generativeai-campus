-- ===========================================
-- PRE-IMPORT VERIFICATION SCRIPT
-- Run this BEFORE importing to check current state
-- ===========================================

-- 1. Current table counts
SELECT 'CURRENT DATABASE STATE' as title, '' as count;
SELECT '------------------------' as title, '' as count;

SELECT 'departments' as table_name, COUNT(*)::text as count FROM departments
UNION ALL SELECT 'users', COUNT(*)::text FROM users
UNION ALL SELECT 'student_profiles', COUNT(*)::text FROM student_profiles
UNION ALL SELECT 'faculty_profiles', COUNT(*)::text FROM faculty_profiles
UNION ALL SELECT 'academic_batches', COUNT(*)::text FROM academic_batches
UNION ALL SELECT 'courses', COUNT(*)::text FROM courses
UNION ALL SELECT 'timetable', COUNT(*)::text FROM timetable
UNION ALL SELECT 'period_attendance', COUNT(*)::text FROM period_attendance
UNION ALL SELECT 'internal_marks', COUNT(*)::text FROM internal_marks;

-- 2. Check existing departments
SELECT '' as spacer, '' as count;
SELECT 'EXISTING DEPARTMENTS' as title, '' as count;
SELECT code, name FROM departments ORDER BY code;

-- 3. Check existing students by department
SELECT '' as spacer, '' as count;
SELECT 'STUDENTS BY DEPARTMENT' as title, '' as count;
SELECT dept_code, COUNT(*) as student_count 
FROM student_profiles 
GROUP BY dept_code 
ORDER BY student_count DESC;

-- 4. Check existing batches
SELECT '' as spacer, '' as count;
SELECT 'EXISTING BATCHES' as title, '' as count;
SELECT batch_year, batch_name, is_current FROM academic_batches ORDER BY batch_year DESC;
