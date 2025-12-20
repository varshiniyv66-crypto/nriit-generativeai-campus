
-- =========================================================
-- GOLD DIAMOND: Seed Attendance & Marks Data (ALL ENUMS FIXED)
-- =========================================================

-- =====================
-- PART 1: PERIOD ATTENDANCE (PRESENT ONLY)
-- =====================

INSERT INTO period_attendance (
    student_id, course_id, faculty_id, class_section_id,
    attendance_date, period_number, status, created_at
)
SELECT 
    sp.id as student_id,
    t.course_id,
    t.faculty_id,
    t.class_section_id,
    (CURRENT_DATE - (random() * 30)::int) as attendance_date,
    t.period_number,
    'present'::attendance_status as status,
    NOW() as created_at
FROM student_profiles sp
JOIN class_sections cs ON cs.dept_code::text = sp.dept_code::text 
    AND cs.section = COALESCE(sp.section, 'A')
JOIN timetable t ON t.class_section_id = cs.id
WHERE sp.is_active = true
LIMIT 10000;

-- =====================
-- PART 2: INTERNAL MARKS (mid_1 & mid_2)
-- =====================

INSERT INTO internal_marks (
    student_id, course_id, exam_type, semester_type,
    marks_obtained, max_marks, is_absent, academic_year, created_at
)
SELECT 
    sp.id as student_id,
    c.id as course_id,
    'mid_1'::exam_type as exam_type,
    (CASE WHEN sp.current_semester % 2 = 1 THEN 'odd' ELSE 'even' END)::semester_type as semester_type,
    (15 + random() * 10)::numeric(5,2) as marks_obtained,
    25 as max_marks,
    false as is_absent,
    '2025-2026' as academic_year,
    NOW() as created_at
FROM student_profiles sp
JOIN courses c ON c.dept_code::text = sp.dept_code::text
WHERE sp.is_active = true
LIMIT 5000;

INSERT INTO internal_marks (
    student_id, course_id, exam_type, semester_type,
    marks_obtained, max_marks, is_absent, academic_year, created_at
)
SELECT 
    sp.id as student_id,
    c.id as course_id,
    'mid_2'::exam_type as exam_type,
    (CASE WHEN sp.current_semester % 2 = 1 THEN 'odd' ELSE 'even' END)::semester_type as semester_type,
    (14 + random() * 11)::numeric(5,2) as marks_obtained,
    25 as max_marks,
    false as is_absent,
    '2025-2026' as academic_year,
    NOW() as created_at
FROM student_profiles sp
JOIN courses c ON c.dept_code::text = sp.dept_code::text
WHERE sp.is_active = true
LIMIT 5000;

-- =====================
-- PART 3: EXTERNAL MARKS
-- =====================

INSERT INTO external_marks (
    student_id, course_id, academic_year, semester_type,
    theory_marks, practical_marks, total_marks, max_marks,
    grade, grade_points, credits_earned, is_passed,
    attempt_number, result_date, created_at
)
SELECT 
    sp.id as student_id,
    c.id as course_id,
    '2025-2026' as academic_year,
    (CASE WHEN sp.current_semester % 2 = 1 THEN 'odd' ELSE 'even' END)::semester_type as semester_type,
    (45 + random() * 25)::numeric(5,2) as theory_marks,
    (20 + random() * 10)::numeric(5,2) as practical_marks,
    (65 + random() * 30)::numeric(5,2) as total_marks,
    100 as max_marks,
    CASE 
        WHEN random() > 0.9 THEN 'O'
        WHEN random() > 0.7 THEN 'A+'
        WHEN random() > 0.5 THEN 'A'
        WHEN random() > 0.3 THEN 'B+'
        WHEN random() > 0.1 THEN 'B'
        ELSE 'C'
    END as grade,
    CASE 
        WHEN random() > 0.9 THEN 10
        WHEN random() > 0.7 THEN 9
        WHEN random() > 0.5 THEN 8
        WHEN random() > 0.3 THEN 7
        WHEN random() > 0.1 THEN 6
        ELSE 5
    END as grade_points,
    c.credits as credits_earned,
    true as is_passed,
    1 as attempt_number,
    CURRENT_DATE - 30 as result_date,
    NOW() as created_at
FROM student_profiles sp
JOIN courses c ON c.dept_code::text = sp.dept_code::text
WHERE sp.is_active = true
LIMIT 5000;

-- =====================
-- VERIFICATION
-- =====================

SELECT 
    '🏆 GOLD DIAMOND DATA SEEDED' as status,
    (SELECT count(*) FROM period_attendance) as attendance_records,
    (SELECT count(*) FROM internal_marks) as internal_marks_records,
    (SELECT count(*) FROM external_marks) as external_marks_records;
