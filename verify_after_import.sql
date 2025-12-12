-- ===========================================
-- POST-IMPORT VERIFICATION SCRIPT
-- Run this AFTER importing to verify success
-- ===========================================

-- 1. Check table counts
SELECT 'POST-IMPORT DATABASE STATE' as title;
SELECT '----------------------------' as title;

SELECT 'departments' as table_name, COUNT(*) as count FROM departments
UNION ALL SELECT 'users', COUNT(*) FROM users
UNION ALL SELECT 'student_profiles', COUNT(*) FROM student_profiles
UNION ALL SELECT 'faculty_profiles', COUNT(*) FROM faculty_profiles
UNION ALL SELECT 'academic_batches', COUNT(*) FROM academic_batches;

-- 2. Students by department (should match expected counts)
SELECT 'STUDENTS BY DEPARTMENT' as title;
SELECT dept_code, COUNT(*) as student_count 
FROM student_profiles 
GROUP BY dept_code 
ORDER BY student_count DESC;

-- Expected counts:
-- CSE: 1034
-- ECE: 497
-- CSE-DS: 344
-- CSE-AI: 309
-- IT: 232
-- MBA: 177
-- MCA: 161
-- EVT: 117
-- CIVIL: 28

-- 3. Students by batch year
SELECT 'STUDENTS BY BATCH YEAR' as title;
SELECT 
  SUBSTRING(roll_number, 1, 2) as year_prefix,
  COUNT(*) as count
FROM student_profiles
GROUP BY SUBSTRING(roll_number, 1, 2)
ORDER BY year_prefix DESC;

-- 4. Check for any issues
SELECT 'POTENTIAL ISSUES' as title;

-- Students without user records
SELECT 'Students without users' as issue, COUNT(*) as count
FROM student_profiles sp
LEFT JOIN users u ON sp.user_id = u.id
WHERE u.id IS NULL;

-- Check for duplicate roll numbers
SELECT 'Duplicate roll numbers' as issue, 
  (SELECT COUNT(*) FROM (
    SELECT roll_number FROM student_profiles 
    GROUP BY roll_number HAVING COUNT(*) > 1
  ) as dups) as count;

-- 5. Sample student data
SELECT 'SAMPLE STUDENTS (first 5)' as title;
SELECT roll_number, first_name, last_name, dept_code, current_semester, section
FROM student_profiles
ORDER BY roll_number
LIMIT 5;

-- SUCCESS MESSAGE
SELECT '✅ IMPORT VERIFICATION COMPLETE' as status;
