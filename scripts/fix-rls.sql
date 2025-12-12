-- ==============================================================================
-- FIX RLS POLICIES FOR DEVELOPMENT/DEMO
-- Run this script in your Supabase SQL Editor to resolve "Row Level Security" errors.
-- ==============================================================================

-- 1. Enable RLS (Ensure it's on so policies apply)
ALTER TABLE student_profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE faculty_profiles ENABLE ROW LEVEL SECURITY;

-- 2. Create Permissive Policies for 'student_profiles'
-- Allow anyone (including unauthenticated 'anon' users) to READ student metadata.
-- This is required for the Login Page to verify if a Roll Number exists before logging in.
DROP POLICY IF EXISTS "Enable read access for all users" ON student_profiles;
CREATE POLICY "Enable read access for all users"
ON student_profiles FOR SELECT
TO public
USING (true);

-- Allow authenticated users to update their own data
DROP POLICY IF EXISTS "Enable update for users based on id" ON student_profiles;
CREATE POLICY "Enable update for users based on id"
ON student_profiles FOR UPDATE
TO authenticated
USING (auth.uid() = id)
WITH CHECK (auth.uid() = id);

-- 3. Create Permissive Policies for 'faculty_profiles'
-- Allow anyone (including unauthenticated 'anon' users) to READ faculty metadata.
DROP POLICY IF EXISTS "Enable read access for all users" ON faculty_profiles;
CREATE POLICY "Enable read access for all users"
ON faculty_profiles FOR SELECT
TO public
USING (true);

-- Allow authenticated users to update their own data
DROP POLICY IF EXISTS "Enable update for users based on id" ON faculty_profiles;
CREATE POLICY "Enable update for users based on id"
ON faculty_profiles FOR UPDATE
TO authenticated
USING (auth.uid() = id)
WITH CHECK (auth.uid() = id);


-- 4. General fallback allowing Service Role full access (Supabase usually handles this by default, but essentially:
-- Service Role bypasses RLS, so no policy needed for it)

-- 5. Grant permissions to the anon role just in case
GRANT USAGE ON SCHEMA public TO anon;
GRANT SELECT ON student_profiles TO anon;
GRANT SELECT ON faculty_profiles TO anon;

-- Output confirmation
SELECT 'RLS Policies Fixed Successfully' as status;
