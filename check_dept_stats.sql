
-- =========================================================
-- DEPARTMENT STATISTICS (Detailed View)
-- =========================================================

SELECT 
    d.code AS department_code,
    d.name AS department_name,
    COUNT(DISTINCT f.id) AS active_faculty,
    COUNT(DISTINCT s.id) AS active_students
FROM departments d
LEFT JOIN faculty_profiles f ON d.code::text = f.dept_code::text
LEFT JOIN students s ON d.code::text = s.dept_code::text
GROUP BY d.code, d.name
ORDER BY d.code ASC;
