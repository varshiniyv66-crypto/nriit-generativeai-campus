# 📥 DATA IMPORT GUIDE - NRIIT DIGITAL CAMPUS

## 🎯 **COMPLETE IMPORT WORKFLOW**

This guide will help you import all your data into the Supabase database using the perfect templates provided.

---

## 📋 **IMPORT ORDER (VERY IMPORTANT!)**

**You MUST import in this exact order due to foreign key dependencies:**

1. ✅ **Departments** (`1_departments.csv`)
2. ✅ **Faculty** (`2_faculty.csv`) - Depends on departments
3. ✅ **Students** (`3_students.csv`) - Depends on departments & faculty (mentor)
4. ✅ **Courses** (`4_courses.csv`) - Depends on departments
5. ✅ **Timetable** (`5_timetable.csv`) - Depends on courses & faculty
6. ✅ **Attendance** (`6_attendance.csv`) - Depends on students, courses & timetable
7. ✅ **Marks** (`7_marks.csv`) - Depends on students & courses

---

## 🔧 **PREPARATION STEPS**

### **Step 1: Review Sample Data**
Open each CSV file and review the sample data format:
- Check column headers
- Understand data types
- See example values

### **Step 2: Prepare Your Data**
- Collect all department information
- Gather faculty details (with research IDs)
- Compile student records (with parent details)
- List all courses for each semester
- Create class timetables
- Prepare attendance records
- Compile marks data

### **Step 3: Fill the Templates**
- **Keep column headers EXACTLY as provided**
- Replace sample rows with your actual data
- Follow the same format for dates, booleans, etc.
- Ensure all required fields are filled

---

## 📊 **TEMPLATE DETAILS**

### **1. DEPARTMENTS (1_departments.csv)**

**Required Fields (11):**
- `code` - CSE, ECE, MECH, etc.
- `name` - Full department name
- `short_name` - Abbreviated name
- `description` - Brief description
- `vision` - Vision statement
- `mission` - Mission statement
- `established_year` - Year (e.g., 2010)
- `contact_email` - dept@nriit.ac.in
- `contact_phone` - 10 digits
- `location` - Building/Floor
- `is_active` - TRUE/FALSE

**Sample:**
```csv
code,name,short_name,description,vision,mission,established_year,contact_email,contact_phone,location,is_active
CSE,Computer Science & Engineering,CSE,Premier CSE department,To be a center of excellence...,To provide quality education...,2010,cse@nriit.ac.in,9876543210,Main Block - 3rd Floor,TRUE
```

---

### **2. FACULTY (2_faculty.csv)**

**Required Fields (30):**
- Personal: employee_id, first_name, last_name, date_of_birth, gender, blood_group
- Professional: dept_code, designation, qualification, specialization, experience_years, date_of_joining
- Contact: phone, email, personal_email, address, city, state, pincode
- ID Proofs: aadhar_number, pan_number
- Research: google_scholar_id, orcid_id, research_gate_id, scopus_id
- Counts: publications_count, patents_count, projects_count
- Status: is_mentor, is_active

**Important Notes:**
- `employee_id` must be unique (e.g., FAC001, FAC002)
- `dept_code` must match a department code
- `email` format: firstname.lastname@nriit.ac.in
- `designation`: Professor, Associate Professor, Assistant Professor, etc.
- `qualification`: Ph.D, M.Tech, M.E, B.Tech, etc.
- `is_mentor`: TRUE if faculty is a mentor, FALSE otherwise
- Research IDs are optional but recommended

---

### **3. STUDENTS (3_students.csv)**

**Required Fields (39):**
- Personal: roll_number, registration_number, first_name, last_name, date_of_birth, gender, blood_group
- Academic: dept_code, current_semester, section, admission_date, admission_type
- Contact: phone, email, personal_email, permanent_address, current_address, city, state, pincode
- Family: father_name, father_phone, father_occupation, mother_name, mother_phone, mother_occupation
- Guardian: guardian_name, guardian_phone, guardian_relation (optional)
- Previous: previous_institution, previous_marks
- Category: nationality, category (OC/BC/SC/ST)
- ID: aadhar_number
- Facilities: is_hosteler, hostel_room, is_transport_user, transport_route
- Status: is_active

**Important Notes:**
- `roll_number` must be unique (e.g., 21B81A0501)
- `dept_code` must match a department code
- `current_semester`: 1-8
- `email` format: rollnumber@nriit.ac.in
- `admission_type`: EAMCET, Management, Lateral Entry, etc.
- Guardian details optional if not applicable

---

### **4. COURSES (4_courses.csv)**

**Required Fields (11):**
- `course_code` - Unique code (e.g., CS501, EC301)
- `course_name` - Full course name
- `dept_code` - Department offering the course
- `semester` - 1-8
- `credits` - Number of credits (e.g., 3, 4)
- `lecture_hours` - Hours per week (e.g., 3)
- `tutorial_hours` - Hours per week (e.g., 1)
- `practical_hours` - Hours per week (e.g., 2)
- `course_type` - theory, lab, project
- `is_elective` - TRUE/FALSE
- `is_active` - TRUE/FALSE

