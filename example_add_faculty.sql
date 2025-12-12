-- ===========================================
-- EXAMPLE: Adding Dr. Rajesh Kumar (CSE Faculty)
-- ===========================================
-- This is a complete working example
-- Copy and modify for your actual faculty
-- ===========================================

DO $$
DECLARE
    new_user_id UUID;
    new_faculty_id UUID;
BEGIN
    RAISE NOTICE '========================================';
    RAISE NOTICE 'Adding Dr. Rajesh Kumar to CSE Department';
    RAISE NOTICE '========================================';

    -- Create User Account
    INSERT INTO users (
        email, 
        phone, 
        role, 
        is_active, 
        email_verified
    )
    VALUES (
        'rajesh.kumar@nriit.ac.in',
        '9876543210',
        'faculty',
        true,
        true
    )
    ON CONFLICT (email) DO UPDATE 
    SET last_login = NOW()
    RETURNING id INTO new_user_id;

    RAISE NOTICE '✅ User created: %', new_user_id;

    -- Create Faculty Profile
    INSERT INTO faculty_profiles (
        user_id,
        employee_id,
        first_name,
        last_name,
        dept_code,
        designation,
        qualification,
        specialization,
        experience_years,
        date_of_joining,
        date_of_birth,
        gender,
        blood_group,
        phone,
        email,
        personal_email,
        address,
        city,
        state,
        pincode,
        photo_path,
        resume_path,
        aadhar_number,
        pan_number,
        google_scholar_id,
        orcid_id,
        publications_count,
        patents_count,
        projects_count,
        is_mentor,
        is_active
    )
    VALUES (
        new_user_id,
        'FACCSE003',
        'Rajesh',
        'Kumar',
        'CSE',
        'Assistant Professor',
        'Ph.D. in Computer Science',
        'Machine Learning & Artificial Intelligence',
        8.5,
        '2024-01-15',
        '1985-06-15',
        'male',
        'B+',
        '9876543210',
        'rajesh.kumar@nriit.ac.in',
        'rajesh.personal@gmail.com',
        'H.No. 12-34, Brodipet, Near Main Road',
        'Guntur',
        'Andhra Pradesh',
        '522002',
        'https://via.placeholder.com/500x500.jpg?text=Dr.+Rajesh+Kumar',  -- Replace with actual photo URL
        'faculty-resumes/FACCSE003_resume.pdf',
        '123456789012',
        'ABCDE1234F',
        'scholar_rajesh_kumar',
        '0000-0001-2345-6789',
        15,
        2,
        5,
        true,
        true
    )
    ON CONFLICT (employee_id) DO NOTHING
    RETURNING id INTO new_faculty_id;

    IF new_faculty_id IS NOT NULL THEN
        RAISE NOTICE '========================================';
        RAISE NOTICE '✅ SUCCESS!';
        RAISE NOTICE '========================================';
        RAISE NOTICE 'Employee ID: FACCSE003';
        RAISE NOTICE 'Name: Dr. Rajesh Kumar';
        RAISE NOTICE 'Email: rajesh.kumar@nriit.ac.in';
        RAISE NOTICE 'Department: CSE';
        RAISE NOTICE 'Designation: Assistant Professor';
        RAISE NOTICE '========================================';
        RAISE NOTICE 'Next Steps:';
        RAISE NOTICE '1. Upload photo to: faculty-photos/FACCSE003.jpg';
        RAISE NOTICE '2. Upload resume to: faculty-resumes/FACCSE003_resume.pdf';
        RAISE NOTICE '3. Create Auth user with email: rajesh.kumar@nriit.ac.in';
        RAISE NOTICE '4. Send welcome email to faculty';
        RAISE NOTICE '========================================';
    ELSE
        RAISE NOTICE '⚠️  Faculty with Employee ID FACCSE003 already exists!';
    END IF;

END $$;

-- Verify
SELECT 
    employee_id,
    first_name || ' ' || last_name as full_name,
    dept_code::TEXT as department,
    designation,
    qualification,
    specialization,
    experience_years,
    email,
    phone,
    is_mentor,
    is_active,
    created_at
FROM faculty_profiles
WHERE employee_id = 'FACCSE003';
