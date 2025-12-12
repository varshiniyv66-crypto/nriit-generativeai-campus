# 🗂️ SUPABASE STORAGE BUCKETS SETUP GUIDE
## Complete Storage Configuration for Gold + Diamond Medal 🏆

---

## 📋 REQUIRED STORAGE BUCKETS

You need to create **4 storage buckets** in Supabase:

### 1️⃣ **faculty-photos** (Public)
- **Purpose**: Store faculty profile photos
- **Access**: Public (anyone can view)
- **File Types**: Images (jpg, png, webp)
- **Max Size**: 2MB per file

### 2️⃣ **faculty-resumes** (Private)
- **Purpose**: Store faculty resumes/CVs
- **Access**: Private (only authorized users)
- **File Types**: PDF, DOC, DOCX
- **Max Size**: 5MB per file

### 3️⃣ **student-photos** (Public)
- **Purpose**: Store student profile photos
- **Access**: Public (anyone can view)
- **File Types**: Images (jpg, png, webp)
- **Max Size**: 2MB per file

### 4️⃣ **circulars** (Public)
- **Purpose**: Store institutional circulars and notices
- **Access**: Public (anyone can view)
- **File Types**: PDF
- **Max Size**: 10MB per file

---

## 🚀 STEP-BY-STEP CREATION PROCESS

### Step 1: Go to Supabase Dashboard
1. Open your browser
2. Navigate to: https://supabase.com/dashboard
3. Select your project: **nriit-generativeai-campus**
4. Click on **Storage** in the left sidebar

### Step 2: Create Each Bucket

#### Creating **faculty-photos** bucket:
```
1. Click "New bucket" button
2. Name: faculty-photos
3. Public bucket: ✅ YES (check this box)
4. File size limit: 2097152 (2MB in bytes)
5. Allowed MIME types: image/jpeg, image/png, image/webp
6. Click "Create bucket"
```

#### Creating **faculty-resumes** bucket:
```
1. Click "New bucket" button
2. Name: faculty-resumes
3. Public bucket: ❌ NO (leave unchecked - this is private)
4. File size limit: 5242880 (5MB in bytes)
5. Allowed MIME types: application/pdf, application/msword, application/vnd.openxmlformats-officedocument.wordprocessingml.document
6. Click "Create bucket"
```

#### Creating **student-photos** bucket:
```
1. Click "New bucket" button
2. Name: student-photos
3. Public bucket: ✅ YES (check this box)
4. File size limit: 2097152 (2MB in bytes)
5. Allowed MIME types: image/jpeg, image/png, image/webp
6. Click "Create bucket"
```

#### Creating **circulars** bucket:
```
1. Click "New bucket" button
2. Name: circulars
3. Public bucket: ✅ YES (check this box)
4. File size limit: 10485760 (10MB in bytes)
5. Allowed MIME types: application/pdf
6. Click "Create bucket"
```

---

## ✅ VERIFICATION CHECKLIST

After creating all buckets, verify:

- [ ] **faculty-photos** - Public, 2MB limit, Images only
- [ ] **faculty-resumes** - Private, 5MB limit, Documents only
- [ ] **student-photos** - Public, 2MB limit, Images only
- [ ] **circulars** - Public, 10MB limit, PDF only

---

## 🔐 STEP 3: Apply Storage Policies

After creating buckets, run the SQL script:

1. Go to **SQL Editor** in Supabase
2. Open the file: `setup_supabase_complete.sql`
3. Click **Run** to apply all storage policies

This will set up:
- ✅ Upload permissions for admins/dean
- ✅ View permissions for authorized users
- ✅ Update/Delete permissions for admins
- ✅ Row Level Security (RLS) policies

---

## 🎯 STEP 4: Create Dean User in Auth

1. Go to **Authentication** → **Users** in Supabase
2. Click **"Add User"** (or "Invite")
3. Fill in:
   - **Email**: dean@nriit.ac.in
   - **Password**: Dean@123
   - **Auto Confirm User**: ✅ YES (check this!)
4. Click **"Create User"** or **"Send Invite"**

---

## 🧪 TESTING THE SETUP

### Test 1: Check Bucket Creation
```sql
-- Run this in SQL Editor to verify buckets
SELECT 
    name,
    public,
    file_size_limit,
    allowed_mime_types
FROM storage.buckets
ORDER BY name;
```

Expected output: 4 rows showing all buckets

### Test 2: Check Storage Policies
```sql
-- Run this in SQL Editor to verify policies
SELECT 
    bucket_id,
    name,
    definition
FROM storage.policies
ORDER BY bucket_id, name;
```

Expected output: Multiple policies for each bucket

### Test 3: Check Dean User
```sql
-- Run this in SQL Editor to verify dean user
SELECT 
    id,
    email,
    role,
    is_active,
    email_verified
FROM users
WHERE email = 'dean@nriit.ac.in';
```

Expected output: 1 row with dean user details

---

## 🏆 FINAL VERIFICATION

Before proceeding to Faculty Management:

1. ✅ All 4 buckets created
2. ✅ Storage policies applied (run SQL script)
3. ✅ Dean user created in database
4. ✅ Dean user created in Authentication
5. ✅ RLS disabled for development (from SQL script)

---

## 📸 SCREENSHOT GUIDE

Take screenshots of:
1. Storage page showing all 4 buckets
2. Each bucket's settings
3. Storage policies list
4. Dean user in Authentication

---

## 🚨 TROUBLESHOOTING

### Issue: "Bucket already exists"
**Solution**: Skip that bucket, it's already created

### Issue: "Permission denied"
**Solution**: Make sure you're the project owner/admin

### Issue: "Policies not working"
**Solution**: 
1. Check if RLS is disabled (for development)
2. Re-run the SQL script
3. Verify bucket names match exactly

### Issue: "Can't upload files"
**Solution**:
1. Check bucket is created
2. Verify policies are applied
3. Check file size and type limits
4. Ensure user is authenticated

---

## 📞 NEED HELP?

If you encounter any issues:
1. Share screenshot of Storage page
2. Share screenshot of SQL Editor output
3. Share any error messages

---

## ✨ NEXT STEPS

Once all buckets are created and verified:
1. Tell me: **"All buckets created successfully!"**
2. I will then create the Faculty Management page
3. We'll test file uploads
4. Deploy and win those medals! 🏆💎

---

**Created**: 2025-12-11
**Status**: Ready for Implementation
**Goal**: Gold + Diamond Medal 🏆💎
