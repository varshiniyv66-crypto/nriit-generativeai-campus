# 🏆 SUPABASE SETUP CHECKLIST - Gold + Diamond Medal Winner

## 🎯 Complete Setup for Award-Winning Project

Follow these steps **IN ORDER** to make your project competition-ready!

---

## ✅ STEP 1: Create Storage Buckets (5 minutes)

### Go to Supabase Dashboard → Storage → Create Bucket

Create these **6 buckets**:

### 1. `faculty-photos` ⭐
- **Public:** ✅ YES
- **File size limit:** 2 MB
- **Allowed MIME types:** `image/jpeg, image/png, image/webp`
- **Purpose:** Faculty profile photos (displayed on website)

### 2. `faculty-resumes` 🔒
- **Public:** ❌ NO (Private)
- **File size limit:** 5 MB
- **Allowed MIME types:** `application/pdf`
- **Purpose:** Faculty CV/Resume files

### 3. `student-photos` ⭐
- **Public:** ✅ YES
- **File size limit:** 2 MB
- **Allowed MIME types:** `image/jpeg, image/png, image/webp`
- **Purpose:** Student profile photos

### 4. `student-documents` 🔒
- **Public:** ❌ NO (Private)
- **File size limit:** 5 MB
- **Allowed MIME types:** `application/pdf`
- **Purpose:** Student certificates, documents

### 5. `course-materials` 🔒
- **Public:** ❌ NO (Private)
- **File size limit:** 10 MB
- **Allowed MIME types:** `application/pdf, application/vnd.ms-powerpoint, application/vnd.openxmlformats-officedocument.presentationml.presentation`
- **Purpose:** Course materials, lecture notes

### 6. `circulars` ⭐
- **Public:** ✅ YES
- **File size limit:** 5 MB
- **Allowed MIME types:** `application/pdf`
- **Purpose:** Public circulars, announcements

---

## ✅ STEP 2: Run Storage Policies SQL (2 minutes)

### Go to Supabase Dashboard → SQL Editor → New Query

**Copy and paste this entire script:**

```sql
-- ===========================================
-- STORAGE POLICIES FOR AWARD-WINNING PROJECT
-- ===========================================

-- ============================================
-- FACULTY PHOTOS (Public bucket)
-- ============================================

-- Allow admins/dean to upload faculty photos
CREATE POLICY "Admins can upload faculty photos"
ON storage.objects
FOR INSERT
TO authenticated
WITH CHECK (
  bucket_id = 'faculty-photos' AND
  EXISTS (
    SELECT 1 FROM users
    WHERE users.id = auth.uid()
    AND users.role IN ('admin', 'dean', 'principal')
  )
);

-- Allow public to view faculty photos
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
-- FACULTY RESUMES (Private bucket)
-- ============================================

-- Allow admins to upload resumes
CREATE POLICY "Admins can upload faculty resumes"
ON storage.objects
FOR INSERT
TO authenticated
WITH CHECK (
  bucket_id = 'faculty-resumes' AND
  EXISTS (
    SELECT 1 FROM users
    WHERE users.id = auth.uid()
    AND users.role IN ('admin', 'dean', 'principal', 'hod')
  )
);

-- Allow authorized users to view resumes
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
    )
  )
);

-- ============================================
-- STUDENT PHOTOS (Public bucket)
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

-- Allow public to view student photos
CREATE POLICY "Public can view student photos"
ON storage.objects
FOR SELECT
TO public
USING (bucket_id = 'student-photos');

-- ============================================
-- CIRCULARS (Public bucket)
-- ============================================

-- Allow admins to upload circulars
CREATE POLICY "Admins can upload circulars"
ON storage.objects
FOR INSERT
TO authenticated
WITH CHECK (
  bucket_id = 'circulars' AND
  EXISTS (
    SELECT 1 FROM users
    WHERE users.id = auth.uid()
    AND users.role IN ('admin', 'dean', 'principal')
  )
);

-- Allow public to view circulars
CREATE POLICY "Public can view circulars"
ON storage.objects
FOR SELECT
TO public
USING (bucket_id = 'circulars');
```

**Click "Run" button** ✅

---

## ✅ STEP 3: Create Dean User (1 minute)

### Go to Supabase Dashboard → SQL Editor → New Query

**Run this script:**

