# NRIIT Timetable Upload System

## What This Format Is

This is the **official blank timetable template** used by NRIIT for all branches and sections.

### Format Details:

**Header:**
- Title: `III B.Tech II-Sem Time Table (2023-2027 Batch)`
- Academic Year: `2025-2026`
- Branch: _(to be filled)_
- Section: _(to be filled)_
- Class Incharge: _(to be filled)_
- Room No: _(to be filled)_

**Grid Structure:**
- **Rows**: Days (Monday - Saturday)
- **Columns**: Periods (1-8)
- **Cells**: Subject codes or faculty names

**Special Subjects Legend:**
- Deep Learning Lab → Faculty Name
- Data Visualization Lab → Faculty Name
- COUN → Counseling
- LIB → Library
- TS → Telangana Studies
- M/C → Moral & Cultural

---

## How to Use This Format

### Option 1: Manual Entry (Current System)
Faculty/Admin logs into Dean Dashboard → Timetable Management → Manually create entries

### Option 2: Excel Upload (Recommended)
1. Download Excel template matching this format
2. Fill in subject codes for each day/period
3. Upload to Dean Dashboard
4. System auto-creates all timetable entries

---

## Excel Template Structure

### Sheet 1: Timetable Grid
```
| Day/Period | P1 | P2 | P3 | P4 | P5 | P6 | P7 | P8 |
|------------|----|----|----|----|----|----|----|----|
| Monday     | SUB1 | SUB2 | LAB1 | LAB1 | SUB3 | SUB4 | COUN | LIB |
| Tuesday    | ... | ... | ... | ... | ... | ... | ... | ... |
```

### Sheet 2: Subject Mapping
```
| Code | Subject Name | Faculty | Type |
|------|--------------|---------|------|
| SUB1 | Operating Systems | Dr. A | Theory |
| LAB1 | Deep Learning Lab | Dr. B | Lab |
```

### Sheet 3: Metadata
```
Branch: CSE
Section: A
Semester: 4
Class Incharge: Dr. XYZ
Room No: 301
Academic Year: 2025-2026
```

---

## Import Process

1. **Upload Excel** → System validates format
2. **Preview** → Shows what will be created
3. **Confirm** → Creates:
   - Class section (if not exists)
   - Courses (if not exists)
   - Faculty assignments
   - Timetable entries (all 48 slots: 6 days × 8 periods)

---

## What We Need to Build

### 1. Excel Template Generator
- Download button in Dean Dashboard
- Pre-filled with correct format
- Includes all metadata fields

### 2. Upload & Parser
- Drag-drop Excel file
- Parse and validate
- Show preview before import

### 3. Bulk Import
- Create all entries in one transaction
- Handle duplicates
- Show success/error report

---

## Current Status

✅ **Database supports this format**
- Correct time slots (P1-P8)
- Day of week (Monday-Saturday)
- Faculty assignments
- Course codes

❌ **Missing Features**
- Excel template download
- Upload interface
- Parser/validator
- Bulk import logic

---

## Next Steps

Would you like me to build:
1. **Excel template generator** (download pre-formatted template)
2. **Upload interface** in Dean Dashboard
3. **Parser & import logic** to process uploaded files

This will allow you to upload filled timetables instead of manual entry!
