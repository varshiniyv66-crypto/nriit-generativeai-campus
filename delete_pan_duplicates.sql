-- ============================================================
-- DELETE PAN DUPLICATES ONLY (5 RECORDS)
-- ============================================================

-- STEP 1: PREVIEW - Verify these are correct
SELECT 
    employee_id,
    first_name || ' ' || last_name as full_name,
    designation,
    pan_number,
    date_of_joining::date as join_date,
    '❌ WILL BE DEACTIVATED' as action
FROM faculty_profiles
WHERE employee_id IN ('cse-23', 'FACCSE042', 'it-13', 'FACCSE044', 'FACCSE036')
  AND is_active = true
ORDER BY employee_id;

-- Expected: 5 rows


-- ============================================================
-- STEP 2: EXECUTE - Soft delete (uncomment to run)
-- ============================================================

/*
UPDATE faculty_profiles
SET 
    is_active = false,
    updated_at = NOW()
WHERE employee_id IN (
    'cse-23',       -- I NAGESWARA RAO (PAN: AAJPE3195R - duplicate with cse-36)
    'FACCSE042',    -- K. Rama Koteswara Rao (PAN: APYPD0479D - duplicate with cse-22)
    'it-13',        -- PRAVEEN ADDANKI (PAN: CNKPA0778G - duplicate with cse-30)
    'FACCSE044',    -- M. Alekhya (PAN: BTLPM1693N - duplicate with cse-34)
    'FACCSE036'     -- M. Uma Devi (PAN: CSTPM2022D - duplicate with cse-28)
)
AND is_active = true;
*/

-- Expected: 5 rows affected


-- ============================================================
-- STEP 3: VERIFY - Check no more PAN duplicates
-- ============================================================

/*
SELECT pan_number, COUNT(*) as count
FROM faculty_profiles
WHERE is_active = true 
  AND pan_number IS NOT NULL 
  AND pan_number != ''
GROUP BY pan_number
HAVING COUNT(*) > 1;

-- Expected: 0 rows (no PAN duplicates remain)
*/
