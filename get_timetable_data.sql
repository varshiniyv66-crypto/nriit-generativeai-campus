-- Get faculty who need timetables (for creating sample files)
-- Run this in Supabase to get actual faculty IDs

SELECT 
    fp.employee_id,
    fp.first_name || ' ' || fp.last_name as faculty_name,
    fp.dept_code
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
ORDER BY fp.dept_code, fp.first_name
LIMIT 50;

-- Get valid class sections for each department
SELECT DISTINCT
    cs.dept_code,
    cs.semester,
    cs.section,
    COUNT(*) as student_count
FROM class_sections cs
JOIN student_profiles sp ON sp.dept_code = cs.dept_code 
                        AND sp.current_semester = cs.semester 
                        AND sp.section = cs.section
                        AND sp.is_active = true
GROUP BY cs.dept_code, cs.semester, cs.section
ORDER BY cs.dept_code, cs.semester;

-- Get available courses by department
SELECT 
    course_code,
    course_name,
    dept_code,
    semester
FROM courses
WHERE is_active = true
ORDER BY dept_code, semester
LIMIT 50;
