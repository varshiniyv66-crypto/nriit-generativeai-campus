# 📊 DATA IMPORT TEMPLATES GUIDE

## 🎯 **EXCEL TEMPLATES FOR DATA IMPORT**

This guide provides Excel templates that match your database tables EXACTLY.  
Fill these templates and provide them to import data into the system.

---

## 📋 **TEMPLATE 1: DEPARTMENTS**

### **File Name**: `departments.xlsx`

| code   | name                                              | short_name | established_year | is_active |
|--------|---------------------------------------------------|------------|------------------|-----------|
| CSE    | Computer Science and Engineering                  | CSE        | 2001             | TRUE      |
| ECE    | Electronics and Communication Engineering         | ECE        | 2001             | TRUE      |
| MECH   | Mechanical Engineering                            | MECH       | 2001             | TRUE      |
| CIVIL  | Civil Engineering                                 | CIVIL      | 2001             | TRUE      |
| IT     | Information Technology                            | IT         | 2005             | TRUE      |
| CSE-DS | Computer Science and Engineering (Data Science)   | CSE-DS     | 2019             | TRUE      |
| CSE-AI | Computer Science and Engineering (AI)             | CSE-AI     | 2020             | TRUE      |
| MBA    | Master of Business Administration                 | MBA        | 2010             | TRUE      |
| MCA    | Master of Computer Applications                   | MCA        | 2008             | TRUE      |

**Instructions:**
- `code`: Unique department code (max 10 chars)
- `name`: Full department name
- `short_name`: Short name for display
- `established_year`: Year department was established
- `is_active`: TRUE or FALSE

---

## 👨‍🏫 **TEMPLATE 2: FACULTY**

### **File Name**: `faculty.xlsx`

| employee_id | first_name | last_name | email                    | phone       | dept_code | designation         | qualification | specialization              | experience_years | date_of_joining | is_active |
|-------------|------------|-----------|--------------------------|-------------|-----------|---------------------|---------------|----------------------------|------------------|-----------------|-----------|
| FACCSE001   | Rajesh     | Kumar     | rajesh.kumar@nriit.ac.in | 9876543001  | CSE       | Professor & HOD     | Ph.D          | Artificial Intelligence     | 18.0             | 2010-07-01      | TRUE      |
| FACCSE002   | Priya      | Sharma    | priya.sharma@nriit.ac.in | 9876543002  | CSE       | Associate Professor | Ph.D          | Machine Learning            | 12.0             | 2015-07-01      | TRUE      |
| FACECE001   | Arun       | Reddy     | arun.reddy@nriit.ac.in   | 9876543003  | ECE       | Professor & HOD     | Ph.D          | VLSI Design                 | 20.0             | 2008-07-01      | TRUE      |

**Instructions:**
- `employee_id`: Unique ID (format: FAC + DEPT + NUMBER)
- `first_name`: First name
- `last_name`: Last name
- `email`: Official email (@nriit.ac.in)
- `phone`: 10-digit mobile number
- `dept_code`: Department code (must match departments table)
- `designation`: Professor / Associate Professor / Assistant Professor / HOD
- `qualification`: Ph.D / M.Tech / M.E. / M.Sc
- `specialization`: Area of expertise
- `experience_years`: Total years of experience (decimal allowed)
- `date_of_joining`: Format: YYYY-MM-DD
- `is_active`: TRUE or FALSE

---

## 🎓 **TEMPLATE 3: STUDENTS**

### **File Name**: `students.xlsx`

