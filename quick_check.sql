-- =============================================
-- QUICK VERIFICATION (30 seconds)
-- =============================================
-- Just the essential checks
-- =============================================

-- Check 1: Buckets (should show 4)
SELECT COUNT(*) as total_buckets, '4 expected' as expected
FROM storage.buckets;

-- Check 2: List all buckets
SELECT name, public FROM storage.buckets ORDER BY name;

-- Check 3: Dean user exists
SELECT email, role, is_active 
FROM users 
WHERE email = 'dean@nriit.ac.in';

-- Check 4: Data counts
SELECT 
    (SELECT COUNT(*) FROM departments) as departments,
    (SELECT COUNT(*) FROM faculty_profiles) as faculty,
    (SELECT COUNT(*) FROM student_profiles) as students,
    (SELECT COUNT(*) FROM users) as total_users;

-- =============================================
-- EXPECTED RESULTS:
-- =============================================
-- Buckets: 4 (circulars, faculty-photos, faculty-resumes, student-photos)
-- Dean: dean@nriit.ac.in, role=dean, is_active=true
-- Departments: 9
-- Faculty: ~100
-- Students: ~1,560
-- Users: ~1,660
-- =============================================
