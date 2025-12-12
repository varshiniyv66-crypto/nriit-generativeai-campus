# 📊 Dashboard Data Requirements

## Current Status

### ✅ What You HAVE:
- **Students**: 1,440 students (all years, all departments)
- **Faculty**: 100 faculty members  
- **Departments**: 9 departments
- **Courses**: 14 courses
- **Dashboard UI**: Complete and beautiful!

### ❌ What You NEED (Currently showing mock data):

---

## 🎓 Student Dashboard Requirements

### **File**: `src/app/student/dashboard/page.tsx`

| Dashboard Element | Current Value | Database Table Needed | Status |
|-------------------|---------------|----------------------|--------|
| **Attendance %** | 82.5% (line 64) | `period_attendance` | ❌ Empty |
| **CGPA** | 8.4 (line 76) | `internal_marks` + `external_marks` | ❌ Empty |
| **Fee Due** | ₹45,000 (line 87) | `fee_transactions` | ❌ Empty |
| **Active Backlogs** | 0 (line 99) | `external_marks` (failed) | ❌ Empty |
| **Subject Attendance** | 4 subjects (lines 124-140) | `period_attendance` + `courses` | ❌ Empty |
| **Today's Schedule** | 3 classes (lines 156-171) | `timetable` + `courses` | ❌ Empty |

---

## 👨‍🏫 Faculty Dashboard Requirements

### **File**: `src/app/faculty/dashboard/page.tsx`

*Need to check what this dashboard shows*

---

## 👔 HOD Dashboard Requirements

### **File**: `src/app/hod/dashboard/page.tsx`

*Need to check what this dashboard shows*

---

## 🔧 Admin Dashboard Requirements

### **File**: `src/app/admin/dashboard/page.tsx`

*Need to check what this dashboard shows*

---

## 📋 Data to Create

### **Priority 1: Essential for Student Dashboard**

#### 1. **Timetable** (`timetable` table)
```sql
-- What it needs:
- day_of_week (1-6 for Mon-Sat)
- period_number (1-8)
- course_id (link to courses)
- faculty_id (link to faculty)
- class_section_id (which section)
- room_number
```

**Impact**: Shows "Today's Schedule" on dashboard

---

#### 2. **Attendance** (`period_attendance` table)
```sql
-- What it needs:
- student_id
- course_id
- attendance_date
- period_number
- status (present/absent/late/on_duty)
- marked_by (faculty_id)
```

**Impact**: 
- Shows overall attendance %
- Shows subject-wise attendance breakdown
- Triggers low attendance alerts

---

#### 3. **Marks** (`internal_marks` + `external_marks` tables)
```sql
-- Internal marks:
- student_id
- course_id
- exam_type (internal_1, internal_2)
- marks_obtained
- max_marks

-- External marks:
- student_id
- course_id
- theory_marks
- practical_marks
- grade
- grade_points
- is_passed
```

**Impact**:
- Shows CGPA
- Shows backlogs count
- Shows semester performance

---

#### 4. **Fees** (`fee_transactions` table)
```sql
-- What it needs:
- student_id
- amount
- status (pending/completed)
- payment_date
- due_date
```

**Impact**:
- Shows fee due amount
- Shows payment status
- Shows due dates

---

## 🚀 Action Plan

### **Step 1**: Create Seed Files
I will create 4 SQL files:
1. `seed_timetable_complete.sql` - Class schedules
2. `seed_attendance_sample.sql` - 30 days attendance
3. `seed_marks_sample.sql` - Internal & external marks
4. `seed_fees_sample.sql` - Fee records

### **Step 2**: Run Seed Files in Order
```
1. seed_timetable_complete.sql
2. seed_attendance_sample.sql  
3. seed_marks_sample.sql
4. seed_fees_sample.sql
```

### **Step 3**: Update Dashboard Code
Replace hardcoded values with Supabase queries:
- Line 64: Fetch real attendance %
- Line 76: Calculate real CGPA
- Line 87: Fetch real fee due
- Lines 124-140: Fetch real subject attendance
- Lines 156-171: Fetch real today's schedule

---

## 📊 Expected Data Volume

After seeding:
- **Timetable**: ~500 entries (all sections, all days)
- **Attendance**: ~43,200 records (1,440 students × 30 days)
- **Marks**: ~11,520 records (1,440 students × 8 subjects)
- **Fees**: ~1,440 records (1 per student)

**Total**: ~56,660 new records

---

## ⏱️ Time Estimate

- Creating seed files: 15 minutes
- Running seed files: 2-3 minutes
- Updating dashboard code: 20 minutes
- Testing: 10 minutes

**Total**: ~50 minutes to get fully working dashboards

---

## 🎯 Next Steps

**Option 1**: "Create all seed files now" ⭐ RECOMMENDED
→ I'll create all 4 seed files with realistic data

**Option 2**: "Create one at a time"
→ Start with timetable, then attendance, etc.

**Option 3**: "Show me sample data first"
→ I'll show you what the data will look like

---

Ready to proceed? Just say which option you want!
