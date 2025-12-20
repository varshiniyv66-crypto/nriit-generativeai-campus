-- =========================================================
-- TIMETABLE DATA CLEANUP & VALIDATION
-- Run this to clean up invalid timetable data
-- This script only CLEANS - it does NOT create fake data
-- =========================================================

-- =====================
-- STEP 1: Check current student distribution
-- This shows which dept/semester/section combinations have students
-- =====================
SELECT 
    '📊 STUDENT DISTRIBUTION' as report,
    dept_code,
    current_semester as semester,
    section,
    COUNT(*) as student_count
FROM student_profiles
WHERE is_active = true
GROUP BY dept_code, current_semester, section
ORDER BY dept_code, current_semester, section;

-- =====================
-- STEP 2: Create missing class_sections
-- Only creates sections where students exist
-- =====================
INSERT INTO class_sections (dept_code, semester, section, name, academic_year, year, strength, is_active, created_at)
SELECT DISTINCT
    sp.dept_code,
    sp.current_semester,
    sp.section,
    sp.dept_code || ' - Sem ' || sp.current_semester || ' - ' || sp.section as name,
    '2024-25' as academic_year,
    CEIL(sp.current_semester::numeric / 2)::integer as year,
    120 as strength,
    true as is_active,
    NOW() as created_at
FROM student_profiles sp
WHERE sp.is_active = true
  AND NOT EXISTS (
    SELECT 1 FROM class_sections cs 
    WHERE cs.dept_code = sp.dept_code 
      AND cs.semester = sp.current_semester 
      AND cs.section = sp.section
  )
ON CONFLICT DO NOTHING;

-- =====================
-- STEP 3: Delete timetable entries for EMPTY classes
-- Removes entries pointing to class_sections with no students
-- =====================
DELETE FROM timetable t
WHERE NOT EXISTS (
    SELECT 1 
    FROM class_sections cs
    JOIN student_profiles sp ON sp.dept_code = cs.dept_code 
                            AND sp.current_semester = cs.semester 
                            AND sp.section = cs.section 
                            AND sp.is_active = true
    WHERE cs.id = t.class_section_id
);

-- =====================
-- STEP 4: Show valid class sections (with students)
-- =====================
SELECT 
    '✅ VALID CLASS SECTIONS' as report,
    cs.dept_code,
    cs.semester,
    cs.section,
    cs.name,
    COUNT(sp.id) as student_count
FROM class_sections cs
JOIN student_profiles sp ON sp.dept_code = cs.dept_code 
                        AND sp.current_semester = cs.semester 
                        AND sp.section = cs.section
                        AND sp.is_active = true
GROUP BY cs.id, cs.dept_code, cs.semester, cs.section, cs.name
ORDER BY cs.dept_code, cs.semester, cs.section;

-- =====================
-- STEP 5: Show faculty with valid timetable assignments
-- =====================
SELECT 
    '👨‍🏫 FACULTY WITH CLASSES' as report,
    fp.employee_id,
    fp.first_name || ' ' || fp.last_name as faculty_name,
    fp.dept_code as home_dept,
    cs.dept_code as teaching_dept,
    cs.semester,
    cs.section,
    c.course_code,
    c.course_name,
    COUNT(t.id) as periods_per_week,
    (SELECT COUNT(*) FROM student_profiles sp 
     WHERE sp.dept_code = cs.dept_code 
       AND sp.current_semester = cs.semester 
       AND sp.section = cs.section 
       AND sp.is_active = true) as students
FROM faculty_profiles fp
JOIN timetable t ON t.faculty_id = fp.id
JOIN class_sections cs ON cs.id = t.class_section_id
JOIN courses c ON c.id = t.course_id
WHERE fp.is_active = true
  AND EXISTS (
      SELECT 1 FROM student_profiles sp 
      WHERE sp.dept_code = cs.dept_code 
        AND sp.current_semester = cs.semester 
        AND sp.section = cs.section 
        AND sp.is_active = true
  )
GROUP BY fp.id, fp.employee_id, fp.first_name, fp.last_name, fp.dept_code, 
         cs.dept_code, cs.semester, cs.section, c.course_code, c.course_name
ORDER BY fp.dept_code, fp.first_name;

-- =====================
-- STEP 6: Faculty WITHOUT timetable (needs upload from HOD)
-- These faculty don't have any valid class assignments
-- Dean needs to upload their timetables
-- =====================
SELECT 
    '⚠️ FACULTY NEEDING TIMETABLE UPLOAD' as report,
    fp.employee_id,
    fp.first_name || ' ' || fp.last_name as faculty_name,
    fp.dept_code,
    fp.designation,
    'Upload timetable via Dean Portal' as action_required
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
ORDER BY fp.dept_code, fp.first_name;

-- =====================
-- STEP 7: Summary
-- =====================
SELECT 
    '📈 SUMMARY' as report,
    (SELECT COUNT(*) FROM faculty_profiles WHERE is_active = true) as total_faculty,
    (SELECT COUNT(DISTINCT t.faculty_id) 
     FROM timetable t
     JOIN class_sections cs ON cs.id = t.class_section_id
     JOIN student_profiles sp ON sp.dept_code = cs.dept_code 
                             AND sp.current_semester = cs.semester 
                             AND sp.section = cs.section
                             AND sp.is_active = true
    ) as faculty_with_classes,
    (SELECT COUNT(*) FROM faculty_profiles fp
     WHERE fp.is_active = true
       AND NOT EXISTS (
           SELECT 1 FROM timetable t
           JOIN class_sections cs ON cs.id = t.class_section_id
           JOIN student_profiles sp ON sp.dept_code = cs.dept_code 
                                   AND sp.current_semester = cs.semester 
                                   AND sp.section = cs.section
                                   AND sp.is_active = true
           WHERE t.faculty_id = fp.id
       )) as faculty_needing_timetable,
    (SELECT COUNT(*) FROM student_profiles WHERE is_active = true) as total_students,
    (SELECT COUNT(DISTINCT cs.id)
     FROM class_sections cs
     WHERE EXISTS (
         SELECT 1 FROM student_profiles sp 
         WHERE sp.dept_code = cs.dept_code 
           AND sp.current_semester = cs.semester 
           AND sp.section = cs.section 
           AND sp.is_active = true
     )) as valid_class_sections;
