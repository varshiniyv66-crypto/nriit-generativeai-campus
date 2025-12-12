# 🚀 Setup Guide: Connect Real Data to NRIIT Platform

This guide will help you populate your Supabase database with real data and connect all features to work with actual database records instead of mock data.

---

## 📋 Prerequisites

1. **Supabase Project** - You should have a Supabase project created
2. **Environment Variables** - Your `.env.local` file should have valid Supabase credentials
3. **SQL Access** - Access to Supabase SQL Editor

---

## 🗄️ Step 1: Setup Database Schema

### 1.1 Run the Schema File

1. Go to your [Supabase Dashboard](https://supabase.com/dashboard)
2. Select your project
3. Navigate to **SQL Editor** (left sidebar)
4. Click **New Query**
5. Copy the entire content of `supabase_schema.sql` from this project
6. Paste it into the SQL Editor
7. Click **Run** (or press Ctrl+Enter)

**Expected Result**: All tables (users, student_profiles, faculty_profiles, courses, attendance, etc.) will be created.

---

## 👥 Step 2: Seed User Data

### 2.1 Add Faculty Members

1. In Supabase SQL Editor, create a **New Query**
2. Copy the content of `seed_faculty.sql`
3. Paste and **Run**

**Expected Result**: 2 faculty members will be added:
- **FAC001** - Amit Sharma (CSE, Professor)
- **FAC002** - Priya Kapoor (IT, Asst. Professor)

### 2.2 Add Students

1. In Supabase SQL Editor, create a **New Query**
2. Copy the content of `seed_students.sql`
3. Paste and **Run**

**Expected Result**: Multiple students across departments (CSE, IT, ECE, CIVIL, MBA, MCA, BSH) will be added.

---

## 🔐 Step 3: Setup Authentication

### 3.1 Create Auth Users for Faculty

Since the seed files only create profile records, you need to create actual **Supabase Auth users** for login:

#### Option A: Manual Creation (Recommended for Testing)

1. Go to **Authentication** > **Users** in Supabase Dashboard
2. Click **Add User**
3. For each faculty member, create:

**Faculty 1:**
- Email: `fac001@nriit.edu.in`
- Password: `Klu@jntu` (or your preferred password)
- Auto Confirm User: ✅ Yes

**Faculty 2:**
- Email: `fac002@nriit.edu.in`
- Password: `Klu@jntu`
- Auto Confirm User: ✅ Yes

#### Option B: Programmatic Creation (Advanced)

Run this SQL in Supabase SQL Editor:

```sql
-- This uses Supabase's auth.users table (requires service role access)
-- Note: You may need to use Supabase Admin API instead

-- For now, use Option A (Manual Creation) above
```

### 3.2 Create Auth Users for Students (Optional)

For student login testing, create a few auth users:

- Email: `24cse001@nriit.edu.in`, Password: `Klu@jntu`
- Email: `24it001@nriit.edu.in`, Password: `Klu@jntu`
- Email: `24ece001@nriit.edu.in`, Password: `Klu@jntu`

---

## 🔗 Step 4: Update Login to Use Real Authentication

The current login system uses **profile lookup only**. We need to integrate **Supabase Auth**.

### 4.1 Update Login Logic

The login page (`src/app/login/page.tsx`) needs to be updated to:

1. Use `supabase.auth.signInWithPassword()` for actual authentication
2. After successful auth, fetch the user's profile from the database
3. Store both auth session and profile data

**This is already partially implemented** - the login page checks the database for profiles.

### 4.2 Test Login

1. Go to `http://localhost:3000/login`
2. Select **Faculty**
3. Enter: `fac001@nriit.edu.in`
4. Password: `Klu@jntu`
5. Click **Sign In**

**Expected**: You should be redirected to the Faculty Dashboard with real user data.

---

## 📊 Step 5: Connect Real Data to Dashboards

Currently, dashboards show **mock/hardcoded data**. Here's what needs to be connected:

### 5.1 Student Dashboard

**Mock Data to Replace:**
- ✅ User Profile (already using localStorage from login)
- ❌ Attendance Data (hardcoded 82.5%)
- ❌ CGPA (hardcoded 8.4)
- ❌ Fee Due (hardcoded ₹45,000)
- ❌ Subject-wise Attendance (hardcoded table)
- ❌ Today's Schedule (hardcoded timetable)

**Required Database Tables:**
- `attendance_records` - for attendance data
- `student_marks` - for CGPA calculation
- `fee_transactions` - for fee status
- `timetable` - for class schedule

### 5.2 Faculty Dashboard

**Mock Data to Replace:**
- ✅ User Profile (already using localStorage)
- ❌ Workload (hardcoded 18 hrs)
- ❌ Student Count (hardcoded 240)
- ❌ Pending Marks (hardcoded 2)
- ❌ Today's Schedule (hardcoded classes)
- ❌ Mentoring Students (hardcoded)

**Required Database Tables:**
- `faculty_courses` - course assignments
- `timetable` - teaching schedule
- `student_marks` - for pending marks
- `mentoring_assignments` - mentee list

### 5.3 HOD Dashboard

**Mock Data to Replace:**
- ❌ Total Faculty (hardcoded 18)
- ❌ Students (hardcoded 420)
- ❌ Courses (hardcoded 24)
- ❌ Department Attendance (hardcoded 87%)
- ❌ Recent Activities (hardcoded)
- ❌ Pending Tasks (hardcoded)

**Required Database Tables:**
- `faculty_profiles` - count by department
- `student_profiles` - count by department
- `courses` - department courses
- `attendance_summary` - department stats

### 5.4 Admin Dashboard

**Mock Data to Replace:**
- ❌ Total Students (hardcoded 4,250)
- ❌ Faculty Strength (hardcoded 328)
- ❌ Fee Collection (hardcoded ₹8.4 Cr)
- ❌ Avg Attendance (hardcoded 78.2%)
- ❌ Department Performance (chart placeholder)
- ❌ Recent Activities (hardcoded logs)

**Required Database Tables:**
- All profile tables for counts
- `fee_transactions` - for collection stats
- `attendance_summary` - for institution-wide stats
- `audit_logs` - for activity tracking

---

## 📝 Step 6: Additional Data Needed

To make the platform fully functional, you'll need to add:

### 6.1 Course Data
```sql
-- Run this in Supabase SQL Editor
INSERT INTO courses (course_code, course_name, dept_code, credits, semester, year) VALUES
('CS301', 'Computer Networks', 'CSE', 3, 5, 3),
('CS302', 'Web Technologies', 'CSE', 3, 5, 3),
('CS303', 'Data Mining', 'CSE', 3, 5, 3),
('CS304', 'Cloud Computing', 'CSE', 3, 5, 3);
```

### 6.2 Timetable Data
```sql
-- Sample timetable entries
INSERT INTO timetable (day_of_week, period_number, course_code, faculty_id, section, room_number) VALUES
('Monday', 1, 'CS301', 'FAC001', 'III-A', 'LH-101'),
('Monday', 2, 'CS302', 'FAC001', 'III-A', 'LH-101');
```

### 6.3 Attendance Records
```sql
-- Sample attendance
INSERT INTO attendance_records (student_id, course_code, date, status) VALUES
('24CSE001', 'CS301', '2024-12-09', 'present'),
('24CSE001', 'CS302', '2024-12-09', 'present');
```

---

## ✅ Verification Checklist

After completing the setup, verify:

- [ ] Database schema created successfully
- [ ] Faculty profiles exist in `faculty_profiles` table
- [ ] Student profiles exist in `student_profiles` table
- [ ] Auth users created for testing (at least 2 faculty, 2 students)
- [ ] Can login as faculty using email/password
- [ ] Can login as student using roll number
- [ ] Faculty dashboard shows correct user name
- [ ] Student dashboard shows correct user name

---

## 🐛 Troubleshooting

### Issue: "Invalid Credentials" on Login

**Solution**: Make sure you've created Auth users in Supabase Authentication panel.

### Issue: "User not found" after successful auth

**Solution**: Ensure the email in Auth matches the email in `faculty_profiles` or `student_profiles`.

### Issue: Dashboard shows "Loading..." forever

**Solution**: Check browser console for errors. Verify `localStorage` has `nriit_user` data.

---

## 🎯 Next Steps

Once basic data is working:

1. **Add More Data**: Use the seed scripts as templates to add more students/faculty
2. **Connect Dashboards**: Update each dashboard component to fetch real data from Supabase
3. **Add Features**: Implement attendance marking, grade entry, fee payment, etc.
4. **Setup RLS**: Configure Row Level Security policies in Supabase for data protection

---

## 📞 Need Help?

If you encounter issues:
1. Check Supabase logs in Dashboard > Logs
2. Check browser console for JavaScript errors
3. Verify `.env.local` has correct Supabase credentials
4. Test Supabase connection using the test script (if provided)
