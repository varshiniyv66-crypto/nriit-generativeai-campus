-- =============================================
-- SIMPLE SUPABASE VERIFICATION SCRIPT
-- =============================================
-- This version works with all Supabase versions
-- =============================================

-- 1. CHECK STORAGE BUCKETS
SELECT 
    '📦 STORAGE BUCKETS' as check_type,
    '' as details;

SELECT 
    name as bucket_name,
    CASE WHEN public THEN '✅ Public' ELSE '🔒 Private' END as access_type,
    created_at
FROM storage.buckets
ORDER BY name;

-- Expected: 4 buckets (circulars, faculty-photos, faculty-resumes, student-photos)

-- 2. COUNT BUCKETS
SELECT 
    '' as separator,
    '📊 BUCKET COUNT' as check_type,
    '' as details;

SELECT 
    COUNT(*) as total_buckets,
    '4 expected' as expected
FROM storage.buckets;

-- 3. CHECK DEAN USER IN DATABASE
SELECT 
    '' as separator,
    '👤 DEAN USER (DATABASE)' as check_type,
    '' as details;

SELECT 
    id,
    email,
    role,
    CASE WHEN is_active THEN '✅ Active' ELSE '❌ Inactive' END as status,
    CASE WHEN email_verified THEN '✅ Verified' ELSE '❌ Not Verified' END as email_status,
    created_at
FROM users
WHERE email = 'dean@nriit.ac.in';

-- Expected: 1 row with dean@nriit.ac.in

-- 4. CHECK DATA COUNTS
SELECT 
    '' as separator,
    '📊 DATA VERIFICATION' as check_type,
    '' as details;

SELECT 
    'Departments' as table_name,
    COUNT(*) as count,
    '9 expected' as expected_count
FROM departments

UNION ALL

SELECT 
    'Faculty',
    COUNT(*),
    '~100 expected'
FROM faculty_profiles

UNION ALL

SELECT 
    'Students',
    COUNT(*),
    '~1,560 expected'
FROM student_profiles

UNION ALL

SELECT 
    'Users',
    COUNT(*),
    '~1,660 expected'
FROM users;

-- 5. CHECK RLS STATUS
SELECT 
    '' as separator,
    '🛡️ ROW LEVEL SECURITY STATUS' as check_type,
    '' as details;

SELECT 
    tablename,
    CASE WHEN rowsecurity THEN '🔒 Enabled' ELSE '✅ Disabled (Dev Mode)' END as rls_status
FROM pg_tables
WHERE schemaname = 'public'
AND tablename IN (
    'users', 
    'faculty_profiles', 
    'student_profiles', 
    'departments'
)
ORDER BY tablename;

-- 6. FINAL SUMMARY
DO $$
DECLARE
    bucket_count INTEGER;
    dean_exists BOOLEAN;
    dept_count INTEGER;
    faculty_count INTEGER;
    student_count INTEGER;
BEGIN
    -- Count buckets
    SELECT COUNT(*) INTO bucket_count FROM storage.buckets;
    
    -- Check dean user
    SELECT EXISTS(SELECT 1 FROM users WHERE email = 'dean@nriit.ac.in') INTO dean_exists;
    
    -- Count data
    SELECT COUNT(*) INTO dept_count FROM departments;
    SELECT COUNT(*) INTO faculty_count FROM faculty_profiles;
    SELECT COUNT(*) INTO student_count FROM student_profiles;
    
    RAISE NOTICE '';
    RAISE NOTICE '========================================';
    RAISE NOTICE '📊 SETUP VERIFICATION SUMMARY';
    RAISE NOTICE '========================================';
    RAISE NOTICE '';
    RAISE NOTICE '📦 Storage Buckets: % (Expected: 4)', bucket_count;
    RAISE NOTICE '👤 Dean User Exists: % (Expected: true)', dean_exists;
    RAISE NOTICE '🏢 Departments: % (Expected: 9)', dept_count;
    RAISE NOTICE '👨‍🏫 Faculty: % (Expected: ~100)', faculty_count;
    RAISE NOTICE '🎓 Students: % (Expected: ~1,560)', student_count;
    RAISE NOTICE '';
    RAISE NOTICE '========================================';
    
    IF bucket_count = 4 AND dean_exists AND dept_count = 9 THEN
        RAISE NOTICE '✅ ✅ ✅ ALL CHECKS PASSED! ✅ ✅ ✅';
        RAISE NOTICE '';
        RAISE NOTICE '🏆 READY FOR FACULTY MANAGEMENT!';
        RAISE NOTICE '💎 READY FOR GOLD + DIAMOND MEDAL!';
    ELSE
        RAISE NOTICE '⚠️  SETUP INCOMPLETE:';
        IF bucket_count < 4 THEN
            RAISE NOTICE '   ❌ Missing % bucket(s)', 4 - bucket_count;
        END IF;
        IF NOT dean_exists THEN
            RAISE NOTICE '   ❌ Dean user not created';
        END IF;
        IF dept_count < 9 THEN
            RAISE NOTICE '   ❌ Missing departments';
        END IF;
    END IF;
    
    RAISE NOTICE '========================================';
    RAISE NOTICE '';
END $$;
