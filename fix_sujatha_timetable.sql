-- CLEAN TIMETABLE: Remove ALL entries for classes with 0 students
-- AND add MCA class for B. Sujatha

-- Step 1: Delete timetable entries where class has no students
DELETE FROM timetable t
WHERE NOT EXISTS (
    SELECT 1 
    FROM class_sections cs
    WHERE cs.id = t.class_section_id
      AND EXISTS (
        SELECT 1 FROM student_profiles sp 
        WHERE sp.dept_code = cs.dept_code 
          AND sp.current_semester = cs.semester 
          AND sp.section = cs.section 
          AND sp.is_active = true
      )
);

-- Step 2: Find B. Sujatha's ID
DO $$
DECLARE
    v_faculty_id UUID;
    v_mca_class_id UUID;
    v_mca_course_id UUID;
BEGIN
    -- Get B. Sujatha's faculty ID
    SELECT id INTO v_faculty_id 
    FROM faculty_profiles 
    WHERE employee_id = 'FACCSE035' OR first_name ILIKE '%Sujatha%'
    LIMIT 1;

    -- Get MCA 1st semester class section ID  
    SELECT id INTO v_mca_class_id
    FROM class_sections
    WHERE dept_code = 'MCA' AND semester = 1 AND section = 'A'
    LIMIT 1;

    -- Get a MCA course ID
    SELECT id INTO v_mca_course_id
    FROM courses
    WHERE dept_code = 'MCA' AND semester = 1 AND is_active = true
    LIMIT 1;

    IF v_faculty_id IS NOT NULL AND v_mca_class_id IS NOT NULL AND v_mca_course_id IS NOT NULL THEN
        -- Add timetable entries for B. Sujatha -> MCA 1-A
        INSERT INTO timetable (faculty_id, course_id, class_section_id, day_of_week, period_number, start_time, end_time)
        SELECT 
            v_faculty_id,
            v_mca_course_id,
            v_mca_class_id,
            day_name,
            period_num,
            CASE period_num
                WHEN 1 THEN '09:00'::time WHEN 2 THEN '09:50'::time
                WHEN 3 THEN '10:50'::time WHEN 4 THEN '11:40'::time
                WHEN 5 THEN '13:10'::time WHEN 6 THEN '14:00'::time
                WHEN 7 THEN '15:00'::time WHEN 8 THEN '15:50'::time
            END,
            CASE period_num
                WHEN 1 THEN '09:50'::time WHEN 2 THEN '10:40'::time
                WHEN 3 THEN '11:40'::time WHEN 4 THEN '12:30'::time
                WHEN 5 THEN '14:00'::time WHEN 6 THEN '14:50'::time
                WHEN 7 THEN '15:50'::time WHEN 8 THEN '16:40'::time
            END
        FROM (
            SELECT unnest(ARRAY['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']) as day_name
        ) days
        CROSS JOIN (
            SELECT generate_series(1, 8) as period_num
        ) periods
        ON CONFLICT DO NOTHING;

        RAISE NOTICE 'Added MCA timetable for B. Sujatha';
    ELSE
        RAISE NOTICE 'Could not find faculty, class, or course';
    END IF;
END $$;

-- Step 3: Verify - Show B. Sujatha's valid classes
SELECT 
    t.day_of_week,
    cs.dept_code,
    cs.semester,
    cs.section,
    c.course_name,
    (SELECT COUNT(*) FROM student_profiles sp 
     WHERE sp.dept_code = cs.dept_code 
       AND sp.current_semester = cs.semester 
       AND sp.section = cs.section 
       AND sp.is_active = true) as students
FROM timetable t
JOIN faculty_profiles fp ON fp.id = t.faculty_id
JOIN class_sections cs ON cs.id = t.class_section_id
JOIN courses c ON c.id = t.course_id
WHERE fp.employee_id = 'FACCSE035'
GROUP BY t.day_of_week, cs.dept_code, cs.semester, cs.section, c.course_name
ORDER BY cs.dept_code, cs.semester;
