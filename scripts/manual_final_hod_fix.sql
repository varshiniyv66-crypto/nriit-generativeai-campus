
-- =========================================================================================
-- MASTER HOD FIX SCRIPT
-- =========================================================================================
-- Execute this script in your Supabase SQL Editor to fix all Head of Department assignments.
-- Logic:
-- 1. CSE: Enforce Dr. K. Nageswara Rao as HOD.
-- 2. CSE-DS: Enforce Dr. B. Bhavani as HOD.
-- 3. CSE-AI: Enforce Dr. K. Venkata Ramana as HOD ("First Top PhD").
-- 4. General Cleanup: Ensure old HODs are demoted if they are replaced.
-- =========================================================================================

BEGIN;

-- -----------------------------------------------------------------------------------------
-- 1. FIX CSE: Dr. K. Nageswara Rao
-- -----------------------------------------------------------------------------------------
-- Demote current incorrect HODs in CSE (e.g. Suneetha)
UPDATE faculty 
SET designation = 'Professor' 
WHERE department = 'CSE' 
  AND designation ILIKE '%HOD%' 
  AND name NOT ILIKE '%Nageswara Rao%';

-- Promote Dr. K. Nageswara Rao
UPDATE faculty 
SET designation = 'Professor & HOD' 
WHERE name ILIKE '%Nageswara Rao%';


-- -----------------------------------------------------------------------------------------
-- 2. FIX CSE-DS: Dr. B. Bhavani
-- -----------------------------------------------------------------------------------------
-- Ensure she exists or update her
DO $$
DECLARE
    bhavani_id UUID;
BEGIN
    SELECT id INTO bhavani_id FROM faculty WHERE name ILIKE '%Bhavani%';
    
    IF bhavani_id IS NOT NULL THEN
        UPDATE faculty 
        SET designation = 'Associate Professor & HOD', 
            department = 'CSE-DS',
            name = 'Dr. B. Bhavani'
        WHERE id = bhavani_id;
    ELSE
        INSERT INTO faculty (name, designation, department, qualification, status, date_of_joining)
        VALUES ('Dr. B. Bhavani', 'Associate Professor & HOD', 'CSE-DS', 'Ph.D', 'Regular', '2015-06-01');
    END IF;
END $$;


-- -----------------------------------------------------------------------------------------
-- 3. FIX CSE-AI: Dr. K. Venkata Ramana ("First Top PhD")
-- -----------------------------------------------------------------------------------------
DO $$
DECLARE
    ramana_id UUID;
BEGIN
    SELECT id INTO ramana_id FROM faculty WHERE name ILIKE '%Venkata Ramana%';
    
    IF ramana_id IS NOT NULL THEN
        UPDATE faculty 
        SET designation = 'Associate Professor & HOD', 
            department = 'CSE-AI',
            name = 'Dr. K. Venkata Ramana'
        WHERE id = ramana_id;
    ELSE
        INSERT INTO faculty (name, designation, department, qualification, status, date_of_joining)
        VALUES ('Dr. K. Venkata Ramana', 'Associate Professor & HOD', 'CSE-AI', 'Ph.D', 'Regular', '2023-06-01');
    END IF;
END $$;


-- -----------------------------------------------------------------------------------------
-- 4. GENERIC "TOP PHD" PROMOTION QUERY (Safe to run optionally)
-- -----------------------------------------------------------------------------------------
-- This query identifies the top Ph.D. in departments that HAVE NO HOD.
-- It does NOT auto-update, but listing it here for your reference.
/*
SELECT department, name, designation, qualification, date_of_joining 
FROM (
    SELECT *, 
           ROW_NUMBER() OVER (PARTITION BY department ORDER BY 
               CASE 
                   WHEN designation ILIKE '%Professor%' AND designation NOT ILIKE '%Assistant%' THEN 1 
                   WHEN designation ILIKE '%Associate%' THEN 2 
                   ELSE 3 
               END ASC, 
               date_of_joining ASC
           ) as rank
    FROM faculty 
    WHERE (qualification ILIKE '%Ph.D%' OR name ILIKE 'Dr.%')
) Ranked
WHERE rank = 1
AND department NOT IN (SELECT department FROM faculty WHERE designation ILIKE '%HOD%');
*/

COMMIT;

-- Verify Results
SELECT department, name, designation FROM faculty WHERE designation ILIKE '%HOD%' ORDER BY department;
