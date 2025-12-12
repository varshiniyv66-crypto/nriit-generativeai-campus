-- ===========================================
-- FIX RLS POLICIES FOR DEVELOPMENT (CORRECTED)
-- ===========================================
-- This file temporarily disables RLS for development
-- Only includes tables that actually exist in the schema
-- ===========================================

-- Disable RLS on all existing tables

-- Core tables
ALTER TABLE users DISABLE ROW LEVEL SECURITY;
ALTER TABLE firebase_user_mapping DISABLE ROW LEVEL SECURITY;
ALTER TABLE departments DISABLE ROW LEVEL SECURITY;
ALTER TABLE department_peos DISABLE ROW LEVEL SECURITY;
ALTER TABLE department_psos DISABLE ROW LEVEL SECURITY;
ALTER TABLE program_outcomes DISABLE ROW LEVEL SECURITY;

-- Faculty and Student tables
ALTER TABLE faculty_profiles DISABLE ROW LEVEL SECURITY;
ALTER TABLE student_profiles DISABLE ROW LEVEL SECURITY;
ALTER TABLE academic_batches DISABLE ROW LEVEL SECURITY;

-- Course tables
ALTER TABLE courses DISABLE ROW LEVEL SECURITY;
ALTER TABLE course_outcomes DISABLE ROW LEVEL SECURITY;
ALTER TABLE co_po_mapping DISABLE ROW LEVEL SECURITY;
ALTER TABLE co_pso_mapping DISABLE ROW LEVEL SECURITY;
ALTER TABLE faculty_subjects DISABLE ROW LEVEL SECURITY;

-- Attendance tables
ALTER TABLE class_sections DISABLE ROW LEVEL SECURITY;
ALTER TABLE timetable DISABLE ROW LEVEL SECURITY;
ALTER TABLE period_attendance DISABLE ROW LEVEL SECURITY;
ALTER TABLE attendance_alerts DISABLE ROW LEVEL SECURITY;

-- Examination tables
ALTER TABLE exam_schedule DISABLE ROW LEVEL SECURITY;
ALTER TABLE internal_marks DISABLE ROW LEVEL SECURITY;
ALTER TABLE external_marks DISABLE ROW LEVEL SECURITY;
ALTER TABLE hall_tickets DISABLE ROW LEVEL SECURITY;
ALTER TABLE revaluation_requests DISABLE ROW LEVEL SECURITY;

-- Fee tables
ALTER TABLE fee_master DISABLE ROW LEVEL SECURITY;
ALTER TABLE fee_transactions DISABLE ROW LEVEL SECURITY;
ALTER TABLE fee_receipts DISABLE ROW LEVEL SECURITY;

-- Mentoring tables
ALTER TABLE mentor_allocations DISABLE ROW LEVEL SECURITY;
ALTER TABLE mentoring_sessions DISABLE ROW LEVEL SECURITY;
ALTER TABLE student_risk_flags DISABLE ROW LEVEL SECURITY;

-- CRT and Placement tables
ALTER TABLE crt_materials DISABLE ROW LEVEL SECURITY;
ALTER TABLE crt_tests DISABLE ROW LEVEL SECURITY;
ALTER TABLE crt_questions DISABLE ROW LEVEL SECURITY;
ALTER TABLE crt_test_attempts DISABLE ROW LEVEL SECURITY;
ALTER TABLE placement_companies DISABLE ROW LEVEL SECURITY;
ALTER TABLE student_placements DISABLE ROW LEVEL SECURITY;

-- Certificate tables
ALTER TABLE certificate_requests DISABLE ROW LEVEL SECURITY;

-- CMS tables
ALTER TABLE department_pages DISABLE ROW LEVEL SECURITY;
ALTER TABLE department_posts DISABLE ROW LEVEL SECURITY;
ALTER TABLE department_galleries DISABLE ROW LEVEL SECURITY;

-- Lab tables
ALTER TABLE department_labs DISABLE ROW LEVEL SECURITY;
ALTER TABLE lab_equipment DISABLE ROW LEVEL SECURITY;

-- File and Asset tables
ALTER TABLE file_assets DISABLE ROW LEVEL SECURITY;

-- Accreditation tables
ALTER TABLE nba_criteria DISABLE ROW LEVEL SECURITY;
ALTER TABLE nba_claims DISABLE ROW LEVEL SECURITY;
ALTER TABLE nba_claim_evidence DISABLE ROW LEVEL SECURITY;
ALTER TABLE co_attainment DISABLE ROW LEVEL SECURITY;
ALTER TABLE po_attainment DISABLE ROW LEVEL SECURITY;
ALTER TABLE naac_criteria DISABLE ROW LEVEL SECURITY;
ALTER TABLE naac_data DISABLE ROW LEVEL SECURITY;
ALTER TABLE nirf_parameters DISABLE ROW LEVEL SECURITY;
ALTER TABLE nirf_data DISABLE ROW LEVEL SECURITY;

-- System tables
ALTER TABLE audit_events DISABLE ROW LEVEL SECURITY;
ALTER TABLE ai_insights DISABLE ROW LEVEL SECURITY;
ALTER TABLE notifications DISABLE ROW LEVEL SECURITY;

-- ===========================================
-- VERIFICATION QUERIES
-- ===========================================

-- Check RLS status (should all show 'f' for false)
SELECT 
    tablename,
    rowsecurity as rls_enabled
FROM pg_tables 
WHERE schemaname = 'public'
AND tablename IN ('users', 'faculty_profiles', 'student_profiles', 'courses', 'timetable')
ORDER BY tablename;

-- Check if data exists
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
SELECT 'departments', COUNT(*) FROM departments;

-- List faculty members
SELECT 
    employee_id,
    first_name || ' ' || last_name as name,
    email,
    dept_code,
    designation
FROM faculty_profiles
ORDER BY employee_id;

-- List students (first 10)
SELECT 
    roll_number,
    first_name || ' ' || last_name as name,
    email,
    dept_code,
    current_semester,
    section
FROM student_profiles
ORDER BY roll_number
LIMIT 10;

-- Success message
DO $$
BEGIN
    RAISE NOTICE '✅ RLS has been disabled on all tables for development';
    RAISE NOTICE '⚠️  Remember to re-enable RLS before production deployment';
    RAISE NOTICE '📊 Check the verification queries above to confirm data exists';
END $$;
