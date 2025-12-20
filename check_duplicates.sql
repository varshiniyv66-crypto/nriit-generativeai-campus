-- Check for duplicate faculty members in CSE department

-- 1. Find duplicates by similar names (case-insensitive)
SELECT 
    UPPER(REPLACE(REPLACE(first_name || ' ' || last_name, '.', ''), ' ', '')) as normalized_name,
    COUNT(*) as count,
    STRING_AGG(employee_id, ', ') as employee_ids,
    STRING_AGG(first_name || ' ' || last_name, ' | ') as all_names,
    STRING_AGG(designation, ' | ') as designations,
    STRING_AGG(TO_CHAR(date_of_joining, 'YYYY-MM-DD'), ' | ') as join_dates
FROM faculty_profiles fp
JOIN departments d ON fp.department_id = d.id
WHERE d.dept_code = 'CSE' AND fp.is_active = true
GROUP BY UPPER(REPLACE(REPLACE(first_name || ' ' || last_name, '.', ''), ' ', ''))
HAVING COUNT(*) > 1
ORDER BY count DESC;

-- 2. Find duplicates by PAN (should be unique)
SELECT 
    pan_number,
    COUNT(*) as count,
    STRING_AGG(employee_id, ', ') as employee_ids,
    STRING_AGG(first_name || ' ' || last_name, ' | ') as names
FROM faculty_profiles fp
JOIN departments d ON fp.department_id = d.id
WHERE d.dept_code = 'CSE' AND fp.is_active = true AND pan_number IS NOT NULL
GROUP BY pan_number
HAVING COUNT(*) > 1
ORDER BY count DESC;

-- 3. List all CSE faculty sorted by name to spot duplicates visually
SELECT 
    employee_id,
    first_name,
    last_name,
    designation,
    qualification,
    date_of_joining,
    pan_number
FROM faculty_profiles fp
JOIN departments d ON fp.department_id = d.id
WHERE d.dept_code = 'CSE' AND fp.is_active = true
ORDER BY UPPER(last_name), UPPER(first_name), date_of_joining;
