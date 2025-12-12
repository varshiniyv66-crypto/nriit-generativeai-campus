# 📘 Complete Guide: Adding a New Faculty Member

## Overview
This guide explains how to add a new faculty member to the NRIIT platform with their photo, profile PDF (resume), and complete details.

---

## 🎯 What You'll Need

Before starting, gather these details about the new faculty:

### 1. **Personal Information**
- First Name & Last Name
- Employee ID (e.g., `FACCSE003`)
- Email (institutional: `@nriit.ac.in`)
- Personal Email (optional)
- Phone Number
- Date of Birth
- Gender (male/female/other)
- Blood Group (A+, A-, B+, B-, AB+, AB-, O+, O-)

### 2. **Professional Information**
- Department Code (CSE, IT, ECE, CIVIL, MBA, MCA, BSH)
- Designation (Professor, Associate Professor, Assistant Professor, etc.)
- Qualification (Ph.D., M.Tech, M.E., etc.)
- Specialization (e.g., "Machine Learning", "VLSI Design")
- Experience in Years (e.g., 5.5)
- Date of Joining

### 3. **Contact & Address**
- Current Address
- City, State, Pincode
- Aadhar Number (12 digits)
- PAN Number (10 characters)

### 4. **Research Profiles** (Optional)
- Google Scholar ID
- ORCID ID
- ResearchGate ID
- Scopus ID
- Publications Count
- Patents Count
- Projects Count

### 5. **Files to Upload**
- **Photo**: 1:1 ratio (square), preferably 500x500px or higher, JPG/PNG
- **Resume/CV**: PDF format

---

## 🚀 Method 1: Using Admin Dashboard (Recommended)

### Step 1: Access Admin Panel
1. Login to the platform as **Dean** or **Admin**
2. Navigate to **Admin Dashboard** → **Faculty Management**
3. Click **"Add New Faculty"** button

### Step 2: Fill Faculty Details Form
The form will have these sections:

#### A. Basic Information
```
- Employee ID: FACCSE003
- First Name: Rajesh
- Last Name: Kumar
- Email: rajesh.kumar@nriit.ac.in
- Phone: 9876543210
- Date of Birth: 1985-06-15
- Gender: Male
- Blood Group: B+
```

#### B. Professional Details
```
- Department: CSE
- Designation: Assistant Professor
- Qualification: Ph.D. in Computer Science
- Specialization: Machine Learning & AI
- Experience: 8.5 years
- Date of Joining: 2024-01-15
```

#### C. Address & Documents
```
- Address: H.No. 12-34, Street Name, Area
- City: Guntur
- State: Andhra Pradesh
- Pincode: 522019
- Aadhar: 123456789012
- PAN: ABCDE1234F
```

#### D. Research Profile (Optional)
```
- Google Scholar: scholar_id_here
- ORCID: 0000-0001-2345-6789
- Publications: 15
- Patents: 2
```

#### E. File Uploads
1. **Upload Photo**:
   - Click "Choose Photo" button
   - Select square image (1:1 ratio)
   - Preview will show before upload
   
2. **Upload Resume**:
   - Click "Choose Resume" button
   - Select PDF file (max 5MB)
   - File name will be displayed

### Step 3: Submit & Verify
1. Click **"Preview"** to review all details
2. Click **"Submit"** to save
3. System will:
   - Upload photo to Supabase Storage
   - Upload resume to Supabase Storage
   - Create user account
   - Create faculty profile
   - Send welcome email (if configured)

---

## 🛠️ Method 2: Using SQL (Direct Database Entry)

### Step 1: Upload Files to Supabase Storage

#### A. Setup Supabase Storage Buckets (One-time setup)

Go to **Supabase Dashboard** → **Storage** and create these buckets:

1. **faculty-photos**
   - Public: Yes
   - File size limit: 2MB
   - Allowed MIME types: `image/jpeg, image/png`

2. **faculty-resumes**
   - Public: No (Private)
   - File size limit: 5MB
   - Allowed MIME types: `application/pdf`

#### B. Upload Files Manually

1. Go to **Storage** → **faculty-photos**
2. Click **Upload** → Select photo → Upload
3. Copy the public URL (e.g., `https://[project].supabase.co/storage/v1/object/public/faculty-photos/FACCSE003.jpg`)

4. Go to **Storage** → **faculty-resumes**
5. Upload resume PDF
6. Copy the storage path (e.g., `faculty-resumes/FACCSE003_resume.pdf`)

### Step 2: Run SQL Script

