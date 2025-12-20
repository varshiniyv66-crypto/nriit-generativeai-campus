
-- =========================================================
-- GOLD DIAMOND SEEDER: Active Students for ALL Departments
-- =========================================================

-- This script will populate students for every active class section.
-- Target: ~60 students per section.

DO $$
DECLARE
    section_rec RECORD;
    i INTEGER;
    dept_id TEXT;
    roll_prefix TEXT;
    target_count INTEGER := 60; -- Students per section
BEGIN
    FOR section_rec IN SELECT * FROM class_sections LOOP
        
        -- Determine Numeric Dept Code for Roll Numbers (JNTU style logic)
        -- CSE=05, ECE=04, IT=12, CIVIL=01, MECH=03, CSM=42, CSD=44, AID=54 (Approximate)
        CASE section_rec.dept_code
            WHEN 'CSE' THEN dept_id := '05';
            WHEN 'ECE' THEN dept_id := '04';
            WHEN 'CIVIL' THEN dept_id := '01';
            WHEN 'IT' THEN dept_id := '12';
            WHEN 'CSE-DS' THEN dept_id := '44';
            WHEN 'CSE-AI' THEN dept_id := '42';
            WHEN 'MBA' THEN dept_id := 'E0';
            WHEN 'MCA' THEN dept_id := 'F0';
            ELSE dept_id := '99'; -- Fallback
        END CASE;

        -- Generate Students
        FOR i IN 1..target_count LOOP
            -- Format: 21BQ1A(Dept)(Seq)
            -- Sequence padded to 2 digits (e.g. 01, 02... 60)
            roll_prefix := '21BQ1A' || dept_id || LPAD(i::text, 2, '0');
            
            -- Insert Student
            INSERT INTO students (
                roll_number,
                first_name,
                last_name,
                email,
                dept_code,
                section_id,
                academic_year_id,
                current_year,
                current_semester,
                password_hash
            ) VALUES (
                roll_prefix,
                'Student',
                'Number ' || i,
                LOWER(roll_prefix) || '@nriit.ac.in',
                section_rec.dept_code,
                section_rec.id,
                section_rec.academic_year_id,
                section_rec.year,
                section_rec.semester,
                'demo123'
            )
            ON CONFLICT (roll_number) DO NOTHING; -- Skip if exists
        END LOOP;
        
    END LOOP;
END $$;

-- Verify the new counts
SELECT dept_code, count(*) as active_students FROM students GROUP BY dept_code;
