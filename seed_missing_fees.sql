-- ============================================================
-- FEE STRUCTURE FOR ALL DEPARTMENTS (EXCLUDING BSH)
-- BSH handles first-year students - fees go to their own branch
-- 
-- NOTE: CSE, CSE-DS, CSE-AI, IT, ECE already have fee data
-- This SQL adds: CIVIL, MBA, MCA, EVT (if not already added)
-- ============================================================

-- ONLY RUN IF THESE DEPARTMENTS DON'T HAVE FEE DATA YET
-- Check first: SELECT DISTINCT dept_code FROM fee_master ORDER BY dept_code;

INSERT INTO fee_master (
    academic_year, dept_code, category, fee_name, amount, 
    due_date, late_fee_per_day, max_late_fee, is_mandatory, is_active
) VALUES 
-- CIVIL
('2025-2026', 'CIVIL', 'tuition', 'Tuition Fee - Semester 1', 35000.00, '2026-01-13', 100.00, 5000.00, true, true),
('2025-2026', 'CIVIL', 'tuition', 'Tuition Fee - Semester 2', 35000.00, '2026-06-13', 100.00, 5000.00, true, true),

-- MBA
('2025-2026', 'MBA', 'tuition', 'Tuition Fee - Semester 1', 45000.00, '2026-01-13', 100.00, 5000.00, true, true),
('2025-2026', 'MBA', 'tuition', 'Tuition Fee - Semester 2', 45000.00, '2026-06-13', 100.00, 5000.00, true, true),

-- MCA
('2025-2026', 'MCA', 'tuition', 'Tuition Fee - Semester 1', 40000.00, '2026-01-13', 100.00, 5000.00, true, true),
('2025-2026', 'MCA', 'tuition', 'Tuition Fee - Semester 2', 40000.00, '2026-06-13', 100.00, 5000.00, true, true),

-- EVT (Environmental)
('2025-2026', 'EVT', 'tuition', 'Tuition Fee - Semester 1', 35000.00, '2026-01-13', 100.00, 5000.00, true, true),
('2025-2026', 'EVT', 'tuition', 'Tuition Fee - Semester 2', 35000.00, '2026-06-13', 100.00, 5000.00, true, true);

-- NOTE: BSH is NOT included - first-year students pay to their own branch
-- Expected: 8 rows inserted
