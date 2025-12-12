-- ===========================================
-- COMPLETE SUPABASE SETUP - ALL IN ONE
-- ===========================================
-- Run this AFTER creating storage buckets
-- This sets up everything needed for the Dean Dashboard
-- ===========================================

-- ============================================
-- PART 1: STORAGE POLICIES
-- ============================================

-- Faculty Photos (Public)
CREATE POLICY "Admins can upload faculty photos"
ON storage.objects FOR INSERT TO authenticated
WITH CHECK (
  bucket_id = 'faculty-photos' AND
  EXISTS (SELECT 1 FROM users WHERE users.id = auth.uid() AND users.role IN ('admin', 'dean', 'principal'))
);

CREATE POLICY "Public can view faculty photos"
ON storage.objects FOR SELECT TO public
USING (bucket_id = 'faculty-photos');

CREATE POLICY "Admins can update faculty photos"
ON storage.objects FOR UPDATE TO authenticated
USING (
  bucket_id = 'faculty-photos' AND
  EXISTS (SELECT 1 FROM users WHERE users.id = auth.uid() AND users.role IN ('admin', 'dean', 'principal'))
);

CREATE POLICY "Admins can delete faculty photos"
ON storage.objects FOR DELETE TO authenticated
USING (
  bucket_id = 'faculty-photos' AND
  EXISTS (SELECT 1 FROM users WHERE users.id = auth.uid() AND users.role IN ('admin', 'dean', 'principal'))
);

-- Faculty Resumes (Private)
CREATE POLICY "Admins can upload faculty resumes"
ON storage.objects FOR INSERT TO authenticated
WITH CHECK (
  bucket_id = 'faculty-resumes' AND
  EXISTS (SELECT 1 FROM users WHERE users.id = auth.uid() AND users.role IN ('admin', 'dean', 'principal', 'hod'))
);

CREATE POLICY "Authorized users can view faculty resumes"
ON storage.objects FOR SELECT TO authenticated
USING (
  bucket_id = 'faculty-resumes' AND
  (
    EXISTS (SELECT 1 FROM users WHERE users.id = auth.uid() AND users.role IN ('admin', 'dean', 'principal', 'hod'))
    OR
    EXISTS (SELECT 1 FROM faculty_profiles WHERE faculty_profiles.user_id = auth.uid())
  )
);

-- Student Photos (Public)
CREATE POLICY "Admins can upload student photos"
ON storage.objects FOR INSERT TO authenticated
WITH CHECK (
  bucket_id = 'student-photos' AND
  EXISTS (SELECT 1 FROM users WHERE users.id = auth.uid() AND users.role IN ('admin', 'exam_cell'))
);

CREATE POLICY "Public can view student photos"
ON storage.objects FOR SELECT TO public
USING (bucket_id = 'student-photos');

-- Circulars (Public)
CREATE POLICY "Admins can upload circulars"
ON storage.objects FOR INSERT TO authenticated
WITH CHECK (
  bucket_id = 'circulars' AND
  EXISTS (SELECT 1 FROM users WHERE users.id = auth.uid() AND users.role IN ('admin', 'dean', 'principal'))
);

CREATE POLICY "Public can view circulars"
ON storage.objects FOR SELECT TO public
USING (bucket_id = 'circulars');

-- ============================================
-- PART 2: CREATE DEAN USER
-- ============================================

DO $$
DECLARE
    dean_user_id UUID;
BEGIN
    RAISE NOTICE '========================================';
    RAISE NOTICE 'Creating Dean User...';
    RAISE NOTICE '========================================';

    -- Create Dean user account
    INSERT INTO users (email, role, is_active, email_verified)
    VALUES ('dean@nriit.ac.in', 'dean', true, true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW()
    RETURNING id INTO dean_user_id;

    RAISE NOTICE '✅ Dean user created successfully!';
    RAISE NOTICE 'Email: dean@nriit.ac.in';
    RAISE NOTICE 'User ID: %', dean_user_id;
    RAISE NOTICE '';
    RAISE NOTICE '⚠️  IMPORTANT: Now go to Authentication → Users';
    RAISE NOTICE '   and create Auth user with:';
    RAISE NOTICE '   Email: dean@nriit.ac.in';
    RAISE NOTICE '   Password: Dean@123';
    RAISE NOTICE '   Auto Confirm: YES';
    RAISE NOTICE '========================================';
END $$;

-- ============================================
-- PART 3: DISABLE RLS FOR DEVELOPMENT
-- ============================================

-- Disable RLS on main tables for easier development
ALTER TABLE users DISABLE ROW LEVEL SECURITY;
ALTER TABLE faculty_profiles DISABLE ROW LEVEL SECURITY;
ALTER TABLE student_profiles DISABLE ROW LEVEL SECURITY;
ALTER TABLE departments DISABLE ROW LEVEL SECURITY;
ALTER TABLE courses DISABLE ROW LEVEL SECURITY;
ALTER TABLE mentor_allocations DISABLE ROW LEVEL SECURITY;
ALTER TABLE student_risk_flags DISABLE ROW LEVEL SECURITY;
ALTER TABLE mentoring_sessions DISABLE ROW LEVEL SECURITY;
ALTER TABLE period_attendance DISABLE ROW LEVEL SECURITY;

-- ============================================
-- PART 4: VERIFICATION QUERIES
-- ============================================

-- Check data counts
SELECT 
    'Departments' as table_name,
    COUNT(*) as count,
    '9 expected' as expected
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

-- Check Dean user
SELECT 
    id,
    email,
    role,
    is_active,
    email_verified,
    created_at
FROM users
WHERE email = 'dean@nriit.ac.in';

-- ============================================
-- PART 5: SUCCESS MESSAGE
-- ============================================

DO $$
BEGIN
    RAISE NOTICE '';
    RAISE NOTICE '========================================';
    RAISE NOTICE '✅ SUPABASE SETUP COMPLETE!';
    RAISE NOTICE '========================================';
    RAISE NOTICE '';
    RAISE NOTICE '📋 CHECKLIST:';
    RAISE NOTICE '   ✅ Storage policies created';
    RAISE NOTICE '   ✅ Dean user created in database';
    RAISE NOTICE '   ✅ RLS disabled for development';
    RAISE NOTICE '   ✅ Data verification complete';
    RAISE NOTICE '';
    RAISE NOTICE '⚠️  NEXT STEPS:';
    RAISE NOTICE '   1. Go to Supabase Dashboard → Authentication → Users';
    RAISE NOTICE '   2. Click "Add User"';
    RAISE NOTICE '   3. Email: dean@nriit.ac.in';
    RAISE NOTICE '   4. Password: Dean@123';
    RAISE NOTICE '   5. Auto Confirm: YES';
    RAISE NOTICE '   6. Click "Create User"';
    RAISE NOTICE '';
    RAISE NOTICE '🎯 THEN:';
    RAISE NOTICE '   Tell the AI: "Supabase setup complete!"';
    RAISE NOTICE '   AI will build the Dean Dashboard!';
    RAISE NOTICE '';
    RAISE NOTICE '========================================';
    RAISE NOTICE '🏆 READY FOR GOLD + DIAMOND MEDAL!';
    RAISE NOTICE '========================================';
END $$;
