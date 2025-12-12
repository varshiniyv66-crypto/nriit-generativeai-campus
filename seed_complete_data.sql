-- ===========================================
-- COMPLETE DATA SEED - ALL DEPARTMENTS
-- ===========================================
-- This will populate:
-- - All 9 departments
-- - ~100 Faculty for all departments
-- - ~1,560 Students for all 4 years in each department
-- - Academic batches
-- ===========================================

-- ===========================================
-- SECTION 1: DEPARTMENTS
-- ===========================================

INSERT INTO departments (code, name, short_name, established_year, is_active) VALUES
('CSE', 'Computer Science and Engineering', 'CSE', 2001, true),
('CSE-DS', 'Computer Science and Engineering (Data Science)', 'CSE-DS', 2019, true),
('CSE-AI', 'Computer Science and Engineering (Artificial Intelligence)', 'CSE-AI', 2020, true),
('IT', 'Information Technology', 'IT', 2001, true),
('ECE', 'Electronics and Communication Engineering', 'ECE', 2001, true),
('CIVIL', 'Civil Engineering', 'CIVIL', 2001, true),
('MBA', 'Master of Business Administration', 'MBA', 2010, true),
('MCA', 'Master of Computer Applications', 'MCA', 2008, true),
('BSH', 'Basic Sciences and Humanities', 'BSH', 2001, true)
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    short_name = EXCLUDED.short_name,
    established_year = EXCLUDED.established_year,
    is_active = EXCLUDED.is_active;

-- ===========================================
-- SECTION 2: ACADEMIC BATCHES
-- ===========================================

INSERT INTO academic_batches (batch_year, batch_name, start_date, end_date, is_current) VALUES
(2024, '2024-28', '2024-07-01', '2028-06-30', true),
(2023, '2023-27', '2023-07-01', '2027-06-30', false),
(2022, '2022-26', '2022-07-01', '2026-06-30', false),
(2021, '2021-25', '2021-07-01', '2025-06-30', false)
ON CONFLICT DO NOTHING;

-- ===========================================
-- SECTION 3: FACULTY - ALL DEPARTMENTS (~100 total)
-- ===========================================
-- Pattern: FAC[DEPT][XXX] e.g., FACCSE001
-- Email: fac[dept][xxx]@nriit.ac.in
-- ===========================================

DO $$
DECLARE
    new_user_id UUID;
