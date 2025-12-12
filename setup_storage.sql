-- ===========================================
-- SUPABASE STORAGE SETUP FOR FILE UPLOADS
-- ===========================================
-- Run this ONCE to set up storage buckets and policies
-- for faculty photos, resumes, and other files
-- ===========================================

-- ============================================
-- STEP 1: Create Storage Buckets
-- ============================================
-- Note: Buckets are created via Supabase Dashboard UI
-- Go to: Storage → Create Bucket
-- 
-- Create these buckets:
-- 1. faculty-photos (Public)
-- 2. faculty-resumes (Private)
-- 3. student-photos (Public)
-- 4. student-documents (Private)
-- 5. course-materials (Private)
-- 6. circulars (Public)
-- 7. certificates (Private)
-- ============================================

-- ============================================
-- STEP 2: Storage Policies for Faculty Photos
-- ============================================

-- Allow authenticated admins to upload faculty photos
CREATE POLICY "Admins can upload faculty photos"
ON storage.objects
FOR INSERT
TO authenticated
WITH CHECK (
  bucket_id = 'faculty-photos' AND
  (storage.foldername(name))[1] = 'faculty-photos' AND
  EXISTS (
    SELECT 1 FROM users
    WHERE users.id = auth.uid()
    AND users.role IN ('admin', 'dean', 'principal')
  )
);

-- Allow public read access to faculty photos
CREATE POLICY "Public can view faculty photos"
ON storage.objects
FOR SELECT
TO public
USING (bucket_id = 'faculty-photos');

-- Allow admins to update faculty photos
CREATE POLICY "Admins can update faculty photos"
ON storage.objects
FOR UPDATE
TO authenticated
USING (
  bucket_id = 'faculty-photos' AND
  EXISTS (
    SELECT 1 FROM users
    WHERE users.id = auth.uid()
    AND users.role IN ('admin', 'dean', 'principal')
  )
);

-- Allow admins to delete faculty photos
CREATE POLICY "Admins can delete faculty photos"
ON storage.objects
FOR DELETE
TO authenticated
USING (
  bucket_id = 'faculty-photos' AND
  EXISTS (
    SELECT 1 FROM users
    WHERE users.id = auth.uid()
    AND users.role IN ('admin', 'dean', 'principal')
  )
);

-- ============================================
-- STEP 3: Storage Policies for Faculty Resumes
-- ============================================

-- Allow authenticated admins to upload faculty resumes
CREATE POLICY "Admins can upload faculty resumes"
ON storage.objects
FOR INSERT
TO authenticated
WITH CHECK (
  bucket_id = 'faculty-resumes' AND
  EXISTS (
    SELECT 1 FROM users
    WHERE users.id = auth.uid()
    AND users.role IN ('admin', 'dean', 'principal')
  )
);

-- Allow admins and the faculty themselves to view resumes
CREATE POLICY "Authorized users can view faculty resumes"
ON storage.objects
FOR SELECT
TO authenticated
USING (
  bucket_id = 'faculty-resumes' AND
  (
    -- Admins can view all
    EXISTS (
      SELECT 1 FROM users
      WHERE users.id = auth.uid()
      AND users.role IN ('admin', 'dean', 'principal', 'hod')
    )
    OR
    -- Faculty can view their own resume
    EXISTS (
      SELECT 1 FROM faculty_profiles
      WHERE faculty_profiles.user_id = auth.uid()
      AND (storage.foldername(name))[1] = 'faculty-resumes'
      AND name LIKE faculty_profiles.employee_id || '%'
    )
  )
);

-- ============================================
-- STEP 4: Storage Policies for Student Photos
-- ============================================

-- Allow admins to upload student photos
CREATE POLICY "Admins can upload student photos"
ON storage.objects
FOR INSERT
TO authenticated
WITH CHECK (
  bucket_id = 'student-photos' AND
  EXISTS (
    SELECT 1 FROM users
    WHERE users.id = auth.uid()
    AND users.role IN ('admin', 'exam_cell')
  )
);

