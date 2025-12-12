# 📊 DATA IMPORT TEMPLATES - ALL IN ONE

## ✅ **10 CSV FILES CREATED IN `/templates` FOLDER**

All templates are ready to use! Each file has sample data to guide you.

---

## 📁 **FILES CREATED:**

### **1. `1_departments.csv`** 🏢
- **Columns**: code, name, short_name, established_year, is_active
- **Sample Rows**: 9 departments (CSE, ECE, MECH, etc.)
- **Fill**: Your college's departments

### **2. `2_faculty.csv`** 👨‍🏫
- **Columns**: employee_id, first_name, last_name, email, phone, dept_code, designation, qualification, specialization, experience_years, date_of_joining, is_active
- **Sample Rows**: 7 faculty members
- **Fill**: All your faculty members

### **3. `3_students.csv`** 🎓
- **Columns**: roll_number, registration_number, first_name, last_name, email, phone, dept_code, year, section, current_semester, admission_date, admission_type, is_active
- **Sample Rows**: 7 students
- **Fill**: All your students

### **4. `4_subjects.csv`** 📚
- **Columns**: subject_code, subject_name, dept_code, year, semester, credits, subject_type, is_active
- **Sample Rows**: 10 subjects
- **Fill**: All subjects taught

### **5. `5_timetable.csv`** 📅
- **Columns**: faculty_employee_id, subject_code, dept_code, year, section, day_of_week, period_number, start_time, end_time, room_number, academic_year
- **Sample Rows**: 7 timetable entries
- **Fill**: Complete timetable for all classes

### **6. `6_parent_details.csv`** 👨‍👩‍👦
- **Columns**: student_roll_number, father_name, father_phone, father_email, mother_name, mother_phone, mother_email, guardian_name, guardian_phone, guardian_email
- **Sample Rows**: 5 parent records
- **Fill**: Parent details for all students

### **7. `7_faculty_research.csv`** 📝
- **Columns**: faculty_employee_id, title, authors, journal_name, publication_type, publication_date, doi, impact_factor, scopus_indexed, ugc_approved
- **Sample Rows**: 4 research papers
- **Fill**: Faculty research publications (optional)

### **8. `8_faculty_workshops.csv`** 🎓
- **Columns**: faculty_employee_id, title, type, category, organizer, start_date, end_date, duration_days
- **Sample Rows**: 5 workshops
- **Fill**: Faculty workshops/FDPs (optional)

### **9. `9_attendance.csv`** ✅
- **Columns**: student_roll_number, date, subject_code, period_1 to period_8
- **Sample Rows**: 5 attendance records
- **Fill**: Current attendance data (optional)
- **Values**: P (Present), A (Absent), H (Holiday), OD (On Duty), ML (Medical Leave)

### **10. `10_marks.csv`** 📊
- **Columns**: student_roll_number, subject_code, exam_type, marks_obtained, max_marks, academic_year, semester
- **Sample Rows**: 8 marks records
- **Fill**: Current marks data (optional)
- **Exam Types**: mid1, mid2, assignment1, assignment2, quiz1, lab_internal1, project

---

## 🎯 **HOW TO USE:**

### **Step 1: Open CSV Files**
All files are in the `/templates` folder:
```
nriit-generativeai-campus/
  └── templates/
      ├── 1_departments.csv
      ├── 2_faculty.csv
      ├── 3_students.csv
      ├── 4_subjects.csv
      ├── 5_timetable.csv
      ├── 6_parent_details.csv
      ├── 7_faculty_research.csv
      ├── 8_faculty_workshops.csv
      ├── 9_attendance.csv
      └── 10_marks.csv
```

### **Step 2: Edit in Excel**
1. Open each CSV file in Excel
2. See sample data in first few rows
3. Delete sample data
4. Add your actual data
5. Save as CSV

### **Step 3: Or Convert to Single Excel File**
1. Open Excel
2. Create new workbook
3. Import each CSV as a separate sheet:
   - Sheet 1: Departments
   - Sheet 2: Faculty
   - Sheet 3: Students
   - Sheet 4: Subjects
   - Sheet 5: Timetable
   - Sheet 6: Parent Details
   - Sheet 7: Faculty Research
   - Sheet 8: Faculty Workshops
   - Sheet 9: Attendance
   - Sheet 10: Marks
4. Save as `NRIIT_Data_Import.xlsx`

---

## ✅ **VALIDATION RULES:**

### **Date Format:**
- Always: `YYYY-MM-DD`
- Example: `2024-12-11`

### **Boolean Values:**
- Use: `TRUE` or `FALSE`
- Not: Yes/No, 1/0

### **Email Format:**
- Faculty: `firstname.lastname@nriit.ac.in`
- Students: `rollnumber@nriit.ac.in`
- Parents: Any valid email

### **Phone Format:**
- 10 digits only
- No spaces or dashes
- Example: `9876543210`

---

## 🎯 **PRIORITY ORDER:**

Fill in this order:

1. ✅ **Departments** (Required first!)
2. ✅ **Faculty** (Depends on departments)
3. ✅ **Students** (Depends on departments)
4. ✅ **Subjects** (Depends on departments)
5. ✅ **Timetable** (Depends on faculty + subjects)
6. ✅ **Parent Details** (Depends on students)
7. ⭐ **Faculty Research** (Optional)
8. ⭐ **Faculty Workshops** (Optional)
9. ⭐ **Attendance** (Optional - can be marked later)
10. ⭐ **Marks** (Optional - can be entered later)

---

## 📊 **SAMPLE DATA INCLUDED:**

Each file has sample data to show you the exact format:
- ✅ Correct column names
- ✅ Correct data types
- ✅ Correct date formats
- ✅ Example values

**Just replace the sample data with your actual data!**

---

## 🔄 **CONVERTING CSV TO EXCEL:**

### **Method 1: Excel Import**
1. Open Excel
2. File → New Workbook
3. Data → Get Data → From File → From Text/CSV
4. Select `1_departments.csv`
5. Click "Load To..." → Existing worksheet
6. Repeat for all 10 files (each in a new sheet)
7. Save as `.xlsx`

### **Method 2: Online Converter**
1. Go to: https://www.convertcsv.com/csv-to-excel.htm
2. Upload all 10 CSV files
3. Convert to single Excel file
4. Download

### **Method 3: Python Script** (If you have Python)
```python
import pandas as pd

# Create Excel writer
with pd.ExcelWriter('NRIIT_Data.xlsx') as writer:
    pd.read_csv('templates/1_departments.csv').to_excel(writer, sheet_name='Departments', index=False)
    pd.read_csv('templates/2_faculty.csv').to_excel(writer, sheet_name='Faculty', index=False)
    pd.read_csv('templates/3_students.csv').to_excel(writer, sheet_name='Students', index=False)
    # ... and so on for all 10 files
```

---

## ✅ **WHAT TO DO NEXT:**

1. **Open** the `/templates` folder
2. **Edit** each CSV file with your data
3. **Or** convert all CSVs to one Excel file
4. **Fill** your actual college data
5. **Provide** the files back to me
6. **I'll import** into the database

---

## 📧 **NEED HELP?**

If you need help with:
- Converting CSV to Excel
- Filling the data
- Understanding any field
- Data validation

Just ask! I'm here to help! 🚀

---

**All 10 template files are ready in the `/templates` folder!** ✅

**You can edit them as CSV or convert to a single Excel file!** 📊

**Fill your data and provide back for import!** 🎯
