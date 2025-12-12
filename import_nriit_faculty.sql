-- ===========================================
-- NRIIT REAL FACULTY DATA IMPORT
-- Generated: 2025-12-12 15:29
-- Total Faculty: 128
-- ===========================================


-- ===== CSE Faculty: 47 =====
DO $$
DECLARE
    uid UUID;
BEGIN

    -- FACCSE001: Dr. K. Nageswara Rao
    INSERT INTO users (email, role, is_active) VALUES ('faccse001@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACCSE001', 'K.', 'Nageswara Rao', 'CSE',
        'Professor', 'Ph.D', 'CSE', 'faccse001@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACCSE002: Dr. J. Chandrasekhar
    INSERT INTO users (email, role, is_active) VALUES ('faccse002@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACCSE002', 'J.', 'Chandrasekhar', 'CSE',
        'Associate Professor', 'Ph.D', 'CSE', 'faccse002@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACCSE003: Mr. V. K. Pratap
    INSERT INTO users (email, role, is_active) VALUES ('faccse003@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACCSE003', 'V.', 'K. Pratap', 'CSE',
        'Assistant Professor', 'M.Tech', 'CSE', 'faccse003@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACCSE004: Mr. D. Hari Krishna
    INSERT INTO users (email, role, is_active) VALUES ('faccse004@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACCSE004', 'D.', 'Hari Krishna', 'CSE',
        'Assistant Professor', 'M.Tech', 'CSE', 'faccse004@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACCSE005: Ms. Ch. Bindu Madhavi
    INSERT INTO users (email, role, is_active) VALUES ('faccse005@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACCSE005', 'Ch.', 'Bindu Madhavi', 'CSE',
        'Assistant Professor', 'M.Tech', 'CSE', 'faccse005@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACCSE006: Mrs. Y. Jessy Kumari
    INSERT INTO users (email, role, is_active) VALUES ('faccse006@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACCSE006', 'Y.', 'Jessy Kumari', 'CSE',
        'Assistant Professor', 'M.Tech', 'CSE', 'faccse006@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACCSE007: Ms. N. Kanthi Priyadarsini
    INSERT INTO users (email, role, is_active) VALUES ('faccse007@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACCSE007', 'N.', 'Kanthi Priyadarsini', 'CSE',
        'Assistant Professor', 'M.Tech', 'CSE', 'faccse007@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACCSE008: Mrs. K. Manvitha
    INSERT INTO users (email, role, is_active) VALUES ('faccse008@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACCSE008', 'K.', 'Manvitha', 'CSE',
        'Assistant Professor', 'M.Tech', 'CSE', 'faccse008@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACCSE009: Mr. B. Rajashekhar
    INSERT INTO users (email, role, is_active) VALUES ('faccse009@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACCSE009', 'B.', 'Rajashekhar', 'CSE',
        'Assistant Professor', 'M.Tech', 'CSE', 'faccse009@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACCSE010: Ms. G. Sowmya
    INSERT INTO users (email, role, is_active) VALUES ('faccse010@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACCSE010', 'G.', 'Sowmya', 'CSE',
        'Assistant Professor', 'M.Tech', 'CSE', 'faccse010@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACCSE011: Mrs. Raziya Sulthana
    INSERT INTO users (email, role, is_active) VALUES ('faccse011@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACCSE011', 'Raziya', 'Sulthana', 'CSE',
        'Assistant Professor', 'M.Tech', 'CSE', 'faccse011@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACCSE012: Mrs. D. Thirupathamma
    INSERT INTO users (email, role, is_active) VALUES ('faccse012@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACCSE012', 'D.', 'Thirupathamma', 'CSE',
        'Assistant Professor', 'M.Tech', 'CSE', 'faccse012@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACCSE013: Mrs. P. Swathi
    INSERT INTO users (email, role, is_active) VALUES ('faccse013@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACCSE013', 'P.', 'Swathi', 'CSE',
        'Assistant Professor', 'M.Tech', 'CSE', 'faccse013@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACCSE014: Ms. S. Sowjanya
    INSERT INTO users (email, role, is_active) VALUES ('faccse014@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACCSE014', 'S.', 'Sowjanya', 'CSE',
        'Assistant Professor', 'M.Tech', 'CSE', 'faccse014@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACCSE015: Mr. N. Vamsi Krishna
    INSERT INTO users (email, role, is_active) VALUES ('faccse015@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACCSE015', 'N.', 'Vamsi Krishna', 'CSE',
        'Assistant Professor', 'M.Tech', 'CSE', 'faccse015@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACCSE016: Mrs. P. Ratna Kumari
    INSERT INTO users (email, role, is_active) VALUES ('faccse016@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACCSE016', 'P.', 'Ratna Kumari', 'CSE',
        'Assistant Professor', 'M.Tech', 'CSE', 'faccse016@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACCSE017: Mrs. K. Kavya Sri
    INSERT INTO users (email, role, is_active) VALUES ('faccse017@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACCSE017', 'K.', 'Kavya Sri', 'CSE',
        'Assistant Professor', 'M.Tech', 'CSE', 'faccse017@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACCSE018: Mrs. G. Sindhuja
    INSERT INTO users (email, role, is_active) VALUES ('faccse018@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACCSE018', 'G.', 'Sindhuja', 'CSE',
        'Assistant Professor', 'M.Tech', 'CSE', 'faccse018@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACCSE019: Mrs. Shaik Roshna
    INSERT INTO users (email, role, is_active) VALUES ('faccse019@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACCSE019', 'Shaik', 'Roshna', 'CSE',
        'Assistant Professor', 'M.Tech', 'CSE', 'faccse019@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACCSE020: Mr. N. Pradeep Kumar
    INSERT INTO users (email, role, is_active) VALUES ('faccse020@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACCSE020', 'N.', 'Pradeep Kumar', 'CSE',
        'Assistant Professor', 'M.Tech', 'CSE', 'faccse020@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACCSE021: Mr. U. U. Veerendra
    INSERT INTO users (email, role, is_active) VALUES ('faccse021@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACCSE021', 'U.', 'U. Veerendra', 'CSE',
        'Assistant Professor', 'M.Tech', 'CSE', 'faccse021@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACCSE022: Mrs. V. Asha Latha
    INSERT INTO users (email, role, is_active) VALUES ('faccse022@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACCSE022', 'V.', 'Asha Latha', 'CSE',
        'Assistant Professor', 'M.Tech', 'CSE', 'faccse022@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACCSE023: Mr. V. Suresh Babu
    INSERT INTO users (email, role, is_active) VALUES ('faccse023@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACCSE023', 'V.', 'Suresh Babu', 'CSE',
        'Assistant Professor', 'M.Tech', 'CSE', 'faccse023@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACCSE024: Mr. Kommuri Balaji
    INSERT INTO users (email, role, is_active) VALUES ('faccse024@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACCSE024', 'Kommuri', 'Balaji', 'CSE',
        'Assistant Professor', 'MS', 'CSE', 'faccse024@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACCSE025: Mrs. S. Anusha
    INSERT INTO users (email, role, is_active) VALUES ('faccse025@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACCSE025', 'S.', 'Anusha', 'CSE',
        'Assistant Professor', 'M.Tech', 'CSE', 'faccse025@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACCSE026: Mr. J. Ramu
    INSERT INTO users (email, role, is_active) VALUES ('faccse026@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACCSE026', 'J.', 'Ramu', 'CSE',
        'Assistant Professor', 'M.Tech', 'CSE', 'faccse026@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACCSE027: Dr. Dara Vikram
    INSERT INTO users (email, role, is_active) VALUES ('faccse027@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACCSE027', 'Dara', 'Vikram', 'CSE',
        'Professor', 'Ph.D', 'CS & SE', 'faccse027@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACCSE028: Mrs. Sk Hussainbi
    INSERT INTO users (email, role, is_active) VALUES ('faccse028@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACCSE028', 'Sk', 'Hussainbi', 'CSE',
        'Assistant Professor', 'M.Tech', 'CSE', 'faccse028@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACCSE029: Mr. D. Koteswara Rao
    INSERT INTO users (email, role, is_active) VALUES ('faccse029@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACCSE029', 'D.', 'Koteswara Rao', 'CSE',
        'Assistant Professor', 'M.Tech', 'CSE', 'faccse029@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACCSE030: Mr. I. Nageswara Rao
    INSERT INTO users (email, role, is_active) VALUES ('faccse030@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACCSE030', 'I.', 'Nageswara Rao', 'CSE',
        'Assistant Professor', 'M.Tech', 'CSE', 'faccse030@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACCSE031: Mrs. K. Sai Sulochana
    INSERT INTO users (email, role, is_active) VALUES ('faccse031@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACCSE031', 'K.', 'Sai Sulochana', 'CSE',
        'Assistant Professor', 'M.Tech', 'CSE', 'faccse031@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACCSE032: Mr. M. Arunkumar
    INSERT INTO users (email, role, is_active) VALUES ('faccse032@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACCSE032', 'M.', 'Arunkumar', 'CSE',
        'Assistant Professor', 'M.Tech', 'CSE', 'faccse032@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACCSE033: Mr. P. Aravind
    INSERT INTO users (email, role, is_active) VALUES ('faccse033@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACCSE033', 'P.', 'Aravind', 'CSE',
        'Assistant Professor', 'M.Tech', 'CSE', 'faccse033@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACCSE034: Dr. Y. V. Raghava Rao
    INSERT INTO users (email, role, is_active) VALUES ('faccse034@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACCSE034', 'Y.', 'V. Raghava Rao', 'CSE',
        'Associate Professor', 'Ph.D', 'Data Mining', 'faccse034@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACCSE035: Mrs. B. Sujatha
    INSERT INTO users (email, role, is_active) VALUES ('faccse035@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACCSE035', 'B.', 'Sujatha', 'CSE',
        'Assistant Professor', 'M.Tech', 'CSE', 'faccse035@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACCSE036: Mrs. M. Uma Devi
    INSERT INTO users (email, role, is_active) VALUES ('faccse036@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACCSE036', 'M.', 'Uma Devi', 'CSE',
        'Assistant Professor', 'M.Tech', 'CSE', 'faccse036@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACCSE037: Dr. Kode Rajiv
    INSERT INTO users (email, role, is_active) VALUES ('faccse037@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACCSE037', 'Kode', 'Rajiv', 'CSE',
        'Associate Professor', 'Ph.D', 'CSE', 'faccse037@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACCSE038: Dr. D. Sarada Mani
    INSERT INTO users (email, role, is_active) VALUES ('faccse038@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACCSE038', 'D.', 'Sarada Mani', 'CSE',
        'Professor', 'Ph.D', 'CSE', 'faccse038@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACCSE039: Mr. G. Ashok Babu
    INSERT INTO users (email, role, is_active) VALUES ('faccse039@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACCSE039', 'G.', 'Ashok Babu', 'CSE',
        'Assistant Professor', 'M.Tech', 'CSE', 'faccse039@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACCSE040: Mr. Addanki Praveen
    INSERT INTO users (email, role, is_active) VALUES ('faccse040@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACCSE040', 'Addanki', 'Praveen', 'CSE',
        'Assistant Professor', 'M.Tech', 'CSE', 'faccse040@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACCSE041: Mrs. Kopuri Lavanya
    INSERT INTO users (email, role, is_active) VALUES ('faccse041@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACCSE041', 'Kopuri', 'Lavanya', 'CSE',
        'Assistant Professor', 'M.Tech', 'CSE', 'faccse041@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACCSE042: Mr. K. Rama Koteswara Rao
    INSERT INTO users (email, role, is_active) VALUES ('faccse042@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACCSE042', 'K.', 'Rama Koteswara Rao', 'CSE',
        'Assistant Professor', 'M.Tech', 'CSE', 'faccse042@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACCSE043: Mrs. P. Sujatha
    INSERT INTO users (email, role, is_active) VALUES ('faccse043@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACCSE043', 'P.', 'Sujatha', 'CSE',
        'Assistant Professor', 'M.Tech', 'CSE', 'faccse043@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACCSE044: Mrs. M. Alekhya
    INSERT INTO users (email, role, is_active) VALUES ('faccse044@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACCSE044', 'M.', 'Alekhya', 'CSE',
        'Assistant Professor', 'M.Tech', 'CSE', 'faccse044@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACCSE045: Mr. Ganta Srikanth
    INSERT INTO users (email, role, is_active) VALUES ('faccse045@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACCSE045', 'Ganta', 'Srikanth', 'CSE',
        'Assistant Professor', 'M.Tech', 'CSE', 'faccse045@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACCSE046: Dr. G. Mahesh
    INSERT INTO users (email, role, is_active) VALUES ('faccse046@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACCSE046', 'G.', 'Mahesh', 'CSE',
        'Associate Professor', 'Ph.D', 'CSE', 'faccse046@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACCSE047: Dr. G. Kalyani
    INSERT INTO users (email, role, is_active) VALUES ('faccse047@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACCSE047', 'G.', 'Kalyani', 'CSE',
        'Associate Professor', 'Ph.D', 'CSE', 'faccse047@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

END $$;

-- ===== ECE Faculty: 66 =====
DO $$
DECLARE
    uid UUID;
BEGIN

    -- FACECE001: Dr. Srihari Rao Komatineni
    INSERT INTO users (email, role, is_active) VALUES ('facece001@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE001', 'Srihari', 'Rao Komatineni', 'ECE',
        'Professor', 'Ph.D', 'ECE', 'facece001@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE002:  Chekuri Venugopala Chowdary
    INSERT INTO users (email, role, is_active) VALUES ('facece002@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE002', 'Chekuri', 'Venugopala Chowdary', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece002@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE003:  Seshagiri Rao Sugguna
    INSERT INTO users (email, role, is_active) VALUES ('facece003@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE003', 'Seshagiri', 'Rao Sugguna', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece003@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE004:  Lakshmi Darsi
    INSERT INTO users (email, role, is_active) VALUES ('facece004@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE004', 'Lakshmi', 'Darsi', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece004@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE005:  Sujata Kandukuri
    INSERT INTO users (email, role, is_active) VALUES ('facece005@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE005', 'Sujata', 'Kandukuri', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece005@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE006:  Manasa Manukonda
    INSERT INTO users (email, role, is_active) VALUES ('facece006@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE006', 'Manasa', 'Manukonda', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece006@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE007:  Naga Jyothi Valeti
    INSERT INTO users (email, role, is_active) VALUES ('facece007@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE007', 'Naga', 'Jyothi Valeti', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece007@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE008:  Prameela Podili
    INSERT INTO users (email, role, is_active) VALUES ('facece008@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE008', 'Prameela', 'Podili', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece008@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE009:  Srilakshmi Pamarthi
    INSERT INTO users (email, role, is_active) VALUES ('facece009@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE009', 'Srilakshmi', 'Pamarthi', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece009@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE010:  Sai Kumar Gopu
    INSERT INTO users (email, role, is_active) VALUES ('facece010@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE010', 'Sai', 'Kumar Gopu', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece010@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE011:  Saripudi Suneetha
    INSERT INTO users (email, role, is_active) VALUES ('facece011@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE011', 'Saripudi', 'Suneetha', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece011@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE012:  Bindu Sri Mokamatam
    INSERT INTO users (email, role, is_active) VALUES ('facece012@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE012', 'Bindu', 'Sri Mokamatam', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece012@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE013:  Yarru Sreeja
    INSERT INTO users (email, role, is_active) VALUES ('facece013@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE013', 'Yarru', 'Sreeja', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece013@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE014:  Shahanaj Shaik
    INSERT INTO users (email, role, is_active) VALUES ('facece014@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE014', 'Shahanaj', 'Shaik', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece014@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE015:  Kanvitha Penumutchu
    INSERT INTO users (email, role, is_active) VALUES ('facece015@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE015', 'Kanvitha', 'Penumutchu', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece015@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE016:  Haneef Shaik
    INSERT INTO users (email, role, is_active) VALUES ('facece016@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE016', 'Haneef', 'Shaik', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece016@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE017:  Pavani Velaga
    INSERT INTO users (email, role, is_active) VALUES ('facece017@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE017', 'Pavani', 'Velaga', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece017@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE018:  Kiran Kumar Komarapuri
    INSERT INTO users (email, role, is_active) VALUES ('facece018@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE018', 'Kiran', 'Kumar Komarapuri', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece018@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE019:  Tamilvanam M
    INSERT INTO users (email, role, is_active) VALUES ('facece019@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE019', 'Tamilvanam', 'M', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece019@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE020:  Bheemana Indu Latha
    INSERT INTO users (email, role, is_active) VALUES ('facece020@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE020', 'Bheemana', 'Indu Latha', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece020@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE021:  Vijay Kumar Ankipalli
    INSERT INTO users (email, role, is_active) VALUES ('facece021@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE021', 'Vijay', 'Kumar Ankipalli', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece021@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE022:  Chodavarapu Satyanarayana Murthy
    INSERT INTO users (email, role, is_active) VALUES ('facece022@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE022', 'Chodavarapu', 'Satyanarayana Murthy', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece022@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE023: Dr. Chetty Kalai Selvan
    INSERT INTO users (email, role, is_active) VALUES ('facece023@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE023', 'Chetty', 'Kalai Selvan', 'ECE',
        'Professor', 'Ph.D', 'ECE', 'facece023@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE024:  Giridhar Babu Amirisetty
    INSERT INTO users (email, role, is_active) VALUES ('facece024@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE024', 'Giridhar', 'Babu Amirisetty', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece024@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE025:  Manohar Patra
    INSERT INTO users (email, role, is_active) VALUES ('facece025@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE025', 'Manohar', 'Patra', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece025@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE026:  Amala Payala
    INSERT INTO users (email, role, is_active) VALUES ('facece026@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE026', 'Amala', 'Payala', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece026@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE027: Dr. Ravi Mancharla
    INSERT INTO users (email, role, is_active) VALUES ('facece027@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE027', 'Ravi', 'Mancharla', 'ECE',
        'Associate Professor', 'Ph.D', 'ECE', 'facece027@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE028:  Sravya Doppalapudi
    INSERT INTO users (email, role, is_active) VALUES ('facece028@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE028', 'Sravya', 'Doppalapudi', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece028@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE029:  Lakshminarayana Mogili
    INSERT INTO users (email, role, is_active) VALUES ('facece029@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE029', 'Lakshminarayana', 'Mogili', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece029@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE030:  Meenakshi Bollu
    INSERT INTO users (email, role, is_active) VALUES ('facece030@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE030', 'Meenakshi', 'Bollu', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece030@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE031: Dr. Saidaiah Bandi
    INSERT INTO users (email, role, is_active) VALUES ('facece031@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE031', 'Saidaiah', 'Bandi', 'ECE',
        'Professor', 'Ph.D', 'ECE', 'facece031@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE032:  Moparthy Mary Junitha
    INSERT INTO users (email, role, is_active) VALUES ('facece032@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE032', 'Moparthy', 'Mary Junitha', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece032@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE033: Dr. Jampani Krishna Kishore
    INSERT INTO users (email, role, is_active) VALUES ('facece033@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE033', 'Jampani', 'Krishna Kishore', 'ECE',
        'Professor', 'Ph.D', 'ECE', 'facece033@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE034: Dr. V. Naga Malleswari
    INSERT INTO users (email, role, is_active) VALUES ('facece034@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE034', 'V.', 'Naga Malleswari', 'ECE',
        'Professor', 'Ph.D', 'ECE', 'facece034@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE035: Dr. Sanjay Dola
    INSERT INTO users (email, role, is_active) VALUES ('facece035@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE035', 'Sanjay', 'Dola', 'ECE',
        'Professor', 'Ph.D', 'ECE', 'facece035@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE036:  Baba Fariddin Shaik
    INSERT INTO users (email, role, is_active) VALUES ('facece036@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE036', 'Baba', 'Fariddin Shaik', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece036@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE037:  Pothula Teja
    INSERT INTO users (email, role, is_active) VALUES ('facece037@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE037', 'Pothula', 'Teja', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece037@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE038:  Ujjit Buradagunta
    INSERT INTO users (email, role, is_active) VALUES ('facece038@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE038', 'Ujjit', 'Buradagunta', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece038@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE039:  Veerendranath Nune
    INSERT INTO users (email, role, is_active) VALUES ('facece039@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE039', 'Veerendranath', 'Nune', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece039@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE040:  Sai Banavathu
    INSERT INTO users (email, role, is_active) VALUES ('facece040@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE040', 'Sai', 'Banavathu', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece040@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE041:  Fairoze Shaik
    INSERT INTO users (email, role, is_active) VALUES ('facece041@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE041', 'Fairoze', 'Shaik', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece041@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE042:  Prasanna Kumar Thurumela
    INSERT INTO users (email, role, is_active) VALUES ('facece042@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE042', 'Prasanna', 'Kumar Thurumela', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece042@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE043:  Anjaneyulu Ummaneni
    INSERT INTO users (email, role, is_active) VALUES ('facece043@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE043', 'Anjaneyulu', 'Ummaneni', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece043@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE044:  Lalitha Gogineni
    INSERT INTO users (email, role, is_active) VALUES ('facece044@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE044', 'Lalitha', 'Gogineni', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece044@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE045:  Akhila Boggavarapu
    INSERT INTO users (email, role, is_active) VALUES ('facece045@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE045', 'Akhila', 'Boggavarapu', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece045@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE046:  Triveni Lakshmi Marella
    INSERT INTO users (email, role, is_active) VALUES ('facece046@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE046', 'Triveni', 'Lakshmi Marella', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece046@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE047:  K Murali Babu
    INSERT INTO users (email, role, is_active) VALUES ('facece047@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE047', 'K', 'Murali Babu', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece047@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE048:  B Bhaskar
    INSERT INTO users (email, role, is_active) VALUES ('facece048@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE048', 'B', 'Bhaskar', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece048@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE049:  Rambabu Chemakurthi
    INSERT INTO users (email, role, is_active) VALUES ('facece049@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE049', 'Rambabu', 'Chemakurthi', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece049@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE050:  V Gajendra Kumar
    INSERT INTO users (email, role, is_active) VALUES ('facece050@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE050', 'V', 'Gajendra Kumar', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece050@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE051:  Valluri Yamini Devi
    INSERT INTO users (email, role, is_active) VALUES ('facece051@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE051', 'Valluri', 'Yamini Devi', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece051@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE052:  Satyanarayana Divvela
    INSERT INTO users (email, role, is_active) VALUES ('facece052@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE052', 'Satyanarayana', 'Divvela', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece052@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE053:  Chaitanya Vunnava
    INSERT INTO users (email, role, is_active) VALUES ('facece053@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE053', 'Chaitanya', 'Vunnava', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece053@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE054:  Balanarsimha Neerudi
    INSERT INTO users (email, role, is_active) VALUES ('facece054@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE054', 'Balanarsimha', 'Neerudi', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece054@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE055:  Vani Veera
    INSERT INTO users (email, role, is_active) VALUES ('facece055@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE055', 'Vani', 'Veera', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece055@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE056:  Neelima Saripalli
    INSERT INTO users (email, role, is_active) VALUES ('facece056@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE056', 'Neelima', 'Saripalli', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece056@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE057:  N. Shanthi
    INSERT INTO users (email, role, is_active) VALUES ('facece057@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE057', 'N.', 'Shanthi', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece057@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE058:  D. Vasanthi
    INSERT INTO users (email, role, is_active) VALUES ('facece058@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE058', 'D.', 'Vasanthi', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece058@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE059:  Malladi Sumanth
    INSERT INTO users (email, role, is_active) VALUES ('facece059@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE059', 'Malladi', 'Sumanth', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece059@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE060:  C.V. Jai Kumar
    INSERT INTO users (email, role, is_active) VALUES ('facece060@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE060', 'C.V.', 'Jai Kumar', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece060@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE061:  V. Anji Kumar
    INSERT INTO users (email, role, is_active) VALUES ('facece061@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE061', 'V.', 'Anji Kumar', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece061@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE062:  Vijaya Durga
    INSERT INTO users (email, role, is_active) VALUES ('facece062@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE062', 'Vijaya', 'Durga', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece062@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE063:  M. Francies
    INSERT INTO users (email, role, is_active) VALUES ('facece063@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE063', 'M.', 'Francies', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece063@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE064:  Babu Rajak Shaik
    INSERT INTO users (email, role, is_active) VALUES ('facece064@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE064', 'Babu', 'Rajak Shaik', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece064@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE065:  Lakshmi Devarakonda
    INSERT INTO users (email, role, is_active) VALUES ('facece065@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE065', 'Lakshmi', 'Devarakonda', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece065@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACECE066:  Venketeswararao Venturumilli
    INSERT INTO users (email, role, is_active) VALUES ('facece066@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACECE066', 'Venketeswararao', 'Venturumilli', 'ECE',
        'Assistant Professor', 'M.Tech', 'ECE', 'facece066@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

END $$;

-- ===== IT Faculty: 15 =====
DO $$
DECLARE
    uid UUID;
BEGIN

    -- FACIT001:  Battula Sowjanya
    INSERT INTO users (email, role, is_active) VALUES ('facit001@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACIT001', 'Battula', 'Sowjanya', 'IT',
        'Assistant Professor', 'M.Tech', 'CSE', 'facit001@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACIT002:  Patchala Srinivas
    INSERT INTO users (email, role, is_active) VALUES ('facit002@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACIT002', 'Patchala', 'Srinivas', 'IT',
        'Assistant Professor', 'M.Tech', 'CSE', 'facit002@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACIT003:  Garnepudi Sravanilatha
    INSERT INTO users (email, role, is_active) VALUES ('facit003@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACIT003', 'Garnepudi', 'Sravanilatha', 'IT',
        'Assistant Professor', 'M.Tech', 'CSE', 'facit003@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACIT004:  Usha Cherukuri
    INSERT INTO users (email, role, is_active) VALUES ('facit004@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACIT004', 'Usha', 'Cherukuri', 'IT',
        'Assistant Professor', 'M.Tech', 'CSE', 'facit004@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACIT005:  Purnima Annpureddy
    INSERT INTO users (email, role, is_active) VALUES ('facit005@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACIT005', 'Purnima', 'Annpureddy', 'IT',
        'Assistant Professor', 'M.Tech', 'CSE', 'facit005@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACIT006:  Konjeti Gayathri
    INSERT INTO users (email, role, is_active) VALUES ('facit006@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACIT006', 'Konjeti', 'Gayathri', 'IT',
        'Assistant Professor', 'M.Tech', 'CSE', 'facit006@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACIT007:  Dutta Devika
    INSERT INTO users (email, role, is_active) VALUES ('facit007@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACIT007', 'Dutta', 'Devika', 'IT',
        'Assistant Professor', 'M.Tech', 'CSE', 'facit007@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACIT008:  Srinivas Reddy Palle
    INSERT INTO users (email, role, is_active) VALUES ('facit008@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACIT008', 'Srinivas', 'Reddy Palle', 'IT',
        'Professor', 'Ph.D', 'CSE', 'facit008@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACIT009:  Kota Triveni Deepthi
    INSERT INTO users (email, role, is_active) VALUES ('facit009@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACIT009', 'Kota', 'Triveni Deepthi', 'IT',
        'Assistant Professor', 'M.Tech', 'CSE', 'facit009@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACIT010:  Kammili Jagan Mohan
    INSERT INTO users (email, role, is_active) VALUES ('facit010@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACIT010', 'Kammili', 'Jagan Mohan', 'IT',
        'Professor', 'Ph.D', 'CSE', 'facit010@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACIT011:  Desu Sabari Girinath Babu
    INSERT INTO users (email, role, is_active) VALUES ('facit011@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACIT011', 'Desu', 'Sabari Girinath Babu', 'IT',
        'Assistant Professor', 'M.Tech', 'CSE', 'facit011@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACIT012:  Meda Mallikarjuna Rao
    INSERT INTO users (email, role, is_active) VALUES ('facit012@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACIT012', 'Meda', 'Mallikarjuna Rao', 'IT',
        'Assistant Professor', 'M.Tech', 'CSE', 'facit012@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACIT013:  Nadaparaju Durga Rao
    INSERT INTO users (email, role, is_active) VALUES ('facit013@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACIT013', 'Nadaparaju', 'Durga Rao', 'IT',
        'Assistant Professor', 'M.Tech', 'CSE', 'facit013@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACIT014:  Eduru Nagarjuna
    INSERT INTO users (email, role, is_active) VALUES ('facit014@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACIT014', 'Eduru', 'Nagarjuna', 'IT',
        'Professor', 'Ph.D', 'CSE', 'facit014@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

    -- FACIT015:  Gangapatnam Srividya
    INSERT INTO users (email, role, is_active) VALUES ('facit015@nriit.ac.in', 'faculty', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    
    INSERT INTO faculty_profiles (
        user_id, employee_id, first_name, last_name, dept_code, 
        designation, qualification, specialization, email, phone,
        date_of_joining, is_active
    ) VALUES (
        uid, 'FACIT015', 'Gangapatnam', 'Srividya', 'IT',
        'Professor', 'Ph.D', 'CSE', 'facit015@nriit.ac.in', '9999999999',
        '2020-01-01', true
    ) ON CONFLICT (employee_id) DO UPDATE SET 
        first_name = EXCLUDED.first_name,
        last_name = EXCLUDED.last_name,
        designation = EXCLUDED.designation;

END $$;

-- SUMMARY: 128 faculty imported
