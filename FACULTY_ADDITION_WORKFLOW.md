# 🎯 Faculty Addition Workflow - Quick Reference

## 📋 Complete Process Overview

```
┌─────────────────────────────────────────────────────────────────┐
│                    ADDING A NEW FACULTY MEMBER                   │
└─────────────────────────────────────────────────────────────────┘

┌──────────────┐
│ 1. PREPARE   │
│    DATA      │
└──────┬───────┘
       │
       ├─► Collect personal info (name, DOB, contact)
       ├─► Collect professional info (dept, designation, qualification)
       ├─► Collect documents (photo 1:1, resume PDF)
       └─► Assign Employee ID (e.g., FACCSE003)
       │
       ▼
┌──────────────┐
│ 2. SETUP     │
│    STORAGE   │
└──────┬───────┘
       │
       ├─► Go to Supabase Dashboard → Storage
       ├─► Create bucket: faculty-photos (Public)
       ├─► Create bucket: faculty-resumes (Private)
       └─► Run setup_storage.sql for policies
       │
       ▼
┌──────────────┐
│ 3. UPLOAD    │
│    FILES     │
└──────┬───────┘
       │
       ├─► Upload photo to faculty-photos/
       │   • Format: EMPLOYEE_ID.jpg (e.g., FACCSE003.jpg)
       │   • Size: 500x500px minimum (1:1 ratio)
       │   • Max: 2MB
       │
       ├─► Upload resume to faculty-resumes/
       │   • Format: EMPLOYEE_ID_resume.pdf
       │   • Max: 5MB
       │
       └─► Copy URLs/paths for SQL script
       │
       ▼
┌──────────────┐
│ 4. RUN SQL   │
│    SCRIPT    │
└──────┬───────┘
       │
       ├─► Open add_faculty_template.sql
       ├─► Replace all placeholder values
       ├─► Paste photo URL and resume path
       ├─► Run in Supabase SQL Editor
       └─► Verify success message
       │
       ▼
┌──────────────┐
│ 5. CREATE    │
│    AUTH USER │
└──────┬───────┘
       │
       ├─► Go to Supabase → Authentication → Users
       ├─► Click "Add User"
       ├─► Email: faculty.email@nriit.ac.in
       ├─► Password: Temp@123
       └─► Auto Confirm: YES
       │
       ▼
┌──────────────┐
│ 6. VERIFY    │
│    & TEST    │
└──────┬───────┘
       │
       ├─► Check faculty appears in faculty_profiles table
       ├─► Verify photo displays correctly
       ├─► Test login with credentials
       ├─► Check profile page displays all info
       └─► Verify resume is accessible
       │
       ▼
┌──────────────┐
│ 7. NOTIFY    │
│    FACULTY   │
└──────┬───────┘
       │
       ├─► Send welcome email
       ├─► Provide login credentials
       ├─► Share platform guide
       └─► Request password change on first login
       │
       ▼
    ✅ DONE!
```

---

## 🚀 Quick Start (3 Methods)

### Method 1: Admin Dashboard (Recommended) 🎨
**Best for**: Non-technical users, bulk additions

1. Login as Admin/Dean
2. Go to Faculty Management
3. Click "Add New Faculty"
4. Fill form with all details
5. Upload photo & resume
6. Submit

**Pros**: User-friendly, validation, preview
**Cons**: UI needs to be built first

---

### Method 2: SQL Script (Fast) ⚡
**Best for**: Technical users, quick additions

1. Use `add_faculty_template.sql`
2. Replace placeholder values
3. Upload files to Supabase Storage
4. Run script in SQL Editor
5. Create Auth user manually

**Pros**: Fast, direct database access
**Cons**: Requires SQL knowledge

---

### Method 3: API Endpoint (Automated) 🤖
**Best for**: Bulk imports, integrations

1. Create API endpoint: `/api/admin/faculty/add`
2. Send POST request with JSON data
3. Include file uploads (multipart/form-data)
4. API handles everything automatically

**Pros**: Automated, scalable
**Cons**: Requires API development

---

## 📁 File Organization

```
Supabase Storage
│
├── faculty-photos/          (PUBLIC)
│   ├── FACCSE001.jpg
│   ├── FACCSE002.jpg
│   ├── FACCSE003.jpg
│   ├── FACIT001.jpg
│   └── ...
│
├── faculty-resumes/         (PRIVATE)
│   ├── FACCSE001_resume.pdf
│   ├── FACCSE002_resume.pdf
│   ├── FACCSE003_resume.pdf
│   └── ...
│
└── student-photos/          (PUBLIC)
    ├── 24CSE001.jpg
    ├── 24CSE002.jpg
    └── ...
```

---

## 🔐 Security Checklist

- [ ] Photo bucket is PUBLIC (for display on website)
- [ ] Resume bucket is PRIVATE (only authorized access)
- [ ] RLS policies are enabled
- [ ] Only admins can upload/modify faculty data
- [ ] File size limits are enforced (2MB photos, 5MB resumes)
- [ ] Only allowed MIME types (JPG/PNG for photos, PDF for resumes)
- [ ] Aadhar/PAN numbers are encrypted (if required by law)
- [ ] Personal emails are optional and protected
- [ ] Auth users have strong password requirements

