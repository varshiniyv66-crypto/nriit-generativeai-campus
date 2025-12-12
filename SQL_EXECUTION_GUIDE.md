# 🚀 Quick Reference: SQL Files Execution Order

## 📝 Run these SQL files in your Supabase SQL Editor in this exact order:

### 1️⃣ **Database Schema** (REQUIRED - Run First)
```
File: supabase_schema.sql
Purpose: Creates all database tables and structure
Status: ✅ Already exists in your project
```

**How to run:**
1. Open [Supabase Dashboard](https://supabase.com/dashboard)
2. Go to SQL Editor
3. Click "New Query"
4. Copy entire content of `supabase_schema.sql`
5. Paste and click "Run"

---

### 2️⃣ **Faculty Profiles** (REQUIRED)
```
File: seed_faculty.sql
Purpose: Adds 2 faculty members (FAC001, FAC002)
Status: ✅ Already exists
```

---

### 3️⃣ **Student Profiles** (REQUIRED)
```
File: seed_students.sql
Purpose: Adds ~20 students across all departments
Status: ✅ Already exists
```

---

### 4️⃣ **Courses** (REQUIRED for timetable & attendance)
```
File: seed_courses.sql
Purpose: Adds courses for CSE, IT, ECE departments
Status: 🆕 Just created
```

---

### 5️⃣ **Timetable** (REQUIRED for dashboards)
```
File: seed_timetable.sql
Purpose: Creates weekly class schedule for faculty
Status: 🆕 Just created
```

---

### 6️⃣ **Sample Data** (OPTIONAL - for testing)
```
File: seed_sample_data.sql
Purpose: Generates attendance, marks, and fee data
Status: 🆕 Just created
```

---

## ⚡ Quick Commands

### Run All at Once (Copy-Paste into Supabase SQL Editor)

```sql
-- Step 1: Schema (if not already done)
-- Copy content from supabase_schema.sql

-- Step 2: Faculty
-- Copy content from seed_faculty.sql

-- Step 3: Students
-- Copy content from seed_students.sql

-- Step 4: Courses
-- Copy content from seed_courses.sql

-- Step 5: Timetable
-- Copy content from seed_timetable.sql

-- Step 6: Sample Data (optional)
-- Copy content from seed_sample_data.sql
```

---

## 🔐 After Running SQL: Create Auth Users

### Method 1: Supabase Dashboard (Easiest)

1. Go to **Authentication** > **Users**
2. Click **"Add User"**
3. Create these test users:

| Email | Password | Role | Auto-Confirm |
|-------|----------|------|--------------|
| `fac001@nriit.edu.in` | `Klu@jntu` | Faculty | ✅ Yes |
| `fac002@nriit.edu.in` | `Klu@jntu` | Faculty | ✅ Yes |
| `24cse001@nriit.edu.in` | `Klu@jntu` | Student | ✅ Yes |
| `24it001@nriit.edu.in` | `Klu@jntu` | Student | ✅ Yes |

---

## ✅ Verification Steps

After running all SQL files and creating auth users:

### 1. Check Tables Have Data

Run this in Supabase SQL Editor:

```sql
-- Check counts
SELECT 'faculty_profiles' as table_name, COUNT(*) as count FROM faculty_profiles
UNION ALL
SELECT 'student_profiles', COUNT(*) FROM student_profiles
UNION ALL
SELECT 'courses', COUNT(*) FROM courses
UNION ALL
SELECT 'timetable', COUNT(*) FROM timetable
UNION ALL
SELECT 'attendance_records', COUNT(*) FROM attendance_records
UNION ALL
SELECT 'student_marks', COUNT(*) FROM student_marks
UNION ALL
SELECT 'fee_transactions', COUNT(*) FROM fee_transactions;
```

**Expected Output:**
```
faculty_profiles: 2
student_profiles: 20+
courses: 14+
timetable: 10+
attendance_records: 1200+ (if you ran seed_sample_data.sql)
student_marks: 80+ (if you ran seed_sample_data.sql)
fee_transactions: 20+ (if you ran seed_sample_data.sql)
```

### 2. Test Login

1. Go to `http://localhost:3000/login`
2. Select **Faculty**
3. Enter: `fac001@nriit.edu.in`
4. Password: `Klu@jntu`
5. Click **Sign In**

**Expected:** Redirect to Faculty Dashboard showing "Dr. Sharma"

### 3. Check Dashboard Data

Once logged in:
- **Student Dashboard**: Should show attendance %, CGPA, fee due
- **Faculty Dashboard**: Should show today's schedule, workload
- **Admin Dashboard**: Should show total students, faculty count

---

## 🐛 Troubleshooting

### Error: "relation does not exist"
**Solution:** Run `supabase_schema.sql` first

### Error: "duplicate key value violates unique constraint"
**Solution:** Data already exists, this is OK. Skip that file.

### Login shows "Invalid Credentials"
**Solution:** Create auth users in Supabase Dashboard > Authentication

### Dashboard shows "Loading..." forever
**Solution:** 
1. Open browser console (F12)
2. Check for errors
3. Verify `localStorage` has `nriit_user` data

---

## 📊 What Data Each File Creates

| File | Creates | Count | Used By |
|------|---------|-------|---------|
| `supabase_schema.sql` | All tables | ~25 tables | Everything |
| `seed_faculty.sql` | Faculty profiles | 2 | Login, Faculty Dashboard |
| `seed_students.sql` | Student profiles | ~20 | Login, Student Dashboard |
| `seed_courses.sql` | Course catalog | ~14 | Timetable, Attendance, Marks |
| `seed_timetable.sql` | Class schedule | ~10 entries | Faculty/Student Dashboard |
| `seed_sample_data.sql` | Attendance, Marks, Fees | ~1300 records | All Dashboards |

---

## 🎯 Minimum Setup (5 minutes)

If you're in a hurry, run only these:

1. ✅ `supabase_schema.sql`
2. ✅ `seed_faculty.sql`
3. ✅ `seed_students.sql`
4. 🔐 Create 2 auth users (fac001, 24cse001)
5. 🧪 Test login

This gives you working login and basic profiles.

---

## 🚀 Full Setup (15 minutes)

For complete functionality:

1. ✅ Run all 6 SQL files (in order)
2. 🔐 Create 4+ auth users
3. 🧪 Test all 4 dashboards
4. 📊 Verify data in Supabase tables

---

## 📞 Need Help?

- **SQL Errors**: Check Supabase logs in Dashboard > Logs
- **Login Issues**: Verify auth users exist in Authentication panel
- **Data Issues**: Run the verification SQL above
- **Dashboard Issues**: Check browser console (F12) for errors

---

**Ready?** Start with Step 1 and work your way down! 🎉
