-- ===========================================
-- COMPLETE DATABASE INVENTORY
-- ===========================================
-- Run this to see EVERYTHING in your Supabase database
-- ===========================================

-- 1. TABLE COUNTS - See how many records in each table
SELECT 
    'users' as table_name, 
    COUNT(*) as total_records,
    COUNT(*) FILTER (WHERE is_active = true) as active_records
FROM users
UNION ALL
SELECT 'faculty_profiles', COUNT(*), COUNT(*) FILTER (WHERE is_active = true) FROM faculty_profiles
UNION ALL
SELECT 'student_profiles', COUNT(*), COUNT(*) FILTER (WHERE is_active = true) FROM student_profiles
UNION ALL
SELECT 'departments', COUNT(*), COUNT(*) FILTER (WHERE is_active = true) FROM departments
UNION ALL
SELECT 'courses', COUNT(*), COUNT(*) FILTER (WHERE is_active = true) FROM courses
UNION ALL
SELECT 'timetable', COUNT(*), NULL FROM timetable
UNION ALL
SELECT 'class_sections', COUNT(*), COUNT(*) FILTER (WHERE is_active = true) FROM class_sections
UNION ALL
SELECT 'period_attendance', COUNT(*), NULL FROM period_attendance
UNION ALL
SELECT 'fee_transactions', COUNT(*), NULL FROM fee_transactions
UNION ALL
SELECT 'internal_marks', COUNT(*), NULL FROM internal_marks
UNION ALL
SELECT 'external_marks', COUNT(*), NULL FROM external_marks
ORDER BY total_records DESC;

-- ===========================================
-- 2. FACULTY DETAILS - All faculty members
-- ===========================================
SELECT 
    '=== FACULTY MEMBERS ===' as info;

SELECT 
    employee_id,
    first_name || ' ' || last_name as full_name,
    email,
    dept_code,
    designation,
    phone,
    is_active,
    date_of_joining
FROM faculty_profiles
ORDER BY employee_id;

-- ===========================================
-- 3. STUDENT DETAILS - All students
-- ===========================================
SELECT 
    '=== STUDENTS ===' as info;

SELECT 
    roll_number,
    first_name || ' ' || last_name as full_name,
    email,
    dept_code,
    current_semester,
    section,
    phone,
    is_active,
    admission_date
FROM student_profiles
ORDER BY dept_code, roll_number;

-- ===========================================
-- 4. DEPARTMENTS - All departments
-- ===========================================
SELECT 
    '=== DEPARTMENTS ===' as info;

SELECT 
    code,
    name,
    short_name,
    established_year,
    is_active
FROM departments
ORDER BY code;

-- ===========================================
-- 5. COURSES - All courses
-- ===========================================
SELECT 
    '=== COURSES ===' as info;

SELECT 
    course_code,
    course_name,
    dept_code,
    semester,
    credits,
    course_type,
    is_active
FROM courses
ORDER BY dept_code, semester, course_code
LIMIT 20;

-- ===========================================
-- 6. TIMETABLE - Class schedule
-- ===========================================
SELECT 
    '=== TIMETABLE ===' as info;

SELECT 
    t.day_of_week,
    t.period_number,
    c.course_code,
    c.course_name,
    f.employee_id as faculty_id,
    f.first_name || ' ' || f.last_name as faculty_name,
    t.room_number,
    cs.section
FROM timetable t
LEFT JOIN courses c ON t.course_id = c.id
LEFT JOIN faculty_profiles f ON t.faculty_id = f.id
LEFT JOIN class_sections cs ON t.class_section_id = cs.id
ORDER BY t.day_of_week, t.period_number
LIMIT 20;

-- ===========================================
-- 7. USERS TABLE - Auth users
-- ===========================================
SELECT 
    '=== USERS (Auth) ===' as info;

SELECT 
    email,
    role,
    is_active,
    email_verified,
    phone_verified,
    last_login,
    created_at
FROM users
ORDER BY role, email;

-- ===========================================
-- 8. ACADEMIC BATCHES
-- ===========================================
SELECT 
    '=== ACADEMIC BATCHES ===' as info;

SELECT 
    batch_year,
    batch_name,
    start_date,
    end_date,
    is_current
FROM academic_batches
ORDER BY batch_year DESC;

-- ===========================================
-- 9. SUMMARY STATISTICS
-- ===========================================
SELECT 
    '=== SUMMARY STATISTICS ===' as info;

SELECT 
    'Total Faculty' as metric,
    COUNT(*)::text as value
FROM faculty_profiles WHERE is_active = true
UNION ALL
SELECT 'Total Students', COUNT(*)::text FROM student_profiles WHERE is_active = true
UNION ALL
SELECT 'Total Courses', COUNT(*)::text FROM courses WHERE is_active = true
UNION ALL
SELECT 'Departments', COUNT(*)::text FROM departments WHERE is_active = true
UNION ALL
SELECT 'Timetable Entries', COUNT(*)::text FROM timetable
UNION ALL
SELECT 'Attendance Records', COUNT(*)::text FROM period_attendance
UNION ALL
SELECT 'Fee Transactions', COUNT(*)::text FROM fee_transactions
UNION ALL
SELECT 'Internal Marks', COUNT(*)::text FROM internal_marks
UNION ALL
SELECT 'External Marks', COUNT(*)::text FROM external_marks;

-- ===========================================
-- 10. DEPARTMENT-WISE BREAKDOWN
-- ===========================================
SELECT 
    '=== DEPARTMENT-WISE BREAKDOWN ===' as info;

SELECT 
    d.code as dept_code,
    d.name as dept_name,
    COUNT(DISTINCT f.id) as faculty_count,
    COUNT(DISTINCT s.id) as student_count,
    COUNT(DISTINCT c.id) as course_count
FROM departments d
LEFT JOIN faculty_profiles f ON d.code = f.dept_code AND f.is_active = true
LEFT JOIN student_profiles s ON d.code = s.dept_code AND s.is_active = true
LEFT JOIN courses c ON d.code = c.dept_code AND c.is_active = true
GROUP BY d.code, d.name
ORDER BY d.code;

-- ===========================================
-- DONE! Check all results above
-- ===========================================