Go to **Supabase Dashboard** → **SQL Editor** and run this script:

```sql
-- ===========================================
-- ADD NEW FACULTY MEMBER
-- Replace values with actual faculty details
-- ===========================================

DO $$
DECLARE
    new_user_id UUID;
    new_faculty_id UUID;
BEGIN
    -- Step 1: Create user account
    INSERT INTO users (
        email, 
        phone, 
        role, 
        is_active, 
        email_verified
    )
    VALUES (
        'rajesh.kumar@nriit.ac.in',  -- Replace with actual email
        '9876543210',                 -- Replace with actual phone
        'faculty',
        true,
        true
    )
    ON CONFLICT (email) DO UPDATE 
    SET last_login = NOW()
    RETURNING id INTO new_user_id;

    RAISE NOTICE 'User created with ID: %', new_user_id;

    -- Step 2: Create faculty profile
    INSERT INTO faculty_profiles (
        user_id,
        employee_id,
        first_name,
        last_name,
        dept_code,
        designation,
        qualification,
        specialization,
        experience_years,
        date_of_joining,
        date_of_birth,
        gender,
        blood_group,
        phone,
        email,
        personal_email,
        address,
        city,
        state,
        pincode,
        photo_path,
        resume_path,
        aadhar_number,
        pan_number,
        google_scholar_id,
        orcid_id,
        research_gate_id,
        scopus_id,
        publications_count,
        patents_count,
        projects_count,
        is_mentor,
        is_active
    )
    VALUES (
        new_user_id,
        'FACCSE003',                                    -- Employee ID
        'Rajesh',                                        -- First Name
        'Kumar',                                         -- Last Name
        'CSE',                                          -- Department
        'Assistant Professor',                          -- Designation
        'Ph.D. in Computer Science',                   -- Qualification
        'Machine Learning & Artificial Intelligence',   -- Specialization
        8.5,                                            -- Experience (years)
        '2024-01-15',                                   -- Date of Joining
        '1985-06-15',                                   -- Date of Birth
        'male',                                         -- Gender
        'B+',                                           -- Blood Group
        '9876543210',                                   -- Phone
        'rajesh.kumar@nriit.ac.in',                    -- Email
        'rajesh.personal@gmail.com',                   -- Personal Email
        'H.No. 12-34, Street Name, Area Name',         -- Address
        'Guntur',                                       -- City
        'Andhra Pradesh',                              -- State
        '522019',                                       -- Pincode
        'https://[project].supabase.co/storage/v1/object/public/faculty-photos/FACCSE003.jpg',  -- Photo URL
        'faculty-resumes/FACCSE003_resume.pdf',        -- Resume Path
        '123456789012',                                 -- Aadhar
        'ABCDE1234F',                                  -- PAN
        'scholar_id_here',                             -- Google Scholar
        '0000-0001-2345-6789',                         -- ORCID
        'researchgate_id',                             -- ResearchGate
        'scopus_id',                                   -- Scopus
        15,                                            -- Publications
        2,                                             -- Patents
        5,                                             -- Projects
        true,                                          -- Is Mentor
        true                                           -- Is Active
    )
    ON CONFLICT (employee_id) DO NOTHING
    RETURNING id INTO new_faculty_id;

    RAISE NOTICE 'Faculty profile created with ID: %', new_faculty_id;
    RAISE NOTICE '✅ Faculty member added successfully!';
    RAISE NOTICE 'Employee ID: FACCSE003';
    RAISE NOTICE 'Email: rajesh.kumar@nriit.ac.in';

END $$;

-- Verify the new faculty was added
SELECT 
    employee_id,
    first_name || ' ' || last_name as full_name,
    dept_code,
    designation,
    email,
    phone,
    is_active
FROM faculty_profiles
WHERE employee_id = 'FACCSE003';
```

### Step 3: Create Supabase Auth User (Optional but Recommended)

For login functionality:

1. Go to **Supabase Dashboard** → **Authentication** → **Users**
2. Click **"Add User"**
3. Fill:
   - Email: `rajesh.kumar@nriit.ac.in`
   - Password: `Temp@123` (faculty should change on first login)
   - Auto Confirm User: ✅ Yes
4. Click **"Create User"**

---

## 📤 File Upload Implementation Details

### Storage Structure
```
supabase-storage/
├── faculty-photos/
│   ├── FACCSE001.jpg
│   ├── FACCSE002.jpg
│   ├── FACCSE003.jpg
│   └── ...
│
├── faculty-resumes/
│   ├── FACCSE001_resume.pdf
│   ├── FACCSE002_resume.pdf
│   ├── FACCSE003_resume.pdf
│   └── ...
│
└── student-photos/
    ├── 24CSE001.jpg
    ├── 24CSE002.jpg
    └── ...
```

