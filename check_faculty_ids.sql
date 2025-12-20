-- Check what faculty IDs exist in the database

-- 1. Find all faculty with name like "Sujatha"
SELECT id, employee_id, first_name, last_name, dept_code, email
FROM faculty_profiles 
WHERE first_name ILIKE '%Sujatha%' OR last_name ILIKE '%Sujatha%';

-- 2. Show all faculty IDs (first 30)
SELECT employee_id, first_name, last_name, dept_code
FROM faculty_profiles
ORDER BY dept_code, first_name
LIMIT 30;

-- 3. Check if FAC05865 exists
SELECT * FROM faculty_profiles WHERE employee_id = 'FAC05865';

-- 4. Check if FACCSE035 exists
SELECT employee_id, first_name, last_name, dept_code 
FROM faculty_profiles 
WHERE employee_id = 'FACCSE035';
