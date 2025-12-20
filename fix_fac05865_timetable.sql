-- FIX: Add classes for Dr. B. Sujatha (FAC05865) - the EVT faculty

-- 1. Find the faculty
SELECT id, employee_id, first_name, last_name, dept_code
FROM faculty_profiles 
WHERE employee_id = 'FAC05865';

-- 2. Add timetable entries for FAC05865 to MCA, CSE, IT, MBA classes
DO $$
DECLARE
    v_faculty_id UUID;
    v_class_record RECORD;
    v_course_id UUID;
BEGIN
    -- Get FAC05865 faculty ID
    SELECT id INTO v_faculty_id 
    FROM faculty_profiles 
    WHERE employee_id = 'FAC05865'
    LIMIT 1;

    IF v_faculty_id IS NULL THEN
        RAISE NOTICE 'Faculty FAC05865 not found!';
        RETURN;
    END IF;

    RAISE NOTICE 'Faculty ID for FAC05865: %', v_faculty_id;

    -- Loop through classes with students and add timetable entries
    FOR v_class_record IN 
        SELECT cs.id as class_id, cs.dept_code, cs.semester
        FROM class_sections cs
        WHERE EXISTS (
            SELECT 1 FROM student_profiles sp 
            WHERE sp.dept_code = cs.dept_code 
              AND sp.current_semester = cs.semester 
              AND sp.section = cs.section 
              AND sp.is_active = true
        )
        AND cs.dept_code IN ('MCA', 'MBA', 'CSE', 'IT', 'ECE', 'CSE-AI', 'CSE-DS', 'CIVIL', 'EVT')
    LOOP
        -- Get a course for this class
        SELECT id INTO v_course_id
        FROM courses
        WHERE dept_code = v_class_record.dept_code 
          AND semester = v_class_record.semester 
          AND is_active = true
        LIMIT 1;

        IF v_course_id IS NOT NULL THEN
            -- Add timetable entries (only for Saturday for testing)
            INSERT INTO timetable (faculty_id, course_id, class_section_id, day_of_week, period_number, start_time, end_time)
            VALUES 
                (v_faculty_id, v_course_id, v_class_record.class_id, 'Saturday', 1, '09:00', '09:50'),
                (v_faculty_id, v_course_id, v_class_record.class_id, 'Saturday', 8, '15:50', '16:40')
            ON CONFLICT DO NOTHING;
        END IF;
    END LOOP;

    RAISE NOTICE 'Added timetable entries for FAC05865';
END $$;

-- 3. Verify - Show all classes for FAC05865
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
WHERE fp.employee_id = 'FAC05865'
ORDER BY cs.dept_code, cs.semester;
