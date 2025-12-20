
-- =========================================================
-- VERIFICATION SCRIPT
-- =========================================================

SELECT 
    d.code as department,
    cs.name as section,
    c.name as course,
    t.day_of_week,
    t.start_time,
    fp.first_name as faculty
FROM timetable t
JOIN class_sections cs ON t.class_section_id = cs.id
LEFT JOIN courses c ON t.course_id = c.id
LEFT JOIN faculty_profiles fp ON t.faculty_id = fp.id
JOIN departments d ON cs.dept_code = d.code
ORDER BY d.code, cs.year, t.day_of_week, t.start_time
LIMIT 50;

SELECT count(*) as total_timetable_entries FROM timetable;
