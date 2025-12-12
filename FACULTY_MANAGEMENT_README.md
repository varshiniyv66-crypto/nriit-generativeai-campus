# 📚 Faculty Management - Complete Documentation Index

## 🎯 Overview

This documentation provides a complete guide for adding and managing faculty members in the NRIIT Digital University Platform, including photo uploads, resume/profile PDFs, and all necessary details.

---

## 📖 Documentation Files

### 1. **HOW_TO_ADD_FACULTY.md** 📘
**Purpose**: Comprehensive step-by-step guide  
**Best for**: First-time users, detailed instructions  
**Contents**:
- What information you need to collect
- Method 1: Using Admin Dashboard (UI)
- Method 2: Using SQL scripts
- File upload implementation
- Storage setup instructions
- Security & permissions
- Troubleshooting guide

**When to use**: When you need detailed explanations and context

---

### 2. **FACULTY_ADDITION_WORKFLOW.md** 🎯
**Purpose**: Visual workflow and quick reference  
**Best for**: Quick lookups, process overview  
**Contents**:
- Visual workflow diagram
- 3 different methods comparison
- File organization structure
- Security checklist
- Data validation rules
- Common issues & solutions
- Useful SQL queries

**When to use**: When you need a quick reference or workflow overview

---

### 3. **add_faculty_template.sql** 📝
**Purpose**: Ready-to-use SQL template  
**Best for**: Direct database entry  
**Contents**:
- Complete SQL script with placeholders
- Detailed comments for each field
- Department codes reference
- Designation reference
- Verification queries

**When to use**: When adding faculty via SQL Editor

---

### 4. **example_add_faculty.sql** 💡
**Purpose**: Working example with realistic data  
**Best for**: Learning by example  
**Contents**:
- Complete working example (Dr. Rajesh Kumar)
- All fields filled with sample data
- Success messages
- Next steps guidance

**When to use**: When you want to see a real example before creating your own

---

### 5. **setup_storage.sql** 🗄️
**Purpose**: Supabase Storage configuration  
**Best for**: Initial setup, one-time configuration  
**Contents**:
- Storage bucket creation guide
- RLS policies for file access
- Security configurations
- MIME type restrictions
- File size limits
- Helper functions

**When to use**: First-time setup or when configuring storage buckets

---

## 🚀 Quick Start Guide

### For Non-Technical Users (Recommended)
1. Read: `HOW_TO_ADD_FACULTY.md` → Method 1
2. Use: Admin Dashboard UI (when built)
3. Reference: `FACULTY_ADDITION_WORKFLOW.md` for checklist

### For Technical Users
1. Read: `FACULTY_ADDITION_WORKFLOW.md` → Method 2
2. Use: `add_faculty_template.sql`
3. Reference: `example_add_faculty.sql` for guidance

### For First-Time Setup
1. Run: `setup_storage.sql` (one-time)
2. Create storage buckets in Supabase Dashboard
3. Follow: `HOW_TO_ADD_FACULTY.md` → Storage Setup

---

## 📋 Process Summary

### Step 1: Prepare Data
Collect all required information:
- Personal details (name, DOB, contact)
- Professional details (dept, designation, qualification)
- Documents (photo 1:1 ratio, resume PDF)
- Employee ID assignment

### Step 2: Setup Storage (First Time Only)
- Create Supabase storage buckets
- Configure RLS policies
- Set file size limits
- Configure allowed MIME types

### Step 3: Upload Files
- Upload photo to `faculty-photos/` bucket
- Upload resume to `faculty-resumes/` bucket
- Copy URLs/paths for database entry

### Step 4: Add to Database
**Option A**: Use Admin Dashboard (UI)
- Fill form with all details
- Upload files through interface
- Submit and verify

**Option B**: Use SQL Script
- Open `add_faculty_template.sql`
- Replace all placeholder values
- Run in Supabase SQL Editor
- Verify success

### Step 5: Create Auth User
- Go to Supabase → Authentication → Users
- Add user with faculty email
- Set temporary password
- Auto-confirm user

### Step 6: Verify & Test
- Check database records
- Test photo display
- Test resume access
- Test login functionality
- Verify profile page

### Step 7: Notify Faculty
- Send welcome email
- Provide login credentials
- Share platform guide
- Request password change

---

## 🗂️ Database Schema Reference

### Tables Involved

#### 1. `users` table
- Stores authentication and basic user info
- Fields: email, phone, role, is_active

#### 2. `faculty_profiles` table
- Stores complete faculty information
- Fields: employee_id, name, dept, designation, qualification, etc.
- Relationships: user_id → users.id

#### 3. Storage Buckets
- `faculty-photos` (Public)
- `faculty-resumes` (Private)

---

## 🔐 Security Considerations

