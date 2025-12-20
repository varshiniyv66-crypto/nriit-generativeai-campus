
-- =========================================================
-- NUCLEAR FIX: Create Students Table from Scratch
-- =========================================================

-- The error 'relation "students" does not exist' is definitive. The table is missing.
-- We must create it.

CREATE TABLE IF NOT EXISTS students (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    roll_number TEXT UNIQUE NOT NULL,
    email TEXT,
    first_name TEXT,
    last_name TEXT,
    dept_code TEXT,
    section_id UUID REFERENCES class_sections(id),
    academic_year_id UUID REFERENCES academic_years(id),
    current_year INTEGER,
    current_semester INTEGER,
    phone_number TEXT,
    date_of_birth DATE,
    address TEXT,
    guardian_name TEXT,
    guardian_phone TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW(),
    password_hash TEXT, -- For simple auth if needed
    avatar_url TEXT
);

-- Now we can re-run the previous seed logic
-- (Included here for convenience)

INSERT INTO students (
    roll_number, 
    first_name, 
    last_name, 
    email, 
    dept_code, 
    section_id, 
    academic_year_id,
    current_year,
    current_semester
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
    4
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
    current_semester
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
    4
FROM class_sections cs WHERE cs.name = 'ECE-2-A'
ON CONFLICT (roll_number) DO UPDATE SET section_id = EXCLUDED.section_id;

SELECT * FROM students;