-- Allow public read access to student photos
CREATE POLICY "Public can view student photos"
ON storage.objects
FOR SELECT
TO public
USING (bucket_id = 'student-photos');

-- ============================================
-- STEP 5: Helper Function to Get File URL
-- ============================================

-- Function to get public URL for a file
CREATE OR REPLACE FUNCTION get_storage_url(
  bucket_name TEXT,
  file_path TEXT
)
RETURNS TEXT
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  project_url TEXT;
BEGIN
  -- Get your Supabase project URL from settings
  project_url := current_setting('app.settings.supabase_url', true);
  
  IF project_url IS NULL THEN
    project_url := 'https://YOUR_PROJECT.supabase.co';
  END IF;
  
  RETURN project_url || '/storage/v1/object/public/' || bucket_name || '/' || file_path;
END;
$$;

-- Example usage:
-- SELECT get_storage_url('faculty-photos', 'FACCSE001.jpg');

-- ============================================
-- STEP 6: File Upload Size Limits
-- ============================================
-- Configure in Supabase Dashboard → Storage → Bucket Settings
--
-- Recommended limits:
-- - faculty-photos: 2MB max
-- - faculty-resumes: 5MB max
-- - student-photos: 2MB max
-- - student-documents: 5MB max
-- - course-materials: 10MB max
-- - circulars: 5MB max
-- - certificates: 2MB max
-- ============================================

-- ============================================
-- STEP 7: Allowed MIME Types
-- ============================================
-- Configure in Supabase Dashboard → Storage → Bucket Settings
--
-- Recommended MIME types:
-- - faculty-photos: image/jpeg, image/png
-- - faculty-resumes: application/pdf
-- - student-photos: image/jpeg, image/png
-- - student-documents: application/pdf
-- - course-materials: application/pdf, application/vnd.ms-powerpoint, application/vnd.openxmlformats-officedocument.presentationml.presentation
-- - circulars: application/pdf
-- - certificates: application/pdf
-- ============================================

-- ============================================
-- VERIFICATION QUERIES
-- ============================================

-- Check if buckets exist
SELECT 
  id,
  name,
  public,
  file_size_limit,
  allowed_mime_types
FROM storage.buckets
WHERE name IN (
  'faculty-photos',
  'faculty-resumes',
  'student-photos',
  'student-documents',
  'course-materials',
  'circulars',
  'certificates'
)
ORDER BY name;

-- Check storage policies
SELECT 
  schemaname,
  tablename,
  policyname,
  permissive,
  roles,
  cmd,
  qual
FROM pg_policies
WHERE tablename = 'objects'
AND schemaname = 'storage'
ORDER BY policyname;

-- ============================================
-- CLEANUP (if needed)
-- ============================================

-- Drop all storage policies (USE WITH CAUTION!)
-- DROP POLICY IF EXISTS "Admins can upload faculty photos" ON storage.objects;
-- DROP POLICY IF EXISTS "Public can view faculty photos" ON storage.objects;
-- DROP POLICY IF EXISTS "Admins can update faculty photos" ON storage.objects;
-- DROP POLICY IF EXISTS "Admins can delete faculty photos" ON storage.objects;
-- DROP POLICY IF EXISTS "Admins can upload faculty resumes" ON storage.objects;
-- DROP POLICY IF EXISTS "Authorized users can view faculty resumes" ON storage.objects;
-- DROP POLICY IF EXISTS "Admins can upload student photos" ON storage.objects;
-- DROP POLICY IF EXISTS "Public can view student photos" ON storage.objects;

-- ============================================
-- NOTES
-- ============================================
-- 1. Buckets must be created via Supabase Dashboard UI first
-- 2. Public buckets allow anyone to read files
-- 3. Private buckets require authentication and proper policies
-- 4. Always use HTTPS URLs for file access
-- 5. Consider CDN for better performance in production
-- 6. Implement virus scanning for uploaded files in production
-- 7. Add file naming conventions (e.g., EMPLOYEE_ID.jpg)
-- 8. Implement file versioning if needed
-- ============================================
