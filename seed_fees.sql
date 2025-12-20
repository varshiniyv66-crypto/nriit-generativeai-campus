
-- =========================================================
-- GOLD DIAMOND: Seed Fee Structure & Student Payments (ENUM FIXED)
-- =========================================================

-- =====================
-- PART 1: FEE MASTER (Fee Structure for all departments)
-- =====================

-- Tuition Fee (B.Tech = 35000, M.Tech/MBA/MCA = 25000)
INSERT INTO fee_master (
    dept_code, category, fee_name, amount, due_date,
    late_fee_per_day, max_late_fee, is_mandatory, is_active, academic_year, created_at
)
SELECT 
    d.code as dept_code,
    'tuition'::fee_category as category,
    'Tuition Fee - Semester ' || sem.s as fee_name,
    CASE 
        WHEN d.code IN ('MBA', 'MCA') THEN 25000
        ELSE 35000
    END as amount,
    CURRENT_DATE + INTERVAL '30 days' as due_date,
    100 as late_fee_per_day,
    5000 as max_late_fee,
    true as is_mandatory,
    true as is_active,
    '2025-2026' as academic_year,
    NOW() as created_at
FROM departments d
CROSS JOIN (SELECT generate_series(1, 2) as s) sem;

-- Exam Fee (₹1000) - using 'regular_exam'
INSERT INTO fee_master (
    dept_code, category, fee_name, amount, due_date,
    late_fee_per_day, max_late_fee, is_mandatory, is_active, academic_year, created_at
)
SELECT 
    d.code as dept_code,
    'regular_exam'::fee_category as category,
    'Examination Fee' as fee_name,
    1000 as amount,
    CURRENT_DATE + INTERVAL '45 days' as due_date,
    50 as late_fee_per_day,
    500 as max_late_fee,
    true as is_mandatory,
    true as is_active,
    '2025-2026' as academic_year,
    NOW() as created_at
FROM departments d;

-- Library Fee (₹300)
INSERT INTO fee_master (
    dept_code, category, fee_name, amount, due_date,
    late_fee_per_day, max_late_fee, is_mandatory, is_active, academic_year, created_at
)
SELECT 
    d.code as dept_code,
    'library'::fee_category as category,
    'Library & Digital Resources' as fee_name,
    300 as amount,
    CURRENT_DATE + INTERVAL '30 days' as due_date,
    10 as late_fee_per_day,
    100 as max_late_fee,
    false as is_mandatory,
    true as is_active,
    '2025-2026' as academic_year,
    NOW() as created_at
FROM departments d;

-- =====================
-- PART 2: FEE TRANSACTIONS (Student Payments - 70% paid)
-- =====================

INSERT INTO fee_transactions (
    student_id, fee_master_id, academic_year, amount, late_fee, total_amount,
    payment_method, status, payment_date, remarks, created_at
)
SELECT 
    sp.id as student_id,
    fm.id as fee_master_id,
    '2025-2026' as academic_year,
    fm.amount,
    0 as late_fee,
    fm.amount as total_amount,
    CASE WHEN random() > 0.5 THEN 'online' ELSE 'cash' END as payment_method,
    'completed' as status,
    CURRENT_DATE - (random() * 60)::int as payment_date,
    'Fee paid on time' as remarks,
    NOW() as created_at
FROM student_profiles sp
JOIN fee_master fm ON fm.dept_code::text = sp.dept_code::text AND fm.category = 'tuition'
WHERE sp.is_active = true AND random() > 0.3
LIMIT 3500;

-- =====================
-- VERIFICATION
-- =====================

SELECT 
    '🏆 FEE DATA SEEDED' as status,
    (SELECT count(*) FROM fee_master) as fee_structures,
    (SELECT count(*) FROM fee_transactions) as payments_recorded,
    (SELECT SUM(total_amount) FROM fee_transactions WHERE status = 'completed') as total_collected;
