-- Find faculty with 8th period class on Saturday with students
SELECT 
    fp.first_name || ' ' || fp.last_name as faculty_name,
    fp.employee_id,
    fp.email,
    c.course_code,
    c.course_name,
    cs.dept_code,
    cs.semester,
    cs.section,
    t.day_of_week,
    t.period_number,
    t.start_time,
    t.end_time,
    (SELECT COUNT(*) FROM student_profiles sp 
     WHERE sp.dept_code = cs.dept_code 
       AND sp.current_semester = cs.semester 
       AND sp.section = cs.section 
       AND sp.is_active = true) as student_count
FROM timetable t
JOIN faculty_profiles fp ON fp.id = t.faculty_id
JOIN courses c ON c.id = t.course_id
JOIN class_sections cs ON cs.id = t.class_section_id
WHERE t.day_of_week = 'Saturday'
  AND t.period_number IN (1, 2)  -- We created periods 1-2 in the fix
  AND (SELECT COUNT(*) FROM student_profiles sp 
       WHERE sp.dept_code = cs.dept_code 
         AND sp.current_semester = cs.semester 
         AND sp.section = cs.section 
         AND sp.is_active = true) > 0
ORDER BY student_count DESC
LIMIT 10;
