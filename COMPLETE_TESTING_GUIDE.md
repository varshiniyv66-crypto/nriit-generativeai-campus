# 🏆 COMPLETE PROJECT TESTING GUIDE
## NRI Institute of Technology - Digital Campus Platform

---

## ✅ **PROJECT STATUS: RUNNING**

**Server**: http://localhost:3000  
**Status**: ✅ Active (Running for 4+ hours)  
**Environment**: Development  
**Database**: Supabase (Connected)

---

## 🎯 **COMPLETE TESTING CHECKLIST:**

### **PHASE 1: LOGIN SYSTEM** ✅

#### **Test 1: Dean Login**
1. Go to: http://localhost:3000/login
2. Select: "Administrator"
3. Enter: `dean@nriit.ac.in`
4. Password: `Dean@123`
5. Click: "Sign In"
6. **Expected**: Redirect to Dean Dashboard

#### **Test 2: Faculty Login**
1. Go to: http://localhost:3000/login
2. Select: "Faculty"
3. Enter: `faccse001@nriit.ac.in`
4. Click: "Sign In"
5. **Expected**: Redirect to Faculty Dashboard

#### **Test 3: Student Login**
1. Go to: http://localhost:3000/login
2. Select: "Student"
3. Enter: `24CSE001`
4. Click: "Sign In"
5. **Expected**: Redirect to Student Dashboard

---

### **PHASE 2: DEAN PORTAL** 🏛️

#### **Test 4: Dean Dashboard**
- URL: http://localhost:3000/dean/dashboard
- **Check**:
  - ✅ Total Faculty count
  - ✅ Total Students count
  - ✅ Department statistics
  - ✅ Charts loading
  - ✅ Quick action buttons

#### **Test 5: Faculty Management**
- URL: http://localhost:3000/dean/faculty
- **Check**:
  - ✅ Faculty list loads (98 faculty)
  - ✅ Search functionality
  - ✅ Filter by department
  - ✅ Filter by designation
  - ✅ Add new faculty button
  - ✅ Edit faculty
  - ✅ Photo upload
  - ✅ Resume upload

#### **Test 6: Add New Faculty**
1. Click "Add Faculty"
2. Fill all details:
   - Employee ID: TEST001
   - Name: Test Faculty
   - Department: CSE
   - Email: test@nriit.ac.in
3. Click "Add Faculty"
4. **Expected**: Faculty added successfully

---

### **PHASE 3: FACULTY PORTAL** 👨‍🏫

#### **Test 7: Faculty Dashboard**
- URL: http://localhost:3000/faculty/dashboard
- **Check**:
  - ✅ Welcome message
  - ✅ Today's classes
  - ✅ Mentees count
  - ✅ At-risk students
  - ✅ Quick stats

#### **Test 8: Attendance Marking**
- URL: http://localhost:3000/faculty/attendance
- **Check**:
  - ✅ Select class dropdown
  - ✅ Select subject dropdown
  - ✅ Select date
  - ✅ Student list loads
  - ✅ Mark Present/Absent buttons
  - ✅ Submit attendance
  - ✅ Success message

#### **Test 9: Marks Entry**
- URL: http://localhost:3000/faculty/marks
- **Check**:
  - ✅ Select class
  - ✅ Select subject
  - ✅ Select exam type (Mid-1, Mid-2, etc.)
  - ✅ Student list loads
  - ✅ Enter marks
  - ✅ Validation (0-30 for mids)
  - ✅ Save marks
  - ✅ Success message

---

### **PHASE 4: STUDENT PORTAL** 🎓

#### **Test 10: Student Dashboard**
- URL: http://localhost:3000/student/dashboard
- **Check**:
  - ✅ Welcome message
  - ✅ Attendance percentage
  - ✅ Today's classes
  - ✅ Recent marks
  - ✅ Mentor details
  - ✅ Alerts (if attendance < 75%)

#### **Test 11: View Attendance**
- **Check**:
  - ✅ Overall attendance %
  - ✅ Subject-wise attendance
  - ✅ Monthly calendar view
  - ✅ Present/Absent days

#### **Test 12: View Marks**
- **Check**:
  - ✅ Subject-wise marks
  - ✅ Mid-1, Mid-2 marks
  - ✅ Assignment marks
  - ✅ Performance graphs
  - ✅ Class average comparison

---

### **PHASE 5: DATABASE** 💾

#### **Test 13: Data Verification**
Run in Supabase SQL Editor:

```sql
-- Check total counts
SELECT 
    (SELECT COUNT(*) FROM users WHERE role = 'dean') as dean_count,
    (SELECT COUNT(*) FROM faculty_profiles WHERE is_active = true) as faculty_count,
    (SELECT COUNT(*) FROM student_profiles WHERE is_active = true) as student_count,
    (SELECT COUNT(*) FROM departments WHERE is_active = true) as dept_count;
```

