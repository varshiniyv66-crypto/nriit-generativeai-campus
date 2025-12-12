-- Seed Data for Students (Robust Version)
-- Run this in your Supabase SQL Editor

DO $$
DECLARE
    new_user_id UUID;
BEGIN
    RAISE NOTICE 'Seeding Students...';


    -- Student: 24CSE001 (CSE)
    -- 1. Ensure User Exists and Get ID
    INSERT INTO users (email, role, is_active, email_verified)
    VALUES ('24cse001@nriit.edu.in', 'student', true, true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() -- Dummy update to ensure return works or just to touch the row
    RETURNING id INTO new_user_id;

    -- 2. Insert/Update Profile using the ID
    INSERT INTO student_profiles (
        user_id, roll_number, registration_number, first_name, last_name, 
        dept_code, current_semester, section, email, phone, 
        admission_date, admission_type, is_active
    )
    VALUES (
        new_user_id, '24CSE001', '24CSE001', 'Student1', 'CSE', 
        'CSE', 1, 'A', '24cse001@nriit.edu.in', '99003100', 
        NOW(), 'EAMCET', true
    )
    ON CONFLICT (roll_number) DO NOTHING;

    -- Student: 24CSE002 (CSE)
    -- 1. Ensure User Exists and Get ID
    INSERT INTO users (email, role, is_active, email_verified)
    VALUES ('24cse002@nriit.edu.in', 'student', true, true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() -- Dummy update to ensure return works or just to touch the row
    RETURNING id INTO new_user_id;

    -- 2. Insert/Update Profile using the ID
    INSERT INTO student_profiles (
        user_id, roll_number, registration_number, first_name, last_name, 
        dept_code, current_semester, section, email, phone, 
        admission_date, admission_type, is_active
    )
    VALUES (
        new_user_id, '24CSE002', '24CSE002', 'Student2', 'CSE', 
        'CSE', 1, 'A', '24cse002@nriit.edu.in', '99003200', 
        NOW(), 'EAMCET', true
    )
    ON CONFLICT (roll_number) DO NOTHING;

    -- Student: 24CSEDS001 (CSE-DS)
    -- 1. Ensure User Exists and Get ID
    INSERT INTO users (email, role, is_active, email_verified)
    VALUES ('24cseds001@nriit.edu.in', 'student', true, true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() -- Dummy update to ensure return works or just to touch the row
    RETURNING id INTO new_user_id;

    -- 2. Insert/Update Profile using the ID
    INSERT INTO student_profiles (
        user_id, roll_number, registration_number, first_name, last_name, 
        dept_code, current_semester, section, email, phone, 
        admission_date, admission_type, is_active
    )
    VALUES (
        new_user_id, '24CSEDS001', '24CSEDS001', 'Student1', 'CSE-DS', 
        'CSE-DS', 1, 'A', '24cseds001@nriit.edu.in', '99006100', 
        NOW(), 'EAMCET', true
    )
    ON CONFLICT (roll_number) DO NOTHING;

    -- Student: 24CSEDS002 (CSE-DS)
    -- 1. Ensure User Exists and Get ID
    INSERT INTO users (email, role, is_active, email_verified)
    VALUES ('24cseds002@nriit.edu.in', 'student', true, true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() -- Dummy update to ensure return works or just to touch the row
    RETURNING id INTO new_user_id;

    -- 2. Insert/Update Profile using the ID
    INSERT INTO student_profiles (
        user_id, roll_number, registration_number, first_name, last_name, 
        dept_code, current_semester, section, email, phone, 
        admission_date, admission_type, is_active
    )
    VALUES (
        new_user_id, '24CSEDS002', '24CSEDS002', 'Student2', 'CSE-DS', 
        'CSE-DS', 1, 'A', '24cseds002@nriit.edu.in', '99006200', 
        NOW(), 'EAMCET', true
    )
    ON CONFLICT (roll_number) DO NOTHING;

    -- Student: 24CSEAI001 (CSE-AI)
    -- 1. Ensure User Exists and Get ID
    INSERT INTO users (email, role, is_active, email_verified)
    VALUES ('24cseai001@nriit.edu.in', 'student', true, true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() -- Dummy update to ensure return works or just to touch the row
    RETURNING id INTO new_user_id;

    -- 2. Insert/Update Profile using the ID
    INSERT INTO student_profiles (
        user_id, roll_number, registration_number, first_name, last_name, 
        dept_code, current_semester, section, email, phone, 
        admission_date, admission_type, is_active
    )
    VALUES (
        new_user_id, '24CSEAI001', '24CSEAI001', 'Student1', 'CSE-AI', 
        'CSE-AI', 1, 'A', '24cseai001@nriit.edu.in', '99006100', 
        NOW(), 'EAMCET', true
    )
    ON CONFLICT (roll_number) DO NOTHING;

    -- Student: 24CSEAI002 (CSE-AI)
    -- 1. Ensure User Exists and Get ID
    INSERT INTO users (email, role, is_active, email_verified)
    VALUES ('24cseai002@nriit.edu.in', 'student', true, true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() -- Dummy update to ensure return works or just to touch the row
    RETURNING id INTO new_user_id;

    -- 2. Insert/Update Profile using the ID
    INSERT INTO student_profiles (
        user_id, roll_number, registration_number, first_name, last_name, 
        dept_code, current_semester, section, email, phone, 
        admission_date, admission_type, is_active
    )
    VALUES (
        new_user_id, '24CSEAI002', '24CSEAI002', 'Student2', 'CSE-AI', 
        'CSE-AI', 1, 'A', '24cseai002@nriit.edu.in', '99006200', 
        NOW(), 'EAMCET', true
    )
    ON CONFLICT (roll_number) DO NOTHING;

    -- Student: 24IT001 (IT)
    -- 1. Ensure User Exists and Get ID
    INSERT INTO users (email, role, is_active, email_verified)
    VALUES ('24it001@nriit.edu.in', 'student', true, true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() -- Dummy update to ensure return works or just to touch the row
    RETURNING id INTO new_user_id;

    -- 2. Insert/Update Profile using the ID
    INSERT INTO student_profiles (
        user_id, roll_number, registration_number, first_name, last_name, 
        dept_code, current_semester, section, email, phone, 
        admission_date, admission_type, is_active
    )
    VALUES (
        new_user_id, '24IT001', '24IT001', 'Student1', 'IT', 
        'IT', 1, 'A', '24it001@nriit.edu.in', '99002100', 
        NOW(), 'EAMCET', true
    )
    ON CONFLICT (roll_number) DO NOTHING;

    -- Student: 24IT002 (IT)
    -- 1. Ensure User Exists and Get ID
    INSERT INTO users (email, role, is_active, email_verified)
    VALUES ('24it002@nriit.edu.in', 'student', true, true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() -- Dummy update to ensure return works or just to touch the row
    RETURNING id INTO new_user_id;

    -- 2. Insert/Update Profile using the ID
    INSERT INTO student_profiles (
        user_id, roll_number, registration_number, first_name, last_name, 
        dept_code, current_semester, section, email, phone, 
        admission_date, admission_type, is_active
    )
    VALUES (
        new_user_id, '24IT002', '24IT002', 'Student2', 'IT', 
        'IT', 1, 'A', '24it002@nriit.edu.in', '99002200', 
        NOW(), 'EAMCET', true
    )
    ON CONFLICT (roll_number) DO NOTHING;

    -- Student: 24ECE001 (ECE)
    -- 1. Ensure User Exists and Get ID
    INSERT INTO users (email, role, is_active, email_verified)
    VALUES ('24ece001@nriit.edu.in', 'student', true, true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() -- Dummy update to ensure return works or just to touch the row
    RETURNING id INTO new_user_id;

    -- 2. Insert/Update Profile using the ID
    INSERT INTO student_profiles (
        user_id, roll_number, registration_number, first_name, last_name, 
        dept_code, current_semester, section, email, phone, 
        admission_date, admission_type, is_active
    )
    VALUES (
        new_user_id, '24ECE001', '24ECE001', 'Student1', 'ECE', 
        'ECE', 1, 'A', '24ece001@nriit.edu.in', '99003100', 
        NOW(), 'EAMCET', true
    )
    ON CONFLICT (roll_number) DO NOTHING;

    -- Student: 24ECE002 (ECE)
    -- 1. Ensure User Exists and Get ID
    INSERT INTO users (email, role, is_active, email_verified)
    VALUES ('24ece002@nriit.edu.in', 'student', true, true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() -- Dummy update to ensure return works or just to touch the row
    RETURNING id INTO new_user_id;

    -- 2. Insert/Update Profile using the ID
    INSERT INTO student_profiles (
        user_id, roll_number, registration_number, first_name, last_name, 
        dept_code, current_semester, section, email, phone, 
        admission_date, admission_type, is_active
    )
    VALUES (
        new_user_id, '24ECE002', '24ECE002', 'Student2', 'ECE', 
        'ECE', 1, 'A', '24ece002@nriit.edu.in', '99003200', 
        NOW(), 'EAMCET', true
    )
    ON CONFLICT (roll_number) DO NOTHING;

    -- Student: 24CIVIL001 (CIVIL)
    -- 1. Ensure User Exists and Get ID
    INSERT INTO users (email, role, is_active, email_verified)
    VALUES ('24civil001@nriit.edu.in', 'student', true, true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() -- Dummy update to ensure return works or just to touch the row
    RETURNING id INTO new_user_id;

    -- 2. Insert/Update Profile using the ID
    INSERT INTO student_profiles (
        user_id, roll_number, registration_number, first_name, last_name, 
        dept_code, current_semester, section, email, phone, 
        admission_date, admission_type, is_active
    )
    VALUES (
        new_user_id, '24CIVIL001', '24CIVIL001', 'Student1', 'CIVIL', 
        'CIVIL', 1, 'A', '24civil001@nriit.edu.in', '99005100', 
        NOW(), 'EAMCET', true
    )
    ON CONFLICT (roll_number) DO NOTHING;

    -- Student: 24CIVIL002 (CIVIL)
    -- 1. Ensure User Exists and Get ID
    INSERT INTO users (email, role, is_active, email_verified)
    VALUES ('24civil002@nriit.edu.in', 'student', true, true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() -- Dummy update to ensure return works or just to touch the row
    RETURNING id INTO new_user_id;

    -- 2. Insert/Update Profile using the ID
    INSERT INTO student_profiles (
        user_id, roll_number, registration_number, first_name, last_name, 
        dept_code, current_semester, section, email, phone, 
        admission_date, admission_type, is_active
    )
    VALUES (
        new_user_id, '24CIVIL002', '24CIVIL002', 'Student2', 'CIVIL', 
        'CIVIL', 1, 'A', '24civil002@nriit.edu.in', '99005200', 
        NOW(), 'EAMCET', true
    )
    ON CONFLICT (roll_number) DO NOTHING;

    -- Student: 24MBA001 (MBA)
    -- 1. Ensure User Exists and Get ID
    INSERT INTO users (email, role, is_active, email_verified)
    VALUES ('24mba001@nriit.edu.in', 'student', true, true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() -- Dummy update to ensure return works or just to touch the row
    RETURNING id INTO new_user_id;

    -- 2. Insert/Update Profile using the ID
    INSERT INTO student_profiles (
        user_id, roll_number, registration_number, first_name, last_name, 
        dept_code, current_semester, section, email, phone, 
        admission_date, admission_type, is_active
    )
    VALUES (
        new_user_id, '24MBA001', '24MBA001', 'Student1', 'MBA', 
        'MBA', 1, 'A', '24mba001@nriit.edu.in', '99003100', 
        NOW(), 'EAMCET', true
    )
    ON CONFLICT (roll_number) DO NOTHING;

    -- Student: 24MBA002 (MBA)
    -- 1. Ensure User Exists and Get ID
    INSERT INTO users (email, role, is_active, email_verified)
    VALUES ('24mba002@nriit.edu.in', 'student', true, true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() -- Dummy update to ensure return works or just to touch the row
    RETURNING id INTO new_user_id;

    -- 2. Insert/Update Profile using the ID
    INSERT INTO student_profiles (
        user_id, roll_number, registration_number, first_name, last_name, 
        dept_code, current_semester, section, email, phone, 
        admission_date, admission_type, is_active
    )
    VALUES (
        new_user_id, '24MBA002', '24MBA002', 'Student2', 'MBA', 
        'MBA', 1, 'A', '24mba002@nriit.edu.in', '99003200', 
        NOW(), 'EAMCET', true
    )
    ON CONFLICT (roll_number) DO NOTHING;

    -- Student: 24MCA001 (MCA)
    -- 1. Ensure User Exists and Get ID
    INSERT INTO users (email, role, is_active, email_verified)
    VALUES ('24mca001@nriit.edu.in', 'student', true, true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() -- Dummy update to ensure return works or just to touch the row
    RETURNING id INTO new_user_id;

    -- 2. Insert/Update Profile using the ID
    INSERT INTO student_profiles (
        user_id, roll_number, registration_number, first_name, last_name, 
        dept_code, current_semester, section, email, phone, 
        admission_date, admission_type, is_active
    )
    VALUES (
        new_user_id, '24MCA001', '24MCA001', 'Student1', 'MCA', 
        'MCA', 1, 'A', '24mca001@nriit.edu.in', '99003100', 
        NOW(), 'EAMCET', true
    )
    ON CONFLICT (roll_number) DO NOTHING;

    -- Student: 24MCA002 (MCA)
    -- 1. Ensure User Exists and Get ID
    INSERT INTO users (email, role, is_active, email_verified)
    VALUES ('24mca002@nriit.edu.in', 'student', true, true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() -- Dummy update to ensure return works or just to touch the row
    RETURNING id INTO new_user_id;

    -- 2. Insert/Update Profile using the ID
    INSERT INTO student_profiles (
        user_id, roll_number, registration_number, first_name, last_name, 
        dept_code, current_semester, section, email, phone, 
        admission_date, admission_type, is_active
    )
    VALUES (
        new_user_id, '24MCA002', '24MCA002', 'Student2', 'MCA', 
        'MCA', 1, 'A', '24mca002@nriit.edu.in', '99003200', 
        NOW(), 'EAMCET', true
    )
    ON CONFLICT (roll_number) DO NOTHING;

    -- Student: 24BSH001 (BSH)
    -- 1. Ensure User Exists and Get ID
    INSERT INTO users (email, role, is_active, email_verified)
    VALUES ('24bsh001@nriit.edu.in', 'student', true, true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() -- Dummy update to ensure return works or just to touch the row
    RETURNING id INTO new_user_id;

    -- 2. Insert/Update Profile using the ID
    INSERT INTO student_profiles (
        user_id, roll_number, registration_number, first_name, last_name, 
        dept_code, current_semester, section, email, phone, 
        admission_date, admission_type, is_active
    )
    VALUES (
        new_user_id, '24BSH001', '24BSH001', 'Student1', 'BSH', 
        'BSH', 1, 'A', '24bsh001@nriit.edu.in', '99003100', 
        NOW(), 'EAMCET', true
    )
    ON CONFLICT (roll_number) DO NOTHING;

    -- Student: 24BSH002 (BSH)
    -- 1. Ensure User Exists and Get ID
    INSERT INTO users (email, role, is_active, email_verified)
    VALUES ('24bsh002@nriit.edu.in', 'student', true, true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() -- Dummy update to ensure return works or just to touch the row
    RETURNING id INTO new_user_id;

    -- 2. Insert/Update Profile using the ID
    INSERT INTO student_profiles (
        user_id, roll_number, registration_number, first_name, last_name, 
        dept_code, current_semester, section, email, phone, 
        admission_date, admission_type, is_active
    )
    VALUES (
        new_user_id, '24BSH002', '24BSH002', 'Student2', 'BSH', 
        'BSH', 1, 'A', '24bsh002@nriit.edu.in', '99003200', 
        NOW(), 'EAMCET', true
    )
    ON CONFLICT (roll_number) DO NOTHING;

    RAISE NOTICE 'Seeding Complete.';
END $$;
