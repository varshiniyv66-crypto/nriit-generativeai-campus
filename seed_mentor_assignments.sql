-- ===========================================
-- MENTOR ASSIGNMENTS SEED DATA
-- ===========================================
-- This assigns faculty mentors to students
-- Each faculty gets ~15-20 mentees from their department
-- ===========================================

DO $$
DECLARE
    dept_record RECORD;
    faculty_record RECORD;
    student_record RECORD;
    students_per_mentor INTEGER;
    student_count INTEGER;
    current_mentor_id UUID;
    mentor_index INTEGER;
    faculty_list UUID[];
BEGIN
    RAISE NOTICE 'Starting mentor assignments...';

    -- Loop through each department
    FOR dept_record IN 
        SELECT DISTINCT dept_code FROM student_profiles WHERE is_active = true
    LOOP
        RAISE NOTICE 'Processing department: %', dept_record.dept_code;
        
        -- Get all active faculty from this department (excluding HODs for now)
        SELECT ARRAY_AGG(id ORDER BY employee_id) INTO faculty_list
        FROM faculty_profiles
        WHERE dept_code = dept_record.dept_code 
        AND is_active = true
        AND designation NOT LIKE '%HOD%';
        
        IF faculty_list IS NULL OR array_length(faculty_list, 1) = 0 THEN
            RAISE NOTICE 'No faculty found for department %, skipping', dept_record.dept_code;
            CONTINUE;
        END IF;
        
        RAISE NOTICE 'Found % faculty members in %', array_length(faculty_list, 1), dept_record.dept_code;
        
        -- Mark all faculty in this department as mentors
        UPDATE faculty_profiles
        SET is_mentor = true
        WHERE dept_code = dept_record.dept_code 
        AND is_active = true;
        
        -- Assign students to mentors in round-robin fashion
        mentor_index := 1;
        
        FOR student_record IN 
            SELECT id, roll_number 
            FROM student_profiles 
            WHERE dept_code = dept_record.dept_code 
            AND is_active = true
            ORDER BY roll_number
        LOOP
            -- Get current mentor from the list
            current_mentor_id := faculty_list[mentor_index];
            
            -- Update student's mentor_id
            UPDATE student_profiles
            SET mentor_id = current_mentor_id
            WHERE id = student_record.id;
            
            -- Create mentor allocation record
            INSERT INTO mentor_allocations (
                mentor_id,
                student_id,
                academic_year,
                is_active
            ) VALUES (
                current_mentor_id,
                student_record.id,
                '2024-25',
                true
            ) ON CONFLICT DO NOTHING;
            
            -- Move to next mentor (round-robin)
            mentor_index := mentor_index + 1;
            IF mentor_index > array_length(faculty_list, 1) THEN
                mentor_index := 1;
            END IF;
        END LOOP;
        
        RAISE NOTICE 'Completed mentor assignments for %', dept_record.dept_code;
    END LOOP;

    -- Create some sample mentoring sessions for realism
    RAISE NOTICE 'Creating sample mentoring sessions...';
    
    INSERT INTO mentoring_sessions (
        mentor_id,
        student_id,
        session_date,
        session_type,
        discussion_points,
        action_items,
        mentor_remarks,
        attendance_discussed,
        academics_discussed
    )
    SELECT 
        sp.mentor_id,
        sp.id,
        CURRENT_DATE - (FLOOR(RANDOM() * 30)::INTEGER),
        CASE FLOOR(RANDOM() * 4)
            WHEN 0 THEN 'academic'
            WHEN 1 THEN 'personal'
            WHEN 2 THEN 'career'
            ELSE 'disciplinary'
        END,
        'Discussed student progress and challenges',
        'Follow up on attendance and assignment completion',
        'Student is showing improvement',
        true,
        true
    FROM student_profiles sp
    WHERE sp.mentor_id IS NOT NULL
    AND sp.is_active = true
    AND RANDOM() < 0.3  -- 30% of students have recent mentoring sessions
    LIMIT 500;

    -- Create some risk flags for at-risk students
    RAISE NOTICE 'Creating risk flags for at-risk students...';
    
    INSERT INTO student_risk_flags (
        student_id,
        risk_type,
        risk_level,
        description,
        identified_by,
        is_resolved
    )
    SELECT 
        sp.id,
        CASE FLOOR(RANDOM() * 3)
            WHEN 0 THEN 'attendance'
            WHEN 1 THEN 'academic'
            ELSE 'behavioral'
        END,
        CASE FLOOR(RANDOM() * 4)
            WHEN 0 THEN 'low'
            WHEN 1 THEN 'medium'
            WHEN 2 THEN 'high'
            ELSE 'critical'
        END,
        CASE FLOOR(RANDOM() * 3)
            WHEN 0 THEN 'Attendance below 75% threshold'
            WHEN 1 THEN 'Poor performance in recent internals'
            ELSE 'Behavioral concerns reported'
        END,
        sp.mentor_id,
        RANDOM() < 0.4  -- 40% are resolved
    FROM student_profiles sp
    WHERE sp.mentor_id IS NOT NULL
    AND sp.is_active = true
    AND RANDOM() < 0.15  -- 15% of students have risk flags
    LIMIT 200;

    RAISE NOTICE '========================================';
    RAISE NOTICE '✅ MENTOR ASSIGNMENTS COMPLETE!';
    RAISE NOTICE '========================================';
END $$;

-- Verification queries
DO $$
DECLARE
    total_students INTEGER;
    students_with_mentors INTEGER;
    total_mentors INTEGER;
    avg_mentees DECIMAL(5,1);
BEGIN
    SELECT COUNT(*) INTO total_students FROM student_profiles WHERE is_active = true;
    SELECT COUNT(*) INTO students_with_mentors FROM student_profiles WHERE is_active = true AND mentor_id IS NOT NULL;
    SELECT COUNT(*) INTO total_mentors FROM faculty_profiles WHERE is_active = true AND is_mentor = true;
    
    IF total_mentors > 0 THEN
        avg_mentees := students_with_mentors::DECIMAL / total_mentors;
    ELSE
        avg_mentees := 0;
    END IF;
    
    RAISE NOTICE '📊 MENTOR ASSIGNMENT SUMMARY:';
    RAISE NOTICE '   Total Students: %', total_students;
    RAISE NOTICE '   Students with Mentors: %', students_with_mentors;
    RAISE NOTICE '   Total Mentors: %', total_mentors;
    RAISE NOTICE '   Avg Mentees per Mentor: %', ROUND(avg_mentees, 1);
    RAISE NOTICE '========================================';
END $$;

-- Show department-wise breakdown
SELECT 
    dept_code,
    COUNT(DISTINCT mentor_id) as total_mentors,
    COUNT(*) as total_mentees,
    ROUND(COUNT(*)::DECIMAL / NULLIF(COUNT(DISTINCT mentor_id), 0), 1) as avg_per_mentor
FROM student_profiles
WHERE is_active = true AND mentor_id IS NOT NULL
GROUP BY dept_code
ORDER BY dept_code;
