-- ============================================================
-- SOFT DELETE DUPLICATE FACULTY RECORDS
-- This sets is_active = false (doesn't permanently delete)
-- ============================================================

-- STEP 1: PREVIEW - See what will be deactivated (RUN THIS FIRST!)
-- ============================================================
SELECT 
    employee_id,
    first_name || ' ' || last_name as full_name,
    designation,
    pan_number,
    date_of_joining::date as join_date,
    'Will be DEACTIVATED' as action
FROM faculty_profiles
WHERE employee_id IN (
    -- PAN Duplicate
    'cse-23',           -- I NAGESWARA RAO (duplicate PAN with K NAGESWARA RAO)
    
    -- ECE Duplicates (FAC format - keeping cse-xx/ece-xx format)
    'FACECE002',        -- Chekuri Venugopala Chowdary
    'FACECE005',        -- Sujata Kandukuri
    'FACECE006',        -- Manasa Manukonda
    'FACECE013',        -- Yarru Sreeja
    'FACECE015',        -- Kanvitha Penumutchu
    'FACECE025',        -- Manohar Patra
    'FACECE026',        -- Amala Payala
    'FACECE031',        -- Saidaiah Bandi
    'FACECE043',        -- Anjaneyulu Ummaneni
    'FACECE049',        -- Rambabu Chemakurthi
    
    -- CSE Duplicates (FAC format - keeping cse-xx format)
    'FACCSE032',        -- M. Arunkumar
    'FACCSE033',        -- P. Aravind
    'FACCSE035',        -- B. Sujatha
    'FACCSE036',        -- M. Uma Devi
    'FACCSE039',        -- G. Ashok Babu
    'FACCSE042',        -- K. Rama Koteswara Rao
    'FACCSE044',        -- M. Alekhya
    'FACCSE046',        -- G. Mahesh
    'FACCSE047'         -- G. Kalyani
)
AND is_active = true
ORDER BY employee_id;

-- Expected: 20 records


-- ============================================================
-- STEP 2: EXECUTE - Run this ONLY after verifying Step 1
-- ============================================================
/*
UPDATE faculty_profiles
SET 
    is_active = false,
    updated_at = NOW()
WHERE employee_id IN (
    -- PAN Duplicate
    'cse-23',
    
    -- ECE Duplicates
    'FACECE002', 'FACECE005', 'FACECE006', 'FACECE013', 'FACECE015',
    'FACECE025', 'FACECE026', 'FACECE031', 'FACECE043', 'FACECE049',
    
    -- CSE Duplicates
    'FACCSE032', 'FACCSE033', 'FACCSE035', 'FACCSE036', 'FACCSE039',
    'FACCSE042', 'FACCSE044', 'FACCSE046', 'FACCSE047'
)
AND is_active = true;
*/

-- After running, you should see: "20 rows affected"


-- ============================================================
-- STEP 3: VERIFY - Check no more duplicates
-- ============================================================
/*
-- Check for remaining PAN duplicates
SELECT pan_number, COUNT(*) as count
FROM faculty_profiles
WHERE is_active = true AND pan_number IS NOT NULL
GROUP BY pan_number
HAVING COUNT(*) > 1;
-- Expected: 0 rows

-- Check for remaining name duplicates
SELECT 
    UPPER(REGEXP_REPLACE(TRIM(first_name || ' ' || last_name), '\.', '', 'g')) as name,
    COUNT(*) as count
FROM faculty_profiles
WHERE is_active = true
GROUP BY 1
HAVING COUNT(*) > 1;
-- Expected: Only Y V RAGHAVA RAO (intentional dual role)
*/
