-- Check what subjects Dr. B. Sujatha is assigned to teach

-- 1. Find faculty profile
SELECT id, employee_id, first_name, last_name, dept_code, designation
FROM faculty_profiles 
WHERE first_name ILIKE '%Sujatha%' OR last_name ILIKE '%Sujatha%';

-- 2. Show all her timetable assignments (subjects + classes)
SELECT 
    fp.first_name || ' ' || fp.last_name as faculty_name,
    fp.dept_code as home_dept,
    c.course_code,
    c.course_name,
    c.course_type,
    cs.dept_code as teaching_dept,
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
       AND sp.is_active = true) as students_in_class
FROM timetable t
JOIN faculty_profiles fp ON fp.id = t.faculty_id
JOIN courses c ON c.id = t.course_id
JOIN class_sections cs ON cs.id = t.class_section_id
WHERE fp.first_name ILIKE '%Sujatha%' OR fp.last_name ILIKE '%Sujatha%'
ORDER BY cs.dept_code, cs.semester, t.day_of_week, t.period_number;

-- 3. Summary: Unique subjects she teaches
SELECT DISTINCT
    fp.first_name || ' ' || fp.last_name as faculty_name,
    c.course_code,
    c.course_name,
    c.course_type,
    cs.dept_code as class_dept,
    cs.semester as class_semester,
    (SELECT COUNT(*) FROM student_profiles sp 
     WHERE sp.dept_code = cs.dept_code 
       AND sp.current_semester = cs.semester 
       AND sp.section = cs.section 
       AND sp.is_active = true) as students
FROM timetable t
JOIN faculty_profiles fp ON fp.id = t.faculty_id
JOIN courses c ON c.id = t.course_id
JOIN class_sections cs ON cs.id = t.class_section_id
WHERE fp.first_name ILIKE '%Sujatha%' OR fp.last_name ILIKE '%Sujatha%'
ORDER BY cs.dept_code, cs.semester, c.course_name;