BEGIN
    -- ========================================
    -- CSE FACULTY (15 members)
    -- ========================================
    
    -- CSE HOD
    INSERT INTO users (email, role, is_active, email_verified)
    VALUES ('faccse001@nriit.ac.in', 'faculty', true, true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW()
    RETURNING id INTO new_user_id;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, designation,
        qualification, specialization, experience_years, email, phone,
        date_of_joining, is_active
    ) VALUES (
        new_user_id, 'FACCSE001', 'Rajesh', 'Kumar', 'CSE', 'Professor & HOD',
        'Ph.D', 'Artificial Intelligence', 18.0, 'faccse001@nriit.ac.in', '9876543001',
        '2010-07-01', true
    ) ON CONFLICT (employee_id) DO NOTHING;
    
    -- CSE Professors
    FOR i IN 2..5 LOOP
        INSERT INTO users (email, role, is_active, email_verified)
        VALUES ('faccse' || LPAD(i::text, 3, '0') || '@nriit.ac.in', 'faculty', true, true)
        ON CONFLICT (email) DO UPDATE SET last_login = NOW()
        RETURNING id INTO new_user_id;
        
        INSERT INTO faculty_profiles (
            user_id, employee_id, first_name, last_name, dept_code, designation,
            qualification, specialization, experience_years, email, phone,
            date_of_joining, is_active
        ) VALUES (
            new_user_id, 'FACCSE' || LPAD(i::text, 3, '0'),
            'Faculty' || i, 'CSE', 'CSE', 'Professor',
            'Ph.D', 'Computer Science', 12.0 + i, 'faccse' || LPAD(i::text, 3, '0') || '@nriit.ac.in',
            '98765430' || LPAD(i::text, 2, '0'), '2012-07-01', true
        ) ON CONFLICT (employee_id) DO NOTHING;
    END LOOP;
    
    -- CSE Associate Professors
    FOR i IN 6..10 LOOP
        INSERT INTO users (email, role, is_active, email_verified)
        VALUES ('faccse' || LPAD(i::text, 3, '0') || '@nriit.ac.in', 'faculty', true, true)
        ON CONFLICT (email) DO UPDATE SET last_login = NOW()
        RETURNING id INTO new_user_id;
        
        INSERT INTO faculty_profiles (
            user_id, employee_id, first_name, last_name, dept_code, designation,
            qualification, specialization, experience_years, email, phone,
            date_of_joining, is_active
        ) VALUES (
            new_user_id, 'FACCSE' || LPAD(i::text, 3, '0'),
            'Faculty' || i, 'CSE', 'CSE', 'Associate Professor',
            'Ph.D', 'Computer Science', 8.0 + (i-5), 'faccse' || LPAD(i::text, 3, '0') || '@nriit.ac.in',
            '98765430' || LPAD(i::text, 2, '0'), '2015-07-01', true
        ) ON CONFLICT (employee_id) DO NOTHING;
    END LOOP;
    
    -- CSE Assistant Professors
    FOR i IN 11..15 LOOP
        INSERT INTO users (email, role, is_active, email_verified)
        VALUES ('faccse' || LPAD(i::text, 3, '0') || '@nriit.ac.in', 'faculty', true, true)
        ON CONFLICT (email) DO UPDATE SET last_login = NOW()
        RETURNING id INTO new_user_id;
        
        INSERT INTO faculty_profiles (
            user_id, employee_id, first_name, last_name, dept_code, designation,
            qualification, specialization, experience_years, email, phone,
            date_of_joining, is_active
        ) VALUES (
            new_user_id, 'FACCSE' || LPAD(i::text, 3, '0'),
            'Faculty' || i, 'CSE', 'CSE', 'Assistant Professor',
            'M.Tech', 'Computer Science', 3.0 + (i-10), 'faccse' || LPAD(i::text, 3, '0') || '@nriit.ac.in',
            '98765430' || LPAD(i::text, 2, '0'), '2019-07-01', true
        ) ON CONFLICT (employee_id) DO NOTHING;
    END LOOP;

    -- ========================================
    -- IT FACULTY (12 members)
    -- ========================================
    
    FOR i IN 1..12 LOOP
        INSERT INTO users (email, role, is_active, email_verified)
        VALUES ('facit' || LPAD(i::text, 3, '0') || '@nriit.ac.in', 'faculty', true, true)
        ON CONFLICT (email) DO UPDATE SET last_login = NOW()
        RETURNING id INTO new_user_id;
        
        INSERT INTO faculty_profiles (
            user_id, employee_id, first_name, last_name, dept_code, designation,
            qualification, specialization, experience_years, email, phone,
            date_of_joining, is_active
        ) VALUES (
            new_user_id, 'FACIT' || LPAD(i::text, 3, '0'),
            'Faculty' || i, 'IT', 'IT',
            CASE WHEN i = 1 THEN 'Professor & HOD'
                 WHEN i <= 4 THEN 'Professor'
                 WHEN i <= 8 THEN 'Associate Professor'
                 ELSE 'Assistant Professor' END,
            CASE WHEN i <= 8 THEN 'Ph.D' ELSE 'M.Tech' END,
            'Information Technology', 
            CASE WHEN i = 1 THEN 16.0 WHEN i <= 4 THEN 12.0 WHEN i <= 8 THEN 8.0 ELSE 4.0 END,
            'facit' || LPAD(i::text, 3, '0') || '@nriit.ac.in',
            '98765431' || LPAD(i::text, 2, '0'), '2012-07-01', true
        ) ON CONFLICT (employee_id) DO NOTHING;
    END LOOP;

    -- ========================================
    -- ECE FACULTY (12 members)
    -- ========================================
    
    FOR i IN 1..12 LOOP
        INSERT INTO users (email, role, is_active, email_verified)
        VALUES ('facece' || LPAD(i::text, 3, '0') || '@nriit.ac.in', 'faculty', true, true)
        ON CONFLICT (email) DO UPDATE SET last_login = NOW()
        RETURNING id INTO new_user_id;
        
        INSERT INTO faculty_profiles (
            user_id, employee_id, first_name, last_name, dept_code, designation,
            qualification, specialization, experience_years, email, phone,
            date_of_joining, is_active
        ) VALUES (
            new_user_id, 'FACECE' || LPAD(i::text, 3, '0'),
            'Faculty' || i, 'ECE', 'ECE',
            CASE WHEN i = 1 THEN 'Professor & HOD'
                 WHEN i <= 4 THEN 'Professor'
                 WHEN i <= 8 THEN 'Associate Professor'
                 ELSE 'Assistant Professor' END,
            CASE WHEN i <= 8 THEN 'Ph.D' ELSE 'M.Tech' END,
            'Electronics and Communication', 
            CASE WHEN i = 1 THEN 17.0 WHEN i <= 4 THEN 13.0 WHEN i <= 8 THEN 9.0 ELSE 5.0 END,
            'facece' || LPAD(i::text, 3, '0') || '@nriit.ac.in',
            '98765432' || LPAD(i::text, 2, '0'), '2011-07-01', true
        ) ON CONFLICT (employee_id) DO NOTHING;
    END LOOP;

    -- ========================================
    -- CIVIL FACULTY (10 members)
    -- ========================================
    
    FOR i IN 1..10 LOOP
        INSERT INTO users (email, role, is_active, email_verified)
        VALUES ('faccivil' || LPAD(i::text, 3, '0') || '@nriit.ac.in', 'faculty', true, true)
        ON CONFLICT (email) DO UPDATE SET last_login = NOW()
        RETURNING id INTO new_user_id;
        
        INSERT INTO faculty_profiles (
            user_id, employee_id, first_name, last_name, dept_code, designation,
            qualification, specialization, experience_years, email, phone,
            date_of_joining, is_active
        ) VALUES (
            new_user_id, 'FACCIVIL' || LPAD(i::text, 3, '0'),
            'Faculty' || i, 'CIVIL', 'CIVIL',
            CASE WHEN i = 1 THEN 'Professor & HOD'
                 WHEN i <= 3 THEN 'Professor'
                 WHEN i <= 6 THEN 'Associate Professor'
                 ELSE 'Assistant Professor' END,
            CASE WHEN i <= 6 THEN 'Ph.D' ELSE 'M.Tech' END,
            'Civil Engineering', 
            CASE WHEN i = 1 THEN 19.0 WHEN i <= 3 THEN 14.0 WHEN i <= 6 THEN 10.0 ELSE 6.0 END,
            'faccivil' || LPAD(i::text, 3, '0') || '@nriit.ac.in',
            '98765433' || LPAD(i::text, 2, '0'), '2010-07-01', true
        ) ON CONFLICT (employee_id) DO NOTHING;
    END LOOP;

    -- ========================================
    -- CSE-DS FACULTY (8 members)
    -- ========================================
    
    FOR i IN 1..8 LOOP
        INSERT INTO users (email, role, is_active, email_verified)
        VALUES ('faccseds' || LPAD(i::text, 3, '0') || '@nriit.ac.in', 'faculty', true, true)
        ON CONFLICT (email) DO UPDATE SET last_login = NOW()
        RETURNING id INTO new_user_id;
        
        INSERT INTO faculty_profiles (
            user_id, employee_id, first_name, last_name, dept_code, designation,
            qualification, specialization, experience_years, email, phone,
            date_of_joining, is_active
        ) VALUES (
            new_user_id, 'FACCSEDS' || LPAD(i::text, 3, '0'),
            'Faculty' || i, 'DS', 'CSE-DS',
            CASE WHEN i = 1 THEN 'Professor & HOD'
                 WHEN i <= 3 THEN 'Associate Professor'
                 ELSE 'Assistant Professor' END,
            CASE WHEN i <= 3 THEN 'Ph.D' ELSE 'M.Tech' END,
            'Data Science', 
            CASE WHEN i = 1 THEN 10.0 WHEN i <= 3 THEN 7.0 ELSE 4.0 END,
            'faccseds' || LPAD(i::text, 3, '0') || '@nriit.ac.in',
            '98765434' || LPAD(i::text, 2, '0'), '2019-07-01', true
        ) ON CONFLICT (employee_id) DO NOTHING;
    END LOOP;

    -- ========================================
    -- CSE-AI FACULTY (8 members)
    -- ========================================
    
    FOR i IN 1..8 LOOP
        INSERT INTO users (email, role, is_active, email_verified)
        VALUES ('faccseai' || LPAD(i::text, 3, '0') || '@nriit.ac.in', 'faculty', true, true)
        ON CONFLICT (email) DO UPDATE SET last_login = NOW()
        RETURNING id INTO new_user_id;
        
        INSERT INTO faculty_profiles (
            user_id, employee_id, first_name, last_name, dept_code, designation,
            qualification, specialization, experience_years, email, phone,
            date_of_joining, is_active
        ) VALUES (
            new_user_id, 'FACCSEAI' || LPAD(i::text, 3, '0'),
            'Faculty' || i, 'AI', 'CSE-AI',
            CASE WHEN i = 1 THEN 'Professor & HOD'
                 WHEN i <= 3 THEN 'Associate Professor'
                 ELSE 'Assistant Professor' END,
            CASE WHEN i <= 3 THEN 'Ph.D' ELSE 'M.Tech' END,
            'Artificial Intelligence', 
            CASE WHEN i = 1 THEN 11.0 WHEN i <= 3 THEN 8.0 ELSE 5.0 END,
            'faccseai' || LPAD(i::text, 3, '0') || '@nriit.ac.in',
            '98765435' || LPAD(i::text, 2, '0'), '2020-07-01', true
        ) ON CONFLICT (employee_id) DO NOTHING;
    END LOOP;

    -- ========================================
    -- MBA FACULTY (10 members)
    -- ========================================
    
    FOR i IN 1..10 LOOP
        INSERT INTO users (email, role, is_active, email_verified)
        VALUES ('facmba' || LPAD(i::text, 3, '0') || '@nriit.ac.in', 'faculty', true, true)
        ON CONFLICT (email) DO UPDATE SET last_login = NOW()
        RETURNING id INTO new_user_id;
        
        INSERT INTO faculty_profiles (
            user_id, employee_id, first_name, last_name, dept_code, designation,
            qualification, specialization, experience_years, email, phone,
            date_of_joining, is_active
        ) VALUES (
            new_user_id, 'FACMBA' || LPAD(i::text, 3, '0'),
            'Faculty' || i, 'MBA', 'MBA',
            CASE WHEN i = 1 THEN 'Professor & HOD'
                 WHEN i <= 4 THEN 'Professor'
                 WHEN i <= 7 THEN 'Associate Professor'
                 ELSE 'Assistant Professor' END,
            CASE WHEN i <= 7 THEN 'Ph.D' ELSE 'MBA' END,
            'Management', 
            CASE WHEN i = 1 THEN 15.0 WHEN i <= 4 THEN 12.0 WHEN i <= 7 THEN 9.0 ELSE 6.0 END,
            'facmba' || LPAD(i::text, 3, '0') || '@nriit.ac.in',
            '98765436' || LPAD(i::text, 2, '0'), '2010-07-01', true
        ) ON CONFLICT (employee_id) DO NOTHING;
    END LOOP;

    -- ========================================
    -- MCA FACULTY (8 members)
    -- ========================================
    
    FOR i IN 1..8 LOOP
        INSERT INTO users (email, role, is_active, email_verified)
        VALUES ('facmca' || LPAD(i::text, 3, '0') || '@nriit.ac.in', 'faculty', true, true)
        ON CONFLICT (email) DO UPDATE SET last_login = NOW()
        RETURNING id INTO new_user_id;
        
        INSERT INTO faculty_profiles (
            user_id, employee_id, first_name, last_name, dept_code, designation,
            qualification, specialization, experience_years, email, phone,
            date_of_joining, is_active
        ) VALUES (
            new_user_id, 'FACMCA' || LPAD(i::text, 3, '0'),
            'Faculty' || i, 'MCA', 'MCA',
            CASE WHEN i = 1 THEN 'Professor & HOD'
                 WHEN i <= 3 THEN 'Associate Professor'
                 ELSE 'Assistant Professor' END,
            CASE WHEN i <= 3 THEN 'Ph.D' ELSE 'MCA' END,
            'Computer Applications', 
            CASE WHEN i = 1 THEN 13.0 WHEN i <= 3 THEN 9.0 ELSE 5.0 END,
            'facmca' || LPAD(i::text, 3, '0') || '@nriit.ac.in',
            '98765437' || LPAD(i::text, 2, '0'), '2008-07-01', true
        ) ON CONFLICT (employee_id) DO NOTHING;
    END LOOP;

    -- ========================================
    -- BSH FACULTY (15 members - Physics, Chemistry, Maths, English)
    -- ========================================
    
    FOR i IN 1..15 LOOP
        INSERT INTO users (email, role, is_active, email_verified)
        VALUES ('facbsh' || LPAD(i::text, 3, '0') || '@nriit.ac.in', 'faculty', true, true)
        ON CONFLICT (email) DO UPDATE SET last_login = NOW()
        RETURNING id INTO new_user_id;
        
        INSERT INTO faculty_profiles (
            user_id, employee_id, first_name, last_name, dept_code, designation,
            qualification, specialization, experience_years, email, phone,
            date_of_joining, is_active
        ) VALUES (
            new_user_id, 'FACBSH' || LPAD(i::text, 3, '0'),
            'Faculty' || i, 'BSH', 'BSH',
            CASE WHEN i = 1 THEN 'Professor & HOD'
                 WHEN i <= 5 THEN 'Professor'
                 WHEN i <= 10 THEN 'Associate Professor'
                 ELSE 'Assistant Professor' END,
            CASE WHEN i <= 10 THEN 'Ph.D' ELSE 'M.Sc' END,
            CASE WHEN i <= 4 THEN 'Physics'
                 WHEN i <= 8 THEN 'Mathematics'
                 WHEN i <= 12 THEN 'Chemistry'
                 ELSE 'English' END,
            CASE WHEN i = 1 THEN 20.0 WHEN i <= 5 THEN 15.0 WHEN i <= 10 THEN 10.0 ELSE 6.0 END,
            'facbsh' || LPAD(i::text, 3, '0') || '@nriit.ac.in',
            '98765438' || LPAD(i::text, 2, '0'), '2001-07-01', true
        ) ON CONFLICT (employee_id) DO NOTHING;
    END LOOP;

    RAISE NOTICE '✅ All faculty created successfully!';
    RAISE NOTICE '📊 Total faculty: ~100 across all departments';