### Photo Requirements
- **Format**: JPG, PNG
- **Aspect Ratio**: 1:1 (square)
- **Recommended Size**: 500x500px minimum
- **Max File Size**: 2MB
- **Background**: Plain, preferably light color
- **Naming**: `{EMPLOYEE_ID}.jpg` (e.g., `FACCSE003.jpg`)

### Resume Requirements
- **Format**: PDF only
- **Max File Size**: 5MB
- **Naming**: `{EMPLOYEE_ID}_resume.pdf` (e.g., `FACCSE003_resume.pdf`)
- **Content**: Should include education, experience, publications, etc.

---

## 🎨 Admin UI Component (React/Next.js)

Here's a sample component for the admin panel:

```typescript
// src/app/admin/faculty/add/page.tsx
'use client';

import { useState } from 'react';
import { createClientComponentClient } from '@supabase/auth-helpers-nextjs';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { Select } from '@/components/ui/select';
import { Textarea } from '@/components/ui/textarea';

export default function AddFacultyPage() {
  const supabase = createClientComponentClient();
  const [loading, setLoading] = useState(false);
  const [photoFile, setPhotoFile] = useState<File | null>(null);
  const [resumeFile, setResumeFile] = useState<File | null>(null);
  
  const [formData, setFormData] = useState({
    employeeId: '',
    firstName: '',
    lastName: '',
    email: '',
    phone: '',
    deptCode: 'CSE',
    designation: '',
    qualification: '',
    specialization: '',
    experienceYears: '',
    dateOfJoining: '',
    dateOfBirth: '',
    gender: 'male',
    bloodGroup: 'O+',
    address: '',
    city: '',
    state: '',
    pincode: '',
    aadharNumber: '',
    panNumber: '',
  });

  const handlePhotoUpload = async (file: File) => {
    const fileName = `${formData.employeeId}.${file.name.split('.').pop()}`;
    const { data, error } = await supabase.storage
      .from('faculty-photos')
      .upload(fileName, file, { upsert: true });
    
    if (error) throw error;
    
    const { data: { publicUrl } } = supabase.storage
      .from('faculty-photos')
      .getPublicUrl(fileName);
    
    return publicUrl;
  };

  const handleResumeUpload = async (file: File) => {
    const fileName = `${formData.employeeId}_resume.pdf`;
    const { data, error } = await supabase.storage
      .from('faculty-resumes')
      .upload(fileName, file, { upsert: true });
    
    if (error) throw error;
    return fileName;
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setLoading(true);

    try {
      // 1. Upload photo
      let photoPath = '';
      if (photoFile) {
        photoPath = await handlePhotoUpload(photoFile);
      }

      // 2. Upload resume
      let resumePath = '';
      if (resumeFile) {
        resumePath = await handleResumeUpload(resumeFile);
      }

      // 3. Create user
      const { data: userData, error: userError } = await supabase
        .from('users')
        .insert({
          email: formData.email,
          phone: formData.phone,
          role: 'faculty',
          is_active: true,
          email_verified: true,
        })
        .select()
        .single();

      if (userError) throw userError;

      // 4. Create faculty profile
      const { error: profileError } = await supabase
        .from('faculty_profiles')
        .insert({
          user_id: userData.id,
          employee_id: formData.employeeId,
          first_name: formData.firstName,
          last_name: formData.lastName,
          dept_code: formData.deptCode,
          designation: formData.designation,
          qualification: formData.qualification,
          specialization: formData.specialization,
          experience_years: parseFloat(formData.experienceYears),
          date_of_joining: formData.dateOfJoining,
          date_of_birth: formData.dateOfBirth,
          gender: formData.gender,
          blood_group: formData.bloodGroup,
          phone: formData.phone,
          email: formData.email,
          address: formData.address,
          city: formData.city,
          state: formData.state,
          pincode: formData.pincode,
          photo_path: photoPath,
          resume_path: resumePath,
          aadhar_number: formData.aadharNumber,
          pan_number: formData.panNumber,
          is_mentor: true,
          is_active: true,
        });

      if (profileError) throw profileError;

      alert('Faculty member added successfully!');
      // Reset form or redirect
    } catch (error) {
      console.error('Error adding faculty:', error);
      alert('Error adding faculty member');
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="container mx-auto p-6">
      <h1 className="text-3xl font-bold mb-6">Add New Faculty Member</h1>
      
      <form onSubmit={handleSubmit} className="space-y-6">
        {/* Basic Information */}
        <section className="bg-white p-6 rounded-lg shadow">
          <h2 className="text-xl font-semibold mb-4">Basic Information</h2>
          <div className="grid grid-cols-2 gap-4">
            <div>
              <Label>Employee ID *</Label>
              <Input
                required
                value={formData.employeeId}
                onChange={(e) => setFormData({...formData, employeeId: e.target.value})}
                placeholder="FACCSE003"
              />
            </div>
            <div>
              <Label>Email *</Label>
              <Input
                required
                type="email"
                value={formData.email}
                onChange={(e) => setFormData({...formData, email: e.target.value})}
                placeholder="faculty@nriit.ac.in"
              />
            </div>
            {/* Add more fields... */}
          </div>
        </section>

        {/* File Uploads */}
        <section className="bg-white p-6 rounded-lg shadow">
          <h2 className="text-xl font-semibold mb-4">Upload Files</h2>
          <div className="grid grid-cols-2 gap-4">
            <div>
              <Label>Photo (1:1 ratio) *</Label>
              <Input
                type="file"
                accept="image/jpeg,image/png"
                onChange={(e) => setPhotoFile(e.target.files?.[0] || null)}
              />
            </div>
            <div>
              <Label>Resume (PDF) *</Label>
              <Input
                type="file"
                accept="application/pdf"
                onChange={(e) => setResumeFile(e.target.files?.[0] || null)}
              />
            </div>
          </div>
        </section>

        <Button type="submit" disabled={loading}>
          {loading ? 'Adding...' : 'Add Faculty Member'}
        </Button>
      </form>
    </div>
  );
}
```