| roll_number | registration_number | first_name | last_name | email                  | phone       | dept_code | year | section | current_semester | admission_date | admission_type | is_active |
|-------------|---------------------|------------|-----------|------------------------|-------------|-----------|------|---------|------------------|----------------|----------------|-----------|
| 24CSE001    | 24CSE001            | Aarav      | Sharma    | 24cse001@nriit.ac.in   | 9900000001  | CSE       | 1    | A       | 1                | 2024-07-15     | EAMCET         | TRUE      |
| 24CSE002    | 24CSE002            | Aditi      | Rao       | 24cse002@nriit.ac.in   | 9900000002  | CSE       | 1    | A       | 1                | 2024-07-15     | EAMCET         | TRUE      |
| 23CSE001    | 23CSE001            | Karthik    | Reddy     | 23cse001@nriit.ac.in   | 9900000003  | CSE       | 2    | A       | 3                | 2023-07-15     | EAMCET         | TRUE      |

**Instructions:**
- `roll_number`: Unique roll number (format: YYDEPTXXX)
- `registration_number`: University registration number
- `first_name`: First name
- `last_name`: Last name
- `email`: Student email (@nriit.ac.in)
- `phone`: 10-digit mobile number
- `dept_code`: Department code (must match departments table)
- `year`: 1, 2, 3, or 4
- `section`: A, B, C, D, etc.
- `current_semester`: 1-8
- `admission_date`: Format: YYYY-MM-DD
- `admission_type`: EAMCET / Management / NRI / Lateral Entry
- `is_active`: TRUE or FALSE

---

## 📚 **TEMPLATE 4: SUBJECTS**

### **File Name**: `subjects.xlsx`

| subject_code | subject_name          | dept_code | year | semester | credits | subject_type | is_active |
|--------------|-----------------------|-----------|------|----------|---------|--------------|-----------|
| CS501        | Data Mining           | CSE       | 3    | 5        | 4       | theory       | TRUE      |
| CS502        | Web Technologies      | CSE       | 3    | 5        | 3       | theory       | TRUE      |
| CS503        | Data Mining Lab       | CSE       | 3    | 5        | 2       | lab          | TRUE      |
| CS504        | Major Project         | CSE       | 4    | 7        | 6       | project      | TRUE      |

**Instructions:**
- `subject_code`: Unique subject code
- `subject_name`: Full subject name
- `dept_code`: Department code
- `year`: 1, 2, 3, or 4
- `semester`: 1-8
- `credits`: Number of credits
- `subject_type`: theory / lab / project
- `is_active`: TRUE or FALSE

---

## 📅 **TEMPLATE 5: TIMETABLE**

### **File Name**: `timetable.xlsx`

| faculty_employee_id | subject_code | dept_code | year | section | day_of_week | period_number | start_time | end_time | room_number | academic_year |
|---------------------|--------------|-----------|------|---------|-------------|---------------|------------|----------|-------------|---------------|
| FACCSE001           | CS501        | CSE       | 3    | A       | 1           | 1             | 09:00      | 09:50    | 301         | 2024-25       |
| FACCSE001           | CS501        | CSE       | 3    | A       | 1           | 2             | 09:50      | 10:40    | 301         | 2024-25       |
| FACCSE002           | CS502        | CSE       | 3    | A       | 1           | 3             | 10:50      | 11:40    | 302         | 2024-25       |

**Instructions:**
- `faculty_employee_id`: Faculty employee ID (must exist in faculty table)
- `subject_code`: Subject code (must exist in subjects table)
- `dept_code`: Department code
- `year`: 1, 2, 3, or 4
- `section`: A, B, C, D, etc.
- `day_of_week`: 1=Monday, 2=Tuesday... 6=Saturday, 7=Sunday
- `period_number`: 1-8
- `start_time`: Format: HH:MM (24-hour)
- `end_time`: Format: HH:MM (24-hour)
- `room_number`: Room/Lab number
- `academic_year`: Format: YYYY-YY (e.g., 2024-25)

---

## 👥 **TEMPLATE 6: PARENT DETAILS**

### **File Name**: `parent_details.xlsx`