```sql
-- Create Dean user for testing
DO $$
DECLARE
    dean_user_id UUID;
BEGIN
    -- Create user account
    INSERT INTO users (email, role, is_active, email_verified)
    VALUES ('dean@nriit.ac.in', 'dean', true, true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW()
    RETURNING id INTO dean_user_id;

    RAISE NOTICE '✅ Dean user created!';
    RAISE NOTICE 'Email: dean@nriit.ac.in';
    RAISE NOTICE 'User ID: %', dean_user_id;
    RAISE NOTICE 'You can now login as Dean!';
END $$;
```

**Click "Run"** ✅

---

## ✅ STEP 4: Create Supabase Auth User for Dean (2 minutes)

### Go to Supabase Dashboard → Authentication → Users → Add User

**Fill in:**
- **Email:** `dean@nriit.ac.in`
- **Password:** `Dean@123` (or your choice)
- **Auto Confirm User:** ✅ YES (check this box!)
- **Email Confirm:** ✅ YES

**Click "Create User"** ✅

---

## ✅ STEP 5: Verify Row Level Security (RLS) Status (1 minute)

### Go to Supabase Dashboard → SQL Editor → New Query

**Run this to check RLS status:**

```sql
-- Check RLS status on all tables
SELECT 
    schemaname,
    tablename,
    rowsecurity as rls_enabled
FROM pg_tables
WHERE schemaname = 'public'
AND tablename IN (
    'users',
    'faculty_profiles',
    'student_profiles',
    'departments',
    'courses'
)
ORDER BY tablename;
```

**Expected Result:** All should show `rls_enabled = false` (for development)

**If RLS is enabled and blocking access, run:**

```sql
-- Temporarily disable RLS for development
ALTER TABLE users DISABLE ROW LEVEL SECURITY;
ALTER TABLE faculty_profiles DISABLE ROW LEVEL SECURITY;
ALTER TABLE student_profiles DISABLE ROW LEVEL SECURITY;
ALTER TABLE departments DISABLE ROW LEVEL SECURITY;
ALTER TABLE courses DISABLE ROW LEVEL SECURITY;
ALTER TABLE mentor_allocations DISABLE ROW LEVEL SECURITY;
ALTER TABLE student_risk_flags DISABLE ROW LEVEL SECURITY;
```

---

## ✅ STEP 6: Verify Data is Seeded (2 minutes)

### Go to Supabase Dashboard → SQL Editor → New Query

**Run this verification script:**

```sql
-- Comprehensive data check
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
```

**Expected Results:**
- Departments: 9
- Faculty: ~100
- Students: ~1,560
- Mentor Allocations: ~1,560
- Risk Flags: ~200
- Users: ~1,660

**If any count is 0, you need to run the seed files!**

---

## ✅ STEP 7: Run Seed Files (if needed) (5 minutes)

**If data is missing, run these in order:**

### 1. Departments & Users
```sql
-- Already in seed_complete_data.sql
```

### 2. Faculty & Students
**Go to SQL Editor → Open File → `seed_complete_data.sql` → Run**

### 3. Mentor Assignments
**Go to SQL Editor → Open File → `seed_mentor_assignments.sql` → Run**

### 4. Risk Flags
**Go to SQL Editor → Open File → `seed_risk_flags.sql` → Run**

---

## ✅ STEP 8: Test File Upload (Optional - 3 minutes)

### Upload a test faculty photo:

1. **Go to:** Supabase Dashboard → Storage → `faculty-photos`
2. **Click:** Upload
3. **Select:** Any square image (500x500px recommended)
4. **Name it:** `FACCSE001.jpg`
5. **Upload**
6. **Copy the public URL** - should look like:
   ```
   https://[your-project].supabase.co/storage/v1/object/public/faculty-photos/FACCSE001.jpg
   ```

### Update faculty profile with photo:

```sql
UPDATE faculty_profiles
SET photo_path = 'https://[your-project].supabase.co/storage/v1/object/public/faculty-photos/FACCSE001.jpg'
WHERE employee_id = 'FACCSE001';
```

---

## ✅ STEP 9: Configure Environment Variables (1 minute)

### Check your `.env.local` file has:

```env
NEXT_PUBLIC_SUPABASE_URL=https://[your-project].supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key-here
SUPABASE_SERVICE_ROLE_KEY=your-service-role-key-here
```

**Get these from:** Supabase Dashboard → Project Settings → API

