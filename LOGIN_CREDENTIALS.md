# 🎓 NRIIT DIGITAL CAMPUS - LOGIN CREDENTIALS
## ✅ Real Data Imported: 3,598 Students + 128 Faculty

---

## 🔐 **LOGIN PAGE: http://localhost:3000/login**

---

## 👨‍🎓 **STUDENT LOGIN**

### Sample Credentials (from Real Data):

| Roll Number | Name | Department | Semester |
|-------------|------|------------|----------|
| `25KP1A0501` | Ajmeera Akhil Naik | CIVIL | 1 |
| `24KP1A0505` | Alavala Surya Narayana | CSE | 4 |
| `25KP1E0001` | Akkinapalli Haritha | MBA | 1 |
| `25KP1F0001` | Abburi Anjali | MCA | 1 |
| `24KP1A0401` | Adusumalli Jhansi | ECE | 4 |
| `23KP1A0501` | Aakula Suresh | CSE | 6 |
| `22KP1A0501` | Adigoppula Koteswara Rao | CSE | 8 |

**Login Format:**
- Roll Number: `25KP1A0501` (or any student hall ticket)
- Password: (any - demo mode)
- Email: `rollnumber@nriit.ac.in`

---

## 👨‍🏫 **FACULTY LOGIN**

### Sample Credentials (from Real Data):

| Employee ID | Name | Department | Designation |
|-------------|------|------------|-------------|
| `FACCSE001` | Dr. K. Nageswara Rao | CSE | Professor |
| `FACCSE002` | Dr. J. Chandrasekhar | CSE | Associate Professor |
| `FACCSE003` | Mr. V. K. Pratap | CSE | Assistant Professor |
| `FACIT001` | Battula Sowjanya | IT | Assistant Professor |
| `FACIT009` | Srinivas Reddy Palle | IT | Professor |
| `FACECE001` | Dr. Srihari Rao Komatineni | ECE | Professor |
| `FACECE003` | Seshagiri Rao Sugguna | ECE | Assistant Professor |

**Login Format:**
- Employee ID: `FACCSE001` 
- Email: `faccse001@nriit.ac.in`
- Password: (any - demo mode)

---

## 🔑 **DEAN/ADMIN LOGIN**

```
Username: admin
Password: admin123
Role: Select "Admin" in login form
```

---

## 📊 **DATA IMPORT SUMMARY**

### Students by Department:
| Department | Count |
|------------|-------|
| CIVIL | 587 |
| CSE | 560 |
| CSE-AI (AIML) | 399 |
| CSE-DS (Data Science) | 813 |
| ECE | 742 |
| IT | 312 |
| MBA | 206 |
| MCA | 148 |
| **TOTAL** | **3,598** |

### Faculty by Department:
| Department | Count |
|------------|-------|
| CSE | 47 |
| IT | 15 |
| ECE | 66 |
| **TOTAL** | **128** |

---

## 📁 **SQL FILES GENERATED**

1. **Student Data**: `import_nriit_real_data.sql`
   - 25,285 lines of SQL
   - 3,598 unique students
   
2. **Faculty Data**: `import_nriit_faculty.sql`
   - 2,209 lines of SQL
   - 128 unique faculty members

---

## 🚀 **HOW TO IMPORT**

### Step 1: Open Supabase Dashboard
Go to: https://supabase.com/dashboard → Your Project → SQL Editor

### Step 2: Run Faculty SQL First
```sql
-- Copy contents from: import_nriit_faculty.sql
-- Paste in SQL Editor and click Run
```

### Step 3: Run Student SQL
```sql
-- Copy contents from: import_nriit_real_data.sql  
-- Paste in SQL Editor and click Run
-- (This is a large file, may take 1-2 minutes)
```

### Step 4: Verify Data
```sql
SELECT COUNT(*) as students FROM student_profiles;
SELECT COUNT(*) as faculty FROM faculty_profiles;
```

---

## ✅ **AFTER IMPORT - TEST LOGIN**

1. Go to http://localhost:3000/login
2. Select "Student" role
3. Enter: `25KP1A0501`
4. Click Login
5. You should see the Student Dashboard with real data!

**For Faculty:**
1. Select "Faculty" role
2. Enter: `FACCSE001` or `faccse001@nriit.ac.in`
3. Click Login
4. Faculty Dashboard loads with real data!

---

**Last Updated:** December 12, 2025
**Data Source:** NRIIT Official Nominal Rolls 2025-26
