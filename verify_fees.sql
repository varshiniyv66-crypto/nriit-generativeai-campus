-- ============================================================
-- COMPLETE FEE DATA VERIFICATION
-- Run these queries to cross-check everything
-- ============================================================

-- 1. CHECK: All departments with their fee totals
SELECT 
    dept_code,
    COUNT(*) as fee_items,
    SUM(amount) as total_annual_fee
FROM fee_master
WHERE academic_year = '2025-2026' AND is_active = true
GROUP BY dept_code
ORDER BY dept_code;

-- EXPECTED:
-- CSE      | 2 | 70000
-- CSE-AI   | 2 | 70000
-- CSE-DS   | 2 | 70000
-- CIVIL    | 2 | 70000
-- ECE      | 2 | 70000
-- EVT      | 2 | 70000
-- IT       | 2 | 70000
-- MBA      | 2 | 90000  (higher fees)
-- MCA      | 2 | 80000  (higher fees)
-- BSH should NOT appear


-- 2. CHECK: Sample students and their fee status
SELECT 
    sp.roll_number,
    sp.first_name || ' ' || sp.last_name as student_name,
    sp.dept_code,
    COALESCE(SUM(fm.amount), 0) as total_fee,
    COALESCE(SUM(ft.total_amount), 0) as paid_amount,
    COALESCE(SUM(fm.amount), 0) - COALESCE(SUM(ft.total_amount), 0) as due_amount
FROM student_profiles sp
LEFT JOIN fee_master fm ON sp.dept_code = fm.dept_code 
    AND fm.academic_year = '2025-2026' 
    AND fm.is_active = true
LEFT JOIN fee_transactions ft ON sp.id = ft.student_id 
    AND ft.status = 'completed'
WHERE sp.is_active = true
GROUP BY sp.roll_number, sp.first_name, sp.last_name, sp.dept_code
ORDER BY sp.dept_code, sp.roll_number
LIMIT 20;


-- 3. CHECK: Students with payment records
SELECT 
    sp.roll_number,
    sp.dept_code,
    COUNT(ft.id) as payment_count,
    SUM(ft.total_amount) as total_paid
FROM student_profiles sp
LEFT JOIN fee_transactions ft ON sp.id = ft.student_id AND ft.status = 'completed'
WHERE sp.is_active = true
GROUP BY sp.roll_number, sp.dept_code
HAVING COUNT(ft.id) > 0
ORDER BY sp.dept_code
LIMIT 20;


-- 4. CHECK: BSH should NOT have fees
SELECT * FROM fee_master WHERE dept_code = 'BSH';
-- EXPECTED: 0 rows
