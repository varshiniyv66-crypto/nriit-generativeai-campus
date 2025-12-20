-- =========================================================
-- COMPLETE DATA SEEDING FOR STUDENT PORTAL
-- Run this in Supabase SQL Editor to populate:
-- 1. Attendance Data (period_attendance)
-- 2. Internal Marks (mid_1, mid_2)
-- 3. Fee Structure (fee_master)
-- 4. Fee Transactions (fee_transactions)
-- =========================================================

-- =====================
-- CLEANUP: Clear old data (optional - uncomment if needed)
-- =====================
-- TRUNCATE period_attendance, internal_marks, fee_transactions, external_marks RESTART IDENTITY CASCADE;

-- =====================
-- STEP 1: DROP AND RECREATE ATTENDANCE SUMMARY VIEW
-- =====================
DROP VIEW IF EXISTS v_student_attendance_summary CASCADE;

CREATE VIEW v_student_attendance_summary AS
SELECT 
    pa.student_id,
    c.course_code,
    c.course_name,
    COUNT(*) as total_classes,
    COUNT(CASE WHEN pa.status IN ('present', 'late', 'on_duty', 'medical_leave') THEN 1 END) as present_count,
    COUNT(CASE WHEN pa.status = 'absent' THEN 1 END) as absent_count,
    ROUND(
        COUNT(CASE WHEN pa.status IN ('present', 'late', 'on_duty', 'medical_leave') THEN 1 END)::numeric / 
        NULLIF(COUNT(*)::numeric, 0) * 100, 2
    ) as attendance_percentage
FROM period_attendance pa
JOIN courses c ON c.id = pa.course_id
GROUP BY pa.student_id, c.course_code, c.course_name;

-- =====================
-- STEP 2: SEED PERIOD ATTENDANCE (For all active students)
-- Creates 20 recent attendance records per student
-- =====================

DO $$
DECLARE
    rec RECORD;
    course_rec RECORD;
    day_offset INTEGER;
    period_num INTEGER;
    att_status TEXT;
    rand_val NUMERIC;
BEGIN
    -- Loop through all active students
    FOR rec IN (
        SELECT sp.id as student_id, sp.dept_code, sp.current_semester, sp.section
        FROM student_profiles sp
        WHERE sp.is_active = true
        LIMIT 500  -- Limit for performance
    ) LOOP
        -- Get random courses for this student's department
        FOR course_rec IN (
            SELECT c.id as course_id, fp.id as faculty_id, cs.id as class_section_id
            FROM courses c
            JOIN faculty_profiles fp ON fp.dept_code = c.dept_code
            LEFT JOIN class_sections cs ON cs.dept_code = c.dept_code
            WHERE c.dept_code = rec.dept_code AND c.is_active = true
            LIMIT 6  -- 6 courses per student
        ) LOOP
            -- Create attendance for past 15 days
            FOR day_offset IN 1..15 LOOP
                -- Create 4 periods per day
                FOR period_num IN 1..4 LOOP
                    rand_val := random();
                    -- 85% present, 10% absent, 5% late
                    att_status := CASE 
                        WHEN rand_val > 0.15 THEN 'present'
                        WHEN rand_val > 0.05 THEN 'absent'
                        ELSE 'late'
                    END;
                    
                    BEGIN
                        INSERT INTO period_attendance (
                            student_id, course_id, faculty_id, class_section_id,
                            attendance_date, period_number, status, created_at
                        ) VALUES (
                            rec.student_id,
                            course_rec.course_id,
                            course_rec.faculty_id,
                            course_rec.class_section_id,
                            (CURRENT_DATE - day_offset),
                            period_num,
                            att_status::attendance_status,
                            NOW()
                        )
                        ON CONFLICT DO NOTHING;
                    EXCEPTION WHEN OTHERS THEN
                        -- Skip duplicates
                        NULL;
                    END;
                END LOOP;
            END LOOP;
        END LOOP;
    END LOOP;
    
    RAISE NOTICE 'Attendance seeding complete';
END $$;

-- =====================
-- STEP 3: SEED INTERNAL MARKS (Mid-1 & Mid-2)
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
    (12 + random() * 8)::numeric(5,2) as marks_obtained,
    20 as max_marks,
    false as is_absent,
    '2024-25' as academic_year,
    NOW() as created_at
FROM student_profiles sp
CROSS JOIN LATERAL (
    SELECT id FROM courses c 
    WHERE c.dept_code = sp.dept_code AND c.is_active = true 
    ORDER BY random() 
    LIMIT 6
) c
WHERE sp.is_active = true
ON CONFLICT (student_id, course_id, exam_type, academic_year, semester_type) 
DO UPDATE SET marks_obtained = EXCLUDED.marks_obtained;

INSERT INTO internal_marks (
    student_id, course_id, exam_type, semester_type,
    marks_obtained, max_marks, is_absent, academic_year, created_at
)
SELECT 
    sp.id as student_id,
    c.id as course_id,
    'mid_2'::exam_type as exam_type,
    (CASE WHEN sp.current_semester % 2 = 1 THEN 'odd' ELSE 'even' END)::semester_type as semester_type,
    (13 + random() * 7)::numeric(5,2) as marks_obtained,
    20 as max_marks,
    false as is_absent,
    '2024-25' as academic_year,
    NOW() as created_at
