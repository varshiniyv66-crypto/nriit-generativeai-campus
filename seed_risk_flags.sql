-- ===========================================
-- CREATE SAMPLE RISK FLAGS FOR AT-RISK STUDENTS
-- ===========================================
-- This creates realistic risk flags for testing dashboards
-- ===========================================

DO $$
DECLARE
    student_record RECORD;
    mentor_record RECORD;
    risk_count INTEGER := 0;
BEGIN
    RAISE NOTICE 'Creating risk flags for at-risk students...';
    
    -- Create risk flags for ~15% of students (randomly selected)
    FOR student_record IN 
        SELECT 
            sp.id as student_id,
            sp.roll_number,
            sp.mentor_id,
            sp.dept_code
        FROM student_profiles sp
        WHERE sp.is_active = true 
        AND sp.mentor_id IS NOT NULL
        AND RANDOM() < 0.15  -- 15% of students
        LIMIT 250
    LOOP
        -- Insert risk flag
        INSERT INTO student_risk_flags (
            student_id,
            risk_type,
            risk_level,
            description,
            identified_by,
            is_resolved
        ) VALUES (
            student_record.student_id,
            -- Random risk type
            CASE FLOOR(RANDOM() * 3)
                WHEN 0 THEN 'attendance'
                WHEN 1 THEN 'academic'
                ELSE 'behavioral'
            END,
            -- Random risk level
            CASE FLOOR(RANDOM() * 4)
                WHEN 0 THEN 'low'
                WHEN 1 THEN 'medium'
                WHEN 2 THEN 'high'
                ELSE 'critical'
            END,
            -- Description based on risk type
            CASE FLOOR(RANDOM() * 3)
                WHEN 0 THEN 'Attendance below 75% threshold - needs immediate attention'
                WHEN 1 THEN 'Poor performance in recent internal exams - requires academic support'
                ELSE 'Behavioral concerns reported by faculty - counseling recommended'
            END,
            student_record.mentor_id,
            -- 40% are already resolved
            RANDOM() < 0.4
        );
        
        risk_count := risk_count + 1;
    END LOOP;

    RAISE NOTICE '✅ Created % risk flags', risk_count;
    RAISE NOTICE '========================================';
    
    -- Show summary
    RAISE NOTICE 'RISK FLAGS SUMMARY:';
    RAISE NOTICE '   Total Flags: %', risk_count;
    RAISE NOTICE '   Unresolved: %', (SELECT COUNT(*) FROM student_risk_flags WHERE is_resolved = false);
    RAISE NOTICE '   Resolved: %', (SELECT COUNT(*) FROM student_risk_flags WHERE is_resolved = true);
    RAISE NOTICE '========================================';
END $$;

-- Show breakdown by risk type
SELECT 
    risk_type,
    risk_level,
    COUNT(*) as count,
    COUNT(*) FILTER (WHERE is_resolved = false) as unresolved
FROM student_risk_flags
GROUP BY risk_type, risk_level
ORDER BY risk_type, risk_level;

-- Show department-wise distribution
SELECT 
    sp.dept_code,
    COUNT(DISTINCT srf.id) as total_risk_flags,
    COUNT(DISTINCT srf.id) FILTER (WHERE srf.is_resolved = false) as unresolved_flags
FROM student_risk_flags srf
JOIN student_profiles sp ON srf.student_id = sp.id
GROUP BY sp.dept_code
ORDER BY sp.dept_code;
