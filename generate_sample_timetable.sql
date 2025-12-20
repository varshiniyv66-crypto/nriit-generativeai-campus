-- =========================================================
-- GENERATE SAMPLE TIMETABLE DATA
-- Run this in Supabase SQL Editor
-- This will output CSV-ready data with REAL faculty IDs
-- =========================================================

-- Generate timetable entries for faculty who need assignments
-- Using real faculty IDs and real class sections

WITH faculty_needing_timetable AS (
    SELECT 
        fp.id as faculty_id,
        fp.employee_id,
        fp.first_name || ' ' || fp.last_name as faculty_name,
        fp.dept_code,
        ROW_NUMBER() OVER (PARTITION BY fp.dept_code ORDER BY fp.first_name) as rn
    FROM faculty_profiles fp
    WHERE fp.is_active = true
      AND NOT EXISTS (
        SELECT 1 FROM timetable t
        JOIN class_sections cs ON cs.id = t.class_section_id
        JOIN student_profiles sp ON sp.dept_code = cs.dept_code 
                                AND sp.current_semester = cs.semester 
                                AND sp.section = cs.section
                                AND sp.is_active = true
        WHERE t.faculty_id = fp.id
      )
),
valid_classes AS (
    SELECT DISTINCT
        cs.id as class_section_id,
        cs.dept_code,
        cs.semester,
        cs.section,
        ROW_NUMBER() OVER (PARTITION BY cs.dept_code ORDER BY cs.semester, cs.section) as rn
    FROM class_sections cs
    JOIN student_profiles sp ON sp.dept_code = cs.dept_code 
                            AND sp.current_semester = cs.semester 
                            AND sp.section = cs.section
                            AND sp.is_active = true
    GROUP BY cs.id, cs.dept_code, cs.semester, cs.section
),
courses_by_dept AS (
    SELECT 
        c.id as course_id,
        c.course_code,
        c.course_name,
        c.dept_code,
        c.semester,
        ROW_NUMBER() OVER (PARTITION BY c.dept_code ORDER BY c.semester, c.course_code) as rn
    FROM courses c
    WHERE c.is_active = true
)
SELECT 
    f.employee_id,
    f.faculty_name,
    COALESCE(c.course_code, f.dept_code || '101') as course_code,
    COALESCE(c.course_name, 'General Course') as course_name,
    vc.dept_code,
    vc.semester,
    vc.section,
    CASE ((f.rn + vc.rn) % 6) 
        WHEN 0 THEN 'Monday'
        WHEN 1 THEN 'Tuesday'
        WHEN 2 THEN 'Wednesday'
        WHEN 3 THEN 'Thursday'
        WHEN 4 THEN 'Friday'
        WHEN 5 THEN 'Saturday'
    END as day,
    ((f.rn + vc.rn) % 8) + 1 as period,
    f.dept_code || '-' || vc.semester || '0' || ((f.rn % 5) + 1) as room
FROM faculty_needing_timetable f
JOIN valid_classes vc ON vc.dept_code = f.dept_code
LEFT JOIN courses_by_dept c ON c.dept_code = f.dept_code AND c.rn = (f.rn % 5) + 1
WHERE f.rn <= 10  -- Limit to first 10 faculty per department
  AND vc.rn <= 3   -- Assign to first 3 classes per dept
ORDER BY f.dept_code, f.employee_id, vc.semester, day;