FROM student_profiles sp
CROSS JOIN LATERAL (
    SELECT id FROM courses c 
    WHERE c.dept_code = sp.dept_code AND c.is_active = true 
    ORDER BY random() 
    LIMIT 6
) c
WHERE sp.is_active = true
ON CONFLICT (student_id, course_id, exam_type, academic_year, semester_type) 
DO UPDATE SET marks_obtained = EXCLUDED.marks_obtained;

-- =====================
-- STEP 4: SEED FEE MASTER (Fee Structure - Updated Academic Year)
-- =====================

-- Clear and re-insert fee_master with correct academic year
DELETE FROM fee_master WHERE academic_year = '2024-25';

INSERT INTO fee_master (
    dept_code, category, fee_name, amount, due_date,
    late_fee_per_day, max_late_fee, is_mandatory, is_active, academic_year, created_at
)
SELECT 
    d.code as dept_code,
    'tuition'::fee_category as category,
    'Tuition Fee - Semester I' as fee_name,
    CASE 
        WHEN d.code IN ('MBA', 'MCA') THEN 25000
        ELSE 35000
    END as amount,
    '2025-01-15'::date as due_date,
    100 as late_fee_per_day,
    5000 as max_late_fee,
    true as is_mandatory,
    true as is_active,
    '2024-25' as academic_year,
    NOW() as created_at
FROM departments d
ON CONFLICT DO NOTHING;

INSERT INTO fee_master (
    dept_code, category, fee_name, amount, due_date,
    late_fee_per_day, max_late_fee, is_mandatory, is_active, academic_year, created_at
)
SELECT 
    d.code as dept_code,
    'tuition'::fee_category as category,
    'Tuition Fee - Semester II' as fee_name,
    CASE 
        WHEN d.code IN ('MBA', 'MCA') THEN 25000
        ELSE 35000
    END as amount,
    '2025-06-15'::date as due_date,
    100 as late_fee_per_day,
    5000 as max_late_fee,
    true as is_mandatory,
    true as is_active,
    '2024-25' as academic_year,
    NOW() as created_at
FROM departments d
ON CONFLICT DO NOTHING;

-- Exam Fee
INSERT INTO fee_master (
    dept_code, category, fee_name, amount, due_date,
    late_fee_per_day, max_late_fee, is_mandatory, is_active, academic_year, created_at
)
SELECT 
    d.code as dept_code,
    'regular_exam'::fee_category as category,
    'Examination Fee' as fee_name,
    1000 as amount,
    '2025-01-20'::date as due_date,
    50 as late_fee_per_day,
    500 as max_late_fee,
    true as is_mandatory,
    true as is_active,
    '2024-25' as academic_year,
    NOW() as created_at
FROM departments d
ON CONFLICT DO NOTHING;

-- Library Fee
INSERT INTO fee_master (
    dept_code, category, fee_name, amount, due_date,
    late_fee_per_day, max_late_fee, is_mandatory, is_active, academic_year, created_at
)
SELECT 
    d.code as dept_code,
    'library'::fee_category as category,
    'Library & Digital Resources' as fee_name,
    500 as amount,
    '2025-01-15'::date as due_date,
    10 as late_fee_per_day,
    100 as max_late_fee,
    false as is_mandatory,
    true as is_active,
    '2024-25' as academic_year,
    NOW() as created_at
FROM departments d
ON CONFLICT DO NOTHING;

-- =====================
-- STEP 5: SEED FEE TRANSACTIONS (Student Payments - ~60% paid)
-- =====================

INSERT INTO fee_transactions (
    student_id, fee_master_id, academic_year, amount, late_fee, total_amount,
    payment_method, status, payment_date, remarks, created_at
)
SELECT 
    sp.id as student_id,
    fm.id as fee_master_id,
    '2024-25' as academic_year,
    fm.amount,
    0 as late_fee,
    fm.amount as total_amount,
    CASE WHEN random() > 0.5 THEN 'online' ELSE 'cash' END as payment_method,
    'completed' as status,
    CURRENT_DATE - (random() * 60)::int as payment_date,
    'Fee paid successfully' as remarks,
    NOW() as created_at
FROM student_profiles sp
JOIN fee_master fm ON fm.dept_code = sp.dept_code AND fm.academic_year = '2024-25'
WHERE sp.is_active = true 
  AND random() > 0.4  -- ~60% students paid
  AND NOT EXISTS (
    SELECT 1 FROM fee_transactions ft 
    WHERE ft.student_id = sp.id AND ft.fee_master_id = fm.id
  )
LIMIT 4000;

-- =====================
-- VERIFICATION SUMMARY
-- =====================

SELECT 
    '✅ DATA SEEDING COMPLETE' as status,
    (SELECT count(*) FROM period_attendance) as attendance_records,
    (SELECT count(*) FROM internal_marks) as marks_records,
    (SELECT count(*) FROM fee_master WHERE academic_year = '2024-25') as fee_structures,
    (SELECT count(*) FROM fee_transactions WHERE academic_year = '2024-25') as fee_payments,
    (SELECT COALESCE(SUM(total_amount), 0) FROM fee_transactions WHERE status = 'completed') as total_collected;
