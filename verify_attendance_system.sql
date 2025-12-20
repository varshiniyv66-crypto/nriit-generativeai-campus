-- =========================================================
-- VERIFICATION: Faculty Attendance System Readiness
-- Run this AFTER fix_complete_timetable_system.sql
-- =========================================================

-- =====================
-- 1. VERIFY: All Departments Have Students
-- =====================
SELECT 
    d.code as dept_code,
    d.name as department,
    COALESCE(student_counts.total, 0) as total_students,
    COALESCE(student_counts.active, 0) as active_students
FROM departments d
LEFT JOIN (
    SELECT dept_code, 
           COUNT(*) as total,
           COUNT(CASE WHEN is_active THEN 1 END) as active
    FROM student_profiles
    GROUP BY dept_code
) student_counts ON student_counts.dept_code = d.code
ORDER BY d.code;

-- =====================
-- 2. VERIFY: All Departments Have Faculty
-- =====================
SELECT 
    d.code as dept_code,
    d.name as department,
    COALESCE(faculty_counts.total, 0) as total_faculty,
    COALESCE(faculty_counts.active, 0) as active_faculty,
    COALESCE(faculty_counts.with_classes, 0) as faculty_with_classes
FROM departments d
LEFT JOIN (
    SELECT 
        fp.dept_code,
        COUNT(*) as total,
        COUNT(CASE WHEN fp.is_active THEN 1 END) as active,
        COUNT(DISTINCT CASE 
            WHEN EXISTS (
                SELECT 1 FROM timetable t
                JOIN class_sections cs ON cs.id = t.class_section_id
                JOIN student_profiles sp ON sp.dept_code = cs.dept_code 
                                        AND sp.current_semester = cs.semester 
                                        AND sp.section = cs.section
                                        AND sp.is_active = true
                WHERE t.faculty_id = fp.id
            ) THEN fp.id 
        END) as with_classes
    FROM faculty_profiles fp
    GROUP BY fp.dept_code
) faculty_counts ON faculty_counts.dept_code = d.code
ORDER BY d.code;

-- =====================
-- 3. VERIFY: Class Sections Distribution
-- =====================
SELECT 
    cs.dept_code,
    cs.semester,
    STRING_AGG(DISTINCT cs.section, ', ' ORDER BY cs.section) as sections,
    SUM(student_counts.cnt) as total_students
FROM class_sections cs
LEFT JOIN (
    SELECT dept_code, current_semester, section, COUNT(*) as cnt
    FROM student_profiles
    WHERE is_active = true
    GROUP BY dept_code, current_semester, section
) student_counts ON student_counts.dept_code = cs.dept_code 
                AND student_counts.current_semester = cs.semester 
                AND student_counts.section = cs.section
GROUP BY cs.dept_code, cs.semester
HAVING SUM(student_counts.cnt) > 0
ORDER BY cs.dept_code, cs.semester;

-- =====================
-- 4. VERIFY: Faculty Can Take Attendance (Sample for Each Dept)
-- =====================
SELECT 
    fp.dept_code as home_dept,
    fp.employee_id,
    fp.first_name || ' ' || fp.last_name as faculty_name,
    fp.designation,
    cs.dept_code || ' Sem-' || cs.semester || ' ' || cs.section as assigned_class,
    COUNT(DISTINCT t.id) as periods,
    (SELECT COUNT(*) FROM student_profiles sp 
     WHERE sp.dept_code = cs.dept_code 
       AND sp.current_semester = cs.semester 
       AND sp.section = cs.section 
       AND sp.is_active = true) as students_to_mark
FROM faculty_profiles fp
JOIN timetable t ON t.faculty_id = fp.id AND t.is_active = true
JOIN class_sections cs ON cs.id = t.class_section_id
WHERE fp.is_active = true
  AND EXISTS (
      SELECT 1 FROM student_profiles sp 
      WHERE sp.dept_code = cs.dept_code 
        AND sp.current_semester = cs.semester 
        AND sp.section = cs.section 
        AND sp.is_active = true
  )
GROUP BY fp.id, fp.dept_code, fp.employee_id, fp.first_name, fp.last_name, fp.designation, 
         cs.dept_code, cs.semester, cs.section
ORDER BY fp.dept_code, fp.first_name, cs.dept_code, cs.semester;

-- =====================
-- 5. FINAL SUMMARY
-- =====================
SELECT 
    '🎯 ATTENDANCE SYSTEM READY' as status,
    (SELECT COUNT(DISTINCT fp.id) 
     FROM faculty_profiles fp
     JOIN timetable t ON t.faculty_id = fp.id
     JOIN class_sections cs ON cs.id = t.class_section_id
     JOIN student_profiles sp ON sp.dept_code = cs.dept_code 
                             AND sp.current_semester = cs.semester 
                             AND sp.section = cs.section
                             AND sp.is_active = true
     WHERE fp.is_active = true AND t.is_active = true
    ) as faculty_can_take_attendance,
    (SELECT COUNT(*) FROM faculty_profiles WHERE is_active = true) as total_active_faculty,
    (SELECT COUNT(*) FROM student_profiles WHERE is_active = true) as total_active_students,
    (SELECT COUNT(DISTINCT cs.id)
     FROM class_sections cs
     WHERE EXISTS (
         SELECT 1 FROM student_profiles sp 
         WHERE sp.dept_code = cs.dept_code 
           AND sp.current_semester = cs.semester 
           AND sp.section = cs.section 
           AND sp.is_active = true
     )
    ) as valid_class_sections;

-- =====================
-- 6. IDENTIFY ANY REMAINING ISSUES
-- =====================

-- Faculty still without valid classes
SELECT 
    '⚠️ FACULTY WITHOUT VALID CLASSES' as issue,
    fp.employee_id,
    fp.first_name || ' ' || fp.last_name as name,
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
    WHERE t.faculty_id = fp.id AND t.is_active = true
  );

-- Class sections without any faculty assigned
SELECT 
    '⚠️ CLASSES WITHOUT FACULTY' as issue,
    cs.dept_code,
    cs.semester,
    cs.section,
    COUNT(*) as student_count
FROM class_sections cs
JOIN student_profiles sp ON sp.dept_code = cs.dept_code 
                        AND sp.current_semester = cs.semester 
                        AND sp.section = cs.section
                        AND sp.is_active = true
WHERE NOT EXISTS (
    SELECT 1 FROM timetable t WHERE t.class_section_id = cs.id AND t.is_active = true
)
GROUP BY cs.id, cs.dept_code, cs.semester, cs.section
HAVING COUNT(*) > 0;
