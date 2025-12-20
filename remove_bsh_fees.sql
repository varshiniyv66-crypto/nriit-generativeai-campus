-- ============================================================
-- REMOVE BSH FROM FEE_MASTER
-- BSH handles first-year students but fees go to their branch
-- ============================================================

DELETE FROM fee_master 
WHERE dept_code = 'BSH';

-- Expected: 2 rows deleted (Semester 1 and Semester 2)


-- ============================================================
-- VERIFY: BSH is removed
-- ============================================================
-- SELECT DISTINCT dept_code FROM fee_master ORDER BY dept_code;
-- Expected: CSE, CSE-AI, CSE-DS, CIVIL, ECE, EVT, IT, MBA, MCA (no BSH)