**Expected Results**:
- Dean: 1
- Faculty: 98
- Students: 1,560
- Departments: 9

---

### **PHASE 6: FILE UPLOADS** 📁

#### **Test 14: Faculty Photo Upload**
1. Login as Dean
2. Go to Faculty Management
3. Find a faculty member
4. Click photo upload icon
5. Select image file (< 2MB)
6. Upload
7. **Expected**: Photo appears in table

#### **Test 15: Faculty Resume Upload**
1. Same as above
2. Click resume upload icon
3. Select PDF file (< 5MB)
4. Upload
5. **Expected**: Resume link appears

---

### **PHASE 7: REAL-TIME UPDATES** 🔄

#### **Test 16: Attendance Flow**
1. **Faculty**: Mark attendance for a class
2. **Student**: Login and check dashboard
3. **Expected**: Attendance updated automatically
4. **Dean**: Check analytics
5. **Expected**: Department stats updated

#### **Test 17: Marks Flow**
1. **Faculty**: Enter marks for a subject
2. **Student**: Login and check marks
3. **Expected**: Marks visible immediately
4. **Dean**: Check performance stats
5. **Expected**: Analytics updated

---

## 🎯 **QUICK TEST URLS:**

### **Login Page:**
```
http://localhost:3000/login
```

### **Dean Portal:**
```
http://localhost:3000/dean/dashboard
http://localhost:3000/dean/faculty
```

### **Faculty Portal:**
```
http://localhost:3000/faculty/dashboard
http://localhost:3000/faculty/attendance
http://localhost:3000/faculty/marks
http://localhost:3000/faculty/classes
http://localhost:3000/faculty/mentoring
```

### **Student Portal:**
```
http://localhost:3000/student/dashboard
```

---

## 🔐 **TEST CREDENTIALS:**

### **Dean:**
```
Role: Administrator
Email: dean@nriit.ac.in
Password: Dean@123
```

### **Faculty:**
```
Role: Faculty
Email: faccse001@nriit.ac.in
Password: (not required for demo)
```

### **Student:**
```
Role: Student
Roll Number: 24CSE001
Password: (not required for demo)
```

---

## ✅ **EXPECTED RESULTS:**

### **All Tests Should Show:**
- ✅ Pages load without errors
- ✅ Data displays correctly
- ✅ Forms submit successfully
- ✅ Real-time updates work
- ✅ File uploads work
- ✅ Navigation works
- ✅ Responsive design works

---

## 🚨 **COMMON ISSUES & FIXES:**

### **Issue 1: "Failed to load faculty data"**
**Fix**: Check `.env.local` file has correct Supabase credentials

### **Issue 2: "No data found"**
**Fix**: Run seed scripts in Supabase to populate data

### **Issue 3: "File upload failed"**
**Fix**: Check Supabase storage buckets are created

### **Issue 4: "Login failed"**
**Fix**: Check user exists in Supabase Auth

---

## 📊 **TESTING SCORECARD:**

```
Total Tests: 17
✅ Passed: __
❌ Failed: __
⏳ Pending: __

Overall Score: ____%
```

---

## 🏆 **GOLD MEDAL CRITERIA:**

To achieve Gold Medal status, all tests must pass:
- ✅ All 17 tests passing
- ✅ No console errors
- ✅ Fast page loads (< 2 seconds)
- ✅ Smooth navigation
- ✅ Beautiful UI
- ✅ Real-time updates working

---

## 💎 **DIAMOND MEDAL CRITERIA:**

Additional requirements:
- ✅ Mobile responsive
- ✅ Offline capability
- ✅ Advanced analytics
- ✅ Export functionality
- ✅ Email notifications
- ✅ NBA/NAAC ready

---

## 🚀 **START TESTING NOW:**

1. Open browser
2. Go to: http://localhost:3000
3. Follow the test checklist above
4. Mark each test as ✅ or ❌
5. Report any issues

---

## 📝 **TEST REPORT TEMPLATE:**

```
Date: 2025-12-11
Tester: [Your Name]
Environment: Development
Server: http://localhost:3000

RESULTS:
--------
✅ Login System: PASS
✅ Dean Portal: PASS
✅ Faculty Portal: PASS
✅ Student Portal: PASS
✅ Database: PASS
✅ File Uploads: PASS
✅ Real-time Updates: PASS

ISSUES FOUND:
-------------
1. [None]

OVERALL STATUS: ✅ GOLD MEDAL ACHIEVED!
```

---

**Created**: 2025-12-11  
**Status**: Ready for Testing  
**Server**: Running at http://localhost:3000  
**Action**: Start testing now!

---

## 🎯 **NEXT STEPS:**

1. **Test everything** using this guide
2. **Report results** (what works, what doesn't)
3. **Fix any issues** found
4. **Deploy to production** when ready

---

**YOUR PROJECT IS LIVE AND READY TO TEST!** 🚀🏆💎
