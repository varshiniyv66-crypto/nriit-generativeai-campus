# 📊 NRIIT Platform - Data Status & Requirements

## ✅ Currently Working (Demo Mode)

### 1. **Authentication & Login**
- ✅ Login page with role selection (Student/Faculty/Admin)
- ✅ Faculty can login with Employee ID or Email
- ✅ Student can login with Roll Number
- ✅ Session management via localStorage
- ⚠️ **Using profile lookup only** (not full Supabase Auth yet)

### 2. **User Profiles**
- ✅ Faculty profiles can be fetched from database
- ✅ Student profiles can be fetched from database
- ✅ Profile data displayed in dashboards

### 3. **Dashboards**
- ✅ Student Dashboard (UI complete, using mock data)
- ✅ Faculty Dashboard (UI complete, using mock data)
- ✅ HOD Dashboard (UI complete, using mock data)
- ✅ Admin Dashboard (UI complete, using mock data)

---

## 📋 Required Data for Full Functionality

### **Priority 1: Essential Data** (Needed for basic operations)

#### 1.1 Users & Authentication
**Status**: 🟡 Partially Complete

**What you have:**
- `seed_faculty.sql` - Creates 2 faculty profiles
- `seed_students.sql` - Creates ~20 student profiles

**What you need:**
- [ ] Create Supabase Auth users for each profile
  - Go to Supabase Dashboard > Authentication > Users
  - Add users with emails matching the profiles
  - Set password: `Klu@jntu` (or your choice)

**Required for:**
- Real login with password authentication
- Session management
- Role-based access control

---

#### 1.2 Courses
**Status**: ❌ Not Created

**What you need:**
- [ ] Run `seed_courses.sql` in Supabase SQL Editor

**This creates:**
- CSE courses: Computer Networks, Web Technologies, Data Mining, etc.
- IT courses: Network Security, Mobile App Development, etc.
- ECE courses: Digital Signal Processing, VLSI Design, etc.

**Required for:**
- Student course enrollment
- Faculty course assignments
- Timetable generation
- Attendance tracking

---

#### 1.3 Timetable
**Status**: ❌ Not Created

**What you need:**
- [ ] Run `seed_timetable.sql` in Supabase SQL Editor

**This creates:**
- Weekly schedule for each faculty
- Class timings (period-wise)
- Room assignments
- Section mappings

**Required for:**
- "Today's Schedule" on dashboards
- Attendance marking
- Faculty workload calculation

---

### **Priority 2: Academic Data** (Needed for student features)

#### 2.1 Attendance Records
**Status**: ❌ Not Created

**Sample SQL to create:**
```sql
-- Insert sample attendance for student 24CSE001
INSERT INTO attendance_records (student_id, course_code, date, status, marked_by)
SELECT 
    sp.id,
    'CS301',
    CURRENT_DATE - (n || ' days')::interval,
    CASE WHEN random() > 0.2 THEN 'present' ELSE 'absent' END,
    (SELECT id FROM faculty_profiles WHERE employee_id = 'FAC001' LIMIT 1)
FROM student_profiles sp
CROSS JOIN generate_series(1, 30) n
WHERE sp.roll_number = '24CSE001';
```

**Required for:**
- Student attendance percentage
- Subject-wise attendance breakdown
- Low attendance alerts
- Attendance reports

---

#### 2.2 Marks & Grades
**Status**: ❌ Not Created

**Sample SQL to create:**
```sql
-- Insert sample marks for students
INSERT INTO student_marks (student_id, course_code, exam_type, marks_obtained, max_marks, semester, academic_year)
SELECT 
    sp.id,
    'CS301',
    'mid1',
    floor(random() * 20 + 10)::int,  -- Random marks between 10-30
    30,
    5,
    '2024-25'
FROM student_profiles sp
WHERE sp.dept_code = 'CSE' AND sp.current_semester = 1;
```

**Required for:**
- CGPA calculation
- Grade reports
- Pending marks tracking (for faculty)
- Academic performance analytics

---

#### 2.3 Fee Transactions
**Status**: ❌ Not Created

**Sample SQL to create:**
```sql
-- Insert fee records for students
INSERT INTO fee_transactions (student_id, academic_year, semester, amount, due_date, status, payment_date)
SELECT 
    id,
    '2024-25',
    1,
    75000,  -- Annual fee
    '2024-12-15',
    CASE WHEN random() > 0.3 THEN 'paid' ELSE 'pending' END,
    CASE WHEN random() > 0.3 THEN CURRENT_DATE - (floor(random() * 30) || ' days')::interval ELSE NULL END
FROM student_profiles;
```

**Required for:**
- Fee due display on student dashboard
- Payment tracking
- Fee collection reports (admin)
- Payment gateway integration

---

### **Priority 3: Advanced Features** (Needed for full platform)

#### 3.1 Faculty Course Assignments
**Status**: ❌ Not Created

**What you need:**
```sql
-- Assign courses to faculty
INSERT INTO faculty_courses (faculty_id, course_code, section, academic_year, semester)
SELECT 
    (SELECT id FROM faculty_profiles WHERE employee_id = 'FAC001'),
    course_code,
    'III-A',
    '2024-25',
    5
FROM courses
WHERE course_code IN ('CS301', 'CS302', 'CS303', 'CS304');
```

