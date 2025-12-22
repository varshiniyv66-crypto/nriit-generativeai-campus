
-- Fix CSE-AI HOD (Dr. K. Venkata Ramana)
DO $$
DECLARE
    ramana_id UUID;
BEGIN
    -- Try to find Dr. K. Venkata Ramana
    SELECT id INTO ramana_id FROM faculty WHERE name ILIKE '%Venkata Ramana%' OR name ILIKE '%K. Venkata Ramana%';
    
    IF ramana_id IS NOT NULL THEN
        UPDATE faculty 
        SET designation = 'Associate Professor & HOD', 
            department = 'CSE-AI',
            name = 'Dr. K. Venkata Ramana'
        WHERE id = ramana_id;
        RAISE NOTICE 'Updated Dr. K. Venkata Ramana to HOD of CSE-AI';
    ELSE
        -- Insert if not exists
        INSERT INTO faculty (name, designation, department, qualification, status, date_of_joining)
        VALUES ('Dr. K. Venkata Ramana', 'Associate Professor & HOD', 'CSE-AI', 'Ph.D', 'Regular', '2023-06-01');
        RAISE NOTICE 'Inserted Dr. K. Venkata Ramana as HOD of CSE-AI';
    END IF;

    -- Cleanup any other potential HODs in CSE-AI to avoid duplicates if necessary
    -- (Optional, but good practice to ensure only one HOD per dept if we want strictness)
END $$;
