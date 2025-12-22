
-- Fix HODs for CSE and CSE-DS
-- Using direct SQL to ensure bypassing potential REST API cache issues

-- 1. Fix CSE HOD (Verify Nageswara Rao)
UPDATE faculty 
SET designation = 'Professor & HOD' 
WHERE name ILIKE '%Nageswara Rao%';

-- Ensure Suneetha is NOT HOD
UPDATE faculty 
SET designation = 'Professor' 
WHERE name ILIKE '%Suneetha%' AND designation ILIKE '%HOD%';

-- 2. Fix CSE-DS HOD (Dr. B. Bhavani)
-- First check if exists, if so update
DO $$
DECLARE
    bhavani_id UUID;
    cseds_id UUID;
BEGIN
    -- Get or Create CSE-DS Department ID if needed (though usually we use code in queries?)
    -- Assuming we just need the text field 'department' to be 'CSE-DS' for the UI to pick it up?
    -- The UI seems to filter by dept code.
    
    -- Try to find Dr. B. Bhavani
    SELECT id INTO bhavani_id FROM faculty WHERE name ILIKE '%Bhavani%';
    
    IF bhavani_id IS NOT NULL THEN
        UPDATE faculty 
        SET designation = 'Associate Professor & HOD', 
            department = 'CSE-DS',
            name = 'Dr. B. Bhavani'
        WHERE id = bhavani_id;
    ELSE
        -- Insert if not exists
        INSERT INTO faculty (name, designation, department, qualification, status, date_of_joining)
        VALUES ('Dr. B. Bhavani', 'Associate Professor & HOD', 'CSE-DS', 'Ph.D', 'Regular', '2015-06-01');
    END IF;
END $$;