| student_roll_number | father_name    | father_phone | father_email              | mother_name    | mother_phone | mother_email              | guardian_name | guardian_phone | guardian_email |
|---------------------|----------------|--------------|---------------------------|----------------|--------------|---------------------------|---------------|----------------|----------------|
| 24CSE001            | Ramesh Sharma  | 9800000001   | ramesh.sharma@gmail.com   | Sunita Sharma  | 9800000002   | sunita.sharma@gmail.com   |               |                |                |
| 24CSE002            | Vijay Rao      | 9800000003   | vijay.rao@gmail.com       | Lakshmi Rao    | 9800000004   | lakshmi.rao@gmail.com     |               |                |                |

**Instructions:**
- `student_roll_number`: Student's roll number (must exist in students table)
- `father_name`: Father's full name
- `father_phone`: Father's mobile (10 digits)
- `father_email`: Father's email (for notifications)
- `mother_name`: Mother's full name
- `mother_phone`: Mother's mobile (10 digits)
- `mother_email`: Mother's email (for notifications)
- `guardian_name`: Guardian name (if applicable)
- `guardian_phone`: Guardian mobile
- `guardian_email`: Guardian email

---

## 📝 **TEMPLATE 7: FACULTY RESEARCH PAPERS**

### **File Name**: `faculty_research_papers.xlsx`

| faculty_employee_id | title                                           | authors                  | journal_name              | publication_type | publication_date | doi                    | impact_factor | scopus_indexed | ugc_approved |
|---------------------|-------------------------------------------------|--------------------------|---------------------------|------------------|------------------|------------------------|---------------|----------------|--------------|
| FACCSE001           | Machine Learning in Healthcare                  | Rajesh Kumar, Priya S    | IEEE Transactions on AI   | journal          | 2023-05-15       | 10.1109/TAI.2023.1234  | 8.5           | TRUE           | TRUE         |
| FACCSE002           | Deep Learning for Image Recognition             | Priya Sharma, Arun R     | Springer LNCS             | conference       | 2023-08-20       | 10.1007/978-3-123456   | 3.2           | TRUE           | TRUE         |

**Instructions:**
- `faculty_employee_id`: Faculty employee ID
- `title`: Paper title
- `authors`: All authors (comma-separated)
- `journal_name`: Journal or conference name
- `publication_type`: journal / conference / book_chapter / patent
- `publication_date`: Format: YYYY-MM-DD
- `doi`: Digital Object Identifier
- `impact_factor`: Journal impact factor (decimal)
- `scopus_indexed`: TRUE or FALSE
- `ugc_approved`: TRUE or FALSE

---

## 🎓 **TEMPLATE 8: FACULTY WORKSHOPS**

### **File Name**: `faculty_workshops.xlsx`

| faculty_employee_id | title                                    | type      | category | organizer              | start_date | end_date   | duration_days |
|---------------------|------------------------------------------|-----------|----------|------------------------|------------|------------|---------------|
| FACCSE001           | AI and Machine Learning                  | attended  | FDP      | AICTE                  | 2023-06-01 | 2023-06-05 | 5             |
| FACCSE002           | Deep Learning Workshop                   | conducted | workshop | NRIIT CSE Dept         | 2023-09-15 | 2023-09-16 | 2             |

**Instructions:**
- `faculty_employee_id`: Faculty employee ID
- `title`: Workshop/FDP title
- `type`: attended / conducted / organized
- `category`: FDP / workshop / seminar / conference / webinar
- `organizer`: Organizing institution
- `start_date`: Format: YYYY-MM-DD
- `end_date`: Format: YYYY-MM-DD
- `duration_days`: Number of days

---

## 📊 **TEMPLATE 9: ATTENDANCE RECORDS**

### **File Name**: `attendance_sample.xlsx`

| student_roll_number | date       | subject_code | period_1 | period_2 | period_3 | period_4 | period_5 | period_6 | period_7 | period_8 |
|---------------------|------------|--------------|----------|----------|----------|----------|----------|----------|----------|----------|
| 24CSE001            | 2024-12-11 | CS501        | P        | P        | P        | P        | P        | P        | P        | P        |
| 24CSE002            | 2024-12-11 | CS501        | P        | P        | A        | P        | P        | P        | P        | P        |
| 24CSE003            | 2024-12-11 | CS501        | A        | A        | A        | A        | A        | A        | A        | A        |

