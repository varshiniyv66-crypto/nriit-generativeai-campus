-- ===========================================
-- SIMPLE MENTOR ASSIGNMENTS (FIXED VERSION)
-- ===========================================
-- This assigns faculty mentors to students
-- ===========================================

DO $$
DECLARE
    dept TEXT;
    faculty_count INTEGER;
    student_count INTEGER;
    assigned_count INTEGER := 0;
BEGIN
    RAISE NOTICE 'Starting mentor assignments...';
    
    -- Process each department
    FOR dept IN SELECT DISTINCT dept_code::TEXT FROM student_profiles WHERE is_active = true
    LOOP
        RAISE NOTICE 'Processing department: %', dept;
        
        -- Mark all faculty in this department as mentors
        UPDATE faculty_profiles
        SET is_mentor = true
        WHERE dept_code::TEXT = dept AND is_active = true;
        
        GET DIAGNOSTICS faculty_count = ROW_COUNT;
        RAISE NOTICE '  Marked % faculty as mentors', faculty_count;
        
        -- Assign students to mentors using a simple round-robin
        WITH faculty_list AS (
            SELECT id, ROW_NUMBER() OVER (ORDER BY employee_id) as rn
            FROM faculty_profiles
            WHERE dept_code::TEXT = dept AND is_active = true
        ),
        student_list AS (
            SELECT id, roll_number, ROW_NUMBER() OVER (ORDER BY roll_number) as rn
            FROM student_profiles
            WHERE dept_code::TEXT = dept AND is_active = true
        )
        UPDATE student_profiles sp
        SET mentor_id = fl.id
        FROM student_list sl
        JOIN faculty_list fl ON ((sl.rn - 1) % (SELECT COUNT(*) FROM faculty_list)) + 1 = fl.rn
        WHERE sp.id = sl.id;
        
        GET DIAGNOSTICS student_count = ROW_COUNT;
        RAISE NOTICE '  Assigned % students to mentors', student_count;
        assigned_count := assigned_count + student_count;
        
        -- Create mentor allocation records
        INSERT INTO mentor_allocations (mentor_id, student_id, academic_year, is_active)
        SELECT 
            sp.mentor_id,
            sp.id,
            '2024-25',
            true
        FROM student_profiles sp
        WHERE sp.dept_code::TEXT = dept 
        AND sp.is_active = true 
        AND sp.mentor_id IS NOT NULL
        ON CONFLICT DO NOTHING;
        
    END LOOP;
    
    RAISE NOTICE '========================================';
    RAISE NOTICE '✅ MENTOR ASSIGNMENTS COMPLETE!';
    RAISE NOTICE '   Total students assigned: %', assigned_count;
    RAISE NOTICE '========================================';
END $$;

-- Verification
SELECT 
    'Faculty marked as mentors' as metric,
    COUNT(*) as count
FROM faculty_profiles
WHERE is_mentor = true AND is_active = true

UNION ALL

SELECT 
    'Students with mentors' as metric,
    COUNT(*) as count
FROM student_profiles
WHERE mentor_id IS NOT NULL AND is_active = true

UNION ALL

SELECT 
    'Mentor allocations' as metric,
    COUNT(*) as count
FROM mentor_allocations;

-- Department-wise breakdown
SELECT 
    dept_code::TEXT as department,
    COUNT(DISTINCT mentor_id) as total_mentors,
    COUNT(*) as total_students,
    ROUND(COUNT(*)::DECIMAL / NULLIF(COUNT(DISTINCT mentor_id), 0), 1) as avg_per_mentor
FROM student_profiles
WHERE is_active = true AND mentor_id IS NOT NULL
GROUP BY dept_code
ORDER BY dept_code;
