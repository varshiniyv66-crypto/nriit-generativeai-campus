# Official NRIIT Timetable Format

## Standard Format Used Across All Branches

### Header Information
- **Title**: III B.Tech II-Sem Time Table (2023-2027 Batch)
- **Academic Year**: 2025-2026
- **Branch**: (e.g., CSE, IT, ECE, etc.)
- **Section**: (e.g., A, B, C, D)
- **Class Incharge**: Faculty name
- **Room No**: Classroom number

---

## Time Slots (8 Periods)

| Period | Time | Duration |
|--------|------|----------|
| **1** | 9:00 - 9:50 | 50 min |
| **2** | 9:50 - 10:40 | 50 min |
| **BREAK** | 10:40 - 10:50 | 10 min |
| **3** | 10:50 - 11:40 | 50 min |
| **4** | 11:40 - 12:30 | 50 min |
| **LUNCH** | 12:30 - 1:10 | 40 min |
| **5** | 1:10 - 2:00 | 50 min |
| **6** | 2:00 - 2:50 | 50 min |
| **BREAK** | 2:50 - 3:00 | 10 min |
| **7** | 3:00 - 3:40 | 40 min |
| **8** | 3:40 - 4:20 | 40 min |

---

## Weekly Schedule

| Day | P1 | P2 | P3 | P4 | P5 | P6 | P7 | P8 |
|-----|----|----|----|----|----|----|----|----|
| Monday | | | | | | | | |
| Tuesday | | | | | | | | |
| Wednesday | | | | | | | | |
| Thursday | | | | | | | | |
| Friday | | | | | | | | |
| Saturday | | | | | | | | |

---

## Lab/Special Subjects Legend

| Code | Subject | Faculty |
|------|---------|---------|
| **Deep Learning Lab** | Lab subject | Faculty Name |
| **Data Visualization Lab** | Lab subject | Faculty Name |
| **COUN** | Counseling | - |
| **LIB** | Library | - |
| **TS** | Telangana Studies | - |
| **M/C** | Moral & Cultural | - |

---

## Subject Code Format Examples

For regular subjects:
- `CSE-4-SUB1` = CSE 4th Semester Subject 1
- `IT-2-LAB1` = IT 2nd Semester Lab 1

For named subjects:
- `Deep Learning`
- `Data Visualization`
- `Operating Systems`
- `Software Project Management`

---

## Import Instructions

### Step 1: Prepare Excel/CSV
Your timetable should have columns:
- Branch (CSE, IT, ECE, etc.)
- Section (A, B, C, D)
- Semester (1-8)
- Day (Monday-Saturday)
- Period (1-8)
- Subject Code or Name
- Faculty Name
- Room Number

### Step 2: Upload Format
Either:
1. **Excel (.xlsx)** with sheets per branch/section
2. **CSV** with all data in one file
3. **JSON** structured format

### Step 3: System Will Auto-Create
- Class sections
- Course entries
- Faculty assignments
- Timetable entries
- Room allocations

---

## Notes

- **Periods 7-8** are shorter (40 min vs 50 min)
- **Saturday** follows same schedule as weekdays
- **Labs** typically occupy 2 consecutive periods
- **Special subjects** (COUN, LIB, TS, M/C) are non-academic

---

## Database Mapping

```sql
-- Each cell in timetable maps to:
INSERT INTO timetable (
  faculty_id,        -- From "Faculty Name"
  course_id,         -- From "Subject Code/Name"
  class_section_id,  -- From "Branch + Section + Semester"
  day_of_week,       -- From "Day" column
  period_number,     -- From "Period" (1-8)
  start_time,        -- From time slot mapping
  end_time,          -- From time slot mapping
  room_number        -- From "Room No"
);
```