**Sample:**
```csv
course_code,course_name,dept_code,semester,credits,lecture_hours,tutorial_hours,practical_hours,course_type,is_elective,is_active
CS501,Machine Learning,CSE,5,4,3,1,0,theory,FALSE,TRUE
CS502,Compiler Design Lab,CSE,5,2,0,0,4,lab,FALSE,TRUE
```

---

### **5. TIMETABLE (5_timetable.csv)**

**Required Fields (11):**
- `dept_code` - Department code
- `batch_year` - Batch year (e.g., 2021 for 2021-25 batch)
- `semester` - Semester number (1-8)
- `section` - Section (A, B, C, etc.)
- `academic_year` - Academic year (e.g., 2024-25)
- `day_of_week` - 1=Monday, 2=Tuesday, ..., 6=Saturday
- `period_number` - 1-8 (8 periods per day)
- `course_code` - Course code (must exist in courses)
- `employee_id` - Faculty employee ID (must exist in faculty)
- `room_number` - Room/Lab number
- `is_lab` - TRUE for lab periods, FALSE for theory

**Sample:**
```csv
dept_code,batch_year,semester,section,academic_year,day_of_week,period_number,course_code,employee_id,room_number,is_lab
CSE,2021,5,A,2024-25,1,1,CS501,FAC001,CSE-301,FALSE
CSE,2021,5,A,2024-25,1,5,CS502,FAC002,CSE-LAB1,TRUE
```

**Notes:**
- Lab sessions typically span 2-3 consecutive periods
- Same course_code and employee_id for consecutive lab periods

---

### **6. ATTENDANCE (6_attendance.csv)**

**Required Fields (6):**
- `roll_number` - Student roll number (must exist)
- `course_code` - Course code (must exist)
- `attendance_date` - Date in YYYY-MM-DD format
- `period_number` - 1-8
- `status` - present, absent, late, on_duty, medical_leave
- `remarks` - Optional notes

**Sample:**
```csv
roll_number,course_code,attendance_date,period_number,status,remarks
21B81A0501,CS501,2024-12-10,1,present,
21B81A0501,CS501,2024-12-10,2,absent,Sick
21B81A0502,CS501,2024-12-10,1,late,Arrived 10 mins late
```

**Status Values:**
- `present` - Student attended
- `absent` - Student was absent
- `late` - Student came late
- `on_duty` - Student on official duty
- `medical_leave` - Student on medical leave

---

### **7. MARKS (7_marks.csv)**

**Required Fields (9):**
- `roll_number` - Student roll number (must exist)
- `course_code` - Course code (must exist)
- `exam_type` - internal_1, internal_2, mid_1, mid_2, external, supplementary
- `academic_year` - Academic year (e.g., 2024-25)
- `semester_type` - odd, even
- `marks_obtained` - Marks scored
- `max_marks` - Maximum marks for the exam
- `is_absent` - TRUE if student was absent, FALSE otherwise
- `remarks` - Optional notes

**Sample:**
```csv
roll_number,course_code,exam_type,academic_year,semester_type,marks_obtained,max_marks,is_absent,remarks
21B81A0501,CS501,internal_1,2024-25,odd,38,50,FALSE,Good performance
21B81A0501,CS501,internal_2,2024-25,odd,42,50,FALSE,Improved
21B81A0501,CS501,external,2024-25,odd,75,100,FALSE,
21B81A0502,CS502,internal_1,2024-25,odd,0,50,TRUE,Absent due to illness
```

**Exam Types:**
- `internal_1` - First internal exam
- `internal_2` - Second internal exam
- `mid_1` - First mid-term
- `mid_2` - Second mid-term
- `external` - External/University exam
- `supplementary` - Supplementary exam

---

## ✅ **DATA VALIDATION CHECKLIST**

### **Before Import:**

#### **General:**
- [ ] All column names match exactly (case-sensitive)
- [ ] No extra columns added
- [ ] No columns removed
- [ ] CSV file is UTF-8 encoded
- [ ] No special characters causing issues

#### **Data Types:**
- [ ] Dates are in YYYY-MM-DD format
- [ ] Booleans are TRUE or FALSE (not Yes/No, 1/0)
- [ ] Phone numbers are 10 digits (no spaces, dashes)
- [ ] Email addresses are valid
- [ ] Numbers don't have commas or currency symbols

#### **Required Fields:**
- [ ] No empty values in required fields
- [ ] All foreign keys reference existing records
- [ ] Department codes are consistent
- [ ] Roll numbers are unique
- [ ] Employee IDs are unique
- [ ] Course codes are unique

#### **Relationships:**
- [ ] Faculty dept_code exists in departments
- [ ] Student dept_code exists in departments
- [ ] Course dept_code exists in departments
- [ ] Timetable course_code exists in courses
- [ ] Timetable employee_id exists in faculty
- [ ] Attendance roll_number exists in students
- [ ] Attendance course_code exists in courses
- [ ] Marks roll_number exists in students
- [ ] Marks course_code exists in courses