### Data Protection
- ✅ Aadhar/PAN numbers stored securely
- ✅ Personal emails are optional
- ✅ Resumes are in private bucket
- ✅ Only authorized users can upload/modify
- ✅ RLS policies enforce access control

### File Security
- ✅ File size limits enforced (2MB photos, 5MB resumes)
- ✅ MIME type restrictions (JPG/PNG for photos, PDF for resumes)
- ✅ Public photos for website display
- ✅ Private resumes with controlled access
- ✅ Virus scanning recommended for production

### Authentication
- ✅ Strong password requirements
- ✅ Email verification
- ✅ Role-based access control
- ✅ Session management
- ✅ Password reset functionality

---

## 📊 Required Information Checklist

### Basic Information ✅
- [ ] Employee ID (e.g., FACCSE003)
- [ ] First Name
- [ ] Last Name
- [ ] Email (@nriit.ac.in)
- [ ] Phone Number
- [ ] Date of Birth
- [ ] Gender
- [ ] Blood Group

### Professional Information ✅
- [ ] Department Code
- [ ] Designation
- [ ] Qualification
- [ ] Specialization
- [ ] Experience (years)
- [ ] Date of Joining

### Contact & Address ✅
- [ ] Full Address
- [ ] City
- [ ] State
- [ ] Pincode
- [ ] Personal Email (optional)

### Documents ✅
- [ ] Photo (1:1 ratio, 500x500px min, JPG/PNG, max 2MB)
- [ ] Resume (PDF, max 5MB)

### Government IDs ✅
- [ ] Aadhar Number (12 digits)
- [ ] PAN Number (10 chars)

### Research Profiles (Optional) ✅
- [ ] Google Scholar ID
- [ ] ORCID ID
- [ ] ResearchGate ID
- [ ] Scopus ID
- [ ] Publications Count
- [ ] Patents Count
- [ ] Projects Count

---

## 🎓 Department Codes

| Code    | Department                                   |
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

## 🛠️ Useful SQL Queries

### List All Faculty
```sql
SELECT employee_id, first_name, last_name, dept_code, designation, email
FROM faculty_profiles
WHERE is_active = true
ORDER BY dept_code, employee_id;
```

### Count by Department
```sql
SELECT dept_code::TEXT, COUNT(*) as faculty_count
FROM faculty_profiles
WHERE is_active = true
GROUP BY dept_code;
```

### Find Faculty Without Photos
```sql
SELECT employee_id, first_name, last_name
FROM faculty_profiles
WHERE (photo_path IS NULL OR photo_path = '') AND is_active = true;
```

### Find Faculty Without Resumes
```sql
SELECT employee_id, first_name, last_name
FROM faculty_profiles
WHERE (resume_path IS NULL OR resume_path = '') AND is_active = true;
```

---

## 🐛 Troubleshooting

### Common Issues

1. **Duplicate Employee ID**
   - Check existing records before adding
   - Use unique employee ID format

2. **Photo Not Displaying**
   - Verify bucket is public
   - Check URL format
   - Ensure correct file extension

3. **Resume Upload Fails**
   - Check file size (max 5MB)
   - Verify PDF format
   - Check bucket permissions

4. **Cannot Login**
   - Create Auth user in Supabase
   - Verify email matches
   - Check password requirements

5. **RLS Policy Blocking**
   - Verify user role
   - Check policy conditions
   - Temporarily disable for testing

---

## 📞 Support

### Documentation
- `HOW_TO_ADD_FACULTY.md` - Detailed guide
- `FACULTY_ADDITION_WORKFLOW.md` - Quick reference
- `add_faculty_template.sql` - SQL template
- `example_add_faculty.sql` - Working example
- `setup_storage.sql` - Storage setup

### Resources
- Supabase Documentation: https://supabase.com/docs
- Next.js Documentation: https://nextjs.org/docs
- Project Repository: (your repo URL)

### Contact
- IT Support: support@nriit.ac.in
- Dean's Office: dean@nriit.ac.in
- Phone: 0863 234 4300

---

## 🔄 Version History

| Version | Date       | Changes                                    |
|---------|------------|--------------------------------------------|
| 1.0     | 2024-12-10 | Initial documentation created              |

---

## ✅ Final Checklist

Before considering faculty addition complete:

- [ ] All required information collected
- [ ] Photo uploaded (1:1 ratio, correct format)
- [ ] Resume uploaded (PDF format)
- [ ] Database entry created
- [ ] Auth user created
- [ ] Login tested successfully
- [ ] Photo displays correctly
- [ ] Resume accessible
- [ ] Profile page shows all info
- [ ] Welcome email sent
- [ ] Faculty notified

---

**Status**: ✅ Complete Documentation  
**Last Updated**: December 10, 2024  
**Maintained by**: NRIIT IT Team
