-- ============================================================
-- COMPLETE FEE CLEANUP (Including transactions)
-- Must delete transactions first due to foreign key
-- ============================================================

-- STEP 1: DELETE fee_transactions first (has foreign key to fee_master)
DELETE FROM fee_transactions WHERE academic_year = '2025-2026';

-- STEP 2: Now delete fee_master
DELETE FROM fee_master WHERE academic_year = '2025-2026';

-- STEP 3: INSERT correct fee data
INSERT INTO fee_master (
    academic_year, dept_code, category, fee_name, amount, 
    due_date, late_fee_per_day, max_late_fee, is_mandatory, is_active
) VALUES 
-- ============ B.TECH PROGRAMMES (₹43,000/year = ₹21,500/semester) ============
('2025-2026', 'CSE', 'tuition', 'Tuition Fee - Semester 1', 21500.00, '2026-01-15', 100.00, 5000.00, true, true),
('2025-2026', 'CSE', 'tuition', 'Tuition Fee - Semester 2', 21500.00, '2026-06-15', 100.00, 5000.00, true, true),
('2025-2026', 'CSE-DS', 'tuition', 'Tuition Fee - Semester 1', 21500.00, '2026-01-15', 100.00, 5000.00, true, true),
('2025-2026', 'CSE-DS', 'tuition', 'Tuition Fee - Semester 2', 21500.00, '2026-06-15', 100.00, 5000.00, true, true),
('2025-2026', 'CSE-AI', 'tuition', 'Tuition Fee - Semester 1', 21500.00, '2026-01-15', 100.00, 5000.00, true, true),
('2025-2026', 'CSE-AI', 'tuition', 'Tuition Fee - Semester 2', 21500.00, '2026-06-15', 100.00, 5000.00, true, true),
('2025-2026', 'IT', 'tuition', 'Tuition Fee - Semester 1', 21500.00, '2026-01-15', 100.00, 5000.00, true, true),
('2025-2026', 'IT', 'tuition', 'Tuition Fee - Semester 2', 21500.00, '2026-06-15', 100.00, 5000.00, true, true),
('2025-2026', 'ECE', 'tuition', 'Tuition Fee - Semester 1', 21500.00, '2026-01-15', 100.00, 5000.00, true, true),
('2025-2026', 'ECE', 'tuition', 'Tuition Fee - Semester 2', 21500.00, '2026-06-15', 100.00, 5000.00, true, true),
('2025-2026', 'CIVIL', 'tuition', 'Tuition Fee - Semester 1', 21500.00, '2026-01-15', 100.00, 5000.00, true, true),
('2025-2026', 'CIVIL', 'tuition', 'Tuition Fee - Semester 2', 21500.00, '2026-06-15', 100.00, 5000.00, true, true),
('2025-2026', 'EVT', 'tuition', 'Tuition Fee - Semester 1', 21500.00, '2026-01-15', 100.00, 5000.00, true, true),
('2025-2026', 'EVT', 'tuition', 'Tuition Fee - Semester 2', 21500.00, '2026-06-15', 100.00, 5000.00, true, true),
-- ============ MBA PROGRAMME (₹28,400/year = ₹14,200/semester) ============
('2025-2026', 'MBA', 'tuition', 'Tuition Fee - Semester 1', 14200.00, '2026-01-15', 100.00, 5000.00, true, true),
('2025-2026', 'MBA', 'tuition', 'Tuition Fee - Semester 2', 14200.00, '2026-06-15', 100.00, 5000.00, true, true),
-- ============ MCA PROGRAMME (₹35,000/semester) ============
('2025-2026', 'MCA', 'tuition', 'Tuition Fee - Semester 1', 35000.00, '2026-01-15', 100.00, 5000.00, true, true),
('2025-2026', 'MCA', 'tuition', 'Tuition Fee - Semester 2', 35000.00, '2026-06-15', 100.00, 5000.00, true, true);


-- STEP 4: VERIFY
SELECT 
    dept_code,
    COUNT(*) as semesters,
    SUM(amount) as annual_fee
FROM fee_master 
WHERE academic_year = '2025-2026' AND is_active = true
GROUP BY dept_code
ORDER BY dept_code;
