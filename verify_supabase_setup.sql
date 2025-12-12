-- =============================================
-- SUPABASE STORAGE VERIFICATION SCRIPT
-- =============================================
-- Run this to check current storage setup status
-- =============================================

-- 1. CHECK EXISTING BUCKETS
SELECT 
    '📦 STORAGE BUCKETS' as check_type,
    '' as details;

SELECT 
    name as bucket_name,
    CASE WHEN public THEN '✅ Public' ELSE '🔒 Private' END as access_type,
    CASE 
        WHEN file_size_limit IS NULL THEN 'No limit'
        ELSE CONCAT(ROUND(file_size_limit / 1048576.0, 2), ' MB')
    END as max_file_size,
    CASE 
        WHEN allowed_mime_types IS NULL THEN 'All types'
        ELSE array_to_string(allowed_mime_types, ', ')
    END as allowed_types,
    created_at
FROM storage.buckets
ORDER BY name;

-- Expected: 4 buckets
-- ✅ circulars (Public)
-- ✅ faculty-photos (Public)
-- ✅ faculty-resumes (Private)
-- ✅ student-photos (Public)

-- 2. CHECK STORAGE POLICIES
SELECT 
    '' as separator,
    '🔐 STORAGE POLICIES' as check_type,
    '' as details;

SELECT 
    bucket_id,
    name as policy_name,
    CASE 
        WHEN definition LIKE '%INSERT%' THEN '📤 Upload'
        WHEN definition LIKE '%SELECT%' THEN '👁️ View'
        WHEN definition LIKE '%UPDATE%' THEN '✏️ Update'
        WHEN definition LIKE '%DELETE%' THEN '🗑️ Delete'
        ELSE '❓ Other'
    END as action_type
FROM storage.policies
ORDER BY bucket_id, name;

-- Expected: Multiple policies per bucket (INSERT, SELECT, UPDATE, DELETE)

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

-- 4. CHECK RLS STATUS
SELECT 
    '' as separator,
    '🛡️ ROW LEVEL SECURITY STATUS' as check_type,
    '' as details;

SELECT 
    schemaname,
    tablename,
    CASE WHEN rowsecurity THEN '🔒 Enabled' ELSE '✅ Disabled (Dev Mode)' END as rls_status
FROM pg_tables
WHERE schemaname = 'public'
AND tablename IN (
    'users', 
    'faculty_profiles', 
    'student_profiles', 
    'departments',
    'mentor_allocations',
    'student_risk_flags'
)
ORDER BY tablename;

-- Expected: All should show "Disabled (Dev Mode)"

-- 5. CHECK DATA COUNTS
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
    'Mentor Allocations',
    COUNT(*),
    '~1,560 expected'
FROM mentor_allocations

UNION ALL

SELECT 
    'Risk Flags',
    COUNT(*),
    '~200 expected'
FROM student_risk_flags

UNION ALL

SELECT 
    'Users',
    COUNT(*),
    '~1,660 expected'
FROM users;

-- 6. SUMMARY
SELECT 
    '' as separator,
    '✅ SETUP SUMMARY' as check_type,
    '' as details;

DO $$
DECLARE
    bucket_count INTEGER;
    policy_count INTEGER;
    dean_exists BOOLEAN;
BEGIN
    -- Count buckets
    SELECT COUNT(*) INTO bucket_count FROM storage.buckets;
    
    -- Count policies
    SELECT COUNT(*) INTO policy_count FROM storage.policies;
    
    -- Check dean user
    SELECT EXISTS(SELECT 1 FROM users WHERE email = 'dean@nriit.ac.in') INTO dean_exists;
    
    RAISE NOTICE '========================================';
    RAISE NOTICE '📦 Storage Buckets: % (Expected: 4)', bucket_count;
    RAISE NOTICE '🔐 Storage Policies: % (Expected: 16+)', policy_count;
    RAISE NOTICE '👤 Dean User: % (Expected: true)', dean_exists;
    RAISE NOTICE '========================================';
    
    IF bucket_count = 4 AND policy_count >= 16 AND dean_exists THEN
        RAISE NOTICE '✅ ✅ ✅ ALL CHECKS PASSED! ✅ ✅ ✅';
        RAISE NOTICE '🏆 Ready for Faculty Management!';
    ELSE
        RAISE NOTICE '⚠️  SETUP INCOMPLETE:';
        IF bucket_count < 4 THEN
            RAISE NOTICE '   ❌ Missing % bucket(s)', 4 - bucket_count;
        END IF;
        IF policy_count < 16 THEN
            RAISE NOTICE '   ❌ Missing storage policies';
        END IF;
        IF NOT dean_exists THEN
            RAISE NOTICE '   ❌ Dean user not created';
        END IF;
    END IF;
    RAISE NOTICE '========================================';
END $$;
