-- Fix Dr. B. Sujatha's timetable - Remove classes with no students

-- First, let's see what classes she's assigned to
SELECT 
    fp.first_name || ' ' || fp.last_name as faculty,
    cs.dept_code,
    cs.semester,
    cs.section,
    cs.name as class_name,
    c.course_code,
    c.course_name,
    (SELECT COUNT(*) FROM student_profiles sp 
     WHERE sp.dept_code = cs.dept_code 
       AND sp.current_semester = cs.semester 
       AND sp.section = cs.section 
       AND sp.is_active = true) as student_count
FROM timetable t
JOIN faculty_profiles fp ON fp.id = t.faculty_id
JOIN class_sections cs ON cs.id = t.class_section_id
JOIN courses c ON c.id = t.course_id
WHERE fp.first_name ILIKE '%Sujatha%'
GROUP BY fp.first_name, fp.last_name, cs.dept_code, cs.semester, cs.section, cs.name, c.course_code, c.course_name
ORDER BY cs.dept_code, cs.semester;

-- Delete timetable entries for classes that have NO students
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

-- Show which valid classes exist for EVT (since Sujatha was assigned to EVT)
SELECT 
    cs.dept_code,
    cs.semester,
    cs.section,
    cs.name,
    COUNT(*) as student_count
FROM class_sections cs
JOIN student_profiles sp ON sp.dept_code = cs.dept_code 
                        AND sp.current_semester = cs.semester 
                        AND sp.section = cs.section 
                        AND sp.is_active = true
WHERE cs.dept_code = 'EVT'
GROUP BY cs.dept_code, cs.semester, cs.section, cs.name
ORDER BY cs.semester;

-- Show Sujatha's valid classes after cleanup
SELECT 
    fp.first_name || ' ' || fp.last_name as faculty,
    cs.dept_code,
    cs.semester,
    cs.section,
    (SELECT COUNT(*) FROM student_profiles sp 
     WHERE sp.dept_code = cs.dept_code 
       AND sp.current_semester = cs.semester 
       AND sp.section = cs.section 
       AND sp.is_active = true) as student_count
FROM timetable t
JOIN faculty_profiles fp ON fp.id = t.faculty_id
JOIN class_sections cs ON cs.id = t.class_section_id
WHERE fp.first_name ILIKE '%Sujatha%'
GROUP BY fp.first_name, fp.last_name, cs.dept_code, cs.semester, cs.section
HAVING (SELECT COUNT(*) FROM student_profiles sp 
        WHERE sp.dept_code = cs.dept_code 
          AND sp.current_semester = cs.semester 
          AND sp.section = cs.section 
          AND sp.is_active = true) > 0
ORDER BY cs.dept_code, cs.semester;