END $$;

-- ===========================================
-- SECTION 4: STUDENTS - ALL DEPARTMENTS, ALL YEARS (~1,560 total)
-- ===========================================
-- Pattern: [YY][DEPT][XXX] e.g., 24CSE001
-- Semesters: 1st year=1-2, 2nd year=3-4, 3rd year=5-6, 4th year=7-8
-- ===========================================

DO $$
DECLARE
    new_user_id UUID;
    batch_2024 UUID;
    batch_2023 UUID;
    batch_2022 UUID;
    batch_2021 UUID;
BEGIN
    -- Get batch IDs
    SELECT id INTO batch_2024 FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    SELECT id INTO batch_2023 FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    SELECT id INTO batch_2022 FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    SELECT id INTO batch_2021 FROM academic_batches WHERE batch_year = 2021 LIMIT 1;

    -- ========================================
    -- CSE STUDENTS (60 per year = 240 total)
    -- ========================================
    
    -- 1st Year CSE (2024 batch, Semester 1)
    FOR i IN 1..60 LOOP
        INSERT INTO users (email, role, is_active, email_verified)
        VALUES ('24cse' || LPAD(i::text, 3, '0') || '@nriit.ac.in', 'student', true, true)
        ON CONFLICT (email) DO UPDATE SET last_login = NOW()
        RETURNING id INTO new_user_id;

        INSERT INTO student_profiles (
            user_id, roll_number, registration_number, first_name, last_name,
            dept_code, batch_id, current_semester, section, email, phone,
            admission_date, admission_type, is_active
        ) VALUES (
            new_user_id, '24CSE' || LPAD(i::text, 3, '0'), '24CSE' || LPAD(i::text, 3, '0'),
            'Student' || i, 'CSE', 'CSE', batch_2024, 1,
            CASE WHEN i <= 30 THEN 'A' ELSE 'B' END,
            '24cse' || LPAD(i::text, 3, '0') || '@nriit.ac.in',
            '99000' || LPAD(i::text, 5, '0'),
            '2024-07-15', 'EAMCET', true
        ) ON CONFLICT (roll_number) DO NOTHING;
    END LOOP;

    -- 2nd Year CSE (2023 batch, Semester 3)
    FOR i IN 1..60 LOOP
        INSERT INTO users (email, role, is_active, email_verified)
        VALUES ('23cse' || LPAD(i::text, 3, '0') || '@nriit.ac.in', 'student', true, true)
        ON CONFLICT (email) DO UPDATE SET last_login = NOW()
        RETURNING id INTO new_user_id;

        INSERT INTO student_profiles (
            user_id, roll_number, registration_number, first_name, last_name,
            dept_code, batch_id, current_semester, section, email, phone,
            admission_date, admission_type, is_active
        ) VALUES (
            new_user_id, '23CSE' || LPAD(i::text, 3, '0'), '23CSE' || LPAD(i::text, 3, '0'),
            'Student' || i, 'CSE', 'CSE', batch_2023, 3,
            CASE WHEN i <= 30 THEN 'A' ELSE 'B' END,
            '23cse' || LPAD(i::text, 3, '0') || '@nriit.ac.in',
            '99001' || LPAD(i::text, 5, '0'),
            '2023-07-15', 'EAMCET', true
        ) ON CONFLICT (roll_number) DO NOTHING;
    END LOOP;

    -- 3rd Year CSE (2022 batch, Semester 5)
    FOR i IN 1..60 LOOP
        INSERT INTO users (email, role, is_active, email_verified)
        VALUES ('22cse' || LPAD(i::text, 3, '0') || '@nriit.ac.in', 'student', true, true)
        ON CONFLICT (email) DO UPDATE SET last_login = NOW()
        RETURNING id INTO new_user_id;

        INSERT INTO student_profiles (
            user_id, roll_number, registration_number, first_name, last_name,
            dept_code, batch_id, current_semester, section, email, phone,
            admission_date, admission_type, is_active
        ) VALUES (
            new_user_id, '22CSE' || LPAD(i::text, 3, '0'), '22CSE' || LPAD(i::text, 3, '0'),
            'Student' || i, 'CSE', 'CSE', batch_2022, 5,
            CASE WHEN i <= 30 THEN 'A' ELSE 'B' END,
            '22cse' || LPAD(i::text, 3, '0') || '@nriit.ac.in',
            '99002' || LPAD(i::text, 5, '0'),
            '2022-07-15', 'EAMCET', true
        ) ON CONFLICT (roll_number) DO NOTHING;
    END LOOP;

    -- 4th Year CSE (2021 batch, Semester 7)
    FOR i IN 1..60 LOOP
        INSERT INTO users (email, role, is_active, email_verified)
        VALUES ('21cse' || LPAD(i::text, 3, '0') || '@nriit.ac.in', 'student', true, true)
        ON CONFLICT (email) DO UPDATE SET last_login = NOW()
        RETURNING id INTO new_user_id;

        INSERT INTO student_profiles (
            user_id, roll_number, registration_number, first_name, last_name,
            dept_code, batch_id, current_semester, section, email, phone,
            admission_date, admission_type, is_active
        ) VALUES (
            new_user_id, '21CSE' || LPAD(i::text, 3, '0'), '21CSE' || LPAD(i::text, 3, '0'),
            'Student' || i, 'CSE', 'CSE', batch_2021, 7,
            CASE WHEN i <= 30 THEN 'A' ELSE 'B' END,
            '21cse' || LPAD(i::text, 3, '0') || '@nriit.ac.in',
            '99003' || LPAD(i::text, 5, '0'),
            '2021-07-15', 'EAMCET', true
        ) ON CONFLICT (roll_number) DO NOTHING;
    END LOOP;

    -- ========================================
    -- IT STUDENTS (60 per year = 240 total)
    -- ========================================
    
    FOR year_offset IN 0..3 LOOP
        DECLARE
            year_prefix TEXT := (24 - year_offset)::TEXT;
            batch_id UUID := CASE year_offset
                WHEN 0 THEN batch_2024
                WHEN 1 THEN batch_2023
                WHEN 2 THEN batch_2022
                WHEN 3 THEN batch_2021
            END;
            semester INT := 1 + (year_offset * 2);
        BEGIN
            FOR i IN 1..60 LOOP
                INSERT INTO users (email, role, is_active, email_verified)
                VALUES (year_prefix || 'it' || LPAD(i::text, 3, '0') || '@nriit.ac.in', 'student', true, true)
                ON CONFLICT (email) DO UPDATE SET last_login = NOW()
                RETURNING id INTO new_user_id;

                INSERT INTO student_profiles (
                    user_id, roll_number, registration_number, first_name, last_name,
                    dept_code, batch_id, current_semester, section, email, phone,
                    admission_date, admission_type, is_active
                ) VALUES (
                    new_user_id, year_prefix || 'IT' || LPAD(i::text, 3, '0'), year_prefix || 'IT' || LPAD(i::text, 3, '0'),
                    'Student' || i, 'IT', 'IT', batch_id, semester,
                    CASE WHEN i <= 30 THEN 'A' ELSE 'B' END,
                    year_prefix || 'it' || LPAD(i::text, 3, '0') || '@nriit.ac.in',
                    '99' || (10 + year_offset)::TEXT || LPAD(i::text, 5, '0'),
                    ((2024 - year_offset)::TEXT || '-07-15')::DATE, 'EAMCET', true
                ) ON CONFLICT (roll_number) DO NOTHING;
            END LOOP;
        END;
    END LOOP;

    -- ========================================
    -- ECE STUDENTS (60 per year = 240 total)
    -- ========================================
    
    FOR year_offset IN 0..3 LOOP
        DECLARE
            year_prefix TEXT := (24 - year_offset)::TEXT;
            batch_id UUID := CASE year_offset
                WHEN 0 THEN batch_2024
                WHEN 1 THEN batch_2023
                WHEN 2 THEN batch_2022
                WHEN 3 THEN batch_2021
            END;
            semester INT := 1 + (year_offset * 2);
        BEGIN
            FOR i IN 1..60 LOOP
                INSERT INTO users (email, role, is_active, email_verified)
                VALUES (year_prefix || 'ece' || LPAD(i::text, 3, '0') || '@nriit.ac.in', 'student', true, true)
                ON CONFLICT (email) DO UPDATE SET last_login = NOW()
                RETURNING id INTO new_user_id;

                INSERT INTO student_profiles (
                    user_id, roll_number, registration_number, first_name, last_name,
                    dept_code, batch_id, current_semester, section, email, phone,
                    admission_date, admission_type, is_active
                ) VALUES (
                    new_user_id, year_prefix || 'ECE' || LPAD(i::text, 3, '0'), year_prefix || 'ECE' || LPAD(i::text, 3, '0'),
                    'Student' || i, 'ECE', 'ECE', batch_id, semester,
                    CASE WHEN i <= 30 THEN 'A' ELSE 'B' END,
                    year_prefix || 'ece' || LPAD(i::text, 3, '0') || '@nriit.ac.in',
                    '99' || (20 + year_offset)::TEXT || LPAD(i::text, 5, '0'),
                    ((2024 - year_offset)::TEXT || '-07-15')::DATE, 'EAMCET', true
                ) ON CONFLICT (roll_number) DO NOTHING;
            END LOOP;
        END;
    END LOOP;

    -- ========================================
    -- CIVIL STUDENTS (60 per year = 240 total)
    -- ========================================
    
    FOR year_offset IN 0..3 LOOP
        DECLARE
            year_prefix TEXT := (24 - year_offset)::TEXT;
            batch_id UUID := CASE year_offset
                WHEN 0 THEN batch_2024
                WHEN 1 THEN batch_2023
                WHEN 2 THEN batch_2022
                WHEN 3 THEN batch_2021
            END;
            semester INT := 1 + (year_offset * 2);
        BEGIN
            FOR i IN 1..60 LOOP
                INSERT INTO users (email, role, is_active, email_verified)
                VALUES (year_prefix || 'civil' || LPAD(i::text, 3, '0') || '@nriit.ac.in', 'student', true, true)
                ON CONFLICT (email) DO UPDATE SET last_login = NOW()
                RETURNING id INTO new_user_id;

                INSERT INTO student_profiles (
                    user_id, roll_number, registration_number, first_name, last_name,
                    dept_code, batch_id, current_semester, section, email, phone,
                    admission_date, admission_type, is_active
                ) VALUES (
                    new_user_id, year_prefix || 'CIVIL' || LPAD(i::text, 3, '0'), year_prefix || 'CIVIL' || LPAD(i::text, 3, '0'),
                    'Student' || i, 'CIVIL', 'CIVIL', batch_id, semester,
                    CASE WHEN i <= 30 THEN 'A' ELSE 'B' END,
                    year_prefix || 'civil' || LPAD(i::text, 3, '0') || '@nriit.ac.in',
                    '99' || (30 + year_offset)::TEXT || LPAD(i::text, 5, '0'),
                    ((2024 - year_offset)::TEXT || '-07-15')::DATE, 'EAMCET', true
                ) ON CONFLICT (roll_number) DO NOTHING;
            END LOOP;
        END;
    END LOOP;

    -- ========================================
    -- CSE-DS STUDENTS (30 per year = 120 total)
    -- ========================================
    
    FOR year_offset IN 0..3 LOOP
        DECLARE
            year_prefix TEXT := (24 - year_offset)::TEXT;
            batch_id UUID := CASE year_offset
                WHEN 0 THEN batch_2024
                WHEN 1 THEN batch_2023
                WHEN 2 THEN batch_2022
                WHEN 3 THEN batch_2021
            END;
            semester INT := 1 + (year_offset * 2);
        BEGIN
            FOR i IN 1..30 LOOP
                INSERT INTO users (email, role, is_active, email_verified)
                VALUES (year_prefix || 'cseds' || LPAD(i::text, 3, '0') || '@nriit.ac.in', 'student', true, true)
                ON CONFLICT (email) DO UPDATE SET last_login = NOW()
                RETURNING id INTO new_user_id;

                INSERT INTO student_profiles (
                    user_id, roll_number, registration_number, first_name, last_name,
                    dept_code, batch_id, current_semester, section, email, phone,
                    admission_date, admission_type, is_active
                ) VALUES (
                    new_user_id, year_prefix || 'CSEDS' || LPAD(i::text, 3, '0'), year_prefix || 'CSEDS' || LPAD(i::text, 3, '0'),
                    'Student' || i, 'DS', 'CSE-DS', batch_id, semester, 'A',
                    year_prefix || 'cseds' || LPAD(i::text, 3, '0') || '@nriit.ac.in',
                    '99' || (40 + year_offset)::TEXT || LPAD(i::text, 5, '0'),
                    ((2024 - year_offset)::TEXT || '-07-15')::DATE, 'EAMCET', true
                ) ON CONFLICT (roll_number) DO NOTHING;
            END LOOP;
        END;
    END LOOP;

    -- ========================================
    -- CSE-AI STUDENTS (30 per year = 120 total)
    -- ========================================
    
    FOR year_offset IN 0..3 LOOP
        DECLARE
            year_prefix TEXT := (24 - year_offset)::TEXT;
            batch_id UUID := CASE year_offset
                WHEN 0 THEN batch_2024
                WHEN 1 THEN batch_2023
                WHEN 2 THEN batch_2022
                WHEN 3 THEN batch_2021
            END;
            semester INT := 1 + (year_offset * 2);
        BEGIN
            FOR i IN 1..30 LOOP
                INSERT INTO users (email, role, is_active, email_verified)
                VALUES (year_prefix || 'cseai' || LPAD(i::text, 3, '0') || '@nriit.ac.in', 'student', true, true)
                ON CONFLICT (email) DO UPDATE SET last_login = NOW()
                RETURNING id INTO new_user_id;

                INSERT INTO student_profiles (
                    user_id, roll_number, registration_number, first_name, last_name,
                    dept_code, batch_id, current_semester, section, email, phone,
                    admission_date, admission_type, is_active
                ) VALUES (
                    new_user_id, year_prefix || 'CSEAI' || LPAD(i::text, 3, '0'), year_prefix || 'CSEAI' || LPAD(i::text, 3, '0'),
                    'Student' || i, 'AI', 'CSE-AI', batch_id, semester, 'A',
                    year_prefix || 'cseai' || LPAD(i::text, 3, '0') || '@nriit.ac.in',
                    '99' || (50 + year_offset)::TEXT || LPAD(i::text, 5, '0'),
                    ((2024 - year_offset)::TEXT || '-07-15')::DATE, 'EAMCET', true
                ) ON CONFLICT (roll_number) DO NOTHING;
            END LOOP;
        END;
    END LOOP;

    -- ========================================
    -- MBA STUDENTS (60 per year, 2 years = 120 total)
    -- ========================================
    
    FOR year_offset IN 0..1 LOOP
        DECLARE
            year_prefix TEXT := (24 - year_offset)::TEXT;
            batch_id UUID := CASE year_offset
                WHEN 0 THEN batch_2024
                WHEN 1 THEN batch_2023
            END;
            semester INT := 1 + (year_offset * 2);
        BEGIN
            FOR i IN 1..60 LOOP
                INSERT INTO users (email, role, is_active, email_verified)
                VALUES (year_prefix || 'mba' || LPAD(i::text, 3, '0') || '@nriit.ac.in', 'student', true, true)
                ON CONFLICT (email) DO UPDATE SET last_login = NOW()
                RETURNING id INTO new_user_id;

                INSERT INTO student_profiles (
                    user_id, roll_number, registration_number, first_name, last_name,
                    dept_code, batch_id, current_semester, section, email, phone,
                    admission_date, admission_type, is_active
                ) VALUES (
                    new_user_id, year_prefix || 'MBA' || LPAD(i::text, 3, '0'), year_prefix || 'MBA' || LPAD(i::text, 3, '0'),
                    'Student' || i, 'MBA', 'MBA', batch_id, semester, 'A',
                    year_prefix || 'mba' || LPAD(i::text, 3, '0') || '@nriit.ac.in',
                    '99' || (60 + year_offset)::TEXT || LPAD(i::text, 5, '0'),
                    ((2024 - year_offset)::TEXT || '-07-15')::DATE, 'ICET', true
                ) ON CONFLICT (roll_number) DO NOTHING;
            END LOOP;
        END;
    END LOOP;

    -- ========================================
    -- MCA STUDENTS (60 per year, 2 years = 120 total)
    -- ========================================
    
    FOR year_offset IN 0..1 LOOP
        DECLARE
            year_prefix TEXT := (24 - year_offset)::TEXT;
            batch_id UUID := CASE year_offset
                WHEN 0 THEN batch_2024
                WHEN 1 THEN batch_2023
            END;
            semester INT := 1 + (year_offset * 2);
        BEGIN
            FOR i IN 1..60 LOOP
                INSERT INTO users (email, role, is_active, email_verified)
                VALUES (year_prefix || 'mca' || LPAD(i::text, 3, '0') || '@nriit.ac.in', 'student', true, true)
                ON CONFLICT (email) DO UPDATE SET last_login = NOW()
                RETURNING id INTO new_user_id;

                INSERT INTO student_profiles (
                    user_id, roll_number, registration_number, first_name, last_name,
                    dept_code, batch_id, current_semester, section, email, phone,
                    admission_date, admission_type, is_active
                ) VALUES (
                    new_user_id, year_prefix || 'MCA' || LPAD(i::text, 3, '0'), year_prefix || 'MCA' || LPAD(i::text, 3, '0'),
                    'Student' || i, 'MCA', 'MCA', batch_id, semester, 'A',
                    year_prefix || 'mca' || LPAD(i::text, 3, '0') || '@nriit.ac.in',
                    '99' || (70 + year_offset)::TEXT || LPAD(i::text, 5, '0'),
                    ((2024 - year_offset)::TEXT || '-07-15')::DATE, 'ICET', true
                ) ON CONFLICT (roll_number) DO NOTHING;
            END LOOP;
        END;
    END LOOP;

    RAISE NOTICE '✅ All students created successfully!';
    RAISE NOTICE '📊 Total students: ~1,560 across all departments and years';
