# 📅 Sample Timetable Files for Dean Upload

This folder contains sample CSV timetable files for testing the Dean Timetable Upload feature.

---

## 📁 Files Included

| File | Department | Entries |
|------|------------|---------|
| `CSE_timetable.csv` | Computer Science | 21 entries |
| `IT_timetable.csv` | Information Technology | 15 entries |
| `ECE_timetable.csv` | Electronics & Communication | 15 entries |
| `TEMPLATE_timetable.csv` | Empty Template | 1 sample row |

---

## 📋 CSV Format

### Required Columns:

| Column | Description | Example |
|--------|-------------|---------|
| `employee_id` | Faculty Employee ID | FACCSE001 |
| `faculty_name` | Faculty Full Name | Dr. A. Kumar |
| `course_code` | Course Code | CS301 |
| `course_name` | Course Name | Data Structures |
| `dept_code` | Department Code | CSE, IT, ECE, etc. |
| `semester` | Semester Number | 1-8 |
| `section` | Section | A, B, C |
| `day` | Day of Week | Monday, Tuesday, etc. |
| `period` | Period Number | 1-8 |
| `room` | Room Number | CSE-301 |

---

## 🔄 How to Use

1. **Open** the Dean Portal at `/dean/timetable`
2. **Select** the department (e.g., CSE)
3. **Upload** the corresponding CSV file
4. **Review** the preview
5. **Confirm** upload

---

## ⚠️ Important Notes

1. **Employee IDs** must match existing faculty in the database
2. **Course codes** will be auto-created if they don't exist
3. **Class sections** will be auto-created based on dept/semester/section
4. **Duplicate entries** (same faculty, day, period) will be updated, not duplicated

---

## 📊 Department Codes

| Code | Department |
|------|------------|
| CSE | Computer Science & Engineering |
| IT | Information Technology |
| ECE | Electronics & Communication |
| CSE-DS | CSE - Data Science |
| CSE-AI | CSE - AI & ML |
| EVT | Electric Vehicle Technology |
| CIVIL | Civil Engineering |
| MBA | Master of Business Administration |
| MCA | Master of Computer Applications |
| BSH | Humanities & Sciences |

---

## 🗓️ Day Values

- Monday
- Tuesday
- Wednesday
- Thursday
- Friday
- Saturday

---

## ⏰ Period Numbers

| Period | Time |
|--------|------|
| 1 | 09:00 - 09:50 |
| 2 | 09:50 - 10:40 |
| 3 | 10:50 - 11:40 |
| 4 | 11:40 - 12:30 |
| 5 | 13:30 - 14:20 |
| 6 | 14:20 - 15:10 |
| 7 | 15:20 - 16:10 |
| 8 | 16:10 - 17:00 |
