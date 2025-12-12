-- ============================================
-- UPDATE DEAN PROFILE
-- ============================================
-- This script updates the Dean user to Dr Y V RAGHAVA RAO
-- with full administrative rights over all departments

-- Step 1: Update the users table
UPDATE users
SET 
    email = 'dean@nriit.ac.in',
    role = 'dean',
    is_active = true,
    email_verified = true,
    updated_at = NOW()
WHERE email = 'dean@nriit.ac.in';

-- Step 2: Check if dean profile exists in faculty_profiles
-- If exists, update it. If not, we'll create it.

-- First, get the user_id for the dean
DO $$
DECLARE
    dean_user_id UUID;
    dean_profile_exists BOOLEAN;
BEGIN
    -- Get dean's user_id
    SELECT id INTO dean_user_id 
    FROM users 
    WHERE email = 'dean@nriit.ac.in' 
    LIMIT 1;

    -- Check if dean has a faculty profile
    SELECT EXISTS(
        SELECT 1 FROM faculty_profiles WHERE user_id = dean_user_id
    ) INTO dean_profile_exists;

    IF dean_profile_exists THEN
        -- Update existing profile
        UPDATE faculty_profiles
        SET
            employee_id = 'DEAN001',
            first_name = 'Y V RAGHAVA',
            last_name = 'RAO',
            email = 'dean@nriit.ac.in',
            phone = '0863-2344300',
            designation = 'Dean & Professor',
            qualification = 'Ph.D',
            specialization = 'Computer Science & Engineering',
            experience_years = 25.0,
            dept_code = 'CSE',
            date_of_joining = '2000-07-01',
            is_active = true,
            updated_at = NOW()
        WHERE user_id = dean_user_id;
        
        RAISE NOTICE '✅ Dean profile updated successfully!';
    ELSE
        -- Create new profile
        INSERT INTO faculty_profiles (
            user_id, employee_id, first_name, last_name, email, phone,
            designation, qualification, specialization, experience_years,
            dept_code, date_of_joining, is_active
        ) VALUES (
            dean_user_id, 'DEAN001', 'Y V RAGHAVA', 'RAO', 
            'dean@nriit.ac.in', '0863-2344300',
            'Dean & Professor', 'Ph.D', 'Computer Science & Engineering', 25.0,
            'CSE', '2000-07-01', true
        );
        
        RAISE NOTICE '✅ Dean profile created successfully!';
    END IF;

    RAISE NOTICE '============================================';
    RAISE NOTICE '✅ DEAN PROFILE UPDATED!';
    RAISE NOTICE '============================================';
    RAISE NOTICE 'Name: Dr Y V RAGHAVA RAO';
    RAISE NOTICE 'Email: dean@nriit.ac.in';
    RAISE NOTICE 'Designation: Dean & Professor';
    RAISE NOTICE 'Department: CSE';
    RAISE NOTICE 'Qualification: Ph.D';
    RAISE NOTICE 'Experience: 25 years';
    RAISE NOTICE '============================================';
    RAISE NOTICE 'Dean has full administrative rights over all 9 departments:';
    RAISE NOTICE '  - CSE (Computer Science & Engineering)';
    RAISE NOTICE '  - CSE-DS (CSE - Data Science)';
    RAISE NOTICE '  - CSE-AI (CSE - Artificial Intelligence)';
    RAISE NOTICE '  - IT (Information Technology)';
    RAISE NOTICE '  - ECE (Electronics & Communication)';
    RAISE NOTICE '  - CIVIL (Civil Engineering)';
    RAISE NOTICE '  - MBA (Master of Business Administration)';
    RAISE NOTICE '  - MCA (Master of Computer Applications)';
    RAISE NOTICE '  - BSH (Basic Sciences & Humanities)';
    RAISE NOTICE '============================================';
END $$;

-- Verify the update
SELECT 
    u.email,
    u.role,
    fp.employee_id,
    fp.first_name,
    fp.last_name,
    fp.designation,
    fp.qualification,
    fp.dept_code,
    fp.experience_years
FROM users u
LEFT JOIN faculty_profiles fp ON u.id = fp.user_id
WHERE u.email = 'dean@nriit.ac.in';
