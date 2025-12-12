-- ===========================================
-- NRIIT REAL DATA IMPORT
-- Generated: 2025-12-12 15:47
-- Total Students: 3598
-- ===========================================

-- FINAL 10 NRIIT DEPARTMENTS
INSERT INTO departments (code, name, short_name, is_active) VALUES
('CSE', 'Computer Science and Engineering', 'CSE', true),
('CSE-DS', 'CSE - Data Science', 'CSE-DS', true),
('ECE', 'Electronics and Communication Engineering', 'ECE', true),
('CSE-AI', 'CSE - Artificial Intelligence & ML', 'CSE-AI', true),
('IT', 'Information Technology', 'IT', true),
('EVT', 'Electric Vehicle Technology', 'EVT', true),
('CIVIL', 'Civil Engineering', 'CIVIL', true),
('BSH', 'Humanities and Sciences', 'BSH', true),
('MBA', 'Master of Business Administration', 'MBA', true),
('MCA', 'Master of Computer Applications', 'MCA', true)
ON CONFLICT (code) DO NOTHING;

-- Ensure batches exist
INSERT INTO academic_batches (batch_year, batch_name, is_current) VALUES
(2025, '2025-29', true), (2024, '2024-28', false), (2023, '2023-27', false), 
(2022, '2022-26', false), (2021, '2021-25', false)
ON CONFLICT DO NOTHING;


-- ===== CIVIL: 28 students =====
DO $$
DECLARE
    uid UUID;
    bid UUID;
BEGIN

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0101@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0101', '25KP1A0101', 'Devireddy', 'Ajay', 'CIVIL', bid, 1, 'A', '25kp1a0101@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0102@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0102', '25KP1A0102', 'Gunja', 'Manikanta Prasad', 'CIVIL', bid, 1, 'A', '25kp1a0102@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0103@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0103', '25KP1A0103', 'Meesala', 'Gopichand', 'CIVIL', bid, 1, 'A', '25kp1a0103@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0104@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0104', '25KP1A0104', 'Pattan', 'Basha', 'CIVIL', bid, 1, 'A', '25kp1a0104@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0105@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0105', '25KP1A0105', 'Saripudi', 'Nikhila', 'CIVIL', bid, 1, 'A', '25kp1a0105@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0106@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0106', '25KP1A0106', 'Thota', 'Siva', 'CIVIL', bid, 1, 'A', '25kp1a0106@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0107@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0107', '25KP1A0107', 'Vavilala', 'Chandu', 'CIVIL', bid, 1, 'A', '25kp1a0107@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0108@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0108', '25KP1A0108', 'Veerayapalem', 'Karthik', 'CIVIL', bid, 1, 'A', '25kp1a0108@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0101@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0101', '24KP1A0101', 'Banavath', 'Manisankar Naik', 'CIVIL', bid, 4, 'A', '24kp1a0101@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0102@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0102', '24KP1A0102', 'Bethala', 'Shyam Dinesh', 'CIVIL', bid, 4, 'A', '24kp1a0102@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0103@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0103', '24KP1A0103', 'Chatla', 'Dani', 'CIVIL', bid, 4, 'A', '24kp1a0103@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0104@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0104', '24KP1A0104', 'Gangavarapu', 'Devaraj Kumar', 'CIVIL', bid, 4, 'A', '24kp1a0104@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0105@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0105', '24KP1A0105', 'Kalisetty', 'Charan Kumar', 'CIVIL', bid, 4, 'A', '24kp1a0105@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0106@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0106', '24KP1A0106', 'Mukkapati', 'Naga Raju', 'CIVIL', bid, 4, 'A', '24kp1a0106@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0107@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0107', '24KP1A0107', 'Orsu', 'Prem Kumar', 'CIVIL', bid, 4, 'A', '24kp1a0107@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0108@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0108', '24KP1A0108', 'Sanneboina', 'Suresh', 'CIVIL', bid, 4, 'A', '24kp1a0108@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0109@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0109', '24KP1A0109', 'Thota', 'Teja', 'CIVIL', bid, 4, 'A', '24kp1a0109@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0101@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0101', '25KP5A0101', 'Bandaru', 'Vijay Kumar', 'CIVIL', bid, 4, 'A', '25kp5a0101@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0102@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0102', '25KP5A0102', 'Gandhudi', 'Adarsh', 'CIVIL', bid, 4, 'A', '25kp5a0102@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0103@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0103', '25KP5A0103', 'Gunna', 'Leelamohan', 'CIVIL', bid, 4, 'A', '25kp5a0103@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0104@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0104', '25KP5A0104', 'Moddu', 'Jaipaul', 'CIVIL', bid, 4, 'A', '25kp5a0104@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0105@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0105', '25KP5A0105', 'Pari', 'Manoj', 'CIVIL', bid, 4, 'A', '25kp5a0105@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0101@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0101', '23KP1A0101', 'Chakarijamula', 'Mahesh Babu', 'CIVIL', bid, 4, 'A', '23kp1a0101@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0102@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0102', '23KP1A0102', 'Parsam', 'Naresh', 'CIVIL', bid, 4, 'A', '23kp1a0102@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0103@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0103', '23KP1A0103', 'Thirumala', 'Nagaraju', 'CIVIL', bid, 4, 'A', '23kp1a0103@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp5a0101@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP5A0101', '24KP5A0101', 'Dharmana', 'Ayyappa', 'CIVIL', bid, 4, 'A', '24kp5a0101@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp5a0102@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP5A0102', '24KP5A0102', 'Vinnakota', 'Naga Venkata Ganesh', 'CIVIL', bid, 4, 'A', '24kp5a0102@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0104@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0104', '23KP1A0104', 'Thirumala', 'Sreenu', 'CIVIL', bid, 4, 'A', '23kp1a0104@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

END $$;

-- ===== CSE: 1034 students =====
DO $$
DECLARE
    uid UUID;
    bid UUID;
