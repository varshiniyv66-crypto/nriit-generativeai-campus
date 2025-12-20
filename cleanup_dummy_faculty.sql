-- =================================================================
-- CLEANUP SCRIPT: DELETE DUMMY FACULTY
-- =================================================================
-- This script removes all faculty members who are likely "dummy" data.
-- Criterion: Missing PAN number.
-- Exceptions: We explicitly KEEP the Dean and specific admin accounts.

DELETE FROM faculty_profiles
WHERE 
    -- Condition: No PAN number
    (pan_number IS NULL OR TRIM(pan_number) = '')
    
    -- Safety: Do NOT delete typical admin/dean emails even if they lack PAN
    AND email NOT ILIKE '%dean%'
    AND email NOT ILIKE '%admin%'
    AND email NOT ILIKE '%principal%';

-- Verify results
SELECT count(*) as remaining_faculty FROM faculty_profiles;