END $$;

-- ===========================================
-- SUCCESS MESSAGE
-- ===========================================
DO $$
BEGIN
    RAISE NOTICE '========================================';
    RAISE NOTICE '✅ COMPLETE DATA SEED SUCCESSFUL!';
    RAISE NOTICE '========================================';
    RAISE NOTICE '📚 Departments: 9 (CSE, CSE-DS, CSE-AI, IT, ECE, CIVIL, MBA, MCA, BSH)';
    RAISE NOTICE '👨‍🏫 Faculty: ~100 total';
    RAISE NOTICE '   - CSE: 15 faculty';
    RAISE NOTICE '   - IT: 12 faculty';
    RAISE NOTICE '   - ECE: 12 faculty';
    RAISE NOTICE '   - CIVIL: 10 faculty';
    RAISE NOTICE '   - CSE-DS: 8 faculty';
    RAISE NOTICE '   - CSE-AI: 8 faculty';
    RAISE NOTICE '   - MBA: 10 faculty';
    RAISE NOTICE '   - MCA: 8 faculty';
    RAISE NOTICE '   - BSH: 15 faculty';
    RAISE NOTICE '👨‍🎓 Students: ~1,560 total';
    RAISE NOTICE '   - CSE: 240 (60 per year × 4 years)';
    RAISE NOTICE '   - IT: 240 (60 per year × 4 years)';
    RAISE NOTICE '   - ECE: 240 (60 per year × 4 years)';
    RAISE NOTICE '   - CIVIL: 240 (60 per year × 4 years)';
    RAISE NOTICE '   - CSE-DS: 120 (30 per year × 4 years)';
    RAISE NOTICE '   - CSE-AI: 120 (30 per year × 4 years)';
    RAISE NOTICE '   - MBA: 120 (60 per year × 2 years)';
    RAISE NOTICE '   - MCA: 120 (60 per year × 2 years)';
    RAISE NOTICE '========================================';
    RAISE NOTICE '📧 Faculty Email format: fac[dept][number]@nriit.ac.in';
    RAISE NOTICE '   Examples:';
    RAISE NOTICE '   - faccse001@nriit.ac.in (CSE HOD)';
    RAISE NOTICE '   - facit001@nriit.ac.in (IT HOD)';
    RAISE NOTICE '   - facmba001@nriit.ac.in (MBA HOD)';
    RAISE NOTICE '📧 Student Email format: [year][dept][number]@nriit.ac.in';
    RAISE NOTICE '   Examples:';
    RAISE NOTICE '   - 24cse001@nriit.ac.in (1st year CSE)';
    RAISE NOTICE '   - 23it015@nriit.ac.in (2nd year IT)';
    RAISE NOTICE '   - 22ece030@nriit.ac.in (3rd year ECE)';
    RAISE NOTICE '   - 21civil045@nriit.ac.in (4th year CIVIL)';
    RAISE NOTICE '========================================';
    RAISE NOTICE '🔑 Test Login:';
    RAISE NOTICE '   Faculty: FACCSE001, FACIT001, FACMBA001, etc.';
    RAISE NOTICE '   Students: 24CSE001, 24IT001, 24ECE001, etc.';
    RAISE NOTICE '========================================';
END $$;
