# 📅 Understanding NRIIT Timetable Format

## Your Current Timetable Format

Your timetables are in **Word/PDF format** with two main sections:

### Section 1: Day-Period Grid
```
Day/Hours | 1st | 2nd | Break | 3rd | 4th | Lunch | 5th | 6th | Break | 7th | 8th
----------|-----|-----|-------|-----|-----|-------|-----|-----|-------|-----|-----
Monday    | DBMS| OOPS|       | CRT | Lib |       | OS  | OS  |       | M-III| DM
Tuesday   | LAB | LAB | LAB   | LAB | DM  |       | M-III| DBMS|      | OOPS | SPORTS
...
```

### Section 2: Subject-Faculty Mapping
```
SUBJECT                        | Name of The Faculty
-------------------------------|-------------------
Mathematics III                | D.Vinoda
Object Oriented Programming    | D.Devika
Operating Systems              | D.Koteswara Rao
Database Management Systems    | Ch.Bindhu Madhavi
```

---

## How To Convert This For Upload

### Option 1: Manual CSV (Recommended for Few Classes)

Convert to this format:
```csv
employee_id,faculty_name,course_code,course_name,dept_code,semester,section,day,period,room
FAC001,D.Vinoda,M-III,Mathematics III,IT,3,A,Monday,7,IT-301
FAC001,D.Vinoda,M-III,Mathematics III,IT,3,A,Tuesday,6,IT-301
FAC002,D.Devika,OOPS,Object Oriented Programming,IT,3,A,Monday,2,IT-301
...
```

### Option 2: Upload as-is (Future Feature)

We can add a **Smart Parser** that:
1. Accepts the original Word/PDF/Excel format
2. Uses the Subject-Faculty mapping table
3. Auto-extracts the day-period grid
4. Converts to database entries

---

## Quick Conversion Steps

1. **Open your timetable Word document**
2. **Create a new Excel file** with this structure:

| employee_id | faculty_name | course_code | course_name | dept_code | semester | section | day | period | room |
|-------------|--------------|-------------|-------------|-----------|----------|---------|-----|--------|------|

3. For each cell in the timetable grid:
   - Add a row with the subject, day, period
   - Look up the faculty name from the mapping table
   - Use faculty employee_id from database

4. **Save as CSV** and upload via Dean Portal

---

## Example Conversion

**From your timetable (IT 3-1):**

Grid shows: Monday, Period 1 = "DBMS"
Faculty mapping shows: "Database Management Systems" = "Ch.Bindhu Madhavi"

**Becomes CSV row:**
```csv
FACIT005,Ch.Bindhu Madhavi,DBMS,Database Management Systems,IT,3,A,Monday,1,IT-301
```

---

## Template Files Included

1. `timetable_samples/TEMPLATE_timetable.csv` - Empty template
2. `timetable_samples/CSE_timetable.csv` - Sample CSE data
3. `timetable_samples/IT_timetable.csv` - Sample IT data
4. `timetable_samples/ECE_timetable.csv` - Sample ECE data
