# 📊 COMPLETE DATABASE SCHEMA - ALL TABLES & FIELDS

## 🎯 **EXACT DATABASE STRUCTURE**

This document shows EVERY table and EVERY field in your Supabase database.

---

## 📋 **TABLE 1: departments**

### **Fields:**
```sql
CREATE TABLE departments (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    code TEXT UNIQUE NOT NULL,
    name TEXT NOT NULL,
    short_name TEXT,
    established_year INTEGER,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```

### **CSV Template Fields:**
✅ `code` - Department code (CSE, ECE, etc.)  
✅ `name` - Full department name  
✅ `short_name` - Short name  
✅ `established_year` - Year established  
✅ `is_active` - TRUE/FALSE  

**Auto-generated (Don't provide):**
- `id` - Auto UUID
- `created_at` - Auto timestamp
- `updated_at` - Auto timestamp

---

## 👨‍🏫 **TABLE 2: faculty_profiles**

### **Fields:**
```sql
CREATE TABLE faculty_profiles (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES users(id),
    employee_id TEXT UNIQUE NOT NULL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    phone TEXT,
    dept_code TEXT NOT NULL,
    designation TEXT,
    qualification TEXT,
    specialization TEXT,
    experience_years DECIMAL(4,1),
    date_of_joining DATE,
    photo_url TEXT,
    resume_url TEXT,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```

### **CSV Template Fields:**
✅ `employee_id` - Unique employee ID  
✅ `first_name` - First name  
✅ `last_name` - Last name  
✅ `email` - Email address  
✅ `phone` - Phone number  
✅ `dept_code` - Department code  
✅ `designation` - Professor/Associate Professor/etc.  
✅ `qualification` - Ph.D/M.Tech/etc.  
✅ `specialization` - Area of expertise  
✅ `experience_years` - Years of experience (decimal)  
✅ `date_of_joining` - Date joined (YYYY-MM-DD)  
✅ `is_active` - TRUE/FALSE  

**Auto-generated (Don't provide):**
- `id` - Auto UUID
- `user_id` - Auto linked to users table
- `photo_url` - Uploaded later
- `resume_url` - Uploaded later
- `created_at` - Auto timestamp
- `updated_at` - Auto timestamp

---

## 🎓 **TABLE 3: student_profiles**

### **Fields:**
```sql
CREATE TABLE student_profiles (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES users(id),
    roll_number TEXT UNIQUE NOT NULL,
    registration_number TEXT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    phone TEXT,
    dept_code TEXT NOT NULL,
    batch_id UUID REFERENCES academic_batches(id),
    year INTEGER,
    section TEXT,
    current_semester INTEGER,
    admission_date DATE,
    admission_type TEXT,
    photo_url TEXT,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```

### **CSV Template Fields:**
✅ `roll_number` - Unique roll number  
✅ `registration_number` - University registration  
✅ `first_name` - First name  
✅ `last_name` - Last name  
✅ `email` - Email address  
✅ `phone` - Phone number  
✅ `dept_code` - Department code  
✅ `year` - 1, 2, 3, or 4  
✅ `section` - A, B, C, etc.  
✅ `current_semester` - 1-8  
✅ `admission_date` - Date admitted (YYYY-MM-DD)  
✅ `admission_type` - EAMCET/Management/etc.  
✅ `is_active` - TRUE/FALSE  

**Auto-generated (Don't provide):**
- `id` - Auto UUID
- `user_id` - Auto linked to users table
- `batch_id` - Auto calculated from year
- `photo_url` - Uploaded later
- `created_at` - Auto timestamp
- `updated_at` - Auto timestamp

---

## 📚 **TABLE 4: subjects** (NOT IN CURRENT DATABASE)

**Note:** This table needs to be created! Currently subjects are handled differently.

**Recommended fields:**
```sql
CREATE TABLE subjects (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    subject_code TEXT UNIQUE NOT NULL,
    subject_name TEXT NOT NULL,
    dept_code TEXT NOT NULL,
    year INTEGER,
    semester INTEGER,
    credits INTEGER,
    subject_type TEXT, -- theory, lab, project
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```

---

## 📅 **TABLE 5: timetable** (NOT IN CURRENT DATABASE)

**Note:** This table needs to be created!

**Recommended fields:**
```sql
CREATE TABLE faculty_timetable (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    faculty_id UUID REFERENCES faculty_profiles(id),
    subject_code TEXT,
    dept_code TEXT,
    year INTEGER,
    section TEXT,
    day_of_week INTEGER, -- 1=Monday, 7=Sunday
    period_number INTEGER,
    start_time TIME,
    end_time TIME,
    room_number TEXT,
    academic_year TEXT,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```

---

## 👨‍👩‍👦 **TABLE 6: parent_details** (NOT IN CURRENT DATABASE)

**Note:** This table needs to be created!

**Recommended fields:**
```sql
CREATE TABLE parent_details (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    student_id UUID REFERENCES student_profiles(id),
    father_name TEXT,
    father_phone TEXT,
    father_email TEXT,
    mother_name TEXT,
    mother_phone TEXT,
    mother_email TEXT,
    guardian_name TEXT,
    guardian_phone TEXT,
    guardian_email TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```

---

## 📝 **TABLE 7: faculty_research_papers**

### **Fields:**
```sql
CREATE TABLE faculty_research_papers (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    faculty_id UUID REFERENCES faculty_profiles(id),
    title TEXT NOT NULL,
    authors TEXT NOT NULL,
    journal_name TEXT,
    conference_name TEXT,
    publication_type TEXT NOT NULL,
    publication_date DATE,
    doi TEXT,
    isbn TEXT,
    issn TEXT,
    volume TEXT,
    issue TEXT,
    pages TEXT,
    publisher TEXT,
    impact_factor DECIMAL(10,3),
    citations_count INTEGER DEFAULT 0,
    scopus_indexed BOOLEAN DEFAULT false,
    web_of_science_indexed BOOLEAN DEFAULT false,
    ugc_approved BOOLEAN DEFAULT false,
    pdf_url TEXT,
    status TEXT DEFAULT 'pending',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```

### **CSV Template Fields:**
✅ `faculty_employee_id` - Faculty employee ID (will be converted to faculty_id)  
✅ `title` - Paper title  
✅ `authors` - All authors  
✅ `journal_name` - Journal name  
✅ `publication_type` - journal/conference/etc.  
✅ `publication_date` - Date published (YYYY-MM-DD)  
✅ `doi` - DOI number  
✅ `impact_factor` - Impact factor  
✅ `scopus_indexed` - TRUE/FALSE  
✅ `ugc_approved` - TRUE/FALSE  

---

## 🎓 **TABLE 8: faculty_workshops**

### **Fields:**
```sql
CREATE TABLE faculty_workshops (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    faculty_id UUID REFERENCES faculty_profiles(id),
    title TEXT NOT NULL,
    type TEXT NOT NULL, -- attended, conducted, organized
    category TEXT NOT NULL, -- FDP, workshop, seminar, etc.
    organizer TEXT,
    venue TEXT,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    duration_days INTEGER,
    certificate_url TEXT,
    description TEXT,
    status TEXT DEFAULT 'pending',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```

### **CSV Template Fields:**
✅ `faculty_employee_id` - Faculty employee ID  
✅ `title` - Workshop title  
✅ `type` - attended/conducted/organized  
✅ `category` - FDP/workshop/seminar/etc.  
✅ `organizer` - Organizing institution  
✅ `start_date` - Start date (YYYY-MM-DD)  
✅ `end_date` - End date (YYYY-MM-DD)  
✅ `duration_days` - Number of days  

---

## ✅ **TABLE 9: attendance_records** (NOT IN CURRENT DATABASE)

**Note:** This table needs to be created!

**Recommended fields:**
```sql
CREATE TABLE attendance_records (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    student_id UUID REFERENCES student_profiles(id),
    faculty_id UUID REFERENCES faculty_profiles(id),
    subject_code TEXT,
    date DATE NOT NULL,
    period_number INTEGER,
    status TEXT NOT NULL, -- present, absent, holiday, on_duty, medical
    academic_year TEXT,
    semester INTEGER,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```

---

## 📊 **TABLE 10: student_marks** (NOT IN CURRENT DATABASE)

**Note:** This table needs to be created!

**Recommended fields:**
```sql
CREATE TABLE student_marks (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    student_id UUID REFERENCES student_profiles(id),
    faculty_id UUID REFERENCES faculty_profiles(id),
    subject_code TEXT NOT NULL,
    exam_type TEXT NOT NULL, -- mid1, mid2, assignment1, etc.
    marks_obtained DECIMAL(5,2),
    max_marks DECIMAL(5,2),
    percentage DECIMAL(5,2),
    grade TEXT,
    academic_year TEXT,
    semester INTEGER,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```

---

## ⚠️ **IMPORTANT NOTES:**

### **Tables that EXIST in database:**
1. ✅ `departments`
2. ✅ `faculty_profiles`
3. ✅ `student_profiles`
4. ✅ `faculty_research_papers`
5. ✅ `faculty_workshops`
6. ✅ `users` (auto-managed)
7. ✅ `academic_batches` (auto-managed)

### **Tables that NEED TO BE CREATED:**
1. ❌ `subjects`
2. ❌ `faculty_timetable`
3. ❌ `parent_details`
4. ❌ `attendance_records`
5. ❌ `student_marks`

---

## 🎯 **WHAT THIS MEANS:**

### **You CAN import now:**
- ✅ Departments
- ✅ Faculty
- ✅ Students
- ✅ Faculty Research Papers
- ✅ Faculty Workshops

### **You NEED tables created for:**
- ❌ Subjects
- ❌ Timetable
- ❌ Parent Details
- ❌ Attendance
- ❌ Marks

---

## 🚀 **SOLUTION:**

### **Option 1: Import what exists**
Import only:
1. Departments
2. Faculty
3. Students
4. Faculty Research
5. Faculty Workshops

### **Option 2: Create missing tables first**
I'll create SQL script to add:
1. Subjects table
2. Timetable table
3. Parent Details table
4. Attendance table
5. Marks table

Then you can import all 10 templates!

---

## ✅ **RECOMMENDATION:**

**Do this:**
1. I'll create the missing tables
2. Then you can import all 10 templates
3. Everything will work perfectly

**Should I create the missing tables now?** 🚀

---

**Created**: 2025-12-11  
**Status**: Schema documented  
**Action**: Create missing tables or import existing data

---

**The templates match the database fields EXACTLY for tables that exist!**  
**We just need to create 5 more tables for complete functionality!** ✅
