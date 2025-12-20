# Dean Dashboard - Timetable Upload Feature Implementation Plan

## 📋 Feature Overview

The Dean receives timetables from each department and uploads them to the system. This data automatically updates faculty assignments, class sections, and enables the attendance system.

---

## 🔄 Workflow

```
Department HOD → Prepares Timetable (Excel/CSV) → Submits to Dean
      ↓
Dean → Uploads to System (Department-wise) → Validates Data
      ↓
System → Processes & Updates Database → Faculty/Students Ready
      ↓
Faculty → Can Take Attendance → Students See Schedule
```

---

## 📁 File Structure to Create

```
src/
├── app/dean/
│   └── timetable/
│       └── page.tsx           # Main timetable upload page
├── components/dean/
│   ├── TimetableUpload.tsx    # Upload form component
│   ├── TimetablePreview.tsx   # Preview uploaded data
│   └── TimetableHistory.tsx   # View past uploads
├── lib/
│   └── timetable-parser.ts    # Parse Excel/CSV to timetable format
└── api/dean/
    └── timetable/
        └── route.ts           # API for processing uploads
```

---

## 📊 Excel Template Format

The departments will submit timetables in this format:

### Sheet 1: Faculty-Class Assignments
| employee_id | faculty_name | course_code | course_name | dept_code | semester | section | day | period | room |
|-------------|--------------|-------------|-------------|-----------|----------|---------|-----|--------|------|
| FAC001 | Dr. A. Kumar | CS301 | Data Structures | CSE | 3 | A | Monday | 1 | CSE-301 |
| FAC001 | Dr. A. Kumar | CS301 | Data Structures | CSE | 3 | A | Tuesday | 2 | CSE-301 |
| FAC002 | Ms. B. Sujatha | CS302 | DBMS | IT | 4 | A | Monday | 3 | IT-201 |

### Sheet 2: Class Sections (Optional - Auto-generated if missing)
| dept_code | semester | section | class_teacher_id | room |
|-----------|----------|---------|------------------|------|
| CSE | 3 | A | FAC001 | CSE-301 |
| IT | 4 | A | FAC002 | IT-201 |

---

## 🗃️ Database Tables Used

1. **timetable** - Stores faculty-course-class-period mappings
2. **class_sections** - Stores class information
3. **courses** - Course master data
4. **faculty_profiles** - Faculty information

---

## 🔧 Implementation Steps

### Step 1: Create Timetable Upload Page
- Department selector dropdown
- File upload component (Excel/CSV)
- Academic year selector
- Preview table before submission
- Validation messages

### Step 2: Create Timetable Parser
- Parse Excel (.xlsx) using SheetJS/xlsx library
- Parse CSV files
- Map columns to database fields
- Validate employee_ids exist
- Validate course_codes exist
- Flag invalid rows

### Step 3: Create API Endpoint
- Receive parsed data
- Begin database transaction
- Clear existing timetable for dept/academic_year
- Insert new timetable entries
- Create missing class_sections
- Return success/error with details

### Step 4: Add to Dean Navigation
- Add "Timetable" menu item
- Icon: Calendar

---

## 🎨 UI Design

### Upload Page Layout:
```
+--------------------------------------------------+
| Dean Dashboard > Timetable Management            |
+--------------------------------------------------+
| ┌─────────────────────────────────────────────┐  |
| │  Upload Department Timetable                 │  |
| │  ─────────────────────────────────────────  │  |
| │  Department: [CSE ▼]  Academic Year: [2024-25 ▼]|
| │                                              │  |
| │  ┌─────────────────────────────────────────┐│  |
| │  │     📁 Drop Excel file here             ││  |
| │  │     or click to browse                  ││  |
| │  └─────────────────────────────────────────┘│  |
| │                                              │  |
| │  [Download Template]                         │  |
| └─────────────────────────────────────────────┘  |
|                                                   |
| ┌─────────────────────────────────────────────┐  |
| │  Preview (23 entries found)                  │  |
| │  ─────────────────────────────────────────  │  |
| │  ✅ 21 valid entries                        │  |
| │  ⚠️ 2 warnings (unknown faculty)           │  |
| │                                              │  |
| │  [Faculty] [Course] [Class] [Day] [Period]  │  |
| │  Dr. Kumar  CS301   CSE-3A  Mon    1        │  |
| │  ...                                         │  |
| └─────────────────────────────────────────────┘  |
|                                                   |
| [Cancel]                       [Upload Timetable] |
+--------------------------------------------------+
```

---

## 📥 Template Download Feature

Provide a downloadable Excel template with:
1. Instructions sheet
2. Sample data
3. Data validation dropdowns for:
   - dept_code (from departments table)
   - day (Monday-Saturday)
   - period (1-8)
4. Column headers with explanations

---

## ✅ Validation Rules

1. **Required Fields**: employee_id, course_code, dept_code, semester, section, day, period
2. **Employee ID**: Must exist in faculty_profiles
3. **Course Code**: Must exist in courses table
4. **Semester**: 1-8 for UG, 1-4 for PG
5. **Section**: A-Z
6. **Day**: Monday-Saturday
7. **Period**: 1-8
8. **Conflict Check**: No duplicate faculty assignment for same day+period

---

## 🔄 Auto-Update Features

After successful upload:
1. ✅ Timetable entries created/updated
2. ✅ Missing class_sections auto-created
3. ✅ Faculty dashboard shows new assignments
4. ✅ Attendance system ready for these classes
5. ✅ Student timetable views updated

---

## 📊 History & Reports

Track all uploads:
- Upload date/time
- Uploaded by (Dean)
- Department
- Academic year
- Entries count
- Status (success/partial/failed)

---

## 🚀 Quick Implementation Order

1. **First**: Add route to NAV_ROUTES (constants.ts)
2. **Second**: Create basic upload page with UI
3. **Third**: Add Excel parser library
4. **Fourth**: Create API endpoint
5. **Fifth**: Connect upload to API
6. **Sixth**: Add template download
7. **Seventh**: Add history view

---

## Dependencies to Install

```bash
npm install xlsx   # For Excel parsing
```

---

## Time Estimate

- Basic Upload UI: 1 hour
- Excel Parser: 1 hour
- API Endpoint: 1 hour
- Validation Logic: 1 hour
- Template Generator: 30 mins
- History View: 1 hour
- Testing: 1 hour

**Total: ~6-7 hours**
