
-- =========================================================
-- GOLD DIAMOND: Intelligent Mentor Allocations (FK FIXED)
-- =========================================================

-- 1. Clear existing dummy mentor allocations
TRUNCATE mentor_allocations CASCADE;

-- 2. Intelligently assign Faculty as Mentors to Students (Same Department)
-- Using student_profiles as the source (matches FK constraint)
INSERT INTO mentor_allocations (student_id, mentor_id, academic_year, is_active, allocated_at, created_at)
SELECT 
    s.id as student_id,
    f.id as mentor_id,
    '2025-2026' as academic_year,
    true as is_active,
    NOW() as allocated_at,
    NOW() as created_at
FROM (
    SELECT 
        sp.id,
        sp.dept_code::text as dept_code,
        ROW_NUMBER() OVER (PARTITION BY sp.dept_code ORDER BY sp.roll_number) as student_rank
    FROM student_profiles sp
    WHERE sp.is_active = true
) s
JOIN (
    SELECT 
        fp.id,
        fp.dept_code::text as dept_code,
        ROW_NUMBER() OVER (PARTITION BY fp.dept_code ORDER BY fp.id) as faculty_rank,
        COUNT(*) OVER (PARTITION BY fp.dept_code) as faculty_count
    FROM faculty_profiles fp
) f ON s.dept_code = f.dept_code 
    AND f.faculty_rank = ((s.student_rank - 1) % f.faculty_count) + 1;

-- 3. Verification Report
SELECT 
    '🏆 MENTOR ALLOCATION COMPLETE' as status,
    (SELECT count(*) FROM mentor_allocations) as total_allocations,
    (SELECT count(DISTINCT mentor_id) FROM mentor_allocations) as active_mentors,
    (SELECT count(DISTINCT student_id) FROM mentor_allocations) as students_with_mentors;