**Instructions:**
- `student_roll_number`: Student's roll number
- `date`: Format: YYYY-MM-DD
- `subject_code`: Subject code
- `period_1` to `period_8`: P (Present) / A (Absent) / H (Holiday) / OD (On Duty) / ML (Medical Leave)

---

## 📝 **TEMPLATE 10: MARKS RECORDS**

### **File Name**: `marks_sample.xlsx`

| student_roll_number | subject_code | exam_type    | marks_obtained | max_marks | academic_year | semester |
|---------------------|--------------|--------------|----------------|-----------|---------------|----------|
| 24CSE001            | CS501        | mid1         | 28             | 30        | 2024-25       | 5        |
| 24CSE001            | CS501        | mid2         | 25             | 30        | 2024-25       | 5        |
| 24CSE001            | CS501        | assignment1  | 9              | 10        | 2024-25       | 5        |
| 24CSE002            | CS501        | mid1         | 25             | 30        | 2024-25       | 5        |

**Instructions:**
- `student_roll_number`: Student's roll number
- `subject_code`: Subject code
- `exam_type`: mid1 / mid2 / assignment1 / assignment2 / quiz1 / lab_internal1 / project
- `marks_obtained`: Marks scored
- `max_marks`: Maximum marks
- `academic_year`: Format: YYYY-YY
- `semester`: 1-8

---

## 📥 **HOW TO USE THESE TEMPLATES:**

### **Step 1: Download Templates**
All templates are provided in this guide. Create Excel files with exact column names.

### **Step 2: Fill Data**
- Follow the format exactly
- Use sample data as reference
- Ensure all required fields are filled
- Use TRUE/FALSE for boolean fields
- Use YYYY-MM-DD for dates

### **Step 3: Validate Data**
- Check for duplicate IDs
- Verify foreign keys exist (e.g., dept_code must exist in departments)
- Ensure dates are in correct format
- Check email formats

### **Step 4: Provide to System**
- Save as `.xlsx` or `.csv`
- Upload through Dean portal
- Or provide to developer for import

---

## ✅ **DATA VALIDATION RULES:**

### **Email Format:**
- Faculty: `firstname.lastname@nriit.ac.in`
- Students: `rollnumber@nriit.ac.in`
- Parents: Any valid email

### **Phone Format:**
- 10 digits only
- No spaces or dashes
- Example: 9876543210

### **Date Format:**
- Always: YYYY-MM-DD
- Example: 2024-12-11

### **Boolean Values:**
- Use: TRUE or FALSE
- Not: Yes/No, 1/0, T/F

---

## 🎯 **PRIORITY ORDER:**

Fill templates in this order:

1. ✅ **Departments** (Required first)
2. ✅ **Faculty** (Depends on departments)
3. ✅ **Students** (Depends on departments)
4. ✅ **Subjects** (Depends on departments)
5. ✅ **Parent Details** (Depends on students)
6. ✅ **Timetable** (Depends on faculty + subjects)
7. ✅ **Faculty Research** (Optional)
8. ✅ **Faculty Workshops** (Optional)
9. ✅ **Attendance** (After students enrolled)
10. ✅ **Marks** (After subjects assigned)

---

## 📊 **SAMPLE DATA COUNTS:**

Recommended data for testing:
- Departments: 9
- Faculty: 50-100
- Students: 500-1000
- Subjects: 30-50 per department
- Timetable: All classes covered
- Parent Details: All students
- Research Papers: 5-10 per senior faculty
- Workshops: 2-5 per faculty per year

---

**Created**: 2025-12-11  
**Status**: Ready to Use  
**Format**: Excel (.xlsx) or CSV (.csv)  

**Fill these templates and provide the data for import!** 📊✅
