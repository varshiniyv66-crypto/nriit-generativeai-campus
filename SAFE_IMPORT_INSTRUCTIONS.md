# 🔒 COMPLETE SAFE IMPORT TO SUPABASE - NRIIT DATA

## ⚠️ IMPORTANT: This Import is SAFE for Your Website

All SQL scripts use **safe insert patterns** with conflict handling.  
**Your existing website data will NOT be affected!**

---

## 📊 COMPLETE IMPORT SUMMARY

| Data Type | Count | File | Safety |
|-----------|-------|------|--------|
| Departments | 10 | `import_step1_departments.sql` | ✅ Skip if exists |
| Batches | 5 | `import_step1_departments.sql` | ✅ Skip if exists |
| **Faculty** | **128** | `import_nriit_faculty.sql` | ✅ Safe upsert |
| **Students** | **3,598** | `import_nriit_real_data.sql` | ✅ Skip if exists |

### Faculty by Department:
| Department | Faculty Count |
|------------|---------------|
| CSE | 47 |
| ECE | 29 |
| BSH (H&S) | 16 |
| CIVIL | 7 |
| MBA | 10 |
| MCA | 9 |
| IT | 5 |
| CSE-AI | 3 |
| CSE-DS | 2 |

### Students by Department:
| Department | Student Count |
|------------|---------------|
| CSE | 1,034 |
| ECE | 497 |
| CSE-DS | 344 |
| CSE-AI | 309 |
| IT | 232 |
| MBA | 177 |
| MCA | 161 |
| EVT | 117 |
| CIVIL | 28 |

---

## 🚀 STEP-BY-STEP IMPORT GUIDE

### Step 1: Verify Current State

Run in Supabase SQL Editor:
```sql
-- Check current counts before import
SELECT 'departments' as table_name, COUNT(*) as count FROM departments
UNION ALL SELECT 'users', COUNT(*) FROM users
UNION ALL SELECT 'student_profiles', COUNT(*) FROM student_profiles
UNION ALL SELECT 'faculty_profiles', COUNT(*) FROM faculty_profiles
UNION ALL SELECT 'academic_batches', COUNT(*) FROM academic_batches;
```

### Step 2: Import Departments & Batches First

1. Open Supabase Dashboard → SQL Editor
2. Copy contents of `import_step1_departments.sql`
3. Paste and Run

### Step 3: Import Faculty (128 faculty)

1. Copy contents of `import_nriit_faculty.sql`
2. Paste and Run
3. Wait ~30 seconds for completion

### Step 4: Import Students (3,598 students)

1. Copy contents of `import_nriit_real_data.sql`
2. Paste and Run
3. Wait 2-5 minutes for completion

### Step 5: Verify Import Success

```sql
-- Verify all data imported
SELECT 'departments' as table_name, COUNT(*) as count FROM departments
UNION ALL SELECT 'users', COUNT(*) FROM users
UNION ALL SELECT 'student_profiles', COUNT(*) FROM student_profiles
UNION ALL SELECT 'faculty_profiles', COUNT(*) FROM faculty_profiles
UNION ALL SELECT 'academic_batches', COUNT(*) FROM academic_batches;

-- Check faculty by department
SELECT dept_code, COUNT(*) as faculty_count 
FROM faculty_profiles 
GROUP BY dept_code 
ORDER BY faculty_count DESC;

-- Check students by department
SELECT dept_code, COUNT(*) as student_count 
FROM student_profiles 
GROUP BY dept_code 
ORDER BY student_count DESC;
```

---

## ✅ WHAT WILL HAPPEN

### New Records Created:
- 10 departments
- 5 academic batches
- 128 faculty members (users + faculty_profiles)
- 3,598 students (users + student_profiles)

### Existing Data Protection:
- ✅ Existing departments → NOT changed
- ✅ Existing students → NOT changed
- ✅ Existing faculty → Name/designation updated if changed
- ✅ Existing attendance → NOT affected
- ✅ Existing marks → NOT affected

---

## � FILES READY FOR IMPORT

### Import Order (IMPORTANT!):

```
1. import_step1_departments.sql    → Departments & Batches (run first)
2. import_nriit_faculty.sql        → 128 Faculty members
3. import_nriit_real_data.sql      → 3,598 Students
```

### Verification Files:
```
verify_before_import.sql  → Run before starting
verify_after_import.sql   → Run after completing
```

---

## 🔄 IF SOMETHING GOES WRONG

### Rollback Faculty:
```sql
DELETE FROM faculty_profiles WHERE DATE(created_at) = CURRENT_DATE;
DELETE FROM users WHERE role = 'faculty' AND DATE(created_at) = CURRENT_DATE;
```

### Rollback Students:
```sql
DELETE FROM student_profiles WHERE DATE(created_at) = CURRENT_DATE;
DELETE FROM users WHERE role = 'student' AND DATE(created_at) = CURRENT_DATE;
```

---

## ⏰ TOTAL ESTIMATED TIME

| Step | Time |
|------|------|
| Departments & Batches | < 1 second |
| 128 Faculty | ~30 seconds |
| 3,598 Students | 2-5 minutes |
| **Total** | **~5-6 minutes** |

---

## 🎯 QUICK COPY COMMANDS

### All in one (if database is empty):
```bash
# Run these in order in Supabase SQL Editor:
# 1. import_step1_departments.sql
# 2. import_nriit_faculty.sql
# 3. import_nriit_real_data.sql
```

---

**Ready to import? Start with `import_step1_departments.sql` in Supabase SQL Editor!** 🚀
