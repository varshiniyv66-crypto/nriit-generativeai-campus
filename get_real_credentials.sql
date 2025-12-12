-- GET ACTUAL FACULTY EMAILS FROM DATABASE
-- Run this in Supabase SQL Editor to get real faculty login credentials

-- Get first 20 faculty members with their emails
SELECT 
    employee_id,
    first_name,
    last_name,
    email,
    designation,
    dept_code
FROM faculty_profiles
WHERE is_active = true
ORDER BY employee_id
LIMIT 20;

-- Get faculty count by department
SELECT 
    dept_code,
    COUNT(*) as faculty_count
FROM faculty_profiles
WHERE is_active = true
GROUP BY dept_code
ORDER BY dept_code;

-- Get all student roll numbers (first 10)
SELECT 
    roll_number,
    first_name,
    last_name,
    email,
    year,
    section
FROM student_profiles
WHERE is_active = true
ORDER BY roll_number
LIMIT 10;
