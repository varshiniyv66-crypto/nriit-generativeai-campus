# 🔧 CONTINUATION GUIDE - Fixing Login & RLS Issues

## Current Status (as of December 10, 2025)

### ✅ Completed:
1. ✅ Database schema created (`supabase_schema.sql`)
2. ✅ Faculty seed data created (`seed_faculty.sql`)
3. ✅ Student seed data created (`seed_students.sql`)
4. ✅ Course seed data created (`seed_courses.sql`)
5. ✅ Timetable seed data created (`seed_timetable.sql`)
6. ✅ Login page implemented with role-based authentication
7. ✅ Development server running on http://localhost:3000

### ⚠️ Current Issues:
1. **RLS (Row Level Security) is blocking data access**
   - RLS policies use `auth.uid()` but login uses localStorage
   - Data queries are failing due to restrictive policies
   
2. **Real data not displaying after login**
   - Dashboards still show mock data
   - Need to connect to actual database

---

## 🚀 IMMEDIATE NEXT STEPS

### Step 1: Fix RLS Policies (CRITICAL)

**Problem**: RLS policies are preventing data access because:
- Policies check `auth.uid()` from Supabase Auth
- But login system uses localStorage (no Supabase Auth session)
- This causes all queries to fail

**Solution**: Temporarily disable RLS for development

1. Go to your [Supabase Dashboard](https://supabase.com/dashboard)
2. Navigate to **SQL Editor**
3. Open the file `fix_rls_policies.sql` (just created)
4. Copy and paste the content into SQL Editor
5. Click **Run**

This will disable RLS on all tables, allowing queries to work during development.

---

### Step 2: Verify Data is Seeded

Run these queries in Supabase SQL Editor to check if data exists:

```sql
-- Check faculty
SELECT COUNT(*) FROM faculty_profiles;
SELECT employee_id, first_name, last_name, email FROM faculty_profiles;

-- Check students
SELECT COUNT(*) FROM student_profiles;
SELECT roll_number, first_name, last_name, email FROM student_profiles LIMIT 5;

-- Check courses
SELECT COUNT(*) FROM courses;
SELECT course_code, course_name, dept_code FROM courses LIMIT 5;

-- Check timetable
SELECT COUNT(*) FROM timetable;
```

**Expected Results:**
- Faculty: 2 records (FAC001, FAC002)
- Students: ~20 records
- Courses: Should have data if `seed_courses.sql` was run
- Timetable: Should have data if `seed_timetable.sql` was run

**If counts are 0**, you need to run the seed files:
1. Run `seed_faculty.sql`
2. Run `seed_students.sql`
3. Run `seed_courses.sql`
4. Run `seed_timetable.sql`

---

### Step 3: Update Login to Use Supabase Auth (Optional but Recommended)

The current login system bypasses Supabase Auth. For production, you should:

**Current Flow:**
```
User enters ID → Query database → Store in localStorage → Redirect
```

**Recommended Flow:**
```
User enters email/password → Supabase Auth → Get session → Query profile → Redirect
```

**To implement:**
1. Create Supabase Auth users for testing:
   - Go to **Authentication > Users** in Supabase Dashboard
   - Add user: `fac001@nriit.ac.in`, password: `Test@123`
   - Add user: `24cse001@nriit.ac.in`, password: `Test@123`

2. Update login logic to use:
```typescript
const { data, error } = await supabase.auth.signInWithPassword({
  email: email,
  password: password
});
```

---

### Step 4: Connect Dashboards to Real Data

Currently, dashboards use mock data. Here's what needs updating:

#### Faculty Dashboard (`src/app/faculty/dashboard/page.tsx`)

**Replace mock data with:**
```typescript
// Get faculty profile
const user = JSON.parse(localStorage.getItem('nriit_user') || '{}');
const { data: profile } = await supabase
  .from('faculty_profiles')
  .select('*')
  .eq('employee_id', user.employee_id)
  .single();

// Get today's classes from timetable
const today = new Date().getDay(); // 1=Monday, 2=Tuesday, etc.
const { data: classes } = await supabase
  .from('timetable')
  .select(`
    *,
    courses(course_name, course_code),
    class_sections(section, dept_code)
  `)
  .eq('faculty_id', profile.id)
  .eq('day_of_week', today);

// Get assigned courses
const { data: courses } = await supabase
  .from('faculty_subjects')
  .select(`
    *,
    courses(course_name, course_code, credits)
  `)
  .eq('faculty_id', profile.id)
  .eq('academic_year', '2024-25');
```

#### Student Dashboard (`src/app/student/dashboard/page.tsx`)

**Replace mock data with:**
```typescript
// Get student profile
const user = JSON.parse(localStorage.getItem('nriit_user') || '{}');
const { data: profile } = await supabase
  .from('student_profiles')
  .select('*')
  .eq('roll_number', user.roll_number)
  .single();

// Get attendance summary
const { data: attendance } = await supabase
  .from('v_student_attendance_summary')
  .select('*')
  .eq('student_id', profile.id);

// Get fee status
const { data: fees } = await supabase
  .from('fee_transactions')
  .select('*')
  .eq('student_id', profile.id)
  .eq('status', 'pending');
```

---

## 📋 TESTING CHECKLIST

After completing the steps above, test:

- [ ] Can login as faculty (FAC001 or fac001@nriit.ac.in)
- [ ] Faculty dashboard shows real name from database
- [ ] Can login as student (24CSE001)
- [ ] Student dashboard shows real name from database
- [ ] No console errors related to RLS or permissions
- [ ] Supabase queries return data (check Network tab)

---

## 🔍 DEBUGGING TIPS

### If login fails:
1. Check browser console for errors
2. Verify `.env.local` has correct Supabase credentials
3. Test Supabase connection: `npm run diagnose-env` (if script exists)

### If dashboard shows no data:
1. Open browser DevTools → Network tab
2. Look for failed Supabase requests (red/4xx errors)
3. Check error message - likely "RLS policy violation"
4. If RLS error: Run `fix_rls_policies.sql` again

### If "User not found" error:
1. Verify data exists: Run verification queries in Supabase SQL Editor
2. Check email/ID matches exactly (case-sensitive)
3. Ensure `seed_faculty.sql` and `seed_students.sql` were run successfully

---

## 🎯 PRIORITY ORDER

**Do these in order:**

1. **FIRST**: Run `fix_rls_policies.sql` to disable RLS
2. **SECOND**: Verify seed data exists (run verification queries)
3. **THIRD**: Test login with existing users (FAC001, 24CSE001)
4. **FOURTH**: Update one dashboard to use real data (start with faculty)
5. **FIFTH**: Test and verify real data displays correctly

---

## 📞 NEXT CONVERSATION STARTERS

When you're ready to continue, you can say:

- "Run the RLS fix" - I'll guide you through fixing RLS
- "Seed the database" - I'll help run all seed files
- "Connect faculty dashboard" - I'll update faculty dashboard to use real data
- "Connect student dashboard" - I'll update student dashboard to use real data
- "Test the login" - I'll help you test and debug login issues

---

## ⚠️ IMPORTANT NOTES

1. **RLS Disabled = Development Only**: Before production, re-enable RLS with proper policies
2. **Password Security**: Change default passwords before going live
3. **Email Domain**: Update `@nriit.edu.in` to `@nriit.ac.in` everywhere (as per previous conversation)
4. **Data Backup**: Always backup before running SQL scripts

---

**Current Server**: Running on http://localhost:3000
**Status**: Ready for RLS fix and data connection

Let me know which step you'd like to tackle first!
