-- Check if MCA is in B. Sujatha's timetable

-- 1. Check B. Sujatha's faculty ID
SELECT id, employee_id, first_name, last_name, dept_code
FROM faculty_profiles 
WHERE first_name ILIKE '%Sujatha%' OR employee_id = 'FACCSE035';

-- 2. Check if MCA class section exists
SELECT id, dept_code, semester, section, name, strength
FROM class_sections
WHERE dept_code = 'MCA';

-- 3. Check if B. Sujatha has MCA timetable entries
SELECT 
    t.id as timetable_id,
    fp.first_name || ' ' || fp.last_name as faculty,
    cs.dept_code,
    cs.semester,
    cs.section,
    c.course_name,
    t.day_of_week
FROM timetable t
JOIN faculty_profiles fp ON fp.id = t.faculty_id
JOIN class_sections cs ON cs.id = t.class_section_id
JOIN courses c ON c.id = t.course_id
WHERE (fp.first_name ILIKE '%Sujatha%' OR fp.employee_id = 'FACCSE035')
  AND cs.dept_code = 'MCA'
LIMIT 20;

-- 4. If NO MCA entries, add them now
DO $$
DECLARE
    v_faculty_id UUID;
    v_mca_class_id UUID;
    v_mca_course_id UUID;
    v_count INT;
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

    -- Check if entries already exist
    SELECT COUNT(*) INTO v_count
    FROM timetable t
    JOIN class_sections cs ON cs.id = t.class_section_id
    WHERE t.faculty_id = v_faculty_id AND cs.dept_code = 'MCA';

    RAISE NOTICE 'Faculty ID: %, MCA Class ID: %, Existing MCA entries: %', v_faculty_id, v_mca_class_id, v_count;

    IF v_count = 0 AND v_faculty_id IS NOT NULL AND v_mca_class_id IS NOT NULL THEN
        -- Get a MCA course ID
        SELECT id INTO v_mca_course_id
        FROM courses
        WHERE dept_code = 'MCA' AND semester = 1 AND is_active = true
        LIMIT 1;

        IF v_mca_course_id IS NOT NULL THEN
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

            RAISE NOTICE 'Added MCA timetable entries for B. Sujatha!';
        ELSE
            RAISE NOTICE 'No MCA course found!';
        END IF;
    ELSE
        RAISE NOTICE 'MCA entries already exist or faculty/class not found';
    END IF;
END $$;

-- 5. Final verification - Show all unique departments for B. Sujatha
SELECT DISTINCT
    cs.dept_code,
    cs.semester,
    cs.section,
    (SELECT COUNT(*) FROM student_profiles sp 
     WHERE sp.dept_code = cs.dept_code 
       AND sp.current_semester = cs.semester 
       AND sp.section = cs.section 
       AND sp.is_active = true) as students
FROM timetable t
JOIN faculty_profiles fp ON fp.id = t.faculty_id
JOIN class_sections cs ON cs.id = t.class_section_id
WHERE fp.first_name ILIKE '%Sujatha%' OR fp.employee_id = 'FACCSE035'
ORDER BY cs.dept_code, cs.semester;
