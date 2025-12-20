
-- =========================================================
-- DIAGNOSTIC & SEEDING SCRIPT
-- =========================================================

-- 1. Check if 'students' table exists and count rows
SELECT 'checking_students_table' as check_type, count(*) as count FROM students;

-- 2. Check if we have active sections to attach students to
SELECT 'checking_sections' as check_type, name, id FROM class_sections WHERE name IN ('CSE-2-A', 'ECE-2-A');

-- 3. SEED Students (Safe Insert)
-- This will insert verified students linked to the active 'CSE-2-A' and 'ECE-2-A' sections.

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
    password_hash -- Optional if using Supabase Auth, but good for local checks
)
SELECT 
    '21BQ1A0501', 
    'Arjun', 
    'Reddy', 
    'arjun.cse@nriit.ac.in', 
    'CSE', 
    cs.id, 
    cs.academic_year_id,
    2,
    4,
    'demo123' -- Placeholder
FROM class_sections cs WHERE cs.name = 'CSE-2-A'
ON CONFLICT (roll_number) DO UPDATE SET section_id = EXCLUDED.section_id;

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
)
SELECT 
    '21BQ1A0401', 
    'Priya', 
    'Sharma', 
    'priya.ece@nriit.ac.in', 
    'ECE', 
    cs.id, 
    cs.academic_year_id,
    2,
    4,
    'demo123'
FROM class_sections cs WHERE cs.name = 'ECE-2-A'
ON CONFLICT (roll_number) DO UPDATE SET section_id = EXCLUDED.section_id;

-- 4. Verify Creation
SELECT * FROM students WHERE roll_number IN ('21BQ1A0501', '21BQ1A0401');
