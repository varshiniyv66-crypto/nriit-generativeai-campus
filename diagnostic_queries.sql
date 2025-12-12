-- ===========================================
-- DIAGNOSTIC QUERIES - Check Current State
-- ===========================================
-- Run this in Supabase SQL Editor to see current status
-- ===========================================

-- 1. Check if tables exist
SELECT 
    schemaname,
    tablename,
    rowsecurity as rls_enabled
FROM pg_tables 
WHERE schemaname = 'public'
AND tablename IN ('users', 'faculty_profiles', 'student_profiles', 'courses', 'timetable')
ORDER BY tablename;

-- 2. Check data counts
SELECT 
    'users' as table_name, COUNT(*) as record_count FROM users
UNION ALL
SELECT 'faculty_profiles', COUNT(*) FROM faculty_profiles
UNION ALL
SELECT 'student_profiles', COUNT(*) FROM student_profiles
UNION ALL
SELECT 'courses', COUNT(*) FROM courses
UNION ALL
SELECT 'timetable', COUNT(*) FROM timetable
UNION ALL
SELECT 'departments', COUNT(*) FROM departments
UNION ALL
SELECT 'period_attendance', COUNT(*) FROM period_attendance
UNION ALL
SELECT 'fee_transactions', COUNT(*) FROM fee_transactions;

-- 3. Check faculty data
SELECT 
    employee_id,
    first_name || ' ' || last_name as name,
    email,
    dept_code,
    designation,
    is_active
FROM faculty_profiles
ORDER BY employee_id;

-- 4. Check student data (first 10)
SELECT 
    roll_number,
    first_name || ' ' || last_name as name,
    email,
    dept_code,
    current_semester,
    section,
    is_active
FROM student_profiles
ORDER BY roll_number
LIMIT 10;

-- 5. Check courses
SELECT 
    course_code,
    course_name,
    dept_code,
    semester,
    credits,
    is_active
FROM courses
ORDER BY dept_code, semester, course_code
LIMIT 10;

-- 6. Check timetable
SELECT 
    t.day_of_week,
    t.period_number,
    c.course_code,
    c.course_name,
    f.employee_id,
    f.first_name || ' ' || f.last_name as faculty_name,
    t.room_number
FROM timetable t
LEFT JOIN courses c ON t.course_id = c.id
LEFT JOIN faculty_profiles f ON t.faculty_id = f.id
ORDER BY t.day_of_week, t.period_number
LIMIT 10;

-- 7. Check RLS policies
SELECT 
    schemaname,
    tablename,
    policyname,
    permissive,
    roles,
    cmd
FROM pg_policies
WHERE schemaname = 'public'
ORDER BY tablename, policyname;

-- 8. Check if departments are populated
SELECT 
    code,
    name,
    short_name,
    is_active
FROM departments
ORDER BY code;

-- ===========================================
-- EXPECTED RESULTS:
-- ===========================================
-- Table 1: Should show RLS status (true/false)
-- Table 2: Should show counts for each table
--   - faculty_profiles: 2
--   - student_profiles: ~20
--   - courses: depends on seed
--   - timetable: depends on seed
-- Table 3: Should list FAC001, FAC002
-- Table 4: Should list students starting with 24CSE001
-- Table 5: Should list courses if seeded
-- Table 6: Should show timetable entries if seeded
-- Table 7: Should list RLS policies (or empty if disabled)
-- Table 8: Should list departments