---

## 🔐 Security & Permissions

### Row Level Security (RLS) Policies

```sql
-- Allow admins to insert faculty profiles
CREATE POLICY "Admins can insert faculty"
ON faculty_profiles
FOR INSERT
TO authenticated
WITH CHECK (
  EXISTS (
    SELECT 1 FROM users
    WHERE users.id = auth.uid()
    AND users.role IN ('admin', 'dean', 'principal')
  )
);

-- Allow admins to update faculty profiles
CREATE POLICY "Admins can update faculty"
ON faculty_profiles
FOR UPDATE
TO authenticated
USING (
  EXISTS (
    SELECT 1 FROM users
    WHERE users.id = auth.uid()
    AND users.role IN ('admin', 'dean', 'principal')
  )
);
```

### Storage Policies

```sql
-- Allow authenticated users to upload faculty photos
CREATE POLICY "Admins can upload faculty photos"
ON storage.objects
FOR INSERT
TO authenticated
WITH CHECK (
  bucket_id = 'faculty-photos' AND
  auth.role() = 'authenticated'
);

-- Allow public read access to faculty photos
CREATE POLICY "Public can view faculty photos"
ON storage.objects
FOR SELECT
TO public
USING (bucket_id = 'faculty-photos');
```

---

## ✅ Verification Checklist

After adding a faculty member, verify:

- [ ] User account created in `users` table
- [ ] Faculty profile created in `faculty_profiles` table
- [ ] Photo uploaded to `faculty-photos` bucket
- [ ] Resume uploaded to `faculty-resumes` bucket
- [ ] Photo URL accessible publicly
- [ ] Resume accessible (with proper permissions)
- [ ] Employee ID is unique
- [ ] Email is unique
- [ ] Can login with credentials (if Auth user created)
- [ ] Profile displays correctly on faculty list
- [ ] Photo displays on profile page

---

## 🐛 Troubleshooting

### Issue: "Duplicate key value violates unique constraint"
**Solution**: Employee ID or email already exists. Check existing records:
```sql
SELECT employee_id, email FROM faculty_profiles WHERE employee_id = 'FACCSE003';
```

### Issue: Photo not displaying
**Solution**: 
1. Check if bucket is public
2. Verify photo URL is correct
3. Check file format (JPG/PNG only)

### Issue: Resume upload fails
**Solution**:
1. Check file size (max 5MB)
2. Verify file is PDF format
3. Check storage bucket permissions

---

## 📞 Need Help?

If you encounter issues:
1. Check Supabase logs in Dashboard → Logs
2. Verify RLS policies are correct
3. Check browser console for errors
4. Ensure all required fields are filled

---

**Last Updated**: December 10, 2024
**Version**: 1.0