---

## 🚀 **IMPORT METHODS**

### **Method 1: Supabase Dashboard (Recommended for Small Datasets)**

1. **Login to Supabase:**
   - Go to https://supabase.com
   - Login to your project

2. **Navigate to Table Editor:**
   - Click on "Table Editor" in sidebar
   - Select the table to import

3. **Import CSV:**
   - Click "Insert" → "Import data from CSV"
   - Upload your CSV file
   - Map columns (should auto-map if headers match)
   - Click "Import"

4. **Verify Import:**
   - Check row count
   - View sample records
   - Verify no errors

### **Method 2: SQL Script (Recommended for Large Datasets)**

I can create a SQL import script that:
- Validates data
- Handles lookups (roll_number → student_id, etc.)
- Inserts data in correct order
- Provides detailed error messages

**To use this method:**
1. Provide your filled CSV files
2. I'll generate the SQL script
3. Run the script in Supabase SQL Editor

### **Method 3: Node.js Import Script**

I can create a Node.js script that:
- Reads CSV files
- Validates data
- Performs lookups
- Inserts via Supabase API
- Shows progress
- Handles errors gracefully

---

## 🔍 **POST-IMPORT VERIFICATION**

### **Check Record Counts:**
```sql
-- Check all tables
SELECT 'departments' as table_name, COUNT(*) as count FROM departments
UNION ALL
SELECT 'faculty_profiles', COUNT(*) FROM faculty_profiles
UNION ALL
SELECT 'student_profiles', COUNT(*) FROM student_profiles
UNION ALL
SELECT 'courses', COUNT(*) FROM courses
UNION ALL
SELECT 'timetable', COUNT(*) FROM timetable
UNION ALL
SELECT 'period_attendance', COUNT(*) FROM period_attendance
UNION ALL
SELECT 'internal_marks', COUNT(*) FROM internal_marks;
```

### **Verify Relationships:**
```sql
-- Check for orphaned faculty (dept_code doesn't exist)
SELECT f.* FROM faculty_profiles f
LEFT JOIN departments d ON f.dept_code = d.code
WHERE d.code IS NULL;

-- Check for orphaned students
SELECT s.* FROM student_profiles s
LEFT JOIN departments d ON s.dept_code = d.code
WHERE d.code IS NULL;

-- Check for orphaned courses
SELECT c.* FROM courses c
LEFT JOIN departments d ON c.dept_code = d.code
WHERE d.code IS NULL;
```

### **Check Data Quality:**
```sql
-- Find faculty without email
SELECT * FROM faculty_profiles WHERE email IS NULL OR email = '';

-- Find students without phone
SELECT * FROM student_profiles WHERE phone IS NULL OR phone = '';

-- Find courses without credits
SELECT * FROM courses WHERE credits IS NULL OR credits = 0;
```

---

## 🆘 **COMMON IMPORT ERRORS & SOLUTIONS**

### **Error: "Duplicate key value violates unique constraint"**
**Cause:** Trying to insert a record with a value that already exists in a unique column
**Solution:** 
- Check for duplicate roll_numbers, employee_ids, course_codes
- Remove duplicates from CSV
- Update existing records instead of inserting

### **Error: "Foreign key constraint violation"**
**Cause:** Referenced record doesn't exist
**Solution:**
- Import in correct order (see Import Order section)
- Verify dept_code exists in departments
- Verify employee_id exists in faculty
- Verify roll_number exists in students

### **Error: "Invalid input syntax for type date"**
**Cause:** Date format is incorrect
**Solution:**
- Use YYYY-MM-DD format only
- Check for empty date fields
- Ensure dates are valid (e.g., not 2024-02-30)

### **Error: "Invalid input syntax for type boolean"**
**Cause:** Boolean value is not TRUE/FALSE
**Solution:**
- Replace Yes/No with TRUE/FALSE
- Replace 1/0 with TRUE/FALSE
- Check for empty boolean fields

---

## 📞 **NEED HELP?**

If you encounter any issues during import:

1. **Check the error message** - It usually tells you what's wrong
2. **Verify your data** - Use the validation checklist
3. **Test with sample data** - Import a few rows first
4. **Share the error** - I can help debug specific issues

---

## 🎯 **NEXT STEPS**

After successful import:

1. ✅ **Verify Data** - Check all records imported correctly
2. ✅ **Test Dashboards** - Login and verify data displays correctly
3. ✅ **Upload Files** - Upload faculty photos, resumes, etc.
4. ✅ **Assign Mentors** - Update student mentor_id if not done during import
5. ✅ **Configure RLS** - Enable Row Level Security policies
6. ✅ **Test Features** - Test attendance marking, marks entry, etc.

---

**Ready to import? Let me know which method you prefer and I'll help you through the process!** 🚀