**Required for:**
- Faculty workload calculation
- Course-wise student lists
- Marks entry permissions
- Attendance marking permissions

---

#### 3.2 Mentoring Assignments
**Status**: ❌ Not Created

**What you need:**
```sql
-- Assign students to faculty mentors
INSERT INTO mentoring_assignments (faculty_id, student_id, academic_year, is_active)
SELECT 
    (SELECT id FROM faculty_profiles WHERE employee_id = 'FAC001' LIMIT 1),
    id,
    '2024-25',
    true
FROM student_profiles
WHERE dept_code = 'CSE' AND current_semester = 1
LIMIT 15;  -- 15 mentees per faculty
```

**Required for:**
- Mentoring dashboard (faculty)
- At-risk student alerts
- Mentor-mentee communication

---

#### 3.3 Department Data
**Status**: 🟡 Partially Complete (departments table exists in schema)

**What you need:**
```sql
-- Insert department details
INSERT INTO departments (dept_code, dept_name, hod_id, is_active)
VALUES
('CSE', 'Computer Science & Engineering', NULL, true),
('IT', 'Information Technology', NULL, true),
('ECE', 'Electronics & Communication Engineering', NULL, true),
('CIVIL', 'Civil Engineering', NULL, true),
('MBA', 'Master of Business Administration', NULL, true),
('MCA', 'Master of Computer Applications', NULL, true)
ON CONFLICT (dept_code) DO NOTHING;
```

**Required for:**
- HOD dashboard
- Department-wise reports
- Faculty/student counts by department

---

## 🎯 Quick Start: Minimum Data Needed

To make the platform functional **TODAY**, you need:

### Step 1: Run These SQL Files (in order)
1. ✅ `supabase_schema.sql` - Creates all tables
2. ✅ `seed_faculty.sql` - Adds 2 faculty members
3. ✅ `seed_students.sql` - Adds ~20 students
4. 🆕 `seed_courses.sql` - Adds courses
5. 🆕 `seed_timetable.sql` - Adds class schedule

### Step 2: Create Auth Users
- Go to Supabase Dashboard > Authentication > Users
- Add at least 2 users:
  - `fac001@nriit.edu.in` (password: `Klu@jntu`)
  - `24cse001@nriit.edu.in` (password: `Klu@jntu`)

### Step 3: Test Login
- Login as faculty: `fac001@nriit.edu.in`
- Login as student: `24CSE001` (roll number)

---

## 📈 Data Completion Checklist

### Essential (Must Have)
- [ ] Faculty profiles in database
- [ ] Student profiles in database
- [ ] Auth users created for testing
- [ ] Courses added
- [ ] Timetable created

### Important (Should Have)
- [ ] Attendance records (at least 1 month)
- [ ] Marks data (at least 1 exam)
- [ ] Fee transactions
- [ ] Faculty course assignments

### Nice to Have
- [ ] Mentoring assignments
- [ ] Department HOD assignments
- [ ] Audit logs
- [ ] Notifications/announcements

---

## 🔧 How to Add More Data

### Add More Students
Edit `seed_students.sql` and add more entries following the same pattern:

```sql
-- Student: 24CSE003 (CSE)
INSERT INTO users (email, role, is_active, email_verified)
VALUES ('24cse003@nriit.edu.in', 'student', true, true)
ON CONFLICT (email) DO UPDATE SET last_login = NOW()
RETURNING id INTO new_user_id;

INSERT INTO student_profiles (
    user_id, roll_number, registration_number, first_name, last_name, 
    dept_code, current_semester, section, email, phone, 
    admission_date, admission_type, is_active
)
VALUES (
    new_user_id, '24CSE003', '24CSE003', 'StudentName', 'LastName', 
    'CSE', 1, 'A', '24cse003@nriit.edu.in', '9900031003', 
    NOW(), 'EAMCET', true
)
ON CONFLICT (roll_number) DO NOTHING;
```

### Add More Faculty
Edit `seed_faculty.sql` similarly.

---

## 📞 Next Actions

1. **Run the SQL files** in Supabase SQL Editor (in the order shown above)
2. **Create Auth users** for at least 2 faculty and 2 students
3. **Test login** to verify everything works
4. **Add attendance/marks data** using the sample SQL provided
5. **Update dashboards** to fetch real data instead of mock data

---

## ⚠️ Important Notes

- **Row Level Security (RLS)**: Currently disabled for development. Enable it before production!
- **Password Security**: Change default password `Klu@jntu` before going live
- **Data Privacy**: Ensure compliance with data protection regulations
- **Backup**: Always backup your database before running bulk operations

---

## 🎓 What Each Dashboard Needs

| Dashboard | Essential Data | Current Status |
|-----------|---------------|----------------|
| **Student** | Profile, Attendance, Marks, Fees, Timetable | Profile ✅, Rest ❌ |
| **Faculty** | Profile, Courses, Timetable, Students, Marks | Profile ✅, Rest ❌ |
| **HOD** | Dept Stats, Faculty List, Student List, Attendance | All ❌ |
| **Admin** | All Stats, Fee Collection, Logs | All ❌ |

---

**Ready to proceed?** Start with Step 1 above and let me know if you need help with any specific part!
