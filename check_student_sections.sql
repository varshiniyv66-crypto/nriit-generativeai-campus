-- Check student distribution by department, semester, and section
SELECT 
    dept_code,
    current_semester,
    section,
    COUNT(*) as student_count
FROM student_profiles
WHERE is_active = true
GROUP BY dept_code, current_semester, section
ORDER BY dept_code, current_semester, section;

-- Check if EVT department has any students
SELECT 
    dept_code,
    current_semester,
    section,
    COUNT(*) as count
FROM student_profiles 
WHERE dept_code = 'EVT' AND is_active = true
GROUP BY dept_code, current_semester, section;

-- Check what class_sections exist
SELECT 
    id, dept_code, semester, section, name
FROM class_sections
WHERE dept_code = 'EVT'
ORDER BY semester;

-- Check total active students
SELECT COUNT(*) as total_active FROM student_profiles WHERE is_active = true;