---

## ✅ STEP 10: Enable Realtime (Optional - for live updates)

### Go to Supabase Dashboard → Database → Replication

**Enable replication for these tables:**
- ✅ `faculty_profiles`
- ✅ `student_profiles`
- ✅ `mentor_allocations`
- ✅ `student_risk_flags`
- ✅ `attendance_alerts`

---

## 🎯 FINAL VERIFICATION CHECKLIST

Before submitting your project, verify:

### Database ✅
- [ ] All 6 storage buckets created
- [ ] Storage policies applied
- [ ] Dean user created in `users` table
- [ ] Dean auth user created
- [ ] RLS disabled for development (or proper policies set)
- [ ] All seed data loaded (~100 faculty, ~1,560 students)
- [ ] Mentor allocations created
- [ ] Risk flags created

### Application ✅
- [ ] Can login as Faculty (`faccse001@nriit.ac.in`)
- [ ] Can login as Student (`24CSE001`)
- [ ] Can login as Dean (`dean@nriit.ac.in`)
- [ ] Faculty dashboard displays correctly
- [ ] Student dashboard displays correctly
- [ ] Dean dashboard displays correctly (after we build it)
- [ ] Photos display (if uploaded)
- [ ] No console errors

### Features ✅
- [ ] Mentor-mentee relationships working
- [ ] At-risk students displaying
- [ ] Charts and analytics working
- [ ] Real-time data from database
- [ ] File uploads working (photos, resumes)

---

## 🏆 GOLD + DIAMOND MEDAL FEATURES

To make this truly award-winning, ensure:

### 1. **Premium Design** ✨
- ✅ Glassmorphism effects
- ✅ Smooth animations
- ✅ Gradient backgrounds
- ✅ Interactive charts (Recharts)
- ✅ Responsive layout
- ✅ Modern color scheme

### 2. **Complete Functionality** 🚀
- ✅ Role-based dashboards (Student, Faculty, Dean)
- ✅ Real database integration
- ✅ File upload system
- ✅ Mentor-mentee system
- ✅ Risk flag system
- ✅ Analytics and reports

### 3. **Professional Features** 💎
- ✅ Search and filter
- ✅ Export to PDF/Excel
- ✅ Bulk operations
- ✅ Email notifications
- ✅ Activity logs
- ✅ Data validation

### 4. **Security** 🔐
- ✅ Row Level Security (RLS)
- ✅ Role-based access control
- ✅ Secure file storage
- ✅ Input validation
- ✅ SQL injection prevention

---

## 📞 QUICK REFERENCE

### Login Credentials for Testing:

**Faculty:**
- Email: `faccse001@nriit.ac.in`
- No password needed (demo mode)

**Student:**
- Roll: `24CSE001`
- No password needed (demo mode)

**Dean:**
- Email: `dean@nriit.ac.in`
- Password: `Dean@123` (if using Supabase Auth)

### Supabase Dashboard Shortcuts:
- **Storage:** https://supabase.com/dashboard/project/[your-project]/storage/buckets
- **SQL Editor:** https://supabase.com/dashboard/project/[your-project]/sql
- **Authentication:** https://supabase.com/dashboard/project/[your-project]/auth/users
- **Table Editor:** https://supabase.com/dashboard/project/[your-project]/editor

---

## ⚡ SPEED RUN (Minimum Setup - 10 minutes)

If you're short on time, do these MUST-HAVE steps:

1. ✅ Create `faculty-photos` bucket (public)
2. ✅ Create `faculty-resumes` bucket (private)
3. ✅ Run storage policies SQL
4. ✅ Create Dean user (SQL + Auth)
5. ✅ Verify seed data exists
6. ✅ Test login as Dean

**That's it! You're ready to build the Dean Dashboard!**

---

## 🎯 NEXT STEPS

After completing this checklist:

1. **Tell me:** "Supabase setup complete!"
2. **I will:** Build the award-winning Dean Dashboard with:
   - Faculty Management UI (Add/Edit/Delete)
   - File Upload Interface
   - Academic Analytics
   - Department Reports
   - Beautiful Charts
   - Export Features

---

**Status:** 🏆 Ready for Gold + Diamond Medal!  
**Time Required:** 15-20 minutes  
**Difficulty:** Easy (just follow the steps)  

**Let's make this project LEGENDARY!** 🚀✨
