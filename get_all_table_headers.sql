-- ============================================
-- GET ALL TABLE HEADERS (COLUMN NAMES)
-- ============================================
-- This shows all column names for all tables
-- Perfect for planning data import templates!
-- ============================================

-- Query 1: All columns for all tables (organized by table)
SELECT 
    table_name,
    column_name,
    data_type,
    character_maximum_length,
    is_nullable,
    column_default
FROM information_schema.columns
WHERE table_schema = 'public'
ORDER BY table_name, ordinal_position;

-- Query 2: Column names only (comma-separated per table)
SELECT 
    table_name,
    string_agg(column_name, ', ' ORDER BY ordinal_position) as columns
FROM information_schema.columns
WHERE table_schema = 'public'
GROUP BY table_name
ORDER BY table_name;

-- Query 3: Specific important tables with all columns
-- DEPARTMENTS
SELECT 'DEPARTMENTS' as table_name, column_name, data_type
FROM information_schema.columns
WHERE table_schema = 'public' AND table_name = 'departments'
ORDER BY ordinal_position;

-- FACULTY_PROFILES
SELECT 'FACULTY_PROFILES' as table_name, column_name, data_type
FROM information_schema.columns
WHERE table_schema = 'public' AND table_name = 'faculty_profiles'
ORDER BY ordinal_position;

-- STUDENT_PROFILES
SELECT 'STUDENT_PROFILES' as table_name, column_name, data_type
FROM information_schema.columns
WHERE table_schema = 'public' AND table_name = 'student_profiles'
ORDER BY ordinal_position;

-- COURSES
SELECT 'COURSES' as table_name, column_name, data_type
FROM information_schema.columns
WHERE table_schema = 'public' AND table_name = 'courses'
ORDER BY ordinal_position;

-- TIMETABLE
SELECT 'TIMETABLE' as table_name, column_name, data_type
FROM information_schema.columns
WHERE table_schema = 'public' AND table_name = 'timetable'
ORDER BY ordinal_position;

-- PERIOD_ATTENDANCE
SELECT 'PERIOD_ATTENDANCE' as table_name, column_name, data_type
FROM information_schema.columns
WHERE table_schema = 'public' AND table_name = 'period_attendance'
ORDER BY ordinal_position;

-- INTERNAL_MARKS
SELECT 'INTERNAL_MARKS' as table_name, column_name, data_type
FROM information_schema.columns
WHERE table_schema = 'public' AND table_name = 'internal_marks'
ORDER BY ordinal_position;

-- Query 4: Export-friendly format (CSV-ready)
SELECT 
    table_name || ',' || string_agg(column_name, ',' ORDER BY ordinal_position) as csv_header
FROM information_schema.columns
WHERE table_schema = 'public'
GROUP BY table_name
ORDER BY table_name;