---

## 📊 Data Validation Rules

### Employee ID
- Format: `FAC{DEPT}{NUMBER}` (e.g., FACCSE003)
- Must be unique
- 6-10 characters

### Email
- Format: `firstname.lastname@nriit.ac.in`
- Must be unique
- Must be valid email format

### Phone
- Format: 10 digits
- Must be unique
- Indian mobile number

### Photo
- Format: JPG or PNG
- Aspect Ratio: 1:1 (square)
- Min Size: 500x500px
- Max Size: 2MB
- Background: Plain, light color preferred

### Resume
- Format: PDF only
- Max Size: 5MB
- Should include: Education, Experience, Publications

### Aadhar
- Format: 12 digits
- Must be unique
- Optional but recommended

### PAN
- Format: 10 characters (ABCDE1234F)
- Must be unique
- Optional but recommended

---

## 🎓 Department Codes Reference

| Code    | Department Name                              |
|---------|----------------------------------------------|
| CSE     | Computer Science & Engineering               |
| CSE-DS  | CSE (Data Science)                          |
| CSE-AI  | CSE (Artificial Intelligence)               |
| IT      | Information Technology                       |
| ECE     | Electronics & Communication Engineering      |
| CIVIL   | Civil Engineering                            |
| MBA     | Master of Business Administration            |
| MCA     | Master of Computer Applications              |
| BSH     | Basic Sciences & Humanities                  |

---

## 👔 Designation Reference

- Professor
- Associate Professor
- Assistant Professor
- Senior Assistant Professor
- Lecturer
- Lab Instructor
- Guest Faculty
- Visiting Faculty
- Research Scholar
- Teaching Assistant

---

## 🐛 Common Issues & Solutions

### Issue 1: "Duplicate key value violates unique constraint"
**Cause**: Employee ID or email already exists
**Solution**: 
```sql
-- Check existing records
SELECT employee_id, email FROM faculty_profiles 
WHERE employee_id = 'FACCSE003' OR email = 'faculty@nriit.ac.in';
```

### Issue 2: Photo not displaying
**Cause**: Incorrect URL or bucket not public
**Solution**:
1. Verify bucket is public
2. Check photo URL format
3. Test URL in browser
4. Ensure file extension is correct

### Issue 3: Resume upload fails
**Cause**: File too large or wrong format
**Solution**:
1. Check file size (max 5MB)
2. Verify file is PDF
3. Check bucket permissions
4. Try re-uploading

### Issue 4: Cannot login after creation
**Cause**: Auth user not created
**Solution**:
1. Go to Supabase → Authentication → Users
2. Create user with same email
3. Set password
4. Auto-confirm user

### Issue 5: RLS policy blocking access
**Cause**: Restrictive Row Level Security
**Solution**:
```sql
-- Temporarily disable RLS for testing
ALTER TABLE faculty_profiles DISABLE ROW LEVEL SECURITY;

-- Re-enable after testing
ALTER TABLE faculty_profiles ENABLE ROW LEVEL SECURITY;
```

---

## 📞 Support & Resources

### Files Created
1. `HOW_TO_ADD_FACULTY.md` - Complete guide
2. `add_faculty_template.sql` - SQL template
3. `example_add_faculty.sql` - Working example
4. `setup_storage.sql` - Storage setup

### Useful Queries

**List all faculty:**
```sql
SELECT employee_id, first_name, last_name, dept_code, designation, email
FROM faculty_profiles
WHERE is_active = true
ORDER BY dept_code, employee_id;
```

**Count faculty by department:**
```sql
SELECT dept_code::TEXT, COUNT(*) as faculty_count
FROM faculty_profiles
WHERE is_active = true
GROUP BY dept_code
ORDER BY dept_code;
```

**Find faculty without photos:**
```sql
SELECT employee_id, first_name, last_name, email
FROM faculty_profiles
WHERE photo_path IS NULL OR photo_path = ''
AND is_active = true;
```

**Find faculty without resumes:**
```sql
SELECT employee_id, first_name, last_name, email
FROM faculty_profiles
WHERE resume_path IS NULL OR resume_path = ''
AND is_active = true;
```

---

## ✅ Final Checklist

Before marking a faculty addition as complete:

- [ ] User account created in `users` table
- [ ] Faculty profile created in `faculty_profiles` table
- [ ] Photo uploaded and URL saved
- [ ] Resume uploaded and path saved
- [ ] Photo displays correctly on website
- [ ] Resume is accessible (with proper permissions)
- [ ] Auth user created for login
- [ ] Login tested successfully
- [ ] Profile page displays all information
- [ ] Email sent to faculty with credentials
- [ ] Faculty added to department mailing list
- [ ] Faculty assigned to courses (if applicable)
- [ ] Mentor status set correctly

---

**Last Updated**: December 10, 2024  
**Version**: 1.0  
**Maintained by**: NRIIT IT Team
