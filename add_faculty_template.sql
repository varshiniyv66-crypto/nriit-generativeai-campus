-- ===========================================
-- ADD NEW FACULTY MEMBER - TEMPLATE
-- ===========================================
-- Instructions:
-- 1. Replace ALL placeholder values with actual data
-- 2. Upload photo to Supabase Storage → faculty-photos bucket
-- 3. Upload resume to Supabase Storage → faculty-resumes bucket
-- 4. Copy the photo URL and resume path
-- 5. Run this script in Supabase SQL Editor
-- ===========================================

DO $$
DECLARE
    new_user_id UUID;
    new_faculty_id UUID;
BEGIN
    RAISE NOTICE '========================================';
    RAISE NOTICE 'Adding New Faculty Member...';
    RAISE NOTICE '========================================';

    -- ============================================
    -- STEP 1: Create User Account
    -- ============================================
    INSERT INTO users (
        email, 
        phone, 
        role, 
        is_active, 
        email_verified
    )
    VALUES (
        'faculty.name@nriit.ac.in',  -- ⚠️ REPLACE: Faculty email
        '9876543210',                 -- ⚠️ REPLACE: Faculty phone
        'faculty',                    -- Don't change
        true,                         -- Don't change
        true                          -- Don't change
    )
    ON CONFLICT (email) DO UPDATE 
    SET last_login = NOW()
    RETURNING id INTO new_user_id;

    RAISE NOTICE '✅ User account created: %', new_user_id;

    -- ============================================
    -- STEP 2: Create Faculty Profile
    -- ============================================
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
        research_gate_id,
        scopus_id,
        publications_count,
        patents_count,
        projects_count,
        is_mentor,
        is_active
    )
    VALUES (
        new_user_id,
        
        -- ⚠️ REPLACE ALL VALUES BELOW ⚠️
        
        -- Basic Information
        'FACCSE999',                    -- Employee ID (e.g., FACCSE003, FACIT001)
        'FirstName',                    -- First Name
        'LastName',                     -- Last Name
        'CSE',                          -- Department: CSE, IT, ECE, CIVIL, MBA, MCA, BSH
        'Assistant Professor',          -- Designation
        'Ph.D. in Computer Science',   -- Qualification
        'Machine Learning',             -- Specialization
        5.0,                            -- Experience in years (decimal)
        '2024-01-15',                   -- Date of Joining (YYYY-MM-DD)
        '1985-06-15',                   -- Date of Birth (YYYY-MM-DD)
        'male',                         -- Gender: male, female, other
        'O+',                           -- Blood Group: A+, A-, B+, B-, AB+, AB-, O+, O-
        
        -- Contact Information
        '9876543210',                   -- Phone
        'faculty.name@nriit.ac.in',    -- Email (same as above)
        'personal@gmail.com',           -- Personal Email (optional)
        
        -- Address
        'H.No. 12-34, Street, Area',   -- Full Address
        'Guntur',                       -- City
        'Andhra Pradesh',              -- State
        '522019',                       -- Pincode
        
        -- Files (Upload to Supabase Storage first!)
        'https://YOUR_PROJECT.supabase.co/storage/v1/object/public/faculty-photos/FACCSE999.jpg',  -- Photo URL
        'faculty-resumes/FACCSE999_resume.pdf',  -- Resume Path
        
        -- Government IDs
        '123456789012',                 -- Aadhar Number (12 digits)
        'ABCDE1234F',                  -- PAN Number (10 chars)
        
        -- Research Profiles (Optional - use NULL if not available)
        NULL,                           -- Google Scholar ID
        NULL,                           -- ORCID ID
        NULL,                           -- ResearchGate ID
        NULL,                           -- Scopus ID
        0,                              -- Publications Count
        0,                              -- Patents Count
        0,                              -- Projects Count
        
        -- Status
        true,                           -- Is Mentor (true/false)
        true                            -- Is Active (true/false)
    )
    ON CONFLICT (employee_id) DO NOTHING
    RETURNING id INTO new_faculty_id;

    IF new_faculty_id IS NOT NULL THEN
        RAISE NOTICE '========================================';
        RAISE NOTICE '✅ SUCCESS! Faculty member added!';
        RAISE NOTICE '========================================';
        RAISE NOTICE 'Faculty ID: %', new_faculty_id;
        RAISE NOTICE 'User ID: %', new_user_id;
    ELSE
        RAISE NOTICE '⚠️  Employee ID already exists!';
    END IF;

END $$;

-- ============================================
-- STEP 3: Verify the Faculty was Added
-- ============================================
SELECT 
    employee_id,
    first_name || ' ' || last_name as full_name,
    dept_code::TEXT as department,
    designation,
    email,
    phone,
    date_of_joining,
    is_mentor,
    is_active
FROM faculty_profiles
WHERE employee_id = 'FACCSE999'  -- ⚠️ REPLACE with actual Employee ID
ORDER BY created_at DESC;

-- ============================================
-- OPTIONAL: Create Supabase Auth User
-- ============================================
-- After running this script, go to:
-- Supabase Dashboard → Authentication → Users → Add User
-- 
-- Email: faculty.name@nriit.ac.in
-- Password: Temp@123 (faculty should change on first login)
-- Auto Confirm: YES
-- ============================================

-- ============================================
-- QUICK REFERENCE: Department Codes
-- ============================================
-- CSE      = Computer Science & Engineering
-- CSE-DS   = CSE (Data Science)
-- CSE-AI   = CSE (Artificial Intelligence)
-- IT       = Information Technology
-- ECE      = Electronics & Communication Engineering
-- CIVIL    = Civil Engineering
-- MBA      = Master of Business Administration
-- MCA      = Master of Computer Applications
-- BSH      = Basic Sciences & Humanities
-- ============================================

-- ============================================
-- QUICK REFERENCE: Designations
-- ============================================
-- Professor
-- Associate Professor
-- Assistant Professor
-- Senior Assistant Professor
-- Lecturer
-- Lab Instructor
-- Guest Faculty
-- Visiting Faculty
-- ============================================
