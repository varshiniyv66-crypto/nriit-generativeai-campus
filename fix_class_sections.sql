-- =========================================================
-- FIX: Sync Class Sections & Timetable (Cross-Department Support)
-- Faculty can teach in ANY department based on timetable
-- =========================================================

-- STEP 1: Create class_sections for all actual student groups
DO $$
DECLARE
    v_ay_id UUID;
BEGIN
    -- Get or create academic year
    SELECT id INTO v_ay_id FROM academic_years WHERE is_active = true LIMIT 1;
    
    IF v_ay_id IS NULL THEN
        INSERT INTO academic_years (name, start_date, end_date, is_active)
        VALUES ('2024-25', '2024-06-01', '2025-05-31', true)
        RETURNING id INTO v_ay_id;
    END IF;

    -- Insert class_sections for ALL student groups that don't have them yet
    INSERT INTO class_sections (name, dept_code, academic_year_id, academic_year, year, semester, section, strength)
    SELECT DISTINCT
        sp.dept_code || '-' || sp.current_semester || '-' || sp.section as name,
        sp.dept_code,
        v_ay_id,
        '2024-25' as academic_year,
        CEIL(sp.current_semester::numeric / 2) as year,
        sp.current_semester as semester,
        sp.section,
        COUNT(*) OVER (PARTITION BY sp.dept_code, sp.current_semester, sp.section) as strength
    FROM student_profiles sp
    WHERE sp.is_active = true
    GROUP BY sp.dept_code, sp.current_semester, sp.section, v_ay_id
    ON CONFLICT DO NOTHING;

    RAISE NOTICE 'Class sections synced!';
END $$;

-- STEP 2: Create courses for all departments/semesters if missing
INSERT INTO courses (course_code, course_name, dept_code, semester, credits, course_type, is_active)
SELECT DISTINCT
    cs.dept_code || '-' || cs.semester || '-SUB' || row_num as course_code,
    CASE row_num
        WHEN 1 THEN 'Subject 1'
        WHEN 2 THEN 'Subject 2'
        WHEN 3 THEN 'Subject 3'
        WHEN 4 THEN 'Subject 4'
        WHEN 5 THEN 'Lab 1'
        WHEN 6 THEN 'Lab 2'
    END as course_name,
    cs.dept_code,
    cs.semester,
    CASE WHEN row_num <= 4 THEN 3 ELSE 2 END as credits,
    CASE WHEN row_num <= 4 THEN 'theory' ELSE 'lab' END as course_type,
    true as is_active
FROM class_sections cs
CROSS JOIN generate_series(1, 6) as row_num
WHERE NOT EXISTS (
    SELECT 1 FROM courses c 
    WHERE c.dept_code = cs.dept_code 
      AND c.semester = cs.semester
)
ON CONFLICT (course_code) DO NOTHING;

-- STEP 3: Clear old timetable entries that reference non-existent class sections
DELETE FROM timetable t
WHERE NOT EXISTS (
    SELECT 1 FROM class_sections cs WHERE cs.id = t.class_section_id
);

-- STEP 4: Generate timetable - Faculty CROSS-department teaching
-- BSH faculty teach in all UG departments (CSE, IT, ECE, etc.)
-- Other faculty teach in their own department

INSERT INTO timetable (faculty_id, course_id, class_section_id, day_of_week, period_number, start_time, end_time)
SELECT DISTINCT
    fp.id as faculty_id,
    c.id as course_id,
    cs.id as class_section_id,
    dow.day_name,
    period.num,
    CASE period.num
        WHEN 1 THEN '09:00'::time WHEN 2 THEN '09:50'::time
        WHEN 3 THEN '10:50'::time WHEN 4 THEN '11:40'::time
        WHEN 5 THEN '13:10'::time WHEN 6 THEN '14:00'::time
        WHEN 7 THEN '15:00'::time WHEN 8 THEN '15:50'::time
    END,
    CASE period.num
        WHEN 1 THEN '09:50'::time WHEN 2 THEN '10:40'::time
        WHEN 3 THEN '11:40'::time WHEN 4 THEN '12:30'::time
        WHEN 5 THEN '14:00'::time WHEN 6 THEN '14:50'::time
        WHEN 7 THEN '15:50'::time WHEN 8 THEN '16:40'::time
    END
FROM faculty_profiles fp
CROSS JOIN class_sections cs
JOIN courses c ON c.dept_code = cs.dept_code AND c.semester = cs.semester AND c.is_active = true
CROSS JOIN (
    SELECT unnest(ARRAY['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']) as day_name
) dow
CROSS JOIN (SELECT generate_series(1, 2) as num) period -- Just 2 periods per faculty per class
WHERE fp.is_active = true
  -- Cross-department logic:
  AND (
    -- BSH faculty can teach in ALL departments (Math, Physics, English, etc.)
    fp.dept_code = 'BSH'
    -- OR faculty teaches in their OWN department
    OR fp.dept_code = cs.dept_code
    -- OR faculty from any dept can teach in 1st year of any UG program (common foundation courses)
    OR (cs.semester IN (1, 2) AND fp.dept_code IN ('CSE', 'IT', 'ECE', 'CIVIL', 'EVT', 'BSH'))
  )
  -- Only for class sections that have students
  AND EXISTS (
    SELECT 1 FROM student_profiles sp
    WHERE sp.dept_code = cs.dept_code
      AND sp.current_semester = cs.semester
      AND sp.section = cs.section
      AND sp.is_active = true
  )
  -- Don't duplicate existing entries
  AND NOT EXISTS (
    SELECT 1 FROM timetable t
    WHERE t.faculty_id = fp.id AND t.class_section_id = cs.id 
      AND t.day_of_week = dow.day_name AND t.period_number = period.num
  )
LIMIT 10000;

-- STEP 5: Show summary
SELECT 
    '✅ TIMETABLE SYNCED' as status,
    (SELECT COUNT(*) FROM class_sections) as total_class_sections,
    (SELECT COUNT(*) FROM timetable) as total_timetable_entries,
    (SELECT COUNT(DISTINCT faculty_id) FROM timetable) as faculty_with_schedules;

-- Show which faculty have classes in which departments
SELECT 
    fp.first_name || ' ' || fp.last_name as faculty_name,
    fp.dept_code as home_dept,
    STRING_AGG(DISTINCT cs.dept_code::text, ', ' ORDER BY cs.dept_code::text) as teaches_in_depts,
    STRING_AGG(DISTINCT cs.semester::text || cs.section, ', ') as classes,
    COUNT(DISTINCT cs.id) as class_count
FROM faculty_profiles fp
JOIN timetable t ON t.faculty_id = fp.id
JOIN class_sections cs ON cs.id = t.class_section_id
WHERE EXISTS (
    SELECT 1 FROM student_profiles sp
    WHERE sp.dept_code = cs.dept_code
      AND sp.current_semester = cs.semester
      AND sp.section = cs.section
      AND sp.is_active = true
)
GROUP BY fp.id, fp.first_name, fp.last_name, fp.dept_code
ORDER BY fp.dept_code, fp.first_name
LIMIT 30;