BEGIN

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0501@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0501', '25KP1A0501', 'Adepu', 'Manasa Pranavi', 'CSE', bid, 1, 'A', '25kp1a0501@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0502@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0502', '25KP1A0502', 'Akula', 'Pujitha', 'CSE', bid, 1, 'A', '25kp1a0502@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0503@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0503', '25KP1A0503', 'Allam', 'Yashwanth Reddy', 'CSE', bid, 1, 'A', '25kp1a0503@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0504@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0504', '25KP1A0504', 'Allamsetti', 'Lakshmi Prasanna', 'CSE', bid, 1, 'A', '25kp1a0504@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0505@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0505', '25KP1A0505', 'Ambadipudi', 'Yestheramma', 'CSE', bid, 1, 'A', '25kp1a0505@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0506@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0506', '25KP1A0506', 'Ambati', 'Nanda Kishore Reddy', 'CSE', bid, 1, 'A', '25kp1a0506@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0507@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0507', '25KP1A0507', 'Amulothu', 'Bhargav Naidu', 'CSE', bid, 1, 'A', '25kp1a0507@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0508@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0508', '25KP1A0508', 'Ande', 'Hasmika', 'CSE', bid, 1, 'A', '25kp1a0508@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0509@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0509', '25KP1A0509', 'Angadi', 'Harsha Vardhan', 'CSE', bid, 1, 'A', '25kp1a0509@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0510@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0510', '25KP1A0510', 'Anumula', 'Venkata Naga Sruthi', 'CSE', bid, 1, 'A', '25kp1a0510@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0511@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0511', '25KP1A0511', 'Anupoju', 'Jahnav Ganga Phani Sanjith', 'CSE', bid, 1, 'A', '25kp1a0511@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0512@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0512', '25KP1A0512', 'Arepalli', 'Ravi Kiran', 'CSE', bid, 1, 'A', '25kp1a0512@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0513@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0513', '25KP1A0513', 'Arigela', 'Mani', 'CSE', bid, 1, 'A', '25kp1a0513@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0514@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0514', '25KP1A0514', 'Atchi', 'Dhana Priya', 'CSE', bid, 1, 'A', '25kp1a0514@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0515@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0515', '25KP1A0515', 'Atla', 'Bhargavi', 'CSE', bid, 1, 'A', '25kp1a0515@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0516@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0516', '25KP1A0516', 'Avuluri', 'Ramanjaneya Reddy', 'CSE', bid, 1, 'A', '25kp1a0516@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0517@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0517', '25KP1A0517', 'Baddula', 'Venkata Sai', 'CSE', bid, 1, 'A', '25kp1a0517@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0518@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0518', '25KP1A0518', 'Balantha', 'Chinna Sathesh', 'CSE', bid, 1, 'A', '25kp1a0518@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0519@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0519', '25KP1A0519', 'Balusupati', 'Venkataravamma', 'CSE', bid, 1, 'A', '25kp1a0519@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0520@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0520', '25KP1A0520', 'Banaganapalli', 'Khaja Uddin', 'CSE', bid, 1, 'A', '25kp1a0520@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0521@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0521', '25KP1A0521', 'Bandaru', 'Abhinash', 'CSE', bid, 1, 'A', '25kp1a0521@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0522@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0522', '25KP1A0522', 'Bandaru', 'Srinadh', 'CSE', bid, 1, 'A', '25kp1a0522@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0523@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0523', '25KP1A0523', 'Bandi', 'Nanda Kishore', 'CSE', bid, 1, 'A', '25kp1a0523@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0524@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0524', '25KP1A0524', 'Bandikalla', 'Adbutha', 'CSE', bid, 1, 'A', '25kp1a0524@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0525@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0525', '25KP1A0525', 'Banka', 'Akshaya', 'CSE', bid, 1, 'A', '25kp1a0525@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0526@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0526', '25KP1A0526', 'Bannaravuri', 'Sridhatrika', 'CSE', bid, 1, 'A', '25kp1a0526@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0527@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0527', '25KP1A0527', 'Barma', 'Jaya Surendra Kumar', 'CSE', bid, 1, 'A', '25kp1a0527@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0528@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0528', '25KP1A0528', 'Barma', 'Raghava', 'CSE', bid, 1, 'A', '25kp1a0528@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0529@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0529', '25KP1A0529', 'Bathula', 'Baji Prasanna', 'CSE', bid, 1, 'A', '25kp1a0529@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0530@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0530', '25KP1A0530', 'Bellamkonda', 'Ankaiah', 'CSE', bid, 1, 'A', '25kp1a0530@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0531@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0531', '25KP1A0531', 'Bellamkonda', 'Pradeep', 'CSE', bid, 1, 'A', '25kp1a0531@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0532@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0532', '25KP1A0532', 'Bijjam', 'Thirupathi Reddy', 'CSE', bid, 1, 'A', '25kp1a0532@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0533@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0533', '25KP1A0533', 'Boddapati', 'Bhanu Sankar', 'CSE', bid, 1, 'A', '25kp1a0533@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0534@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0534', '25KP1A0534', 'Boddu', 'Karunya', 'CSE', bid, 1, 'A', '25kp1a0534@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0535@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0535', '25KP1A0535', 'Boggavarapu', 'Harish', 'CSE', bid, 1, 'A', '25kp1a0535@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0536@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0536', '25KP1A0536', 'Bolisetty', 'Rutwik', 'CSE', bid, 1, 'A', '25kp1a0536@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0537@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0537', '25KP1A0537', 'Bolligarla', 'Venkata Bhargava', 'CSE', bid, 1, 'A', '25kp1a0537@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0538@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0538', '25KP1A0538', 'Bommisetty', 'Simhadri Naidu', 'CSE', bid, 1, 'A', '25kp1a0538@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0539@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0539', '25KP1A0539', 'Bonala', 'Tharunkumar', 'CSE', bid, 1, 'A', '25kp1a0539@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0540@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0540', '25KP1A0540', 'Bonam', 'Vishnu Kumar', 'CSE', bid, 1, 'A', '25kp1a0540@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0541@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0541', '25KP1A0541', 'Bontha', 'Akhil', 'CSE', bid, 1, 'A', '25kp1a0541@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0542@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0542', '25KP1A0542', 'Botla', 'Srikanth', 'CSE', bid, 1, 'A', '25kp1a0542@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0543@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0543', '25KP1A0543', 'Budala', 'Akshaya Shanti', 'CSE', bid, 1, 'A', '25kp1a0543@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0544@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0544', '25KP1A0544', 'Budamcharla', 'Ganesh', 'CSE', bid, 1, 'A', '25kp1a0544@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0545@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0545', '25KP1A0545', 'Bukkaraju', 'Venkat Sesha Jagannadhabala Teja', 'CSE', bid, 1, 'A', '25kp1a0545@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0546@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0546', '25KP1A0546', 'Chakrakoti', 'Rohith Krishna Manikanta', 'CSE', bid, 1, 'A', '25kp1a0546@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0547@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0547', '25KP1A0547', 'Challa', 'Jaya Sri', 'CSE', bid, 1, 'A', '25kp1a0547@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0548@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0548', '25KP1A0548', 'Chandaka', 'Sirisha', 'CSE', bid, 1, 'A', '25kp1a0548@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0549@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0549', '25KP1A0549', 'Chaparala', 'Rohith Chowdary', 'CSE', bid, 1, 'A', '25kp1a0549@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0550@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0550', '25KP1A0550', 'Chattu', 'Sri Pavan Kumar', 'CSE', bid, 1, 'A', '25kp1a0550@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0551@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0551', '25KP1A0551', 'Chattu', 'Sri Satya Sai', 'CSE', bid, 1, 'A', '25kp1a0551@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0552@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0552', '25KP1A0552', 'Chavala', 'Premanjali', 'CSE', bid, 1, 'A', '25kp1a0552@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0553@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0553', '25KP1A0553', 'Chegireddy', 'Akhileswara Reddy', 'CSE', bid, 1, 'A', '25kp1a0553@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0554@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0554', '25KP1A0554', 'Chennamsetty', 'Spandana', 'CSE', bid, 1, 'A', '25kp1a0554@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0555@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0555', '25KP1A0555', 'Chennareddy', 'Sanjeeva Reddy', 'CSE', bid, 1, 'A', '25kp1a0555@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0556@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0556', '25KP1A0556', 'Chennu', 'Bhanu Teja', 'CSE', bid, 1, 'A', '25kp1a0556@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0557@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0557', '25KP1A0557', 'Chetharajupalli', 'Venkatesh', 'CSE', bid, 1, 'A', '25kp1a0557@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0558@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0558', '25KP1A0558', 'Chevula', 'Gowri Narendra', 'CSE', bid, 1, 'A', '25kp1a0558@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0559@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0559', '25KP1A0559', 'Chippada', 'Leela Prasad', 'CSE', bid, 1, 'A', '25kp1a0559@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0560@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0560', '25KP1A0560', 'Danaboina', 'Bhargav', 'CSE', bid, 1, 'A', '25kp1a0560@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0561@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0561', '25KP1A0561', 'Darsanala', 'Shanmukha Priya', 'CSE', bid, 1, 'B', '25kp1a0561@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0562@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0562', '25KP1A0562', 'Dasari', 'Hasini', 'CSE', bid, 1, 'B', '25kp1a0562@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0563@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0563', '25KP1A0563', 'Dasari', 'Hema', 'CSE', bid, 1, 'B', '25kp1a0563@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0564@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0564', '25KP1A0564', 'Devarakonda', 'Nagaraju', 'CSE', bid, 1, 'B', '25kp1a0564@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0565@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0565', '25KP1A0565', 'Devarapalli', 'Prasanna Kumar', 'CSE', bid, 1, 'B', '25kp1a0565@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0566@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0566', '25KP1A0566', 'Devathoti', 'Immaniyelu', 'CSE', bid, 1, 'B', '25kp1a0566@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0567@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0567', '25KP1A0567', 'Devavarapu', 'Sirisha', 'CSE', bid, 1, 'B', '25kp1a0567@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0568@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0568', '25KP1A0568', 'Dharmarajula', 'Siva Sankar', 'CSE', bid, 1, 'B', '25kp1a0568@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0569@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0569', '25KP1A0569', 'Dokku', 'Manoj Kumar', 'CSE', bid, 1, 'B', '25kp1a0569@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0570@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0570', '25KP1A0570', 'Eeda', 'Chaitanya', 'CSE', bid, 1, 'B', '25kp1a0570@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0571@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0571', '25KP1A0571', 'Eerthineni', 'Rajeswari', 'CSE', bid, 1, 'B', '25kp1a0571@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0572@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0572', '25KP1A0572', 'Ettala', 'Komala Deepthi', 'CSE', bid, 1, 'B', '25kp1a0572@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0573@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0573', '25KP1A0573', 'Gaddam', 'Bharath Kumar Naidu', 'CSE', bid, 1, 'B', '25kp1a0573@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0574@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0574', '25KP1A0574', 'Gaddam', 'Parimala', 'CSE', bid, 1, 'B', '25kp1a0574@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0575@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0575', '25KP1A0575', 'Gadde', 'Jayanth', 'CSE', bid, 1, 'B', '25kp1a0575@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0576@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0576', '25KP1A0576', 'Gadiparthi', 'Varun', 'CSE', bid, 1, 'B', '25kp1a0576@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0577@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0577', '25KP1A0577', 'Gajja', 'Naveen Kumar', 'CSE', bid, 1, 'B', '25kp1a0577@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0578@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0578', '25KP1A0578', 'Gajula', 'Navya', 'CSE', bid, 1, 'B', '25kp1a0578@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0579@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0579', '25KP1A0579', 'Galiboina', 'Geethanjali', 'CSE', bid, 1, 'B', '25kp1a0579@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0580@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0580', '25KP1A0580', 'Galla', 'Leela Venkata Subramanyam', 'CSE', bid, 1, 'B', '25kp1a0580@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0581@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0581', '25KP1A0581', 'Ganji', 'Gopaiah', 'CSE', bid, 1, 'B', '25kp1a0581@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0582@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0582', '25KP1A0582', 'Gannamaneni', 'Jaswanth', 'CSE', bid, 1, 'B', '25kp1a0582@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0583@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0583', '25KP1A0583', 'Ganta', 'Bharath', 'CSE', bid, 1, 'B', '25kp1a0583@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0584@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0584', '25KP1A0584', 'Ganta', 'Narendra', 'CSE', bid, 1, 'B', '25kp1a0584@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0585@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0585', '25KP1A0585', 'Ganta', 'Sravana Sandhya', 'CSE', bid, 1, 'B', '25kp1a0585@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0586@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0586', '25KP1A0586', 'Gayathri', 'Devalla', 'CSE', bid, 1, 'B', '25kp1a0586@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0587@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0587', '25KP1A0587', 'Gogulapati', 'Bala Bharathi', 'CSE', bid, 1, 'B', '25kp1a0587@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0588@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0588', '25KP1A0588', 'Golla', 'Sumanth', 'CSE', bid, 1, 'B', '25kp1a0588@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0589@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0589', '25KP1A0589', 'Gonuguntla', 'Chendu', 'CSE', bid, 1, 'B', '25kp1a0589@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0590@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0590', '25KP1A0590', 'Gonuguntla', 'Rajesh', 'CSE', bid, 1, 'B', '25kp1a0590@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0591@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0591', '25KP1A0591', 'Gowraboina', 'Ganesh', 'CSE', bid, 1, 'B', '25kp1a0591@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0592@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0592', '25KP1A0592', 'Guda', 'Narendra Reddy', 'CSE', bid, 1, 'B', '25kp1a0592@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0593@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0593', '25KP1A0593', 'Gude', 'Abhishek', 'CSE', bid, 1, 'B', '25kp1a0593@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0594@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0594', '25KP1A0594', 'Gudi', 'Harika', 'CSE', bid, 1, 'B', '25kp1a0594@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0595@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0595', '25KP1A0595', 'Guduru', 'Sravanthi', 'CSE', bid, 1, 'B', '25kp1a0595@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0596@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0596', '25KP1A0596', 'Gumma', 'Gireesh', 'CSE', bid, 1, 'B', '25kp1a0596@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0597@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0597', '25KP1A0597', 'Gunturu', 'Ankamma Rao', 'CSE', bid, 1, 'B', '25kp1a0597@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0598@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0598', '25KP1A0598', 'Indela', 'Maitri', 'CSE', bid, 1, 'B', '25kp1a0598@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0599@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0599', '25KP1A0599', 'Jagannadham', 'Hari Raghu Ram', 'CSE', bid, 1, 'B', '25kp1a0599@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05a0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05A0', '25KP1A05A0', 'Jaganti', 'Naga Brahmendra', 'CSE', bid, 1, 'B', '25kp1a05a0@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05a1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05A1', '25KP1A05A1', 'Jonnalagadda', 'Karthik', 'CSE', bid, 1, 'B', '25kp1a05a1@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05a2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05A2', '25KP1A05A2', 'Jorige', 'Kavya Sri', 'CSE', bid, 1, 'B', '25kp1a05a2@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05a3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05A3', '25KP1A05A3', 'Kakarla', 'Venkata Sameera', 'CSE', bid, 1, 'B', '25kp1a05a3@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05a4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05A4', '25KP1A05A4', 'Kakarlapudi', 'Sravya', 'CSE', bid, 1, 'B', '25kp1a05a4@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05a5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05A5', '25KP1A05A5', 'Kaku', 'Vamsi', 'CSE', bid, 1, 'B', '25kp1a05a5@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05a6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05A6', '25KP1A05A6', 'Kalle', 'Sivanandu', 'CSE', bid, 1, 'B', '25kp1a05a6@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05a7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05A7', '25KP1A05A7', 'Kamineni', 'Akhil Sai', 'CSE', bid, 1, 'B', '25kp1a05a7@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05a8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05A8', '25KP1A05A8', 'Kancharla', 'Pavani', 'CSE', bid, 1, 'B', '25kp1a05a8@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05a9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05A9', '25KP1A05A9', 'Kancherla', 'Prasanth', 'CSE', bid, 1, 'B', '25kp1a05a9@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05b0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05B0', '25KP1A05B0', 'Kandru', 'Anushka', 'CSE', bid, 1, 'B', '25kp1a05b0@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05b1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05B1', '25KP1A05B1', 'Kanigiri', 'Lakshminarayana', 'CSE', bid, 1, 'B', '25kp1a05b1@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05b2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05B2', '25KP1A05B2', 'Kankanala', 'Venkata Lakshmi Yaswanth Kumar', 'CSE', bid, 1, 'B', '25kp1a05b2@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05b3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05B3', '25KP1A05B3', 'Karri', 'Vagdevi', 'CSE', bid, 1, 'B', '25kp1a05b3@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05b4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05B4', '25KP1A05B4', 'Kasamneni', 'Venkata Sai Pavan', 'CSE', bid, 1, 'B', '25kp1a05b4@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05b5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05B5', '25KP1A05B5', 'Katta', 'Jagadeesh', 'CSE', bid, 1, 'B', '25kp1a05b5@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05b6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05B6', '25KP1A05B6', 'Kattepogu', 'Dhanush', 'CSE', bid, 1, 'B', '25kp1a05b6@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05b7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05B7', '25KP1A05B7', 'Kodali', 'Purna Siva Naga Raju', 'CSE', bid, 1, 'B', '25kp1a05b7@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05b8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05B8', '25KP1A05B8', 'Kodirekka', 'Abhilash', 'CSE', bid, 1, 'B', '25kp1a05b8@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05b9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05B9', '25KP1A05B9', 'Kodirekka', 'Sailaja', 'CSE', bid, 1, 'B', '25kp1a05b9@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05c0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05C0', '25KP1A05C0', 'Kokkanda', 'Pavan Kumar', 'CSE', bid, 1, 'B', '25kp1a05c0@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05c1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05C1', '25KP1A05C1', 'Kolakaluri', 'Narendra', 'CSE', bid, 1, 'C', '25kp1a05c1@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05c2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05C2', '25KP1A05C2', 'Kolhe', 'Nikita Dilip', 'CSE', bid, 1, 'C', '25kp1a05c2@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05c3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05C3', '25KP1A05C3', 'Kolli', 'Sai Hemanth', 'CSE', bid, 1, 'C', '25kp1a05c3@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05c4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05C4', '25KP1A05C4', 'Kommagoni', 'Nikhil Mallesh', 'CSE', bid, 1, 'C', '25kp1a05c4@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05c5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05C5', '25KP1A05C5', 'Kommireddy', 'Naga Durga Asish', 'CSE', bid, 1, 'C', '25kp1a05c5@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05c6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05C6', '25KP1A05C6', 'Kondapaneni', 'Santosh', 'CSE', bid, 1, 'C', '25kp1a05c6@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05c7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05C7', '25KP1A05C7', 'Kondaveeti', 'Shaik Mariya Sulthana', 'CSE', bid, 1, 'C', '25kp1a05c7@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05c8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05C8', '25KP1A05C8', 'Koppala', 'Lakshmi Manohar Reddy', 'CSE', bid, 1, 'C', '25kp1a05c8@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05c9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05C9', '25KP1A05C9', 'Koppala', 'Ram Mohan Reddy', 'CSE', bid, 1, 'C', '25kp1a05c9@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05d0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05D0', '25KP1A05D0', 'Kopparthi', 'Thrillinga Teja Raju', 'CSE', bid, 1, 'C', '25kp1a05d0@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05d1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05D1', '25KP1A05D1', 'Koppula', 'Bharath Simha Reddy', 'CSE', bid, 1, 'C', '25kp1a05d1@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05d2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05D2', '25KP1A05D2', 'Kota', 'Dimpuna Dhanalakshmi', 'CSE', bid, 1, 'C', '25kp1a05d2@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05d3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05D3', '25KP1A05D3', 'Kotaru', 'Bharath', 'CSE', bid, 1, 'C', '25kp1a05d3@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05d4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05D4', '25KP1A05D4', 'Kothi', 'Sanni', 'CSE', bid, 1, 'C', '25kp1a05d4@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05d5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05D5', '25KP1A05D5', 'Kottapalli', 'Abhilash', 'CSE', bid, 1, 'C', '25kp1a05d5@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05d6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05D6', '25KP1A05D6', 'Kumbha', 'Ajay Kumar', 'CSE', bid, 1, 'C', '25kp1a05d6@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05d7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05D7', '25KP1A05D7', 'Lagadapati', 'Manoj Kumar', 'CSE', bid, 1, 'C', '25kp1a05d7@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05d8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05D8', '25KP1A05D8', 'Lakkanaboina', 'Sravani', 'CSE', bid, 1, 'C', '25kp1a05d8@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05d9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05D9', '25KP1A05D9', 'Lakumarapu', 'Nikhileswarao', 'CSE', bid, 1, 'C', '25kp1a05d9@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05e0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05E0', '25KP1A05E0', 'Landa', 'Devi Prasad', 'CSE', bid, 1, 'C', '25kp1a05e0@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05e1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05E1', '25KP1A05E1', 'Lingala', 'Santosh', 'CSE', bid, 1, 'C', '25kp1a05e1@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05e2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05E2', '25KP1A05E2', 'Maccha', 'Narasimha', 'CSE', bid, 1, 'C', '25kp1a05e2@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05e3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05E3', '25KP1A05E3', 'Madduri', 'Vamsi', 'CSE', bid, 1, 'C', '25kp1a05e3@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05e4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05E4', '25KP1A05E4', 'Majeti', 'Abhinava Naga Datta Sai', 'CSE', bid, 1, 'C', '25kp1a05e4@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05e5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05E5', '25KP1A05E5', 'Makkena', 'Yaswanth Kumar', 'CSE', bid, 1, 'C', '25kp1a05e5@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05e6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05E6', '25KP1A05E6', 'Malapati', 'Bhanu Prasad', 'CSE', bid, 1, 'C', '25kp1a05e6@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05e7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05E7', '25KP1A05E7', 'Malli', 'Siva Sankar', 'CSE', bid, 1, 'C', '25kp1a05e7@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05e8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05E8', '25KP1A05E8', 'Mallolu', 'Prudhvi Raj', 'CSE', bid, 1, 'C', '25kp1a05e8@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05e9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05E9', '25KP1A05E9', 'Manyam', 'Laila Hari Priyanka', 'CSE', bid, 1, 'C', '25kp1a05e9@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05f0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05F0', '25KP1A05F0', 'Marri', 'Mahesh Reddy', 'CSE', bid, 1, 'C', '25kp1a05f0@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05f1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05F1', '25KP1A05F1', 'Meda', 'Anusha', 'CSE', bid, 1, 'C', '25kp1a05f1@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05f2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05F2', '25KP1A05F2', 'Meda', 'Keerthana', 'CSE', bid, 1, 'C', '25kp1a05f2@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05f3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05F3', '25KP1A05F3', 'Medarametla', 'Mahideepika', 'CSE', bid, 1, 'C', '25kp1a05f3@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05f4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05F4', '25KP1A05F4', 'Meenugala', 'Vamsi', 'CSE', bid, 1, 'C', '25kp1a05f4@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05f5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05F5', '25KP1A05F5', 'Mekala', 'Karunakar', 'CSE', bid, 1, 'C', '25kp1a05f5@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05f6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05F6', '25KP1A05F6', 'Mekala', 'Sairam', 'CSE', bid, 1, 'C', '25kp1a05f6@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05f7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05F7', '25KP1A05F7', 'Melam', 'Vijay Kumar', 'CSE', bid, 1, 'C', '25kp1a05f7@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05f8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05F8', '25KP1A05F8', 'Merugu', 'Deepthi', 'CSE', bid, 1, 'C', '25kp1a05f8@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05f9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05F9', '25KP1A05F9', 'Minikanti', 'Areef', 'CSE', bid, 1, 'C', '25kp1a05f9@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05g0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05G0', '25KP1A05G0', 'Miriyala', 'Thushara Mohana Priya Royal', 'CSE', bid, 1, 'C', '25kp1a05g0@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05g1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05G1', '25KP1A05G1', 'Mogilipalepu', 'Vishnu Priya', 'CSE', bid, 1, 'C', '25kp1a05g1@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05g2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05G2', '25KP1A05G2', 'Morri', 'Venkata Sathish', 'CSE', bid, 1, 'C', '25kp1a05g2@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05g3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05G3', '25KP1A05G3', 'Motapothula', 'Srinadh', 'CSE', bid, 1, 'C', '25kp1a05g3@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05g4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05G4', '25KP1A05G4', 'Mudigonda', 'Mahendra', 'CSE', bid, 1, 'C', '25kp1a05g4@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05g5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05G5', '25KP1A05G5', 'Mukkarala', 'Venkata Anil Kumar', 'CSE', bid, 1, 'C', '25kp1a05g5@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05g6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05G6', '25KP1A05G6', 'Munaganti', 'Vishnu Vardhan', 'CSE', bid, 1, 'C', '25kp1a05g6@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05g7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05G7', '25KP1A05G7', 'Murikipudi', 'Poorna Venkatesh', 'CSE', bid, 1, 'C', '25kp1a05g7@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05g8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05G8', '25KP1A05G8', 'Muttineni', 'Pujitha', 'CSE', bid, 1, 'C', '25kp1a05g8@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05g9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05G9', '25KP1A05G9', 'Nadukuru', 'Sai Maha Rupa', 'CSE', bid, 1, 'C', '25kp1a05g9@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05h0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05H0', '25KP1A05H0', 'Nagalla', 'Naga Durga Kavya', 'CSE', bid, 1, 'C', '25kp1a05h0@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05h1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05H1', '25KP1A05H1', 'Nagandla', 'Aakasah', 'CSE', bid, 1, 'C', '25kp1a05h1@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05h2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05H2', '25KP1A05H2', 'Nagaraju', 'Supriya', 'CSE', bid, 1, 'C', '25kp1a05h2@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05h3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05H3', '25KP1A05H3', 'Nagendla', 'Manikanta', 'CSE', bid, 1, 'C', '25kp1a05h3@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05h4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05H4', '25KP1A05H4', 'Nagireddy', 'Manaswitha Reddy', 'CSE', bid, 1, 'C', '25kp1a05h4@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05h5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05H5', '25KP1A05H5', 'Nagrade', 'Ganesh', 'CSE', bid, 1, 'C', '25kp1a05h5@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05h6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05H6', '25KP1A05H6', 'Nakka', 'Ganesh', 'CSE', bid, 1, 'C', '25kp1a05h6@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05h7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05H7', '25KP1A05H7', 'Nakka', 'Ravi Manikanta', 'CSE', bid, 1, 'C', '25kp1a05h7@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05h8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05H8', '25KP1A05H8', 'Nali', 'Rasagna', 'CSE', bid, 1, 'C', '25kp1a05h8@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05h9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05H9', '25KP1A05H9', 'Nallamothu', 'Lakshmi Mahesh Babu', 'CSE', bid, 1, 'C', '25kp1a05h9@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05i0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05I0', '25KP1A05I0', 'Naraboina', 'Sri Lakshmi', 'CSE', bid, 1, 'C', '25kp1a05i0@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05i1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05I1', '25KP1A05I1', 'Narendra', 'Tulasi', 'CSE', bid, 1, 'D', '25kp1a05i1@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05i2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05I2', '25KP1A05I2', 'Narra', 'Siva Naga Sathwika', 'CSE', bid, 1, 'D', '25kp1a05i2@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05i3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05I3', '25KP1A05I3', 'Nelapati', 'Sandeep Kumar', 'CSE', bid, 1, 'D', '25kp1a05i3@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05i4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05I4', '25KP1A05I4', 'Nidamarrui', 'Vamsi', 'CSE', bid, 1, 'D', '25kp1a05i4@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05i5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05I5', '25KP1A05I5', 'Nimmala', 'Tulasi', 'CSE', bid, 1, 'D', '25kp1a05i5@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05i6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05I6', '25KP1A05I6', 'Nosina', 'Raju', 'CSE', bid, 1, 'D', '25kp1a05i6@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05i7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05I7', '25KP1A05I7', 'Nuthalapati', 'Leela Prakash', 'CSE', bid, 1, 'D', '25kp1a05i7@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05i8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05I8', '25KP1A05I8', 'Ontipuli', 'Vinay', 'CSE', bid, 1, 'D', '25kp1a05i8@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05i9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05I9', '25KP1A05I9', 'Padala', 'Dinesh Reddy', 'CSE', bid, 1, 'D', '25kp1a05i9@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05j0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05J0', '25KP1A05J0', 'Pagadala', 'Charan Teja', 'CSE', bid, 1, 'D', '25kp1a05j0@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05j1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05J1', '25KP1A05J1', 'Pagadala', 'Jaswanth Reddy', 'CSE', bid, 1, 'D', '25kp1a05j1@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05j2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05J2', '25KP1A05J2', 'Pagadala', 'Maharaja', 'CSE', bid, 1, 'D', '25kp1a05j2@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05j3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05J3', '25KP1A05J3', 'Palikithala', 'Madhan Kumar', 'CSE', bid, 1, 'D', '25kp1a05j3@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05j4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05J4', '25KP1A05J4', 'Pallamaneni', 'Suresh', 'CSE', bid, 1, 'D', '25kp1a05j4@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05j5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05J5', '25KP1A05J5', 'Pallapu', 'Akhil Kumar', 'CSE', bid, 1, 'D', '25kp1a05j5@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05j6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05J6', '25KP1A05J6', 'Pallapu', 'Mohan', 'CSE', bid, 1, 'D', '25kp1a05j6@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05j7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05J7', '25KP1A05J7', 'Pallepogu', 'Shalem Raju', 'CSE', bid, 1, 'D', '25kp1a05j7@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05j8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05J8', '25KP1A05J8', 'Panithi', 'Pravalika', 'CSE', bid, 1, 'D', '25kp1a05j8@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05j9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05J9', '25KP1A05J9', 'Parimi', 'Navya', 'CSE', bid, 1, 'D', '25kp1a05j9@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05k0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05K0', '25KP1A05K0', 'Pemmasani', 'Sivaiah', 'CSE', bid, 1, 'D', '25kp1a05k0@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05k1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05K1', '25KP1A05K1', 'Penumala', 'Sudeep Babu', 'CSE', bid, 1, 'D', '25kp1a05k1@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05k2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05K2', '25KP1A05K2', 'Peramana', 'Naga Sasikanth', 'CSE', bid, 1, 'D', '25kp1a05k2@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05k3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05K3', '25KP1A05K3', 'Pidathala', 'Rangatharun', 'CSE', bid, 1, 'D', '25kp1a05k3@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05k4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05K4', '25KP1A05K4', 'Pirla', 'Gopi Chand', 'CSE', bid, 1, 'D', '25kp1a05k4@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05k5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05K5', '25KP1A05K5', 'Pokuri', 'Kusuma', 'CSE', bid, 1, 'D', '25kp1a05k5@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05k6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05K6', '25KP1A05K6', 'Polineni', 'Lavanya', 'CSE', bid, 1, 'D', '25kp1a05k6@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05k7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05K7', '25KP1A05K7', 'Poluri', 'M S N Sarvani', 'CSE', bid, 1, 'D', '25kp1a05k7@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05k8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05K8', '25KP1A05K8', 'Ponnapati', 'Susmitha', 'CSE', bid, 1, 'D', '25kp1a05k8@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05k9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05K9', '25KP1A05K9', 'Prathuri', 'Hemachandraveninath', 'CSE', bid, 1, 'D', '25kp1a05k9@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05l0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05L0', '25KP1A05L0', 'Pulibandla', 'Lalith Ananda Sai Manikanta', 'CSE', bid, 1, 'D', '25kp1a05l0@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05l1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05L1', '25KP1A05L1', 'Punja', 'Aravind Kumar', 'CSE', bid, 1, 'D', '25kp1a05l1@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05l2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05L2', '25KP1A05L2', 'Puppala', 'Sai Sanjay', 'CSE', bid, 1, 'D', '25kp1a05l2@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05l3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05L3', '25KP1A05L3', 'Rajamahendravarapu', 'Raju', 'CSE', bid, 1, 'D', '25kp1a05l3@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05l4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05L4', '25KP1A05L4', 'Ravilla', 'Naga Sai Tejesh', 'CSE', bid, 1, 'D', '25kp1a05l4@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05l5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05L5', '25KP1A05L5', 'Ravuri', 'Lakshman Naidu', 'CSE', bid, 1, 'D', '25kp1a05l5@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05l6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05L6', '25KP1A05L6', 'Ravuri', 'Sunitha', 'CSE', bid, 1, 'D', '25kp1a05l6@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05l7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05L7', '25KP1A05L7', 'Regati', 'Nandeeswara Reddy', 'CSE', bid, 1, 'D', '25kp1a05l7@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05l8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05L8', '25KP1A05L8', 'Sangabattula', 'Veeranjaneyulu', 'CSE', bid, 1, 'D', '25kp1a05l8@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05l9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05L9', '25KP1A05L9', 'Sangala', 'Anilkumar', 'CSE', bid, 1, 'D', '25kp1a05l9@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05m0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05M0', '25KP1A05M0', 'Sankarasetti', 'Naveena', 'CSE', bid, 1, 'D', '25kp1a05m0@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05m1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05M1', '25KP1A05M1', 'Sanyada', 'Geethika', 'CSE', bid, 1, 'D', '25kp1a05m1@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05m2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05M2', '25KP1A05M2', 'Satuluri', 'Vennela', 'CSE', bid, 1, 'D', '25kp1a05m2@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05m3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05M3', '25KP1A05M3', 'Sayed', 'Shadulla', 'CSE', bid, 1, 'D', '25kp1a05m3@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05m4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05M4', '25KP1A05M4', 'Seelamneni', 'Chaitanya Ganesh', 'CSE', bid, 1, 'D', '25kp1a05m4@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05m5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05M5', '25KP1A05M5', 'Shaik', 'Ibrahim', 'CSE', bid, 1, 'D', '25kp1a05m5@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05m6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05M6', '25KP1A05M6', 'Shaik', 'John Shaida', 'CSE', bid, 1, 'D', '25kp1a05m6@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05m7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05M7', '25KP1A05M7', 'Shaik', 'Abdul Munaf', 'CSE', bid, 1, 'D', '25kp1a05m7@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05m8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05M8', '25KP1A05M8', 'Shaik', 'Afrin', 'CSE', bid, 1, 'D', '25kp1a05m8@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05m9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05M9', '25KP1A05M9', 'Shaik', 'Chand Basha', 'CSE', bid, 1, 'D', '25kp1a05m9@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05n0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05N0', '25KP1A05N0', 'Shaik', 'Fareed Babu', 'CSE', bid, 1, 'D', '25kp1a05n0@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05n1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05N1', '25KP1A05N1', 'Shaik', 'Habeeba', 'CSE', bid, 1, 'D', '25kp1a05n1@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05n2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05N2', '25KP1A05N2', 'Shaik', 'Himam Khasim', 'CSE', bid, 1, 'D', '25kp1a05n2@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05n3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05N3', '25KP1A05N3', 'Shaik', 'Janbee', 'CSE', bid, 1, 'D', '25kp1a05n3@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05n4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05N4', '25KP1A05N4', 'Shaik', 'Khaja', 'CSE', bid, 1, 'D', '25kp1a05n4@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05n5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05N5', '25KP1A05N5', 'Shaik', 'Mamoor', 'CSE', bid, 1, 'D', '25kp1a05n5@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05n6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05N6', '25KP1A05N6', 'Bandaru', 'Prasanna Babu', 'CSE', bid, 1, 'D', '25kp1a05n6@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05n7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05N7', '25KP1A05N7', 'Shaik', 'Meera Shameema', 'CSE', bid, 1, 'D', '25kp1a05n7@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05n8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05N8', '25KP1A05N8', 'Shaik', 'Mohammad Asim', 'CSE', bid, 1, 'D', '25kp1a05n8@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05n9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05N9', '25KP1A05N9', 'Shaik', 'Mubeena', 'CSE', bid, 1, 'D', '25kp1a05n9@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05o0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05O0', '25KP1A05O0', 'Shaik', 'Munagodu Shabana', 'CSE', bid, 1, 'D', '25kp1a05o0@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05o1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05O1', '25KP1A05O1', 'Shaik', 'Muneera', 'CSE', bid, 1, 'A', '25kp1a05o1@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05o2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05O2', '25KP1A05O2', 'Shaik', 'Qhufran Alam', 'CSE', bid, 1, 'A', '25kp1a05o2@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05o3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05O3', '25KP1A05O3', 'Shaik', 'Roshan Jameera', 'CSE', bid, 1, 'A', '25kp1a05o3@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05o4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05O4', '25KP1A05O4', 'Shaik', 'Saidhu Hussain Bi', 'CSE', bid, 1, 'A', '25kp1a05o4@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05o5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05O5', '25KP1A05O5', 'Shaik', 'Sajida', 'CSE', bid, 1, 'A', '25kp1a05o5@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05o6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05O6', '25KP1A05O6', 'Shaik', 'Sameer', 'CSE', bid, 1, 'A', '25kp1a05o6@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05o7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05O7', '25KP1A05O7', 'Shaik', 'Shafikha Jamal', 'CSE', bid, 1, 'A', '25kp1a05o7@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05o8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05O8', '25KP1A05O8', 'Shaik', 'Shafiuddin', 'CSE', bid, 1, 'A', '25kp1a05o8@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05o9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05O9', '25KP1A05O9', 'Shaik', 'Shahin', 'CSE', bid, 1, 'A', '25kp1a05o9@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05p0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05P0', '25KP1A05P0', 'Shaik', 'Shahina', 'CSE', bid, 1, 'A', '25kp1a05p0@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05p1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05P1', '25KP1A05P1', 'Shaik', 'Sumera Farhen', 'CSE', bid, 1, 'A', '25kp1a05p1@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05p2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05P2', '25KP1A05P2', 'Shaik', 'Usman', 'CSE', bid, 1, 'A', '25kp1a05p2@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05p3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05P3', '25KP1A05P3', 'Siriki', 'Sevita', 'CSE', bid, 1, 'A', '25kp1a05p3@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05p4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05P4', '25KP1A05P4', 'Songa', 'Mahesh Babu', 'CSE', bid, 1, 'A', '25kp1a05p4@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05p5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05P5', '25KP1A05P5', 'Sripathi', 'Kumara Siva Naga Brahma Chari', 'CSE', bid, 1, 'A', '25kp1a05p5@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05p6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05P6', '25KP1A05P6', 'Sudalagunta', 'Deepak Kumar', 'CSE', bid, 1, 'A', '25kp1a05p6@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05p7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05P7', '25KP1A05P7', 'Suddhapalli', 'Akhil Babu', 'CSE', bid, 1, 'A', '25kp1a05p7@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05p8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05P8', '25KP1A05P8', 'Sudireddy', 'Trilokanadh Hanu', 'CSE', bid, 1, 'A', '25kp1a05p8@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05p9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05P9', '25KP1A05P9', 'Talla', 'Ashok', 'CSE', bid, 1, 'A', '25kp1a05p9@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05q0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05Q0', '25KP1A05Q0', 'Tammisetti', 'Dharani', 'CSE', bid, 1, 'A', '25kp1a05q0@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05q1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05Q1', '25KP1A05Q1', 'Tanikonda', 'Itamraju', 'CSE', bid, 1, 'A', '25kp1a05q1@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05q2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05Q2', '25KP1A05Q2', 'Thatikonda', 'Dhanusha', 'CSE', bid, 1, 'A', '25kp1a05q2@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05q3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05Q3', '25KP1A05Q3', 'Thippagudise', 'Ratnaraju', 'CSE', bid, 1, 'A', '25kp1a05q3@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05q4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05Q4', '25KP1A05Q4', 'Thorlikonda', 'Lakshmi Naga Manasa', 'CSE', bid, 1, 'A', '25kp1a05q4@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05q5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05Q5', '25KP1A05Q5', 'Thotakura', 'Ravindra', 'CSE', bid, 1, 'A', '25kp1a05q5@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05q6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05Q6', '25KP1A05Q6', 'Tulasi', 'Leela Prathap', 'CSE', bid, 1, 'A', '25kp1a05q6@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05q7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05Q7', '25KP1A05Q7', 'Tupakula', 'Gopichand', 'CSE', bid, 1, 'A', '25kp1a05q7@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05q8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05Q8', '25KP1A05Q8', 'Udatha', 'Amrutha Varshini', 'CSE', bid, 1, 'A', '25kp1a05q8@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05q9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05Q9', '25KP1A05Q9', 'Unnagiri', 'Srikanth', 'CSE', bid, 1, 'A', '25kp1a05q9@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05r0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05R0', '25KP1A05R0', 'Uppu', 'Sasi Kiran', 'CSE', bid, 1, 'A', '25kp1a05r0@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05r1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05R1', '25KP1A05R1', 'Uppugandla', 'Maneendra', 'CSE', bid, 1, 'A', '25kp1a05r1@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05r2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05R2', '25KP1A05R2', 'Ure', 'Neelaveni', 'CSE', bid, 1, 'A', '25kp1a05r2@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05r3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05R3', '25KP1A05R3', 'Uriya', 'Naga Spandana', 'CSE', bid, 1, 'A', '25kp1a05r3@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05r4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05R4', '25KP1A05R4', 'Vakkalagadda', 'Madhura Meenakshi', 'CSE', bid, 1, 'A', '25kp1a05r4@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05r5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05R5', '25KP1A05R5', 'Vallapuneni', 'Tejaswini', 'CSE', bid, 1, 'A', '25kp1a05r5@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05r6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05R6', '25KP1A05R6', 'Vanguri', 'Bhanuprasad', 'CSE', bid, 1, 'A', '25kp1a05r6@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05r7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05R7', '25KP1A05R7', 'Vankayalapati', 'Anjali', 'CSE', bid, 1, 'A', '25kp1a05r7@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05r8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05R8', '25KP1A05R8', 'Veeramreddy', 'Rasagna Reddy', 'CSE', bid, 1, 'A', '25kp1a05r8@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05r9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05R9', '25KP1A05R9', 'Velpula', 'Mersi', 'CSE', bid, 1, 'A', '25kp1a05r9@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05s0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05S0', '25KP1A05S0', 'Velpuri', 'Shanmuk Nath', 'CSE', bid, 1, 'A', '25kp1a05s0@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05s1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05S1', '25KP1A05S1', 'Vemulakonda', 'Chandrika', 'CSE', bid, 1, 'A', '25kp1a05s1@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05s2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05S2', '25KP1A05S2', 'Vinjamuri', 'Anil Kumar', 'CSE', bid, 1, 'A', '25kp1a05s2@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05s3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05S3', '25KP1A05S3', 'Vipparla', 'Sasidhar', 'CSE', bid, 1, 'A', '25kp1a05s3@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05s4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05S4', '25KP1A05S4', 'Yadavalli', 'Siva Rama Krishna', 'CSE', bid, 1, 'A', '25kp1a05s4@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05s5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05S5', '25KP1A05S5', 'Yadla', 'Satish Kumar', 'CSE', bid, 1, 'A', '25kp1a05s5@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05s6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05S6', '25KP1A05S6', 'Yalakapati', 'Viswasa Raju', 'CSE', bid, 1, 'A', '25kp1a05s6@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05s7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05S7', '25KP1A05S7', 'Yalamandala', 'Rajesh', 'CSE', bid, 1, 'A', '25kp1a05s7@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05s8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05S8', '25KP1A05S8', 'Yamana', 'Koushik Kumar', 'CSE', bid, 1, 'A', '25kp1a05s8@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05s9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05S9', '25KP1A05S9', 'Yarragorla', 'Jotsna Sri', 'CSE', bid, 1, 'A', '25kp1a05s9@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05t0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05T0', '25KP1A05T0', 'Yarramreddy', 'Lakshmi Narayana Reddy', 'CSE', bid, 1, 'A', '25kp1a05t0@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05t1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05T1', '25KP1A05T1', 'Yarrasingu', 'Kalpana', 'CSE', bid, 1, 'A', '25kp1a05t1@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05t2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05T2', '25KP1A05T2', 'Yeddula', 'Bala Charan Teja', 'CSE', bid, 1, 'A', '25kp1a05t2@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05t3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05T3', '25KP1A05T3', 'Yeluka', 'Dharani', 'CSE', bid, 1, 'A', '25kp1a05t3@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05t4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05T4', '25KP1A05T4', 'Yendluri', 'Vekata Sandeep', 'CSE', bid, 1, 'A', '25kp1a05t4@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a05t5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A05T5', '25KP1A05T5', 'Bairapaneni', 'Ram Sai', 'CSE', bid, 1, 'A', '25kp1a05t5@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0501@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0501', '24KP1A0501', 'Adduri', 'Jagadeesh', 'CSE', bid, 4, 'A', '24kp1a0501@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0502@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0502', '24KP1A0502', 'Amareswarapu', 'Lakshmi Poornima', 'CSE', bid, 4, 'A', '24kp1a0502@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0503@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0503', '24KP1A0503', 'Ammisetty', 'Venkateswarlu', 'CSE', bid, 4, 'A', '24kp1a0503@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0504@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0504', '24KP1A0504', 'Ammula', 'Megha Vardhan', 'CSE', bid, 4, 'A', '24kp1a0504@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0505@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0505', '24KP1A0505', 'Arepalli', 'Hema Sri', 'CSE', bid, 4, 'A', '24kp1a0505@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0506@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0506', '24KP1A0506', 'Arikatla', 'Mallikarjuna', 'CSE', bid, 4, 'A', '24kp1a0506@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0508@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0508', '24KP1A0508', 'Bandaru', 'Lazar', 'CSE', bid, 4, 'A', '24kp1a0508@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0509@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0509', '24KP1A0509', 'Bandlamudi', 'Dhanush', 'CSE', bid, 4, 'A', '24kp1a0509@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0510@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0510', '24KP1A0510', 'Bathinenti', 'Lalitha', 'CSE', bid, 4, 'A', '24kp1a0510@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0511@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0511', '24KP1A0511', 'Bathula', 'Sri Lakshmi', 'CSE', bid, 4, 'A', '24kp1a0511@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0512@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0512', '24KP1A0512', 'Battini', 'Venkata Sai', 'CSE', bid, 4, 'A', '24kp1a0512@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0513@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0513', '24KP1A0513', 'Bejawada', 'Manikumar', 'CSE', bid, 4, 'A', '24kp1a0513@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0514@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0514', '24KP1A0514', 'Berduri', 'Mallika', 'CSE', bid, 4, 'A', '24kp1a0514@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0515@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0515', '24KP1A0515', 'Bethapudi', 'Vijay Kumar', 'CSE', bid, 4, 'A', '24kp1a0515@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0516@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0516', '24KP1A0516', 'Bheemisetty', 'Showri Teja', 'CSE', bid, 4, 'A', '24kp1a0516@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0517@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0517', '24KP1A0517', 'Bhukya', 'Bhuvan Chandar', 'CSE', bid, 4, 'A', '24kp1a0517@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0518@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0518', '24KP1A0518', 'Bhupathi', 'Renuka Babu', 'CSE', bid, 4, 'A', '24kp1a0518@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0519@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0519', '24KP1A0519', 'Bijjam', 'Aswini', 'CSE', bid, 4, 'A', '24kp1a0519@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0520@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0520', '24KP1A0520', 'Bikki', 'Bhanu Prakash', 'CSE', bid, 4, 'A', '24kp1a0520@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0521@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0521', '24KP1A0521', 'Bikki', 'Rasagna', 'CSE', bid, 4, 'A', '24kp1a0521@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0522@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0522', '24KP1A0522', 'Bikki', 'Saida Raju', 'CSE', bid, 4, 'A', '24kp1a0522@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0523@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0523', '24KP1A0523', 'Bodupudi', 'Jhansi', 'CSE', bid, 4, 'A', '24kp1a0523@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0524@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0524', '24KP1A0524', 'Bojja', 'Kavya', 'CSE', bid, 4, 'A', '24kp1a0524@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0525@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0525', '24KP1A0525', 'Bollepalli', 'Suresh', 'CSE', bid, 4, 'A', '24kp1a0525@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0526@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0526', '24KP1A0526', 'Bongu', 'Ashok', 'CSE', bid, 4, 'A', '24kp1a0526@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0527@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0527', '24KP1A0527', 'Bonthu', 'Indrani', 'CSE', bid, 4, 'A', '24kp1a0527@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0528@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0528', '24KP1A0528', 'Boppuri', 'Lazar', 'CSE', bid, 4, 'A', '24kp1a0528@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0529@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0529', '24KP1A0529', 'Borugadda', 'Jaswanth', 'CSE', bid, 4, 'A', '24kp1a0529@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0530@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0530', '24KP1A0530', 'Borugadda', 'Santhi Priya', 'CSE', bid, 4, 'A', '24kp1a0530@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0531@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0531', '24KP1A0531', 'Bourothu', 'Swathi', 'CSE', bid, 4, 'A', '24kp1a0531@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0532@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0532', '24KP1A0532', 'Boyalla', 'Arthan Paul', 'CSE', bid, 4, 'A', '24kp1a0532@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0533@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0533', '24KP1A0533', 'Budamcherla', 'Srikanth', 'CSE', bid, 4, 'A', '24kp1a0533@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0534@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0534', '24KP1A0534', 'Budati', 'Nithya', 'CSE', bid, 4, 'A', '24kp1a0534@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0535@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0535', '24KP1A0535', 'Chagani', 'Gayathri', 'CSE', bid, 4, 'A', '24kp1a0535@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0536@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0536', '24KP1A0536', 'Chaganti', 'Venkata Siva Bhargavi', 'CSE', bid, 4, 'A', '24kp1a0536@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0537@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0537', '24KP1A0537', 'Chalamcharla', 'Deepika', 'CSE', bid, 4, 'A', '24kp1a0537@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0538@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0538', '24KP1A0538', 'Challa', 'Surekha', 'CSE', bid, 4, 'A', '24kp1a0538@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0539@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0539', '24KP1A0539', 'Chandrapati', 'Chaitanya Pranadeep', 'CSE', bid, 4, 'A', '24kp1a0539@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0540@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0540', '24KP1A0540', 'Cheekati', 'Abhi Raj', 'CSE', bid, 4, 'A', '24kp1a0540@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0541@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0541', '24KP1A0541', 'Chennupalli', 'Teja Manikanta Chari', 'CSE', bid, 4, 'A', '24kp1a0541@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0544@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0544', '24KP1A0544', 'Chinnapareddy', 'Venkata Lakshmi', 'CSE', bid, 4, 'A', '24kp1a0544@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0545@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0545', '24KP1A0545', 'Chinta', 'Sai Harshitha', 'CSE', bid, 4, 'A', '24kp1a0545@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0546@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0546', '24KP1A0546', 'Chintakrindhi', 'Naga Avinash', 'CSE', bid, 4, 'A', '24kp1a0546@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0547@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0547', '24KP1A0547', 'Chinthalapudi', 'Devaraj Kumar', 'CSE', bid, 4, 'A', '24kp1a0547@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0548@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0548', '24KP1A0548', 'Chinthapalli', 'Vamsi', 'CSE', bid, 4, 'A', '24kp1a0548@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0549@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0549', '24KP1A0549', 'Chirumamilla', 'Lakshmi', 'CSE', bid, 4, 'A', '24kp1a0549@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0550@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0550', '24KP1A0550', 'Chivukula', 'Dinesh Sai', 'CSE', bid, 4, 'A', '24kp1a0550@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0551@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0551', '24KP1A0551', 'Dandu', 'Ranga Divya', 'CSE', bid, 4, 'A', '24kp1a0551@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0552@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0552', '24KP1A0552', 'Dasari', 'Syam Bharath', 'CSE', bid, 4, 'A', '24kp1a0552@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0553@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0553', '24KP1A0553', 'Deevi', 'Venkata Jaswanth', 'CSE', bid, 4, 'A', '24kp1a0553@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0554@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0554', '24KP1A0554', 'Devandla', 'Sai Kumar', 'CSE', bid, 4, 'A', '24kp1a0554@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0555@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0555', '24KP1A0555', 'Dharmavarapu', 'Lakshmi Prasanna Kumar', 'CSE', bid, 4, 'A', '24kp1a0555@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0556@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0556', '24KP1A0556', 'Dogiparthi', 'Krishna Manjari', 'CSE', bid, 4, 'A', '24kp1a0556@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0557@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0557', '24KP1A0557', 'Dokka', 'Mounika', 'CSE', bid, 4, 'A', '24kp1a0557@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0558@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0558', '24KP1A0558', 'Dontala', 'Bhanu Nikhil', 'CSE', bid, 4, 'A', '24kp1a0558@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0559@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0559', '24KP1A0559', 'Duggyala', 'Akshaya', 'CSE', bid, 4, 'A', '24kp1a0559@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0560@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0560', '24KP1A0560', 'Enduri', 'Subhashini', 'CSE', bid, 4, 'A', '24kp1a0560@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0561@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0561', '24KP1A0561', 'Epuri', 'Manikanta Sai', 'CSE', bid, 4, 'A', '24kp1a0561@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0562@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0562', '24KP1A0562', 'Erla', 'Sravani', 'CSE', bid, 4, 'A', '24kp1a0562@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0563@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0563', '24KP1A0563', 'Ette', 'Keerthi Chandana', 'CSE', bid, 4, 'A', '24kp1a0563@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0564@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0564', '24KP1A0564', 'Gaddam', 'Saicharan Teja', 'CSE', bid, 4, 'A', '24kp1a0564@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0565@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0565', '24KP1A0565', 'Gadde', 'Sneha', 'CSE', bid, 4, 'A', '24kp1a0565@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0566@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0566', '24KP1A0566', 'Gadde', 'Sunitha', 'CSE', bid, 4, 'A', '24kp1a0566@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0567@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0567', '24KP1A0567', 'Gajja', 'Sashank', 'CSE', bid, 4, 'A', '24kp1a0567@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0568@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0568', '24KP1A0568', 'Gajjarli', 'Sivaiah', 'CSE', bid, 4, 'A', '24kp1a0568@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0569@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0569', '24KP1A0569', 'Gajula', 'Yogeswara Rao', 'CSE', bid, 4, 'A', '24kp1a0569@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0570@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0570', '24KP1A0570', 'Gajvalli', 'Anil Kumar', 'CSE', bid, 4, 'A', '24kp1a0570@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0571@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0571', '24KP1A0571', 'Gampa', 'Ajay Ram', 'CSE', bid, 4, 'A', '24kp1a0571@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0572@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0572', '24KP1A0572', 'Ganji', 'Ashok Reddy', 'CSE', bid, 4, 'A', '24kp1a0572@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0574@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0574', '24KP1A0574', 'Garbhana', 'Shanmuka Rao', 'CSE', bid, 4, 'A', '24kp1a0574@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0575@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0575', '24KP1A0575', 'Ghanta', 'Harshitha', 'CSE', bid, 4, 'A', '24kp1a0575@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0576@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0576', '24KP1A0576', 'Ghantasala', 'Nanda Gopal', 'CSE', bid, 4, 'A', '24kp1a0576@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0577@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0577', '24KP1A0577', 'Goddala', 'Hasini', 'CSE', bid, 4, 'A', '24kp1a0577@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0578@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0578', '24KP1A0578', 'Golla', 'Chaitanya', 'CSE', bid, 4, 'A', '24kp1a0578@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0501@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0501', '25KP5A0501', 'Adimulam', 'Syam Kumar', 'CSE', bid, 4, 'A', '25kp5a0501@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0502@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0502', '25KP5A0502', 'Aluri', 'Maneesha', 'CSE', bid, 4, 'A', '25kp5a0502@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0503@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0503', '25KP5A0503', 'Chukka', 'Anvith Kumar', 'CSE', bid, 4, 'A', '25kp5a0503@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0507@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0507', '24KP1A0507', 'Balusupati', 'Jessy', 'CSE', bid, 4, 'A', '24kp1a0507@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0542@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0542', '24KP1A0542', 'Chilaka', 'Karthik', 'CSE', bid, 4, 'A', '24kp1a0542@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0543@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0543', '24KP1A0543', 'Chilaka', 'Pranay', 'CSE', bid, 4, 'A', '24kp1a0543@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0579@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0579', '24KP1A0579', 'Gonela', 'Eswar', 'CSE', bid, 4, 'B', '24kp1a0579@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0580@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0580', '24KP1A0580', 'Gopidesi', 'Peda Nagaraju', 'CSE', bid, 4, 'B', '24kp1a0580@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0581@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0581', '24KP1A0581', 'Gopisetti', 'Bhavana', 'CSE', bid, 4, 'B', '24kp1a0581@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0582@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0582', '24KP1A0582', 'Gorantla', 'Yedukondalu', 'CSE', bid, 4, 'B', '24kp1a0582@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0583@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0583', '24KP1A0583', 'Gose', 'Nissi', 'CSE', bid, 4, 'B', '24kp1a0583@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0584@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0584', '24KP1A0584', 'Gude', 'Venkata Naga Virajitha', 'CSE', bid, 4, 'B', '24kp1a0584@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0585@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0585', '24KP1A0585', 'Gudipati', 'Siva Sankar Reddy', 'CSE', bid, 4, 'B', '24kp1a0585@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0586@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0586', '24KP1A0586', 'Gunja', 'Phanindra Sai Kumar', 'CSE', bid, 4, 'B', '24kp1a0586@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0587@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0587', '24KP1A0587', 'Gunji', 'Saloman Raju', 'CSE', bid, 4, 'B', '24kp1a0587@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0588@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0588', '24KP1A0588', 'Gunupudi', 'Manasa', 'CSE', bid, 4, 'B', '24kp1a0588@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0589@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0589', '24KP1A0589', 'Gurajala', 'Naga Sravani', 'CSE', bid, 4, 'B', '24kp1a0589@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0590@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0590', '24KP1A0590', 'Gurram', 'Gayathri', 'CSE', bid, 4, 'B', '24kp1a0590@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0591@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0591', '24KP1A0591', 'Gurram', 'Vimal Gupta', 'CSE', bid, 4, 'B', '24kp1a0591@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0592@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0592', '24KP1A0592', 'Gururi', 'Madhubabu', 'CSE', bid, 4, 'B', '24kp1a0592@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0593@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0593', '24KP1A0593', 'Idamakanti', 'Kasi Lakshmi', 'CSE', bid, 4, 'B', '24kp1a0593@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0594@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0594', '24KP1A0594', 'Isukapalli', 'Bujji Babu', 'CSE', bid, 4, 'B', '24kp1a0594@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0595@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0595', '24KP1A0595', 'Jagarlamudi', 'Manikanta Prasad', 'CSE', bid, 4, 'B', '24kp1a0595@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0596@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0596', '24KP1A0596', 'Jammalamadaka', 'Akhila', 'CSE', bid, 4, 'B', '24kp1a0596@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0597@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0597', '24KP1A0597', 'Jampani', 'Madhuri', 'CSE', bid, 4, 'B', '24kp1a0597@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0598@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0598', '24KP1A0598', 'Jorige', 'Lavanya', 'CSE', bid, 4, 'B', '24kp1a0598@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0599@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0599', '24KP1A0599', 'Juttuga', 'Mokshagna Lakshmi Srinadh', 'CSE', bid, 4, 'B', '24kp1a0599@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05a0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05A0', '24KP1A05A0', 'Kadiyala', 'Sai Vishal', 'CSE', bid, 4, 'B', '24kp1a05a0@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05a1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05A1', '24KP1A05A1', 'Kadiyam', 'Anil Kumar', 'CSE', bid, 4, 'B', '24kp1a05a1@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05a2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05A2', '24KP1A05A2', 'Kaipu', 'Narendra Reddy', 'CSE', bid, 4, 'B', '24kp1a05a2@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05a3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05A3', '24KP1A05A3', 'Kakarla', 'Lakshmi Sarika', 'CSE', bid, 4, 'B', '24kp1a05a3@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05a4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05A4', '24KP1A05A4', 'Kakarlapudi', 'Naga Bhavani', 'CSE', bid, 4, 'B', '24kp1a05a4@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05a5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05A5', '24KP1A05A5', 'Kalavakolanu', 'Vijayendra', 'CSE', bid, 4, 'B', '24kp1a05a5@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05a6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05A6', '24KP1A05A6', 'Kalivela', 'Srujana', 'CSE', bid, 4, 'B', '24kp1a05a6@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05a7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05A7', '24KP1A05A7', 'Kamatham', 'Naga Jyothi', 'CSE', bid, 4, 'B', '24kp1a05a7@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05a8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05A8', '24KP1A05A8', 'Kambala', 'Anil', 'CSE', bid, 4, 'B', '24kp1a05a8@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05a9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05A9', '24KP1A05A9', 'Kambala', 'Indira', 'CSE', bid, 4, 'B', '24kp1a05a9@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05b0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05B0', '24KP1A05B0', 'Kambhampati', 'Chiranjeevi', 'CSE', bid, 4, 'B', '24kp1a05b0@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05b1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05B1', '24KP1A05B1', 'Kammili', 'Ram Kiran Babu', 'CSE', bid, 4, 'B', '24kp1a05b1@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05b2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05B2', '24KP1A05B2', 'Kanasani', 'Naga Sairam', 'CSE', bid, 4, 'B', '24kp1a05b2@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05b3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05B3', '24KP1A05B3', 'Kancharla', 'Sathwik', 'CSE', bid, 4, 'B', '24kp1a05b3@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05b4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05B4', '24KP1A05B4', 'Kandru', 'Mary Hema Latha', 'CSE', bid, 4, 'B', '24kp1a05b4@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05b5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05B5', '24KP1A05B5', 'Kanikutla', 'Hemanth Kumar', 'CSE', bid, 4, 'B', '24kp1a05b5@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05b6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05B6', '24KP1A05B6', 'Kankanala', 'Raghuvardhan', 'CSE', bid, 4, 'B', '24kp1a05b6@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05b7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05B7', '24KP1A05B7', 'Karlapudi', 'Navaneeth Satya Sai', 'CSE', bid, 4, 'B', '24kp1a05b7@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05b8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05B8', '24KP1A05B8', 'Karlapudi', 'Rishitha Kranthi', 'CSE', bid, 4, 'B', '24kp1a05b8@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05b9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05B9', '24KP1A05B9', 'Karra', 'Vijay Kumar', 'CSE', bid, 4, 'B', '24kp1a05b9@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05c0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05C0', '24KP1A05C0', 'Karumuru', 'Smily', 'CSE', bid, 4, 'B', '24kp1a05c0@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05c1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05C1', '24KP1A05C1', 'Katam', 'Lakshmi Devi', 'CSE', bid, 4, 'B', '24kp1a05c1@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05c2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05C2', '24KP1A05C2', 'Katta', 'Chandu', 'CSE', bid, 4, 'B', '24kp1a05c2@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05c3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05C3', '24KP1A05C3', 'Katti', 'Venkata Siva Sai Theja', 'CSE', bid, 4, 'B', '24kp1a05c3@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05c4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05C4', '24KP1A05C4', 'Kethipalli', 'Sandhya', 'CSE', bid, 4, 'B', '24kp1a05c4@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05c5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05C5', '24KP1A05C5', 'Kocherla', 'Vamsi', 'CSE', bid, 4, 'B', '24kp1a05c5@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05c6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05C6', '24KP1A05C6', 'Kodirekka', 'Hemanth Kumar', 'CSE', bid, 4, 'B', '24kp1a05c6@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05c7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05C7', '24KP1A05C7', 'Kokkiligadda', 'Rushitha', 'CSE', bid, 4, 'B', '24kp1a05c7@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05c8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05C8', '24KP1A05C8', 'Kolakaluri', 'Sravanthi', 'CSE', bid, 4, 'B', '24kp1a05c8@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05c9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05C9', '24KP1A05C9', 'Komera', 'Praneetha', 'CSE', bid, 4, 'B', '24kp1a05c9@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05d0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05D0', '24KP1A05D0', 'Komiripalepu', 'Durga Prasanth', 'CSE', bid, 4, 'B', '24kp1a05d0@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05d1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05D1', '24KP1A05D1', 'Kondiparthi', 'Satya Hemanth', 'CSE', bid, 4, 'B', '24kp1a05d1@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05d2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05D2', '24KP1A05D2', 'Kondipogu', 'Bhargavi', 'CSE', bid, 4, 'B', '24kp1a05d2@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05d3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05D3', '24KP1A05D3', 'Kopanathi', 'Nikhil Varma', 'CSE', bid, 4, 'B', '24kp1a05d3@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05d4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05D4', '24KP1A05D4', 'Korabandi', 'Praveen', 'CSE', bid, 4, 'B', '24kp1a05d4@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05d5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05D5', '24KP1A05D5', 'Korampalli', 'Baji Babu', 'CSE', bid, 4, 'B', '24kp1a05d5@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05d6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05D6', '24KP1A05D6', 'Korivi', 'Kota Srinivasa Rao', 'CSE', bid, 4, 'B', '24kp1a05d6@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05d7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05D7', '24KP1A05D7', 'Kotha', 'Hema Anantha Lakshmi Asmitha', 'CSE', bid, 4, 'B', '24kp1a05d7@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05d8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05D8', '24KP1A05D8', 'Kotla', 'Bhaskar Reddy', 'CSE', bid, 4, 'B', '24kp1a05d8@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05d9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05D9', '24KP1A05D9', 'Kukatlapalli', 'Siva Sai', 'CSE', bid, 4, 'B', '24kp1a05d9@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05e0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05E0', '24KP1A05E0', 'Kummari', 'Venkateswarlu', 'CSE', bid, 4, 'B', '24kp1a05e0@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05e1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05E1', '24KP1A05E1', 'Kunchala', 'Archana', 'CSE', bid, 4, 'B', '24kp1a05e1@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05e3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05E3', '24KP1A05E3', 'M', 'Bharath', 'CSE', bid, 4, 'B', '24kp1a05e3@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05e4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05E4', '24KP1A05E4', 'M', 'Venkata Anand', 'CSE', bid, 4, 'B', '24kp1a05e4@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05e5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05E5', '24KP1A05E5', 'Madakasira', 'Bhagya Sri', 'CSE', bid, 4, 'B', '24kp1a05e5@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05e6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05E6', '24KP1A05E6', 'Madasu', 'Reena Sharon', 'CSE', bid, 4, 'B', '24kp1a05e6@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05e7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05E7', '24KP1A05E7', 'Mahankali', 'Pravalika', 'CSE', bid, 4, 'B', '24kp1a05e7@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05e8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05E8', '24KP1A05E8', 'Mallavarapu', 'Ramyasri', 'CSE', bid, 4, 'B', '24kp1a05e8@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05e9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05E9', '24KP1A05E9', 'Manduri', 'Sri Hasini', 'CSE', bid, 4, 'B', '24kp1a05e9@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05f0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05F0', '24KP1A05F0', 'Maramreddy', 'Venkata Uma Maheswara Reddy', 'CSE', bid, 4, 'B', '24kp1a05f0@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05f1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05F1', '24KP1A05F1', 'Marrapu', 'Mohana Srilatha', 'CSE', bid, 4, 'B', '24kp1a05f1@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05f2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05F2', '24KP1A05F2', 'Marri', 'Mallikharjuna', 'CSE', bid, 4, 'B', '24kp1a05f2@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05f3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05F3', '24KP1A05F3', 'Masina', 'Ganesh', 'CSE', bid, 4, 'B', '24kp1a05f3@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05f4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05F4', '24KP1A05F4', 'Meda', 'Srinivas', 'CSE', bid, 4, 'B', '24kp1a05f4@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05f5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05F5', '24KP1A05F5', 'Meda', 'Supriya', 'CSE', bid, 4, 'B', '24kp1a05f5@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0504@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0504', '25KP5A0504', 'Govinda', 'Anusha', 'CSE', bid, 4, 'B', '25kp5a0504@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0505@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0505', '25KP5A0505', 'Kalasani', 'Jyothi', 'CSE', bid, 4, 'B', '25kp5a0505@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0506@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0506', '25KP5A0506', 'Kumbha', 'Venkatesh', 'CSE', bid, 4, 'B', '25kp5a0506@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0573@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0573', '24KP1A0573', 'Ganjinaboina', 'Sasaank', 'CSE', bid, 4, 'B', '24kp1a0573@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05f6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05F6', '24KP1A05F6', 'Medepalli', 'Harshitha', 'CSE', bid, 4, 'C', '24kp1a05f6@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05f7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05F7', '24KP1A05F7', 'Mekala', 'Bavitha', 'CSE', bid, 4, 'C', '24kp1a05f7@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05f8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05F8', '24KP1A05F8', 'Merugu', 'Bala Venkata Sai Krishna', 'CSE', bid, 4, 'C', '24kp1a05f8@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05f9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05F9', '24KP1A05F9', 'Merugupala', 'Manohar', 'CSE', bid, 4, 'C', '24kp1a05f9@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05g0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05G0', '24KP1A05G0', 'Mohammad', 'Basma Firdos', 'CSE', bid, 4, 'C', '24kp1a05g0@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05g1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05G1', '24KP1A05G1', 'Mohammad', 'Sohail Azhar', 'CSE', bid, 4, 'C', '24kp1a05g1@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05g2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05G2', '24KP1A05G2', 'Mohammed', 'Misbah Ul Islam', 'CSE', bid, 4, 'C', '24kp1a05g2@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05g3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05G3', '24KP1A05G3', 'Mohammed', 'Rokhiya Sultana', 'CSE', bid, 4, 'C', '24kp1a05g3@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05g4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05G4', '24KP1A05G4', 'Mohammed', 'Shahid', 'CSE', bid, 4, 'C', '24kp1a05g4@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05g5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05G5', '24KP1A05G5', 'Monduri', 'Prabhu Teja', 'CSE', bid, 4, 'C', '24kp1a05g5@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05g6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05G6', '24KP1A05G6', 'Motukuri', 'Pradeep Kumar', 'CSE', bid, 4, 'C', '24kp1a05g6@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05g7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05G7', '24KP1A05G7', 'Mudamanchu', 'Naga Venkata Ajay', 'CSE', bid, 4, 'C', '24kp1a05g7@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05g8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05G8', '24KP1A05G8', 'Mukkamala', 'Anitha', 'CSE', bid, 4, 'C', '24kp1a05g8@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05g9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05G9', '24KP1A05G9', 'Mukundam', 'Deva Pavan Kalyan', 'CSE', bid, 4, 'C', '24kp1a05g9@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05h0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05H0', '24KP1A05H0', 'Mule', 'Vasavya', 'CSE', bid, 4, 'C', '24kp1a05h0@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05h1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05H1', '24KP1A05H1', 'Ganji', 'Lokesh', 'CSE', bid, 4, 'C', '24kp1a05h1@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05h2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05H2', '24KP1A05H2', 'Mundla', 'Smily', 'CSE', bid, 4, 'C', '24kp1a05h2@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05h3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05H3', '24KP1A05H3', 'Muppala', 'Navya', 'CSE', bid, 4, 'C', '24kp1a05h3@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05h4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05H4', '24KP1A05H4', 'Murugula', 'Madhan Kumar', 'CSE', bid, 4, 'C', '24kp1a05h4@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05h5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05H5', '24KP1A05H5', 'Murugummala', 'Chaitanya Lakshmi', 'CSE', bid, 4, 'C', '24kp1a05h5@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05h6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05H6', '24KP1A05H6', 'Mustipalli', 'Rohith Bhanu Chand', 'CSE', bid, 4, 'C', '24kp1a05h6@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05h7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05H7', '24KP1A05H7', 'Musugu', 'Nagalakshmi', 'CSE', bid, 4, 'C', '24kp1a05h7@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05h8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05H8', '24KP1A05H8', 'Nagalapati', 'Sivasankara Vasu', 'CSE', bid, 4, 'C', '24kp1a05h8@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05h9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05H9', '24KP1A05H9', 'Nakka', 'Prasanna', 'CSE', bid, 4, 'C', '24kp1a05h9@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05i0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05I0', '24KP1A05I0', 'Nakka', 'Rishi Kumar', 'CSE', bid, 4, 'C', '24kp1a05i0@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05i1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05I1', '24KP1A05I1', 'Nakkala', 'Siva Rama Krishna', 'CSE', bid, 4, 'C', '24kp1a05i1@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05i2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05I2', '24KP1A05I2', 'Nanabala', 'Akhil', 'CSE', bid, 4, 'C', '24kp1a05i2@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05i3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05I3', '24KP1A05I3', 'Nanda', 'Swarna Latha', 'CSE', bid, 4, 'C', '24kp1a05i3@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05i4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05I4', '24KP1A05I4', 'Narra', 'Venkata Bhaskar', 'CSE', bid, 4, 'C', '24kp1a05i4@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05i5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05I5', '24KP1A05I5', 'Nelapati', 'Yagna Sindhu', 'CSE', bid, 4, 'C', '24kp1a05i5@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05i6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05I6', '24KP1A05I6', 'Nichu', 'Triveni', 'CSE', bid, 4, 'C', '24kp1a05i6@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05i7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05I7', '24KP1A05I7', 'Noorbasha', 'Rasool', 'CSE', bid, 4, 'C', '24kp1a05i7@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05i8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05I8', '24KP1A05I8', 'Nusum', 'Sushmani', 'CSE', bid, 4, 'C', '24kp1a05i8@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05i9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05I9', '24KP1A05I9', 'Nuthalapati', 'Venkata Vidya Sagar', 'CSE', bid, 4, 'C', '24kp1a05i9@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05j0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05J0', '24KP1A05J0', 'Olipalli', 'Dharaneeswar', 'CSE', bid, 4, 'C', '24kp1a05j0@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05j1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05J1', '24KP1A05J1', 'Orsu', 'Venkatram', 'CSE', bid, 4, 'C', '24kp1a05j1@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05j2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05J2', '24KP1A05J2', 'Pachigolla', 'Karthik', 'CSE', bid, 4, 'C', '24kp1a05j2@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05j3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05J3', '24KP1A05J3', 'Pagalla', 'Kavitha', 'CSE', bid, 4, 'C', '24kp1a05j3@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05j4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05J4', '24KP1A05J4', 'Palavai', 'Omega', 'CSE', bid, 4, 'C', '24kp1a05j4@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05j6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05J6', '24KP1A05J6', 'Paleti', 'Sippora', 'CSE', bid, 4, 'C', '24kp1a05j6@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05j7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05J7', '24KP1A05J7', 'Pallabothula', 'Meghana Swarupa', 'CSE', bid, 4, 'C', '24kp1a05j7@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05j8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05J8', '24KP1A05J8', 'Pamulapati', 'Lakshmi Gayathri', 'CSE', bid, 4, 'C', '24kp1a05j8@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05j9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05J9', '24KP1A05J9', 'Panditi', 'Banni', 'CSE', bid, 4, 'C', '24kp1a05j9@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05k0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05K0', '24KP1A05K0', 'Panthangi', 'Naga Bhuvaneswara Rao', 'CSE', bid, 4, 'C', '24kp1a05k0@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05k1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05K1', '24KP1A05K1', 'Pappala', 'Mokshendra', 'CSE', bid, 4, 'C', '24kp1a05k1@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05k2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05K2', '24KP1A05K2', 'Paritala', 'Uma Saraswathi', 'CSE', bid, 4, 'C', '24kp1a05k2@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05k3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05K3', '24KP1A05K3', 'Paruchuri', 'Hari Priya', 'CSE', bid, 4, 'C', '24kp1a05k3@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05k4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05K4', '24KP1A05K4', 'Pasala', 'Dhanunjay', 'CSE', bid, 4, 'C', '24kp1a05k4@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05k5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05K5', '24KP1A05K5', 'Pasam', 'Bala Nagalakshmi Siva Pavan', 'CSE', bid, 4, 'C', '24kp1a05k5@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05k6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05K6', '24KP1A05K6', 'Pathan', 'Imran Khan', 'CSE', bid, 4, 'C', '24kp1a05k6@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05k7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05K7', '24KP1A05K7', 'Pathi', 'Venkata Siva Prasad', 'CSE', bid, 4, 'C', '24kp1a05k7@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05k8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05K8', '24KP1A05K8', 'Pathuri', 'Sai Kiran', 'CSE', bid, 4, 'C', '24kp1a05k8@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05k9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05K9', '24KP1A05K9', 'Pattan', 'Humera Firdos', 'CSE', bid, 4, 'C', '24kp1a05k9@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05l0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05L0', '24KP1A05L0', 'Peddiboina', 'Krishna Yadav', 'CSE', bid, 4, 'C', '24kp1a05l0@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05l1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05L1', '24KP1A05L1', 'Peddiboyina', 'Tanuja', 'CSE', bid, 4, 'C', '24kp1a05l1@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05l2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05L2', '24KP1A05L2', 'Peerla', 'Madhu Priya', 'CSE', bid, 4, 'C', '24kp1a05l2@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05l3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05L3', '24KP1A05L3', 'Peethala', 'Kiran', 'CSE', bid, 4, 'C', '24kp1a05l3@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05l4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05L4', '24KP1A05L4', 'Perumalla', 'Venkata Mahesh Kumar', 'CSE', bid, 4, 'C', '24kp1a05l4@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05l5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05L5', '24KP1A05L5', 'Pikkili', 'Shiva Kumar', 'CSE', bid, 4, 'C', '24kp1a05l5@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05l6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05L6', '24KP1A05L6', 'Pokuri', 'Kondarao', 'CSE', bid, 4, 'C', '24kp1a05l6@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05l7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05L7', '24KP1A05L7', 'Polavarapu', 'Naresh Babu', 'CSE', bid, 4, 'C', '24kp1a05l7@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05l8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05L8', '24KP1A05L8', 'Polisetty', 'Visalakshmi', 'CSE', bid, 4, 'C', '24kp1a05l8@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05l9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05L9', '24KP1A05L9', 'Pulusu', 'Rohith Venkat Sai Reddy', 'CSE', bid, 4, 'C', '24kp1a05l9@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05m0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05M0', '24KP1A05M0', 'Pusapati', 'Naresh', 'CSE', bid, 4, 'C', '24kp1a05m0@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05m1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05M1', '24KP1A05M1', 'Rachuri', 'Sai Bharath', 'CSE', bid, 4, 'C', '24kp1a05m1@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05m2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05M2', '24KP1A05M2', 'Ramineni', 'Swapna', 'CSE', bid, 4, 'C', '24kp1a05m2@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05m4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05M4', '24KP1A05M4', 'Rayapati', 'Ramya', 'CSE', bid, 4, 'C', '24kp1a05m4@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05m5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05M5', '24KP1A05M5', 'Reddy', 'Lalitha', 'CSE', bid, 4, 'C', '24kp1a05m5@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05m6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05M6', '24KP1A05M6', 'Rompilli', 'Ramya', 'CSE', bid, 4, 'C', '24kp1a05m6@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05m7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05M7', '24KP1A05M7', 'Rudrapati', 'Karthik', 'CSE', bid, 4, 'C', '24kp1a05m7@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05m8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05M8', '24KP1A05M8', 'Sabavath', 'Anil Kumar', 'CSE', bid, 4, 'C', '24kp1a05m8@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05m9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05M9', '24KP1A05M9', 'Sadu', 'Nandhini', 'CSE', bid, 4, 'C', '24kp1a05m9@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05n0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05N0', '24KP1A05N0', 'Sandrapati', 'Karthik', 'CSE', bid, 4, 'C', '24kp1a05n0@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05n1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05N1', '24KP1A05N1', 'Sandu', 'Ramanjaneyulu', 'CSE', bid, 4, 'C', '24kp1a05n1@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0507@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0507', '25KP5A0507', 'Lakkamthoti', 'Meghana', 'CSE', bid, 4, 'C', '25kp5a0507@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0508@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0508', '25KP5A0508', 'Malla', 'Manasa Lakshmi', 'CSE', bid, 4, 'C', '25kp5a0508@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0509@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0509', '25KP5A0509', 'Naraharasetty', 'Revathi Taraka Ratna Kumari', 'CSE', bid, 4, 'C', '25kp5a0509@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05e2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05E2', '24KP1A05E2', 'Lagadapati', 'Manoj Kumar', 'CSE', bid, 4, 'C', '24kp1a05e2@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05j5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05J5', '24KP1A05J5', 'Palepogu', 'Amrutha', 'CSE', bid, 4, 'C', '24kp1a05j5@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05n2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05N2', '24KP1A05N2', 'Sanke', 'Anupriya', 'CSE', bid, 4, 'D', '24kp1a05n2@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05n3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05N3', '24KP1A05N3', 'Santhapurapu', 'Sunny', 'CSE', bid, 4, 'D', '24kp1a05n3@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05n4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05N4', '24KP1A05N4', 'Saridena', 'Madhu Varshini', 'CSE', bid, 4, 'D', '24kp1a05n4@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05n5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05N5', '24KP1A05N5', 'Satuluri', 'Shaik Mohammad Hafizulla', 'CSE', bid, 4, 'D', '24kp1a05n5@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05n6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05N6', '24KP1A05N6', 'Sayyed', 'Irfan', 'CSE', bid, 4, 'D', '24kp1a05n6@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05n7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05N7', '24KP1A05N7', 'Settibathina', 'Kasi Balaji', 'CSE', bid, 4, 'D', '24kp1a05n7@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05n8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05N8', '24KP1A05N8', 'Shaik', 'Aashif', 'CSE', bid, 4, 'D', '24kp1a05n8@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05n9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05N9', '24KP1A05N9', 'Shaik', 'Abdul Afzal', 'CSE', bid, 4, 'D', '24kp1a05n9@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05o0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05O0', '24KP1A05O0', 'Shaik', 'Ajijulla', 'CSE', bid, 4, 'D', '24kp1a05o0@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05o1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05O1', '24KP1A05O1', 'Shaik', 'Akbar', 'CSE', bid, 4, 'D', '24kp1a05o1@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05o2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05O2', '24KP1A05O2', 'Shaik', 'Aneesa', 'CSE', bid, 4, 'D', '24kp1a05o2@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05o3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05O3', '24KP1A05O3', 'Shaik', 'Anvar Bhasha', 'CSE', bid, 4, 'D', '24kp1a05o3@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05o5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05O5', '24KP1A05O5', 'Shaik', 'Firdosh', 'CSE', bid, 4, 'D', '24kp1a05o5@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05o6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05O6', '24KP1A05O6', 'Shaik', 'Ghan Saida', 'CSE', bid, 4, 'D', '24kp1a05o6@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05o7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05O7', '24KP1A05O7', 'Shaik', 'Khajabi', 'CSE', bid, 4, 'D', '24kp1a05o7@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05o8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05O8', '24KP1A05O8', 'Shaik', 'Khashifa', 'CSE', bid, 4, 'D', '24kp1a05o8@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05o9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05O9', '24KP1A05O9', 'Shaik', 'Khasimvali', 'CSE', bid, 4, 'D', '24kp1a05o9@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05p0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05P0', '24KP1A05P0', 'Shaik', 'Mahammad Ghani', 'CSE', bid, 4, 'D', '24kp1a05p0@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05p1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05P1', '24KP1A05P1', 'Shaik', 'Muntaz', 'CSE', bid, 4, 'D', '24kp1a05p1@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05p2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05P2', '24KP1A05P2', 'Shaik', 'Rasool', 'CSE', bid, 4, 'D', '24kp1a05p2@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05p3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05P3', '24KP1A05P3', 'Shaik', 'Saida', 'CSE', bid, 4, 'D', '24kp1a05p3@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05p4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05P4', '24KP1A05P4', 'Shaik', 'Saida', 'CSE', bid, 4, 'D', '24kp1a05p4@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05p5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05P5', '24KP1A05P5', 'Shaik', 'Sameer', 'CSE', bid, 4, 'D', '24kp1a05p5@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05p6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05P6', '24KP1A05P6', 'Shaik', 'Sameera', 'CSE', bid, 4, 'D', '24kp1a05p6@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05p7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05P7', '24KP1A05P7', 'Shaik', 'Shabana', 'CSE', bid, 4, 'D', '24kp1a05p7@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05p8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05P8', '24KP1A05P8', 'Shaik', 'Shameena', 'CSE', bid, 4, 'D', '24kp1a05p8@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05p9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05P9', '24KP1A05P9', 'Shaik', 'Sumaya', 'CSE', bid, 4, 'D', '24kp1a05p9@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05q0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05Q0', '24KP1A05Q0', 'Shaik', 'Yasin', 'CSE', bid, 4, 'D', '24kp1a05q0@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05q1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05Q1', '24KP1A05Q1', 'Singareddy', 'Nasaramma', 'CSE', bid, 4, 'D', '24kp1a05q1@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05q2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05Q2', '24KP1A05Q2', 'Siramaneni', 'Rahul', 'CSE', bid, 4, 'D', '24kp1a05q2@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05q3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05Q3', '24KP1A05Q3', 'Soma', 'Mohan Venkat Lakshman', 'CSE', bid, 4, 'D', '24kp1a05q3@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05q4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05Q4', '24KP1A05Q4', 'Soma', 'Mohan Venkat Ramm', 'CSE', bid, 4, 'D', '24kp1a05q4@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05q5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05Q5', '24KP1A05Q5', 'Sripathi', 'Hari Venkatesh', 'CSE', bid, 4, 'D', '24kp1a05q5@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05q6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05Q6', '24KP1A05Q6', 'Suraboina', 'Brahmendra Kumar', 'CSE', bid, 4, 'D', '24kp1a05q6@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05q7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05Q7', '24KP1A05Q7', 'Suryadevara', 'Sri Krishna Chowdary', 'CSE', bid, 4, 'D', '24kp1a05q7@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05q8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05Q8', '24KP1A05Q8', 'Syed', 'Abdul Khadheer', 'CSE', bid, 4, 'D', '24kp1a05q8@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05q9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05Q9', '24KP1A05Q9', 'Syed', 'Naziya Begum', 'CSE', bid, 4, 'D', '24kp1a05q9@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05r1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05R1', '24KP1A05R1', 'Tallapalli', 'Venkata Danaiah', 'CSE', bid, 4, 'D', '24kp1a05r1@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05r2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05R2', '24KP1A05R2', 'Talluri', 'Purushotam Manikanta', 'CSE', bid, 4, 'D', '24kp1a05r2@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05r3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05R3', '24KP1A05R3', 'Tanniru', 'Dhanush Kumar', 'CSE', bid, 4, 'D', '24kp1a05r3@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05r4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05R4', '24KP1A05R4', 'Teki', 'Tharun Sai Balaji', 'CSE', bid, 4, 'D', '24kp1a05r4@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05r5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05R5', '24KP1A05R5', 'Thirupathi', 'Bhavaneswari', 'CSE', bid, 4, 'D', '24kp1a05r5@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05r6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05R6', '24KP1A05R6', 'Thommandru', 'Gopi Vishnu Vardhan', 'CSE', bid, 4, 'D', '24kp1a05r6@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05r7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05R7', '24KP1A05R7', 'Thumati', 'Hasini', 'CSE', bid, 4, 'D', '24kp1a05r7@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05r8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05R8', '24KP1A05R8', 'Tummala', 'Guru Brahmam', 'CSE', bid, 4, 'D', '24kp1a05r8@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05r9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05R9', '24KP1A05R9', 'Turupati', 'Nikhil', 'CSE', bid, 4, 'D', '24kp1a05r9@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05s1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05S1', '24KP1A05S1', 'Undavalli', 'Poojitha', 'CSE', bid, 4, 'D', '24kp1a05s1@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05s2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05S2', '24KP1A05S2', 'Usthela', 'Arun Kumar', 'CSE', bid, 4, 'D', '24kp1a05s2@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05s3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05S3', '24KP1A05S3', 'Uyyala', 'Vasanth Kumar', 'CSE', bid, 4, 'D', '24kp1a05s3@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05s4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05S4', '24KP1A05S4', 'Vaka', 'Siva Sankar', 'CSE', bid, 4, 'D', '24kp1a05s4@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05s5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05S5', '24KP1A05S5', 'Vallamkonda', 'Neelarjun', 'CSE', bid, 4, 'D', '24kp1a05s5@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05s6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05S6', '24KP1A05S6', 'Vallepu', 'Jaswanth Kumar', 'CSE', bid, 4, 'D', '24kp1a05s6@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05s7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05S7', '24KP1A05S7', 'Vanaparthi', 'Nishanth', 'CSE', bid, 4, 'D', '24kp1a05s7@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05s9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05S9', '24KP1A05S9', 'Vankayalapati', 'Venkata Lakshmi Rao', 'CSE', bid, 4, 'D', '24kp1a05s9@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05t0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05T0', '24KP1A05T0', 'Velanati', 'Venkatesh', 'CSE', bid, 4, 'D', '24kp1a05t0@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05t1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05T1', '24KP1A05T1', 'Vempogu', 'Rani', 'CSE', bid, 4, 'D', '24kp1a05t1@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05t2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05T2', '24KP1A05T2', 'Vengala', 'Mohith Srinaga Kiran Kumar', 'CSE', bid, 4, 'D', '24kp1a05t2@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05t3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05T3', '24KP1A05T3', 'Venigalla', 'Varshitha', 'CSE', bid, 4, 'D', '24kp1a05t3@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05t4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05T4', '24KP1A05T4', 'Vinukonda', 'Venkata Chiranjeevi', 'CSE', bid, 4, 'D', '24kp1a05t4@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05t5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05T5', '24KP1A05T5', 'Vutukuri', 'Sowmya', 'CSE', bid, 4, 'D', '24kp1a05t5@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05t6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05T6', '24KP1A05T6', 'Y', 'Venkata Naga Sruthi', 'CSE', bid, 4, 'D', '24kp1a05t6@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05t7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05T7', '24KP1A05T7', 'Yadavalli', 'Manikanta', 'CSE', bid, 4, 'D', '24kp1a05t7@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05t8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05T8', '24KP1A05T8', 'Yakkala', 'Ajay Kumar', 'CSE', bid, 4, 'D', '24kp1a05t8@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05t9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05T9', '24KP1A05T9', 'Yalamaddi', 'Taruna Sri', 'CSE', bid, 4, 'D', '24kp1a05t9@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05u0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05U0', '24KP1A05U0', 'Yallamati', 'Suresh Babu', 'CSE', bid, 4, 'D', '24kp1a05u0@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05u1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05U1', '24KP1A05U1', 'Yannam', 'Rithwik Reddy', 'CSE', bid, 4, 'D', '24kp1a05u1@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05u2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05U2', '24KP1A05U2', 'Yaparthi', 'Ruthisha', 'CSE', bid, 4, 'D', '24kp1a05u2@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05u3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05U3', '24KP1A05U3', 'Yaragorla', 'Snehalatha', 'CSE', bid, 4, 'D', '24kp1a05u3@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05u4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05U4', '24KP1A05U4', 'Yempogu', 'Surya Teja', 'CSE', bid, 4, 'D', '24kp1a05u4@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05u5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05U5', '24KP1A05U5', 'Yepuri', 'Abhinay Sandeep', 'CSE', bid, 4, 'D', '24kp1a05u5@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05u6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05U6', '24KP1A05U6', 'Yerrabelli', 'Kasirao', 'CSE', bid, 4, 'D', '24kp1a05u6@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05u7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05U7', '24KP1A05U7', 'Zadda', 'Estheru Rani', 'CSE', bid, 4, 'D', '24kp1a05u7@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05u8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05U8', '24KP1A05U8', 'Nali', 'Srikanth', 'CSE', bid, 4, 'D', '24kp1a05u8@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05v0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05V0', '24KP1A05V0', 'Shaik', 'Abdul Kareem', 'CSE', bid, 4, 'D', '24kp1a05v0@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0510@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0510', '25KP5A0510', 'Shaik', 'Nayab Rasool', 'CSE', bid, 4, 'D', '25kp5a0510@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0511@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0511', '25KP5A0511', 'Shaik', 'Reddigudem Reshma', 'CSE', bid, 4, 'D', '25kp5a0511@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0512@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0512', '25KP5A0512', 'Telu', 'Tejaswini', 'CSE', bid, 4, 'D', '25kp5a0512@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05m3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05M3', '24KP1A05M3', 'Rapathati', 'Veeranjaneyulu', 'CSE', bid, 4, 'D', '24kp1a05m3@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05o4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05O4', '24KP1A05O4', 'Shaik', 'Asrunnisa', 'CSE', bid, 4, 'D', '24kp1a05o4@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05r0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05R0', '24KP1A05R0', 'Syed', 'Sameer', 'CSE', bid, 4, 'D', '24kp1a05r0@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05s0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05S0', '24KP1A05S0', 'Ullasa', 'Subba Lakshmi', 'CSE', bid, 4, 'D', '24kp1a05s0@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05u9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05U9', '24KP1A05U9', 'Mundla', 'Akhila-Detained', 'CSE', bid, 4, 'D', '24kp1a05u9@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05a5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05A5', '23KP1A05A5', 'Padala', 'Araveen', 'CSE', bid, 4, 'B', '23kp1a05a5@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a05s8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A05S8', '24KP1A05S8', 'Vangepuram', 'Pavithra Kumar', 'CSE', bid, 4, 'D', '24kp1a05s8@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0501@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0501', '23KP1A0501', 'Abbagani', 'Ravi Krishna', 'CSE', bid, 4, 'A', '23kp1a0501@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0502@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0502', '23KP1A0502', 'Adimulam', 'Vivek Naga Sai', 'CSE', bid, 4, 'A', '23kp1a0502@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0504@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0504', '23KP1A0504', 'Alavala', 'Eswar Kumar', 'CSE', bid, 4, 'A', '23kp1a0504@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0505@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0505', '23KP1A0505', 'Ancha', 'Lahari', 'CSE', bid, 4, 'A', '23kp1a0505@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0506@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0506', '23KP1A0506', 'Animisetty', 'Venkata Surya Teja', 'CSE', bid, 4, 'A', '23kp1a0506@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0507@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0507', '23KP1A0507', 'Annangi', 'Subba Rao', 'CSE', bid, 4, 'A', '23kp1a0507@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0508@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0508', '23KP1A0508', 'Anuku', 'Nandini', 'CSE', bid, 4, 'A', '23kp1a0508@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0509@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0509', '23KP1A0509', 'Athipatla', 'Mahima Keerthana', 'CSE', bid, 4, 'A', '23kp1a0509@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0510@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0510', '23KP1A0510', 'Aurangabad', 'Ganesh', 'CSE', bid, 4, 'A', '23kp1a0510@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0511@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0511', '23KP1A0511', 'Avuthu', 'Vijaya Vardhan Reddy', 'CSE', bid, 4, 'A', '23kp1a0511@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0512@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0512', '23KP1A0512', 'Chintalapudi', 'Srinadh', 'CSE', bid, 4, 'A', '23kp1a0512@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0513@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0513', '23KP1A0513', 'Bandla', 'Himabindu', 'CSE', bid, 4, 'A', '23kp1a0513@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0514@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0514', '23KP1A0514', 'Bathula', 'Uma Devi', 'CSE', bid, 4, 'A', '23kp1a0514@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0515@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0515', '23KP1A0515', 'Batta', 'Krupavaram', 'CSE', bid, 4, 'A', '23kp1a0515@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0516@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0516', '23KP1A0516', 'Bellam', 'Nithin Kumar', 'CSE', bid, 4, 'A', '23kp1a0516@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0517@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0517', '23KP1A0517', 'Bhimavarapu', 'Ajay', 'CSE', bid, 4, 'A', '23kp1a0517@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0518@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0518', '23KP1A0518', 'Boddu', 'Jahnavi', 'CSE', bid, 4, 'A', '23kp1a0518@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0519@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0519', '23KP1A0519', 'Gorijala', 'Vishnuvardhan', 'CSE', bid, 4, 'A', '23kp1a0519@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0520@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0520', '23KP1A0520', 'Bolleddula', 'Yalamanda Rao', 'CSE', bid, 4, 'A', '23kp1a0520@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0521@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0521', '23KP1A0521', 'Bopparaju', 'Venkata Sai Deekshith', 'CSE', bid, 4, 'A', '23kp1a0521@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0522@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0522', '23KP1A0522', 'Borugadda', 'Harsha', 'CSE', bid, 4, 'A', '23kp1a0522@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0523@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0523', '23KP1A0523', 'Challa', 'Surya Teja', 'CSE', bid, 4, 'A', '23kp1a0523@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0524@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0524', '23KP1A0524', 'Chandavalu', 'Suhitha Sharon', 'CSE', bid, 4, 'A', '23kp1a0524@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0525@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0525', '23KP1A0525', 'Chatla', 'Manikya Rao', 'CSE', bid, 4, 'A', '23kp1a0525@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0526@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0526', '23KP1A0526', 'Cheepuri', 'Hemanth Kumar', 'CSE', bid, 4, 'A', '23kp1a0526@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0527@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0527', '23KP1A0527', 'Chilumuru', 'Chandra Harsha Saraman', 'CSE', bid, 4, 'A', '23kp1a0527@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0528@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0528', '23KP1A0528', 'Chinnam', 'Kowshik', 'CSE', bid, 4, 'A', '23kp1a0528@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0529@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0529', '23KP1A0529', 'Chinta', 'Bhargavi', 'CSE', bid, 4, 'A', '23kp1a0529@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0530@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0530', '23KP1A0530', 'Chintalacheruvu', 'Lakshmi Prasanna', 'CSE', bid, 4, 'A', '23kp1a0530@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0531@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0531', '23KP1A0531', 'Chiripireddy', 'Veera Venkata Ravindra Reddy', 'CSE', bid, 4, 'A', '23kp1a0531@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0532@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0532', '23KP1A0532', 'Chodavarapu', 'Triveni', 'CSE', bid, 4, 'A', '23kp1a0532@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0533@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0533', '23KP1A0533', 'Choppara', 'Durgamani', 'CSE', bid, 4, 'A', '23kp1a0533@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0534@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0534', '23KP1A0534', 'Dandu', 'Chandu', 'CSE', bid, 4, 'A', '23kp1a0534@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0535@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0535', '23KP1A0535', 'Dasari', 'Kartheek', 'CSE', bid, 4, 'A', '23kp1a0535@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0536@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0536', '23KP1A0536', 'Dasari', 'Karthik', 'CSE', bid, 4, 'A', '23kp1a0536@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0537@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0537', '23KP1A0537', 'Dasari', 'Satya Sridevi', 'CSE', bid, 4, 'A', '23kp1a0537@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0538@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0538', '23KP1A0538', 'Deevi', 'Reshmitha', 'CSE', bid, 4, 'A', '23kp1a0538@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0539@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0539', '23KP1A0539', 'Devarakonda', 'Shanmukh Raj', 'CSE', bid, 4, 'A', '23kp1a0539@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0540@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0540', '23KP1A0540', 'Duggineni', 'Venkata Sai Manoj', 'CSE', bid, 4, 'A', '23kp1a0540@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0541@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0541', '23KP1A0541', 'Edara', 'Sudeep Sai', 'CSE', bid, 4, 'A', '23kp1a0541@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0542@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0542', '23KP1A0542', 'Elisetti', 'Venkatesh', 'CSE', bid, 4, 'A', '23kp1a0542@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0543@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0543', '23KP1A0543', 'Gadde', 'Thirumala Thejaswani', 'CSE', bid, 4, 'A', '23kp1a0543@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0544@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0544', '23KP1A0544', 'Gadi', 'Surendra', 'CSE', bid, 4, 'A', '23kp1a0544@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0545@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0545', '23KP1A0545', 'Gandi', 'Santhosh Kumar', 'CSE', bid, 4, 'A', '23kp1a0545@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0546@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0546', '23KP1A0546', 'Gandu', 'Venkata Kiran Kumar Reddy', 'CSE', bid, 4, 'A', '23kp1a0546@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0547@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0547', '23KP1A0547', 'Goli', 'Lakshmi Sai Ram', 'CSE', bid, 4, 'A', '23kp1a0547@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0548@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0548', '23KP1A0548', 'Gopi', 'Pradeep', 'CSE', bid, 4, 'A', '23kp1a0548@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0549@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0549', '23KP1A0549', 'Goriparthi', 'Harshitha', 'CSE', bid, 4, 'A', '23kp1a0549@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0550@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0550', '23KP1A0550', 'Gundapaneni', 'Sowmya Sri', 'CSE', bid, 4, 'A', '23kp1a0550@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0551@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0551', '23KP1A0551', 'Ikkurthi', 'Hemanth Venkata Krishna', 'CSE', bid, 4, 'A', '23kp1a0551@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0552@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0552', '23KP1A0552', 'Ineti', 'Jaya Nandini', 'CSE', bid, 4, 'A', '23kp1a0552@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0553@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0553', '23KP1A0553', 'Irukulapati', 'Muktha Sai', 'CSE', bid, 4, 'A', '23kp1a0553@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0554@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0554', '23KP1A0554', 'Isukala', 'Raju', 'CSE', bid, 4, 'A', '23kp1a0554@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0555@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0555', '23KP1A0555', 'Jarubula', 'Suma', 'CSE', bid, 4, 'A', '23kp1a0555@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0556@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0556', '23KP1A0556', 'Jonnala', 'Aswitha', 'CSE', bid, 4, 'A', '23kp1a0556@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0557@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0557', '23KP1A0557', 'Jyesta', 'Madhuri', 'CSE', bid, 4, 'A', '23kp1a0557@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0558@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0558', '23KP1A0558', 'Kakumanu', 'Sai Teja', 'CSE', bid, 4, 'A', '23kp1a0558@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0559@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0559', '23KP1A0559', 'Kamepalli', 'Sekhar', 'CSE', bid, 4, 'A', '23kp1a0559@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0560@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0560', '23KP1A0560', 'Kappala', 'Narendra', 'CSE', bid, 4, 'A', '23kp1a0560@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0503@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0503', '23KP1A0503', 'Akasi', 'Venkata Balaji', 'CSE', bid, 4, 'A', '23kp1a0503@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0561@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0561', '23KP1A0561', 'Katta', 'Josh Karthik Vijayendra Chowd', 'CSE', bid, 4, 'B', '23kp1a0561@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0562@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0562', '23KP1A0562', 'Kattupalli', 'Syam', 'CSE', bid, 4, 'B', '23kp1a0562@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0563@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0563', '23KP1A0563', 'Konda', 'Hemams Sesha Sai', 'CSE', bid, 4, 'B', '23kp1a0563@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0564@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0564', '23KP1A0564', 'Korrapati', 'Jayanth Babu', 'CSE', bid, 4, 'B', '23kp1a0564@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0565@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0565', '23KP1A0565', 'Koruprolu', 'Kanaka Lakshmi Narasimha', 'CSE', bid, 4, 'B', '23kp1a0565@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0566@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0566', '23KP1A0566', 'Kumbha', 'Vijaykumar', 'CSE', bid, 4, 'B', '23kp1a0566@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0567@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0567', '23KP1A0567', 'Kuncham', 'Chinna Rayappa', 'CSE', bid, 4, 'B', '23kp1a0567@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0568@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0568', '23KP1A0568', 'Madala', 'Jyothi Tulasi', 'CSE', bid, 4, 'B', '23kp1a0568@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0569@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0569', '23KP1A0569', 'Madala', 'Srikanth', 'CSE', bid, 4, 'B', '23kp1a0569@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0570@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0570', '23KP1A0570', 'Maddu', 'Gopi Krishna Chaithanya', 'CSE', bid, 4, 'B', '23kp1a0570@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0571@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0571', '23KP1A0571', 'Magham', 'Vijaya Teja', 'CSE', bid, 4, 'B', '23kp1a0571@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0572@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0572', '23KP1A0572', 'Mahanthi', 'Prem Kumar', 'CSE', bid, 4, 'B', '23kp1a0572@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0573@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0573', '23KP1A0573', 'Makkena', 'Devaraj Kumar', 'CSE', bid, 4, 'B', '23kp1a0573@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0574@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0574', '23KP1A0574', 'Malempati', 'Veda Ragamalika', 'CSE', bid, 4, 'B', '23kp1a0574@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0576@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0576', '23KP1A0576', 'Mandadapu', 'Sukanya', 'CSE', bid, 4, 'B', '23kp1a0576@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0577@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0577', '23KP1A0577', 'Mannava', 'Rajesh Kumar', 'CSE', bid, 4, 'B', '23kp1a0577@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0578@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0578', '23KP1A0578', 'Margani', 'Naga Teja Karthik', 'CSE', bid, 4, 'B', '23kp1a0578@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0579@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0579', '23KP1A0579', 'Marneni', 'Venkata Chandu', 'CSE', bid, 4, 'B', '23kp1a0579@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0580@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0580', '23KP1A0580', 'Meda', 'Bhargavi', 'CSE', bid, 4, 'B', '23kp1a0580@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0581@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0581', '23KP1A0581', 'Medarametla', 'Swathi', 'CSE', bid, 4, 'B', '23kp1a0581@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0583@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0583', '23KP1A0583', 'Mekala', 'Siddu', 'CSE', bid, 4, 'B', '23kp1a0583@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0584@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0584', '23KP1A0584', 'Modela', 'Tejaswini', 'CSE', bid, 4, 'B', '23kp1a0584@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0585@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0585', '23KP1A0585', 'Moguluri', 'Navya', 'CSE', bid, 4, 'B', '23kp1a0585@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0586@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0586', '23KP1A0586', 'Moguluri', 'Rohith', 'CSE', bid, 4, 'B', '23kp1a0586@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0587@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0587', '23KP1A0587', 'Motamarri', 'Durga Venkata Jyothirmai', 'CSE', bid, 4, 'B', '23kp1a0587@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0588@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0588', '23KP1A0588', 'Mullangi', 'Jyotsna Reddy', 'CSE', bid, 4, 'B', '23kp1a0588@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0589@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0589', '23KP1A0589', 'Mullapati', 'Harisha Reddy', 'CSE', bid, 4, 'B', '23kp1a0589@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0590@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0590', '23KP1A0590', 'Munnangi', 'Meghana', 'CSE', bid, 4, 'B', '23kp1a0590@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0591@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0591', '23KP1A0591', 'Muppalla', 'Deepika', 'CSE', bid, 4, 'B', '23kp1a0591@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0592@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0592', '23KP1A0592', 'Murikipudi', 'Ramu', 'CSE', bid, 4, 'B', '23kp1a0592@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0593@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0593', '23KP1A0593', 'Mutukuru', 'Srikanth', 'CSE', bid, 4, 'B', '23kp1a0593@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0594@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0594', '23KP1A0594', 'Muvva', 'Hemanth Kumar', 'CSE', bid, 4, 'B', '23kp1a0594@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0595@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0595', '23KP1A0595', 'Naidu', 'Siva Naga Lakshmi', 'CSE', bid, 4, 'B', '23kp1a0595@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0596@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0596', '23KP1A0596', 'Nalajala', 'Pavithra', 'CSE', bid, 4, 'B', '23kp1a0596@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0597@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0597', '23KP1A0597', 'Nallapuneni', 'Sai Krishna', 'CSE', bid, 4, 'B', '23kp1a0597@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0598@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0598', '23KP1A0598', 'Nandyala', 'Venkata Gopi', 'CSE', bid, 4, 'B', '23kp1a0598@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0599@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0599', '23KP1A0599', 'Narra', 'Chetan Brahma Sai', 'CSE', bid, 4, 'B', '23kp1a0599@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05a0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05A0', '23KP1A05A0', 'Nethagani', 'Anuraga Chandra', 'CSE', bid, 4, 'B', '23kp1a05a0@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05a1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05A1', '23KP1A05A1', 'Nomula', 'Anil', 'CSE', bid, 4, 'B', '23kp1a05a1@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05a2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05A2', '23KP1A05A2', 'Noorbasha', 'Shajahan', 'CSE', bid, 4, 'B', '23kp1a05a2@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05a3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05A3', '23KP1A05A3', 'Nukasani', 'Lokesh', 'CSE', bid, 4, 'B', '23kp1a05a3@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05a4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05A4', '23KP1A05A4', 'Nuthangi', 'Navadeep', 'CSE', bid, 4, 'B', '23kp1a05a4@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05a6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05A6', '23KP1A05A6', 'Paladugu', 'Wesley', 'CSE', bid, 4, 'B', '23kp1a05a6@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05a7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05A7', '23KP1A05A7', 'Paleti', 'Ashritha Chowdary', 'CSE', bid, 4, 'B', '23kp1a05a7@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05a8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05A8', '23KP1A05A8', 'Palisetty', 'Divya', 'CSE', bid, 4, 'B', '23kp1a05a8@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05a9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05A9', '23KP1A05A9', 'Panditi', 'Amulya', 'CSE', bid, 4, 'B', '23kp1a05a9@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05b1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05B1', '23KP1A05B1', 'Pathan', 'Rafimunisa', 'CSE', bid, 4, 'B', '23kp1a05b1@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05b2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05B2', '23KP1A05B2', 'Pathipati', 'Kulasekhar Chowdary', 'CSE', bid, 4, 'B', '23kp1a05b2@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05b4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05B4', '23KP1A05B4', 'Patibandla', 'Prudhvi Chowdary', 'CSE', bid, 4, 'B', '23kp1a05b4@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05b5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05B5', '23KP1A05B5', 'Polampalli', 'Dayakar Babu', 'CSE', bid, 4, 'B', '23kp1a05b5@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05b6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05B6', '23KP1A05B6', 'Pondhuri', 'Lohitha', 'CSE', bid, 4, 'B', '23kp1a05b6@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05b7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05B7', '23KP1A05B7', 'Potlacheruvu', 'Venkata Sai Pavanhass', 'CSE', bid, 4, 'B', '23kp1a05b7@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05b8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05B8', '23KP1A05B8', 'Potru', 'Mani Kanta', 'CSE', bid, 4, 'B', '23kp1a05b8@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05b9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05B9', '23KP1A05B9', 'Putluri', 'Koteswara Reddy', 'CSE', bid, 4, 'B', '23kp1a05b9@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05c0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05C0', '23KP1A05C0', 'Kondeti', 'Vijay', 'CSE', bid, 4, 'B', '23kp1a05c0@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05b0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05B0', '23KP1A05B0', 'Parakandla', 'Nandini', 'CSE', bid, 4, 'B', '23kp1a05b0@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0582@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0582', '23KP1A0582', 'Mekala', 'Jhansi', 'CSE', bid, 4, 'B', '23kp1a0582@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0575@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0575', '23KP1A0575', 'Manda', 'Prem Kumar', 'CSE', bid, 4, 'B', '23kp1a0575@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05b3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05B3', '23KP1A05B3', 'Shaik', 'Aliya Tahaseen', 'CSE', bid, 4, 'B', '23kp1a05b3@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05c1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05C1', '23KP1A05C1', 'Rajolu', 'Jaya Krishna', 'CSE', bid, 4, 'C', '23kp1a05c1@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05c2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05C2', '23KP1A05C2', 'Ramayanam', 'Raghavaiah', 'CSE', bid, 4, 'C', '23kp1a05c2@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05c3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05C3', '23KP1A05C3', 'Repudi', 'Aravind Kumar', 'CSE', bid, 4, 'C', '23kp1a05c3@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05c4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05C4', '23KP1A05C4', 'Repudi', 'Priyanka', 'CSE', bid, 4, 'C', '23kp1a05c4@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05c5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05C5', '23KP1A05C5', 'Rodda', 'Venkateswara Rao', 'CSE', bid, 4, 'C', '23kp1a05c5@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05c7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05C7', '23KP1A05C7', 'Saravanabhavan', 'Saranya', 'CSE', bid, 4, 'C', '23kp1a05c7@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05c8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05C8', '23KP1A05C8', 'Sesetti', 'Venkatalakshmi', 'CSE', bid, 4, 'C', '23kp1a05c8@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05c9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05C9', '23KP1A05C9', 'Pathlavath', 'Kavitha Bai', 'CSE', bid, 4, 'C', '23kp1a05c9@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05d0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05D0', '23KP1A05D0', 'Shaik', 'Basha', 'CSE', bid, 4, 'C', '23kp1a05d0@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05d1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05D1', '23KP1A05D1', 'Shaik', 'Hussain Basha', 'CSE', bid, 4, 'C', '23kp1a05d1@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05d2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05D2', '23KP1A05D2', 'Shaik', 'Izaz', 'CSE', bid, 4, 'C', '23kp1a05d2@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05d3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05D3', '23KP1A05D3', 'Shaik', 'Mabasha', 'CSE', bid, 4, 'C', '23kp1a05d3@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05d5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05D5', '23KP1A05D5', 'Shaik', 'Mohammad Mahim', 'CSE', bid, 4, 'C', '23kp1a05d5@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05d6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05D6', '23KP1A05D6', 'Shaik', 'Patta Bibi Ayesha', 'CSE', bid, 4, 'C', '23kp1a05d6@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05d7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05D7', '23KP1A05D7', 'Shaik', 'Sahedabe', 'CSE', bid, 4, 'C', '23kp1a05d7@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05d9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05D9', '23KP1A05D9', 'Shaik', 'Thagbeer', 'CSE', bid, 4, 'C', '23kp1a05d9@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05e0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05E0', '23KP1A05E0', 'Singamsetty', 'Naveen', 'CSE', bid, 4, 'C', '23kp1a05e0@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05e1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05E1', '23KP1A05E1', 'Somula', 'Dundi Venkata Ganesh', 'CSE', bid, 4, 'C', '23kp1a05e1@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05e2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05E2', '23KP1A05E2', 'Sreeramsetty', 'Meenakshi', 'CSE', bid, 4, 'C', '23kp1a05e2@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05e3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05E3', '23KP1A05E3', 'Suddapalli', 'Maha Lakshmi Niharika', 'CSE', bid, 4, 'C', '23kp1a05e3@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05e5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05E5', '23KP1A05E5', 'Tananki', 'Sravanthi', 'CSE', bid, 4, 'C', '23kp1a05e5@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05e6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05E6', '23KP1A05E6', 'Tanikonda', 'Jyoshna', 'CSE', bid, 4, 'C', '23kp1a05e6@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05e7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05E7', '23KP1A05E7', 'Thurumella', 'Kranthi Kumar', 'CSE', bid, 4, 'C', '23kp1a05e7@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05e8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05E8', '23KP1A05E8', 'Ullangula', 'Pavani', 'CSE', bid, 4, 'C', '23kp1a05e8@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05e9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05E9', '23KP1A05E9', 'Vadlamudi', 'Susmitha', 'CSE', bid, 4, 'C', '23kp1a05e9@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05f0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05F0', '23KP1A05F0', 'Vaikuntham', 'Vani', 'CSE', bid, 4, 'C', '23kp1a05f0@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05f1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05F1', '23KP1A05F1', 'Vallapureddy', 'Srinadh Reddy', 'CSE', bid, 4, 'C', '23kp1a05f1@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05f2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05F2', '23KP1A05F2', 'Vankadari', 'Dilip', 'CSE', bid, 4, 'C', '23kp1a05f2@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05f3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05F3', '23KP1A05F3', 'Veerla', 'Leela Madhuri', 'CSE', bid, 4, 'C', '23kp1a05f3@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05f4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05F4', '23KP1A05F4', 'Vejendla', 'Raju', 'CSE', bid, 4, 'C', '23kp1a05f4@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05f5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05F5', '23KP1A05F5', 'Vemulamada', 'Tejaeswar', 'CSE', bid, 4, 'C', '23kp1a05f5@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05f6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05F6', '23KP1A05F6', 'Vemulapalli', 'Surya Likitha', 'CSE', bid, 4, 'C', '23kp1a05f6@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05f7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05F7', '23KP1A05F7', 'Vuyyuru', 'Bhanu Sai Krishna', 'CSE', bid, 4, 'C', '23kp1a05f7@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05f8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05F8', '23KP1A05F8', 'Yajjala', 'Ashish', 'CSE', bid, 4, 'C', '23kp1a05f8@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05f9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05F9', '23KP1A05F9', 'Yarragorla', 'Veera Venkata Gopi Chand', 'CSE', bid, 4, 'C', '23kp1a05f9@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05g0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05G0', '23KP1A05G0', 'Yarru', 'Rajesh', 'CSE', bid, 4, 'C', '23kp1a05g0@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05g1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05G1', '23KP1A05G1', 'Yarru', 'Vasavi', 'CSE', bid, 4, 'C', '23kp1a05g1@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05g3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05G3', '23KP1A05G3', 'Shaik', 'Asheek', 'CSE', bid, 4, 'C', '23kp1a05g3@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05g4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05G4', '23KP1A05G4', 'Thodime', 'Raja Sekhar Reddy', 'CSE', bid, 4, 'C', '23kp1a05g4@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp5a0501@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP5A0501', '24KP5A0501', 'Alakunta', 'Raju', 'CSE', bid, 4, 'C', '24kp5a0501@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp5a0502@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP5A0502', '24KP5A0502', 'Are', 'Lokesh Reddy', 'CSE', bid, 4, 'C', '24kp5a0502@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp5a0503@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP5A0503', '24KP5A0503', 'Chevula', 'Lakshmi Annapurna', 'CSE', bid, 4, 'C', '24kp5a0503@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp5a0504@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP5A0504', '24KP5A0504', 'Gollu', 'Santosh Kumar', 'CSE', bid, 4, 'C', '24kp5a0504@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp5a0505@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP5A0505', '24KP5A0505', 'Sanna', 'Mareppa Gari Vasundhara', 'CSE', bid, 4, 'C', '24kp5a0505@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp5a0507@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP5A0507', '24KP5A0507', 'Mekapothu', 'Harikesavareddy', 'CSE', bid, 4, 'C', '24kp5a0507@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp5a0508@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP5A0508', '24KP5A0508', 'Midde', 'Sai Susmitha', 'CSE', bid, 4, 'C', '24kp5a0508@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp5a0509@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP5A0509', '24KP5A0509', 'Mohd', 'Abdul Bar', 'CSE', bid, 4, 'C', '24kp5a0509@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp5a0510@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP5A0510', '24KP5A0510', 'Mothukuri', 'Ratna Babu', 'CSE', bid, 4, 'C', '24kp5a0510@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp5a0511@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP5A0511', '24KP5A0511', 'Sameer', 'Babu Pathuri', 'CSE', bid, 4, 'C', '24kp5a0511@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp5a0512@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP5A0512', '24KP5A0512', 'Vattivellasaipradeep', '', 'CSE', bid, 4, 'C', '24kp5a0512@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a05c8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A05C8', '22KP1A05C8', 'Thota', 'Lazaru', 'CSE', bid, 8, 'B', '22kp1a05c8@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a05e2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A05E2', '22KP1A05E2', 'Kotapati', 'Rajesh', 'CSE', bid, 8, 'B', '22kp1a05e2@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a05d0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A05D0', '22KP1A05D0', 'Tokala', 'Mahidhar Sanjay', 'CSE', bid, 8, 'B', '22kp1a05d0@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2020 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('20kp1a0528@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '20KP1A0528', '20KP1A0528', 'Gangula', 'Gandla Christi Eshmitha', 'CSE', bid, 4, 'C', '20kp1a0528@nriit.ac.in', '9999999999', '2020-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05g2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05G2', '23KP1A05G2', 'Yedupati', 'Venkata Manoj', 'CSE', bid, 4, 'C', '23kp1a05g2@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05d4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05D4', '23KP1A05D4', 'Shaik', 'Mabu Subhani', 'CSE', bid, 4, 'C', '23kp1a05d4@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05e4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05E4', '23KP1A05E4', 'Tadiboina', 'Dinesh Kumar', 'CSE', bid, 4, 'C', '23kp1a05e4@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp5a0506@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP5A0506', '24KP5A0506', 'Mantada', 'Surya Vamsi', 'CSE', bid, 4, 'C', '24kp5a0506@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05c6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05C6', '23KP1A05C6', 'Sanam', 'Kalyanbabu', 'CSE', bid, 4, 'C', '23kp1a05c6@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a05d8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A05D8', '23KP1A05D8', 'Shaik', 'Sohail', 'CSE', bid, 4, 'C', '23kp1a05d8@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0501@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0501', '22KP1A0501', 'Aina', 'Tajriya Firdos', 'CSE', bid, 8, 'A', '22kp1a0501@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0502@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0502', '22KP1A0502', 'Ambati', 'Yathindranath Reddy', 'CSE', bid, 8, 'A', '22kp1a0502@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0504@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0504', '22KP1A0504', 'Appari', 'Naga Sai Santhosh', 'CSE', bid, 8, 'A', '22kp1a0504@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0505@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0505', '22KP1A0505', 'Badduri', 'Raja Nithin Reddy', 'CSE', bid, 8, 'A', '22kp1a0505@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0506@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0506', '22KP1A0506', 'Balabattina', 'Vijay Kumar', 'CSE', bid, 8, 'A', '22kp1a0506@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0507@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0507', '22KP1A0507', 'Balusupati', 'Deepika', 'CSE', bid, 8, 'A', '22kp1a0507@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0508@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0508', '22KP1A0508', 'Bandaru', 'Vasu', 'CSE', bid, 8, 'A', '22kp1a0508@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0509@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0509', '22KP1A0509', 'Bangaru', 'Tejaswini', 'CSE', bid, 8, 'A', '22kp1a0509@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0510@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0510', '22KP1A0510', 'Bathula', 'Mahesh', 'CSE', bid, 8, 'A', '22kp1a0510@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0511@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0511', '22KP1A0511', 'Battula', 'Triveni', 'CSE', bid, 8, 'A', '22kp1a0511@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0512@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0512', '22KP1A0512', 'Bayyapuneni', 'Kavya Suma', 'CSE', bid, 8, 'A', '22kp1a0512@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0513@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0513', '22KP1A0513', 'Belly', 'Manasa', 'CSE', bid, 8, 'A', '22kp1a0513@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0514@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0514', '22KP1A0514', 'Biollineni', 'Pravalika', 'CSE', bid, 8, 'A', '22kp1a0514@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0516@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0516', '22KP1A0516', 'Bonam', 'Ganesh', 'CSE', bid, 8, 'A', '22kp1a0516@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0517@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0517', '22KP1A0517', 'Bulla', 'Srinivasa Rao', 'CSE', bid, 8, 'A', '22kp1a0517@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0518@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0518', '22KP1A0518', 'Busi', 'Lakshmi Sowjanya', 'CSE', bid, 8, 'A', '22kp1a0518@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0519@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0519', '22KP1A0519', 'Challagundla', 'Harsha Vardhan Chowdary', 'CSE', bid, 8, 'A', '22kp1a0519@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0520@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0520', '22KP1A0520', 'Chaluvadi', 'Gopi', 'CSE', bid, 8, 'A', '22kp1a0520@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0521@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0521', '22KP1A0521', 'Chanamala', 'Bhuvaneswari', 'CSE', bid, 8, 'A', '22kp1a0521@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0522@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0522', '22KP1A0522', 'Chatharajupalli', 'Nandini', 'CSE', bid, 8, 'A', '22kp1a0522@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0523@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0523', '22KP1A0523', 'Chatharajupalli', 'Pavani', 'CSE', bid, 8, 'A', '22kp1a0523@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0524@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0524', '22KP1A0524', 'Chigurupati', 'Jaya Naga Sai Sujith', 'CSE', bid, 8, 'A', '22kp1a0524@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0525@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0525', '22KP1A0525', 'Chilka', 'Pravathi', 'CSE', bid, 8, 'A', '22kp1a0525@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0526@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0526', '22KP1A0526', 'Chilka', 'Sravani', 'CSE', bid, 8, 'A', '22kp1a0526@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0528@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0528', '22KP1A0528', 'Daggubati', 'Manasa', 'CSE', bid, 8, 'A', '22kp1a0528@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0529@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0529', '22KP1A0529', 'Darlla', 'Sowmya', 'CSE', bid, 8, 'A', '22kp1a0529@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0530@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0530', '22KP1A0530', 'Dasari', 'Navya', 'CSE', bid, 8, 'A', '22kp1a0530@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0531@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0531', '22KP1A0531', 'Dundi', 'Eswar Reddy', 'CSE', bid, 8, 'A', '22kp1a0531@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0532@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0532', '22KP1A0532', 'Eeda', 'Anusha', 'CSE', bid, 8, 'A', '22kp1a0532@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0533@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0533', '22KP1A0533', 'Epenagandla', 'Lakshmi', 'CSE', bid, 8, 'A', '22kp1a0533@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0534@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0534', '22KP1A0534', 'Gamidi', 'Manasa', 'CSE', bid, 8, 'A', '22kp1a0534@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0535@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0535', '22KP1A0535', 'Ganga', 'Santhi', 'CSE', bid, 8, 'A', '22kp1a0535@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0536@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0536', '22KP1A0536', 'Ganipalli', 'Srisujan', 'CSE', bid, 8, 'A', '22kp1a0536@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0537@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0537', '22KP1A0537', 'Gogulamudi', 'Blessy', 'CSE', bid, 8, 'A', '22kp1a0537@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0538@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0538', '22KP1A0538', 'Goli', 'Lavanya', 'CSE', bid, 8, 'A', '22kp1a0538@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0539@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0539', '22KP1A0539', 'Golla', 'Gopi Chand', 'CSE', bid, 8, 'A', '22kp1a0539@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0540@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0540', '22KP1A0540', 'Gollapudi', 'Nirmaladitya', 'CSE', bid, 8, 'A', '22kp1a0540@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0541@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0541', '22KP1A0541', 'Gollapudi', 'Suyra Teja', 'CSE', bid, 8, 'A', '22kp1a0541@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0542@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0542', '22KP1A0542', 'Golugoori', 'Bala Sivasai Veera Raghava Reddy', 'CSE', bid, 8, 'A', '22kp1a0542@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0543@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0543', '22KP1A0543', 'Gorla', 'Navya', 'CSE', bid, 8, 'A', '22kp1a0543@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0544@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0544', '22KP1A0544', 'Guddeti', 'Ramcharan Teja', 'CSE', bid, 8, 'A', '22kp1a0544@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0545@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0545', '22KP1A0545', 'Gudipati', 'Pujitha', 'CSE', bid, 8, 'A', '22kp1a0545@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0546@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0546', '22KP1A0546', 'Gudipudi', 'Kranthi Kumar', 'CSE', bid, 8, 'A', '22kp1a0546@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0547@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0547', '22KP1A0547', 'Gummadi', 'Sowjanya', 'CSE', bid, 8, 'A', '22kp1a0547@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0548@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0548', '22KP1A0548', 'Harsha', 'Vardhan Rayudu Ravuri', 'CSE', bid, 8, 'A', '22kp1a0548@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0549@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0549', '22KP1A0549', 'Immadi', 'Harivardhan', 'CSE', bid, 8, 'A', '22kp1a0549@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0550@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0550', '22KP1A0550', 'Immadi', 'Pavan Teja', 'CSE', bid, 8, 'A', '22kp1a0550@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0551@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0551', '22KP1A0551', 'Inavolu', 'Venkata Sai Santhosha Lakshmi', 'CSE', bid, 8, 'A', '22kp1a0551@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0552@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0552', '22KP1A0552', 'Inet', 'Indu Lakshmi', 'CSE', bid, 8, 'A', '22kp1a0552@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0553@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0553', '22KP1A0553', 'Javvaji', 'Amara Lakshmi Trisha', 'CSE', bid, 8, 'A', '22kp1a0553@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0554@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0554', '22KP1A0554', 'Kancharla', 'Chaitanya', 'CSE', bid, 8, 'A', '22kp1a0554@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0555@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0555', '22KP1A0555', 'Karyamsetty', 'Vijay Joshi', 'CSE', bid, 8, 'A', '22kp1a0555@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0556@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0556', '22KP1A0556', 'Kasimkota', 'Pranathi', 'CSE', bid, 8, 'A', '22kp1a0556@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0557@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0557', '22KP1A0557', 'Kayakakula', 'Badara Bhooshan', 'CSE', bid, 8, 'A', '22kp1a0557@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0558@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0558', '22KP1A0558', 'Kilari', 'Vyshnavi', 'CSE', bid, 8, 'A', '22kp1a0558@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0559@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0559', '22KP1A0559', 'Koduri', 'Syam Kumar', 'CSE', bid, 8, 'A', '22kp1a0559@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0560@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0560', '22KP1A0560', 'Kokkiligadda', 'Rajeev', 'CSE', bid, 8, 'A', '22kp1a0560@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0561@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0561', '22KP1A0561', 'Kollu', 'Sushma', 'CSE', bid, 8, 'A', '22kp1a0561@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0563@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0563', '22KP1A0563', 'Kondaru', 'Prabhu', 'CSE', bid, 8, 'A', '22kp1a0563@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0564@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0564', '22KP1A0564', 'Konkepudi', 'Vishnu', 'CSE', bid, 8, 'A', '22kp1a0564@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0565@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0565', '22KP1A0565', 'Koppula', 'Dinesh', 'CSE', bid, 8, 'A', '22kp1a0565@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0566@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0566', '22KP1A0566', 'Korabandi', 'Jashuva', 'CSE', bid, 8, 'A', '22kp1a0566@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0567@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0567', '22KP1A0567', 'Korada', 'Mohan Kumar', 'CSE', bid, 8, 'A', '22kp1a0567@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0568@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0568', '22KP1A0568', 'Kunchala', 'Indra Murthi', 'CSE', bid, 8, 'A', '22kp1a0568@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0569@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0569', '22KP1A0569', 'Kurra', 'Umesh', 'CSE', bid, 8, 'A', '22kp1a0569@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0570@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0570', '22KP1A0570', 'Kutala', 'Naga Ajay', 'CSE', bid, 8, 'A', '22kp1a0570@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0571@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0571', '22KP1A0571', 'Maddineni', 'Brahma Anitha', 'CSE', bid, 8, 'A', '22kp1a0571@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0572@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0572', '22KP1A0572', 'Majji', 'Navaneeth Kumar', 'CSE', bid, 8, 'A', '22kp1a0572@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0573@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0573', '22KP1A0573', 'Makkena', 'Vyshnavi', 'CSE', bid, 8, 'A', '22kp1a0573@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0574@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0574', '22KP1A0574', 'Maniganti', 'Ganesh Sivaji', 'CSE', bid, 8, 'A', '22kp1a0574@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0575@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0575', '22KP1A0575', 'Sudireddy', 'Sai Lakshmi', 'CSE', bid, 8, 'A', '22kp1a0575@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0527@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0527', '22KP1A0527', 'Chinthapalli', 'Srinivas', 'CSE', bid, 8, 'A', '22kp1a0527@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0562@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0562', '22KP1A0562', 'Komera', 'Chinnaraja', 'CSE', bid, 8, 'A', '22kp1a0562@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0515@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0515', '22KP1A0515', 'Bokka', 'Hemant Pottieiah', 'CSE', bid, 8, 'A', '22kp1a0515@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0503@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0503', '22KP1A0503', 'Annam', 'Divya Lakshmi', 'CSE', bid, 8, 'A', '22kp1a0503@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0577@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0577', '22KP1A0577', 'Marthala', 'Nagamani', 'CSE', bid, 8, 'B', '22kp1a0577@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0578@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0578', '22KP1A0578', 'Md', 'Javeria Shaheen', 'CSE', bid, 8, 'B', '22kp1a0578@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0579@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0579', '22KP1A0579', 'Meka', 'Revathi', 'CSE', bid, 8, 'B', '22kp1a0579@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0580@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0580', '22KP1A0580', 'Meriga', 'Solomanu', 'CSE', bid, 8, 'B', '22kp1a0580@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0581@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0581', '22KP1A0581', 'Mindala', 'Komala Lakshmi Prasanna', 'CSE', bid, 8, 'B', '22kp1a0581@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0582@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0582', '22KP1A0582', 'Mohan', 'Das Varsha', 'CSE', bid, 8, 'B', '22kp1a0582@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0583@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0583', '22KP1A0583', 'Mukku', 'Prathyusha', 'CSE', bid, 8, 'B', '22kp1a0583@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0584@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0584', '22KP1A0584', 'Murikipudi', 'Naresh', 'CSE', bid, 8, 'B', '22kp1a0584@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0585@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0585', '22KP1A0585', 'Myneni', 'Bhuvaneswari', 'CSE', bid, 8, 'B', '22kp1a0585@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0586@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0586', '22KP1A0586', 'Myneni', 'Jwalitha', 'CSE', bid, 8, 'B', '22kp1a0586@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0587@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0587', '22KP1A0587', 'Nakkala', 'Shivaiah', 'CSE', bid, 8, 'B', '22kp1a0587@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0588@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0588', '22KP1A0588', 'Napa', 'Praveen Kumar', 'CSE', bid, 8, 'B', '22kp1a0588@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0589@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0589', '22KP1A0589', 'Naraga', 'Srihari', 'CSE', bid, 8, 'B', '22kp1a0589@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0590@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0590', '22KP1A0590', 'Nuthalapati', 'Bhanu Prakash', 'CSE', bid, 8, 'B', '22kp1a0590@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0591@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0591', '22KP1A0591', 'Palakollu', 'Ganesh Kumar', 'CSE', bid, 8, 'B', '22kp1a0591@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0592@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0592', '22KP1A0592', 'Pallepogu', 'Mahesh Babu', 'CSE', bid, 8, 'B', '22kp1a0592@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0593@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0593', '22KP1A0593', 'Palnati', 'Vignesh', 'CSE', bid, 8, 'B', '22kp1a0593@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0594@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0594', '22KP1A0594', 'Parimi', 'Venkata Narasaiah', 'CSE', bid, 8, 'B', '22kp1a0594@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0595@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0595', '22KP1A0595', 'Pasupuleti', 'Bhagya Lakshmi', 'CSE', bid, 8, 'B', '22kp1a0595@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0596@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0596', '22KP1A0596', 'Pattela', 'Dolika Nandini', 'CSE', bid, 8, 'B', '22kp1a0596@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0597@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0597', '22KP1A0597', 'Payala', 'Narendra', 'CSE', bid, 8, 'B', '22kp1a0597@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0598@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0598', '22KP1A0598', 'Penubothu', 'Shannumukha Lakshmi Bhavani', 'CSE', bid, 8, 'B', '22kp1a0598@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0599@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0599', '22KP1A0599', 'Pilli', 'Smiley', 'CSE', bid, 8, 'B', '22kp1a0599@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a05a0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A05A0', '22KP1A05A0', 'Poleboyina', 'Gnana Bala Kumar', 'CSE', bid, 8, 'B', '22kp1a05a0@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a05a1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A05A1', '22KP1A05A1', 'Putta', 'Praneeth', 'CSE', bid, 8, 'B', '22kp1a05a1@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a05a2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A05A2', '22KP1A05A2', 'Ragula', 'Sai', 'CSE', bid, 8, 'B', '22kp1a05a2@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a05a3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A05A3', '22KP1A05A3', 'Ravipati', 'Tirumala Venkata Pavan Teja', 'CSE', bid, 8, 'B', '22kp1a05a3@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a05a4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A05A4', '22KP1A05A4', 'Routhu', 'Lakshmi Sai', 'CSE', bid, 8, 'B', '22kp1a05a4@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a05a5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A05A5', '22KP1A05A5', 'Rudrapati', 'Rohith Arun Raj', 'CSE', bid, 8, 'B', '22kp1a05a5@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a05a6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A05A6', '22KP1A05A6', 'Sangam', 'Harshitha', 'CSE', bid, 8, 'B', '22kp1a05a6@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a05a7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A05A7', '22KP1A05A7', 'Saripudi', 'Saranya', 'CSE', bid, 8, 'B', '22kp1a05a7@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a05a8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A05A8', '22KP1A05A8', 'Shaik', 'Abdul Gani', 'CSE', bid, 8, 'B', '22kp1a05a8@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a05a9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A05A9', '22KP1A05A9', 'Shaik', 'Aisha Siddik', 'CSE', bid, 8, 'B', '22kp1a05a9@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a05b0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A05B0', '22KP1A05B0', 'Shaik', 'Chandini Tabussum', 'CSE', bid, 8, 'B', '22kp1a05b0@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a05b1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A05B1', '22KP1A05B1', 'Shaik', 'Imraan Baig', 'CSE', bid, 8, 'B', '22kp1a05b1@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a05b2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A05B2', '22KP1A05B2', 'Shaik', 'Jul Fayaz', 'CSE', bid, 8, 'B', '22kp1a05b2@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a05b3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A05B3', '22KP1A05B3', 'Shaik', 'Liluthunnisa', 'CSE', bid, 8, 'B', '22kp1a05b3@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a05b4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A05B4', '22KP1A05B4', 'Shaik', 'Moulali', 'CSE', bid, 8, 'B', '22kp1a05b4@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a05b5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A05B5', '22KP1A05B5', 'Shaik', 'Naziya', 'CSE', bid, 8, 'B', '22kp1a05b5@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a05b6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A05B6', '22KP1A05B6', 'Shaik', 'Reshma', 'CSE', bid, 8, 'B', '22kp1a05b6@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a05b7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A05B7', '22KP1A05B7', 'Shaik', 'Roshan', 'CSE', bid, 8, 'B', '22kp1a05b7@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a05b8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A05B8', '22KP1A05B8', 'Shaik', 'Rubeena', 'CSE', bid, 8, 'B', '22kp1a05b8@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a05b9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A05B9', '22KP1A05B9', 'Shaik', 'Saisha Banu', 'CSE', bid, 8, 'B', '22kp1a05b9@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a05c0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A05C0', '22KP1A05C0', 'Shaik', 'Shajiya', 'CSE', bid, 8, 'B', '22kp1a05c0@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a05c1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A05C1', '22KP1A05C1', 'Singamaneni', 'Sahithi', 'CSE', bid, 8, 'B', '22kp1a05c1@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a05c2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A05C2', '22KP1A05C2', 'Somepalli', 'Mahendra', 'CSE', bid, 8, 'B', '22kp1a05c2@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a05c3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A05C3', '22KP1A05C3', 'Subhash', 'Kadiyam', 'CSE', bid, 8, 'B', '22kp1a05c3@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a05c4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A05C4', '22KP1A05C4', 'Surya', 'Krishna Kondru', 'CSE', bid, 8, 'B', '22kp1a05c4@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a05c5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A05C5', '22KP1A05C5', 'Swarna', 'Tarun Sai', 'CSE', bid, 8, 'B', '22kp1a05c5@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a05c9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A05C9', '22KP1A05C9', 'Thota', 'Venkatalakshmi', 'CSE', bid, 8, 'B', '22kp1a05c9@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a05d1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A05D1', '22KP1A05D1', 'Tullimilli', 'Ajay', 'CSE', bid, 8, 'B', '22kp1a05d1@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a05d2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A05D2', '22KP1A05D2', 'Undela', 'Lavanya', 'CSE', bid, 8, 'B', '22kp1a05d2@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a05d3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A05D3', '22KP1A05D3', 'Vadlamudi', 'Tekita Venkata Manikanta', 'CSE', bid, 8, 'B', '22kp1a05d3@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a05d4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A05D4', '22KP1A05D4', 'Vallepu', 'Durga Bhavani', 'CSE', bid, 8, 'B', '22kp1a05d4@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a05d5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A05D5', '22KP1A05D5', 'Vankayalapati', 'Sandeep', 'CSE', bid, 8, 'B', '22kp1a05d5@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a05d6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A05D6', '22KP1A05D6', 'Varada', 'Uday Yaswanth', 'CSE', bid, 8, 'B', '22kp1a05d6@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a05d7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A05D7', '22KP1A05D7', 'Varagani', 'Sandhya', 'CSE', bid, 8, 'B', '22kp1a05d7@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a05d8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A05D8', '22KP1A05D8', 'Veeramallu', 'Harshini', 'CSE', bid, 8, 'B', '22kp1a05d8@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a05d9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A05D9', '22KP1A05D9', 'Vemulapalli', 'Gokul', 'CSE', bid, 8, 'B', '22kp1a05d9@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a05e0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A05E0', '22KP1A05E0', 'Yamana', 'Chaitanya', 'CSE', bid, 8, 'B', '22kp1a05e0@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a05e1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A05E1', '22KP1A05E1', 'Yarravarapu', 'Mohan Krishna', 'CSE', bid, 8, 'B', '22kp1a05e1@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp5a0501@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP5A0501', '23KP5A0501', 'Banka', 'Gowthami', 'CSE', bid, 8, 'B', '23kp5a0501@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp5a0502@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP5A0502', '23KP5A0502', 'Chavali', 'Venkata Sai', 'CSE', bid, 8, 'B', '23kp5a0502@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp5a0503@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP5A0503', '23KP5A0503', 'Gali', 'Vijaya Padmaja', 'CSE', bid, 8, 'B', '23kp5a0503@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp5a0504@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP5A0504', '23KP5A0504', 'Shaik', 'Mohammad Rafi', 'CSE', bid, 8, 'B', '23kp5a0504@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp5a0505@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP5A0505', '23KP5A0505', 'Sriramsetty', 'Teja', 'CSE', bid, 8, 'B', '23kp5a0505@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2021 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('21kp1a0520@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '21KP1A0520', '21KP1A0520', 'Doppalapudi', 'Tharun', 'CSE', bid, 8, 'B', '21kp1a0520@nriit.ac.in', '9999999999', '2021-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2021 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('21kp1a0542@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '21KP1A0542', '21KP1A0542', 'Kattepogu', 'Premkumar', 'CSE', bid, 8, 'B', '21kp1a0542@nriit.ac.in', '9999999999', '2021-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2021 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('21kp1a0590@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '21KP1A0590', '21KP1A0590', 'Sampathirao', 'Shiva Kumar', 'CSE', bid, 8, 'B', '21kp1a0590@nriit.ac.in', '9999999999', '2021-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2021 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('21kp1a0570@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '21KP1A0570', '21KP1A0570', 'Mylipalli', 'Kalyan', 'CSE', bid, 8, 'B', '21kp1a0570@nriit.ac.in', '9999999999', '2021-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2021 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('21kp1a05a5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '21KP1A05A5', '21KP1A05A5', 'Teegala', 'Jyothika', 'CSE', bid, 8, 'B', '21kp1a05a5@nriit.ac.in', '9999999999', '2021-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a05c6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A05C6', '22KP1A05C6', 'Tammisetti', 'Ganesh', 'CSE', bid, 8, 'B', '22kp1a05c6@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a05c7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A05C7', '22KP1A05C7', 'Tetanela', 'Lakshman', 'CSE', bid, 8, 'B', '22kp1a05c7@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a05e3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A05E3', '22KP1A05E3', 'Shaik', 'Mohammad Furqan', 'CSE', bid, 8, 'B', '22kp1a05e3@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a05e4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A05E4', '22KP1A05E4', 'Potharlanka', 'Srikanth', 'CSE', bid, 8, 'B', '22kp1a05e4@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2021 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('21kp1a0504@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '21KP1A0504', '21KP1A0504', 'Bandela', 'Sunny', 'CSE', bid, 8, 'B', '21kp1a0504@nriit.ac.in', '9999999999', '2021-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2021 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('21kp1a0555@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '21KP1A0555', '21KP1A0555', 'Lam', 'Prasanna Kumar', 'CSE', bid, 8, 'B', '21kp1a0555@nriit.ac.in', '9999999999', '2021-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2021 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('21kp1a0572@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '21KP1A0572', '21KP1A0572', 'Nalabolu', 'Venkateswarlu', 'CSE', bid, 8, 'B', '21kp1a0572@nriit.ac.in', '9999999999', '2021-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2021 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('21kp1a0584@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '21KP1A0584', '21KP1A0584', 'Pathakamuri', 'Naga Gopi', 'CSE', bid, 8, 'B', '21kp1a0584@nriit.ac.in', '9999999999', '2021-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2021 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('21kp1a05a4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '21KP1A05A4', '21KP1A05A4', 'Tammisetti', 'Narendra', 'CSE', bid, 8, 'B', '21kp1a05a4@nriit.ac.in', '9999999999', '2021-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2021 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('21kp1a05b6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '21KP1A05B6', '21KP1A05B6', 'Vuyyuri', 'Bala Subrahmanyam', 'CSE', bid, 8, 'B', '21kp1a05b6@nriit.ac.in', '9999999999', '2021-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0576@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0576', '22KP1A0576', 'Mannam', 'Bhargav', 'CSE', bid, 8, 'B', '22kp1a0576@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d5801@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D5801', '25KP1D5801', 'A', 'Renuka', 'CSE', bid, 1, 'A', '25kp1d5801@nriit.ac.in', '9121292733', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d5802@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D5802', '25KP1D5802', 'B', 'Parameswara Reddy', 'CSE', bid, 1, 'A', '25kp1d5802@nriit.ac.in', '6302421918', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d5803@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D5803', '25KP1D5803', 'Bhukya', 'Nageswara Rao', 'CSE', bid, 1, 'A', '25kp1d5803@nriit.ac.in', '9849975488', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d5804@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D5804', '25KP1D5804', 'C', 'Sekhar Rao Cheemakurthy', 'CSE', bid, 1, 'A', '25kp1d5804@nriit.ac.in', '9030882428', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d5805@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D5805', '25KP1D5805', 'Chevula', 'Sruthi', 'CSE', bid, 1, 'A', '25kp1d5805@nriit.ac.in', '9392432193', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d5806@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D5806', '25KP1D5806', 'Chikkam', 'Vishnu Priya', 'CSE', bid, 1, 'A', '25kp1d5806@nriit.ac.in', '8919128955', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d5807@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D5807', '25KP1D5807', 'Chinnam', 'Supriya', 'CSE', bid, 1, 'A', '25kp1d5807@nriit.ac.in', '6303357574', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d5808@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D5808', '25KP1D5808', 'Chirumamilla', 'Tharaka Saiteja', 'CSE', bid, 1, 'A', '25kp1d5808@nriit.ac.in', '9908521788', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d5809@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D5809', '25KP1D5809', 'Gumma', 'Venkata Vamsi Krishna Yadav', 'CSE', bid, 1, 'A', '25kp1d5809@nriit.ac.in', '7013841585', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d5810@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D5810', '25KP1D5810', 'Gurindapalli', 'Deepak', 'CSE', bid, 1, 'A', '25kp1d5810@nriit.ac.in', '9496991720', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d5811@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D5811', '25KP1D5811', 'Kandula', 'Hanumantha Rao', 'CSE', bid, 1, 'A', '25kp1d5811@nriit.ac.in', '9705616919', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d5812@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D5812', '25KP1D5812', 'Kandula', 'Raja Mohan Reddy', 'CSE', bid, 1, 'A', '25kp1d5812@nriit.ac.in', '6305226835', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d5813@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D5813', '25KP1D5813', 'Kezia', 'Mugala', 'CSE', bid, 1, 'A', '25kp1d5813@nriit.ac.in', '9177815339', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d5814@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D5814', '25KP1D5814', 'Korabandi', 'Nilima', 'CSE', bid, 1, 'A', '25kp1d5814@nriit.ac.in', '8897784749', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d5815@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D5815', '25KP1D5815', 'Koti', 'Sowjanya', 'CSE', bid, 1, 'A', '25kp1d5815@nriit.ac.in', '7382015825', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d5816@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D5816', '25KP1D5816', 'Kumbha', 'Sambaiah', 'CSE', bid, 1, 'A', '25kp1d5816@nriit.ac.in', '9502952860', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d5817@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D5817', '25KP1D5817', 'Kurra', 'Bala Gopaludu', 'CSE', bid, 1, 'A', '25kp1d5817@nriit.ac.in', '9492494189', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d5818@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D5818', '25KP1D5818', 'Maroju', 'Rajesh', 'CSE', bid, 1, 'A', '25kp1d5818@nriit.ac.in', '9059433134', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d5819@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D5819', '25KP1D5819', 'Moruboina', 'Bharath', 'CSE', bid, 1, 'A', '25kp1d5819@nriit.ac.in', '9398660649', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d5820@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D5820', '25KP1D5820', 'Nagaraju', 'Murikipudi', 'CSE', bid, 1, 'A', '25kp1d5820@nriit.ac.in', '9032907105', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d5821@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D5821', '25KP1D5821', 'Nakka', 'Harish', 'CSE', bid, 1, 'A', '25kp1d5821@nriit.ac.in', '9014605470', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d5822@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D5822', '25KP1D5822', 'Noorbasha', 'Dilshad', 'CSE', bid, 1, 'A', '25kp1d5822@nriit.ac.in', '8106066548', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d5823@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D5823', '25KP1D5823', 'Parvathaneni', 'Siva Prasad', 'CSE', bid, 1, 'A', '25kp1d5823@nriit.ac.in', '9160672737', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d5824@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D5824', '25KP1D5824', 'Praveena', 'Kadhire', 'CSE', bid, 1, 'A', '25kp1d5824@nriit.ac.in', '9885796870', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d5825@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D5825', '25KP1D5825', 'Pudota', 'Joseph Sai Mahitha Chowdary', 'CSE', bid, 1, 'A', '25kp1d5825@nriit.ac.in', '9492623777', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d5826@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D5826', '25KP1D5826', 'Ragala', 'Venkata Yedukondalu', 'CSE', bid, 1, 'A', '25kp1d5826@nriit.ac.in', '6300976842', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d5827@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D5827', '25KP1D5827', 'Sabiha', 'Sultana', 'CSE', bid, 1, 'A', '25kp1d5827@nriit.ac.in', '8121409467', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d5828@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D5828', '25KP1D5828', 'Sanagandla', 'Jyothi', 'CSE', bid, 1, 'A', '25kp1d5828@nriit.ac.in', '8309284825', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d5829@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D5829', '25KP1D5829', 'Shaik', 'Gandikotasalma', 'CSE', bid, 1, 'A', '25kp1d5829@nriit.ac.in', '9160703482', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d5830@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D5830', '25KP1D5830', 'Shaik', 'Khaja Vali', 'CSE', bid, 1, 'A', '25kp1d5830@nriit.ac.in', '6305239735', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d5831@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D5831', '25KP1D5831', 'Shaik', 'Nagul Meera', 'CSE', bid, 1, 'A', '25kp1d5831@nriit.ac.in', '7032074286', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d5832@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D5832', '25KP1D5832', 'Shaik', 'Shama', 'CSE', bid, 1, 'A', '25kp1d5832@nriit.ac.in', '7993790346', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d5833@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D5833', '25KP1D5833', 'Sivakrishna', 'Telluri', 'CSE', bid, 1, 'A', '25kp1d5833@nriit.ac.in', '9100736638', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d5834@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D5834', '25KP1D5834', 'Tavvagunta', 'Shaik Moulali', 'CSE', bid, 1, 'A', '25kp1d5834@nriit.ac.in', '9701026830', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d5835@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D5835', '25KP1D5835', 'Thanga', 'Sri Varsha', 'CSE', bid, 1, 'A', '25kp1d5835@nriit.ac.in', '9948843938', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d5836@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D5836', '25KP1D5836', 'Thati', 'Sai Chandra', 'CSE', bid, 1, 'A', '25kp1d5836@nriit.ac.in', '7396723596', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d5837@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D5837', '25KP1D5837', 'Thimmisetti', 'Thirumalesh', 'CSE', bid, 1, 'A', '25kp1d5837@nriit.ac.in', '9182692830', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d5838@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D5838', '25KP1D5838', 'Venkata', 'Taraka Nadh Nanduri', 'CSE', bid, 1, 'A', '25kp1d5838@nriit.ac.in', '9949193254', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d5839@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D5839', '25KP1D5839', 'Venkatasubbaiah', 'Jakkampudi', 'CSE', bid, 1, 'A', '25kp1d5839@nriit.ac.in', '9182632808', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d5840@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D5840', '25KP1D5840', 'Yadla', 'Divya Sai', 'CSE', bid, 1, 'A', '25kp1d5840@nriit.ac.in', '9490056849', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d5801@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D5801', '24KP1D5801', 'Allamsetti', 'Haribabu', 'CSE', bid, 4, 'A', '24kp1d5801@nriit.ac.in', '8125460728', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d5802@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D5802', '24KP1D5802', 'Chakkara', 'Prasanth Kumar Reddy', 'CSE', bid, 4, 'A', '24kp1d5802@nriit.ac.in', '7569936206', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d5803@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D5803', '24KP1D5803', 'Chanda', 'Anusha', 'CSE', bid, 4, 'A', '24kp1d5803@nriit.ac.in', '6301468876', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d5804@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D5804', '24KP1D5804', 'Chennamsetti', 'Gopi Krishna', 'CSE', bid, 4, 'A', '24kp1d5804@nriit.ac.in', '8142029896', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d5805@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D5805', '24KP1D5805', 'Sravan', 'Chennupati', 'CSE', bid, 4, 'A', '24kp1d5805@nriit.ac.in', '9603732780', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d5806@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D5806', '24KP1D5806', 'Chintamalla', 'Likhita', 'CSE', bid, 4, 'A', '24kp1d5806@nriit.ac.in', '7893334418', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d5807@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D5807', '24KP1D5807', 'Doppalapudi', 'Lakshmi Jahnavi', 'CSE', bid, 4, 'A', '24kp1d5807@nriit.ac.in', '7780439711', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d5808@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D5808', '24KP1D5808', 'Garikapati', 'Mounika', 'CSE', bid, 4, 'A', '24kp1d5808@nriit.ac.in', '9885951666', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d5809@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D5809', '24KP1D5809', 'Goparaju', 'Basava Naga Sowmya Sree', 'CSE', bid, 4, 'A', '24kp1d5809@nriit.ac.in', '7670986551', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d5810@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D5810', '24KP1D5810', 'Gundala', 'Sravani', 'CSE', bid, 4, 'A', '24kp1d5810@nriit.ac.in', '7093677616', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d5811@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D5811', '24KP1D5811', 'Gundala', 'Subhash', 'CSE', bid, 4, 'A', '24kp1d5811@nriit.ac.in', '8247418544', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d5812@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D5812', '24KP1D5812', 'Janibasha', 'Shaik', 'CSE', bid, 4, 'A', '24kp1d5812@nriit.ac.in', '7569111376', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d5813@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D5813', '24KP1D5813', 'Jaya', 'Chand Bandarupalli', 'CSE', bid, 4, 'A', '24kp1d5813@nriit.ac.in', '9989692873', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d5814@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D5814', '24KP1D5814', 'Jonnala', 'Bramhareddy', 'CSE', bid, 4, 'A', '24kp1d5814@nriit.ac.in', '9110582806', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d5815@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D5815', '24KP1D5815', 'Kakarla', 'Hemanth Nagavasu', 'CSE', bid, 4, 'A', '24kp1d5815@nriit.ac.in', '6304489110', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d5816@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D5816', '24KP1D5816', 'Kancharla', 'Hrushitha', 'CSE', bid, 4, 'A', '24kp1d5816@nriit.ac.in', '8096800679', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d5817@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D5817', '24KP1D5817', 'Komatigunta', 'Bharani Sri', 'CSE', bid, 4, 'A', '24kp1d5817@nriit.ac.in', '6281237179', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d5818@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D5818', '24KP1D5818', 'Kondepati', 'Ragagangaram', 'CSE', bid, 4, 'A', '24kp1d5818@nriit.ac.in', '9391043824', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d5819@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D5819', '24KP1D5819', 'Krishna', 'Jaswitha Kellampalli', 'CSE', bid, 4, 'A', '24kp1d5819@nriit.ac.in', '9542461457', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d5820@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D5820', '24KP1D5820', 'Lakshmi', 'Inturi', 'CSE', bid, 4, 'A', '24kp1d5820@nriit.ac.in', '7286072543', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d5821@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D5821', '24KP1D5821', 'Madduri', 'Bhargava Sri', 'CSE', bid, 4, 'A', '24kp1d5821@nriit.ac.in', '9553230677', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d5822@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D5822', '24KP1D5822', 'Malli', 'Vidhathri', 'CSE', bid, 4, 'A', '24kp1d5822@nriit.ac.in', '7673978448', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d5823@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D5823', '24KP1D5823', 'Manukonda', 'Praven Chowdary', 'CSE', bid, 4, 'A', '24kp1d5823@nriit.ac.in', '8978057919', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d5824@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D5824', '24KP1D5824', 'Mekala', 'Vamsi Manikanta', 'CSE', bid, 4, 'A', '24kp1d5824@nriit.ac.in', '9100989371', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d5825@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D5825', '24KP1D5825', 'Nuthalapati', 'Meghana', 'CSE', bid, 4, 'A', '24kp1d5825@nriit.ac.in', '8500599631', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d5826@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D5826', '24KP1D5826', 'Pathan', 'Adamshafi', 'CSE', bid, 4, 'A', '24kp1d5826@nriit.ac.in', '9676076001', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d5827@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D5827', '24KP1D5827', 'Rahim', 'Shaik', 'CSE', bid, 4, 'A', '24kp1d5827@nriit.ac.in', '9849201427', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d5828@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D5828', '24KP1D5828', 'Ramesh', 'Gundu', 'CSE', bid, 4, 'A', '24kp1d5828@nriit.ac.in', '9347256782', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d5829@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D5829', '24KP1D5829', 'Rayasam', 'Naga Venkata Kavya Sri', 'CSE', bid, 4, 'A', '24kp1d5829@nriit.ac.in', '8919058404', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d5830@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D5830', '24KP1D5830', 'Sanam', 'Manideepa', 'CSE', bid, 4, 'A', '24kp1d5830@nriit.ac.in', '9398278466', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d5831@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D5831', '24KP1D5831', 'Sanam', 'Venus Sundari', 'CSE', bid, 4, 'A', '24kp1d5831@nriit.ac.in', '7780432644', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d5832@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D5832', '24KP1D5832', 'Shaik', 'Akram', 'CSE', bid, 4, 'A', '24kp1d5832@nriit.ac.in', '7036043221', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d5833@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D5833', '24KP1D5833', 'Shaik', 'Mobeena', 'CSE', bid, 4, 'A', '24kp1d5833@nriit.ac.in', '9392961772', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d5834@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D5834', '24KP1D5834', 'Sreenivasulu', 'Shyamala', 'CSE', bid, 4, 'A', '24kp1d5834@nriit.ac.in', '9908501090', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d5835@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D5835', '24KP1D5835', 'Sudheer', 'Kumar Kaki', 'CSE', bid, 4, 'A', '24kp1d5835@nriit.ac.in', '7893432337', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d5836@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D5836', '24KP1D5836', 'Syed', 'Ahamad Basha', 'CSE', bid, 4, 'A', '24kp1d5836@nriit.ac.in', '6281263703', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d5837@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D5837', '24KP1D5837', 'Talluri', 'Kejiya Grace', 'CSE', bid, 4, 'A', '24kp1d5837@nriit.ac.in', '7893656528', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d5838@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D5838', '24KP1D5838', 'Vaka', 'Durga Teja', 'CSE', bid, 4, 'A', '24kp1d5838@nriit.ac.in', '9908773444', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d5839@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D5839', '24KP1D5839', 'Vericharla', 'N Malleswari', 'CSE', bid, 4, 'A', '24kp1d5839@nriit.ac.in', '9948501172', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d5840@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D5840', '24KP1D5840', 'Yallapragada', 'Naga Sai Padma Sri', 'CSE', bid, 4, 'A', '24kp1d5840@nriit.ac.in', '9573230593', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

END $$;
