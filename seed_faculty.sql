-- Seed Data for Faculty (Run in Supabase SQL Editor)

DO $$
DECLARE
    new_user_id UUID;
    dept_code_val text;
BEGIN
    RAISE NOTICE 'Seeding Faculty...';

    -- Faculty: FAC001 (CSE)
    INSERT INTO users (email, role, is_active, email_verified)
    VALUES ('fac001@nriit.edu.in', 'faculty', true, true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW()
    RETURNING id INTO new_user_id;

    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, designation, 
        qualification, specialization, experience_years, email, phone, 
        date_of_joining, is_active
    )
    VALUES (
        new_user_id, 'FAC001', 'Amit', 'Sharma', 'CSE', 'Professor', 
        'Ph.D', 'Artificial Intelligence', 12.5, 'fac001@nriit.edu.in', '9876543210', 
        '2015-06-01', true
    )
    ON CONFLICT (employee_id) DO NOTHING;

    -- Faculty: FAC002 (IT)
    INSERT INTO users (email, role, is_active, email_verified)
    VALUES ('fac002@nriit.edu.in', 'faculty', true, true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW()
    RETURNING id INTO new_user_id;

    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, designation, 
        qualification, specialization, experience_years, email, phone, 
        date_of_joining, is_active
    )
    VALUES (
        new_user_id, 'FAC002', 'Priya', 'Kapoor', 'IT', 'Asst. Professor', 
        'M.Tech', 'Data Mining', 5.0, 'fac002@nriit.edu.in', '9876543211', 
        '2019-08-15', true
    )
    ON CONFLICT (employee_id) DO NOTHING;

    RAISE NOTICE 'Seeding Faculty Complete.';
END $$;
