-- PART 3B: More Students

-- ===== CSE-AI: 393 students =====
DO $$
DECLARE
    uid UUID;
    bid UUID;
BEGIN

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6101@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6101', '25KP1A6101', 'Aala', 'Prakash', 'CSE-AI', bid, 1, 'A', '25kp1a6101@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6102@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6102', '25KP1A6102', 'Ala', 'Vasanthi Sivapriya', 'CSE-AI', bid, 1, 'A', '25kp1a6102@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6103@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6103', '25KP1A6103', 'Alapati', 'Priya Sri', 'CSE-AI', bid, 1, 'A', '25kp1a6103@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6104@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6104', '25KP1A6104', 'Amararapu', 'Suvarna Kumar', 'CSE-AI', bid, 1, 'A', '25kp1a6104@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6105@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6105', '25KP1A6105', 'Amburi', 'Kamakshi', 'CSE-AI', bid, 1, 'A', '25kp1a6105@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6106@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6106', '25KP1A6106', 'Anumula', 'Venkateswarlu', 'CSE-AI', bid, 1, 'A', '25kp1a6106@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6107@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6107', '25KP1A6107', 'Aryavarapu', 'Uday Chandra', 'CSE-AI', bid, 1, 'A', '25kp1a6107@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6108@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6108', '25KP1A6108', 'Balusupati', 'Poornedra Sai', 'CSE-AI', bid, 1, 'A', '25kp1a6108@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6109@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6109', '25KP1A6109', 'Balusupati', 'Santhi Sri', 'CSE-AI', bid, 1, 'A', '25kp1a6109@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6110@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6110', '25KP1A6110', 'Bandaru', 'Charan Teja', 'CSE-AI', bid, 1, 'A', '25kp1a6110@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6111@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6111', '25KP1A6111', 'Bandi', 'Jagadeesh', 'CSE-AI', bid, 1, 'A', '25kp1a6111@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6112@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6112', '25KP1A6112', 'Bantupalli', 'Leelasagar', 'CSE-AI', bid, 1, 'A', '25kp1a6112@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6113@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6113', '25KP1A6113', 'Bingi', 'Dinesh', 'CSE-AI', bid, 1, 'A', '25kp1a6113@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6114@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6114', '25KP1A6114', 'Bitragunta', 'Navadeep', 'CSE-AI', bid, 1, 'A', '25kp1a6114@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6115@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6115', '25KP1A6115', 'Boppiri', 'Anusha', 'CSE-AI', bid, 1, 'A', '25kp1a6115@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6116@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6116', '25KP1A6116', 'Challa', 'Anuradha', 'CSE-AI', bid, 1, 'A', '25kp1a6116@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6117@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6117', '25KP1A6117', 'Chinna', 'Naga Nidish', 'CSE-AI', bid, 1, 'A', '25kp1a6117@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6118@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6118', '25KP1A6118', 'Chirumamilla', 'Devender Chowdary', 'CSE-AI', bid, 1, 'A', '25kp1a6118@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6119@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6119', '25KP1A6119', 'Chukkapalli', 'Haripriya', 'CSE-AI', bid, 1, 'A', '25kp1a6119@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6120@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6120', '25KP1A6120', 'Depoori', 'Venkata Gopi', 'CSE-AI', bid, 1, 'A', '25kp1a6120@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6121@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6121', '25KP1A6121', 'Dhanisiri', 'Durgasai', 'CSE-AI', bid, 1, 'A', '25kp1a6121@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6122@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6122', '25KP1A6122', 'Donthiboyina', 'Rusrija', 'CSE-AI', bid, 1, 'A', '25kp1a6122@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6123@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6123', '25KP1A6123', 'Gadde', 'Daneswari', 'CSE-AI', bid, 1, 'A', '25kp1a6123@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6124@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6124', '25KP1A6124', 'Gampa', 'Srivani', 'CSE-AI', bid, 1, 'A', '25kp1a6124@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6125@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6125', '25KP1A6125', 'Gogulapati', 'Rajeswari', 'CSE-AI', bid, 1, 'A', '25kp1a6125@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6126@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6126', '25KP1A6126', 'Goli', 'Harini Sri', 'CSE-AI', bid, 1, 'A', '25kp1a6126@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6127@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6127', '25KP1A6127', 'Gudipalli', 'Sai Praveen', 'CSE-AI', bid, 1, 'A', '25kp1a6127@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6128@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6128', '25KP1A6128', 'Gudipudi', 'Lakshmi Tanmai', 'CSE-AI', bid, 1, 'A', '25kp1a6128@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6129@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6129', '25KP1A6129', 'Gundreddy', 'Venkata Manoj Kumar Reddy', 'CSE-AI', bid, 1, 'A', '25kp1a6129@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6130@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6130', '25KP1A6130', 'Gutha', 'Bindu Sree', 'CSE-AI', bid, 1, 'A', '25kp1a6130@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6131@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6131', '25KP1A6131', 'Idamakanti', 'Ramanji Reddy', 'CSE-AI', bid, 1, 'A', '25kp1a6131@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6132@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6132', '25KP1A6132', 'Jakka', 'Siva Sai Kumar', 'CSE-AI', bid, 1, 'A', '25kp1a6132@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6133@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6133', '25KP1A6133', 'Jakki', 'Venkata Nagaraju', 'CSE-AI', bid, 1, 'A', '25kp1a6133@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6134@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6134', '25KP1A6134', 'Kakara', 'Raj Kumar', 'CSE-AI', bid, 1, 'A', '25kp1a6134@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6135@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6135', '25KP1A6135', 'Kamatham', 'Premchand', 'CSE-AI', bid, 1, 'A', '25kp1a6135@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6136@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6136', '25KP1A6136', 'Kambala', 'Naga Mounika', 'CSE-AI', bid, 1, 'A', '25kp1a6136@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6137@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6137', '25KP1A6137', 'Kancharla', 'Jasmitha', 'CSE-AI', bid, 1, 'A', '25kp1a6137@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6138@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6138', '25KP1A6138', 'Kancharla', 'Renu Sree Prasanna Mani Saranya', 'CSE-AI', bid, 1, 'A', '25kp1a6138@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6139@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6139', '25KP1A6139', 'Kancheti', 'Dakshayani', 'CSE-AI', bid, 1, 'A', '25kp1a6139@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6140@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6140', '25KP1A6140', 'Karnati', 'Revanth Kumar', 'CSE-AI', bid, 1, 'A', '25kp1a6140@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6141@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6141', '25KP1A6141', 'Karra', 'Suseela', 'CSE-AI', bid, 1, 'A', '25kp1a6141@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6142@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6142', '25KP1A6142', 'Koduru', 'Jaswanth', 'CSE-AI', bid, 1, 'A', '25kp1a6142@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6143@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6143', '25KP1A6143', 'Kola', 'Uttej Ram Sai Sree Laxman', 'CSE-AI', bid, 1, 'A', '25kp1a6143@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6144@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6144', '25KP1A6144', 'Kolla', 'Om Chowdary', 'CSE-AI', bid, 1, 'A', '25kp1a6144@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6145@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6145', '25KP1A6145', 'Kolusu', 'Sowmya Sri', 'CSE-AI', bid, 1, 'A', '25kp1a6145@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6146@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6146', '25KP1A6146', 'Kommineni', 'Karthik', 'CSE-AI', bid, 1, 'A', '25kp1a6146@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6147@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6147', '25KP1A6147', 'Kommu', 'Mariya Babu', 'CSE-AI', bid, 1, 'A', '25kp1a6147@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6148@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6148', '25KP1A6148', 'Koppolu', 'Soumya', 'CSE-AI', bid, 1, 'A', '25kp1a6148@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6149@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6149', '25KP1A6149', 'Kopuri', 'Raju', 'CSE-AI', bid, 1, 'A', '25kp1a6149@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6150@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6150', '25KP1A6150', 'Koramutla', 'Sharon Sampath', 'CSE-AI', bid, 1, 'A', '25kp1a6150@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6151@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6151', '25KP1A6151', 'Kosuri', 'Pranav Naga Sai Varma', 'CSE-AI', bid, 1, 'A', '25kp1a6151@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6152@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6152', '25KP1A6152', 'Kotha', 'Srilakshmi Saimani Karthikeya Mahesh', 'CSE-AI', bid, 1, 'A', '25kp1a6152@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6153@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6153', '25KP1A6153', 'Kotha', 'Thirupathamma', 'CSE-AI', bid, 1, 'A', '25kp1a6153@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6154@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6154', '25KP1A6154', 'Kotla', 'Titesh', 'CSE-AI', bid, 1, 'A', '25kp1a6154@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6155@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6155', '25KP1A6155', 'Kuchipudi', 'Yaswanth Kumar', 'CSE-AI', bid, 1, 'A', '25kp1a6155@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6156@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6156', '25KP1A6156', 'Kumbha', 'Vijay Kumar', 'CSE-AI', bid, 1, 'A', '25kp1a6156@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6157@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6157', '25KP1A6157', 'Lanka', 'Krishna Karthik', 'CSE-AI', bid, 1, 'A', '25kp1a6157@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6158@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6158', '25KP1A6158', 'Maddikunta', 'Kiran Kumar', 'CSE-AI', bid, 1, 'A', '25kp1a6158@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6159@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6159', '25KP1A6159', 'Maddineni', 'Leela Venkat Chowdary', 'CSE-AI', bid, 1, 'A', '25kp1a6159@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6160@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6160', '25KP1A6160', 'Mohammad', 'Moina Anjum', 'CSE-AI', bid, 1, 'A', '25kp1a6160@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6161@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6161', '25KP1A6161', 'Moparthi', 'Sravani', 'CSE-AI', bid, 1, 'A', '25kp1a6161@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6162@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6162', '25KP1A6162', 'Moram', 'Sowjanya', 'CSE-AI', bid, 1, 'A', '25kp1a6162@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6163@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6163', '25KP1A6163', 'Munagala', 'Prasanth Reddy', 'CSE-AI', bid, 1, 'A', '25kp1a6163@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6164@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6164', '25KP1A6164', 'Musugu', 'Bhavana', 'CSE-AI', bid, 1, 'A', '25kp1a6164@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6165@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6165', '25KP1A6165', 'Padavala', 'Lakshmi Varshitha', 'CSE-AI', bid, 1, 'A', '25kp1a6165@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6166@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6166', '25KP1A6166', 'Pallekonda', 'Abhishek', 'CSE-AI', bid, 1, 'A', '25kp1a6166@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6167@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6167', '25KP1A6167', 'Panga', 'Vishnuvardan', 'CSE-AI', bid, 1, 'B', '25kp1a6167@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6168@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6168', '25KP1A6168', 'Patan', 'Ashfakh', 'CSE-AI', bid, 1, 'B', '25kp1a6168@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6169@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6169', '25KP1A6169', 'Patti', 'Maneendra', 'CSE-AI', bid, 1, 'B', '25kp1a6169@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6170@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6170', '25KP1A6170', 'Pedakotla', 'Prasanth Kumar', 'CSE-AI', bid, 1, 'B', '25kp1a6170@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6171@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6171', '25KP1A6171', 'Peruboina', 'Prasanth Kumar', 'CSE-AI', bid, 1, 'B', '25kp1a6171@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6172@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6172', '25KP1A6172', 'Pothanaboina', 'Mounika', 'CSE-AI', bid, 1, 'B', '25kp1a6172@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6173@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6173', '25KP1A6173', 'Pothuganti', 'Sai', 'CSE-AI', bid, 1, 'B', '25kp1a6173@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6174@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6174', '25KP1A6174', 'Potlapalli', 'Bhavya Sri', 'CSE-AI', bid, 1, 'B', '25kp1a6174@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6175@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6175', '25KP1A6175', 'Putta', 'Prashanthi', 'CSE-AI', bid, 1, 'B', '25kp1a6175@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6176@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6176', '25KP1A6176', 'Puvvala', 'Ramcharan Teja', 'CSE-AI', bid, 1, 'B', '25kp1a6176@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6177@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6177', '25KP1A6177', 'Rajarapu', 'Venkata Kalyan', 'CSE-AI', bid, 1, 'B', '25kp1a6177@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6178@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6178', '25KP1A6178', 'Ranganolla', 'Chandana', 'CSE-AI', bid, 1, 'B', '25kp1a6178@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6179@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6179', '25KP1A6179', 'Ravuri', 'Vinay Karthik', 'CSE-AI', bid, 1, 'B', '25kp1a6179@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6180@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6180', '25KP1A6180', 'Rayala', 'Sai Manikanta', 'CSE-AI', bid, 1, 'B', '25kp1a6180@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6181@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6181', '25KP1A6181', 'Routhu', 'Tharunika', 'CSE-AI', bid, 1, 'B', '25kp1a6181@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6182@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6182', '25KP1A6182', 'Sanikommu', 'Himaja', 'CSE-AI', bid, 1, 'B', '25kp1a6182@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6183@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6183', '25KP1A6183', 'Sanke', 'Sireesha', 'CSE-AI', bid, 1, 'B', '25kp1a6183@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6184@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6184', '25KP1A6184', 'Shaik', 'Munni Saida Vali', 'CSE-AI', bid, 1, 'B', '25kp1a6184@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6185@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6185', '25KP1A6185', 'Shaik', 'Aasif Imran', 'CSE-AI', bid, 1, 'B', '25kp1a6185@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6186@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6186', '25KP1A6186', 'Shaik', 'Aboobakar Siddiq', 'CSE-AI', bid, 1, 'B', '25kp1a6186@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6187@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6187', '25KP1A6187', 'Shaik', 'Aslam', 'CSE-AI', bid, 1, 'B', '25kp1a6187@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6188@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6188', '25KP1A6188', 'Shaik', 'Azimunnisa Begum', 'CSE-AI', bid, 1, 'B', '25kp1a6188@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6189@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6189', '25KP1A6189', 'Shaik', 'Dilshad', 'CSE-AI', bid, 1, 'B', '25kp1a6189@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6190@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6190', '25KP1A6190', 'Shaik', 'Eesubu', 'CSE-AI', bid, 1, 'B', '25kp1a6190@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6191@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6191', '25KP1A6191', 'Shaik', 'Imran', 'CSE-AI', bid, 1, 'B', '25kp1a6191@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6192@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6192', '25KP1A6192', 'Shaik', 'Jakeera', 'CSE-AI', bid, 1, 'B', '25kp1a6192@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6193@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6193', '25KP1A6193', 'Shaik', 'Mohamad Nazeer', 'CSE-AI', bid, 1, 'B', '25kp1a6193@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6194@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6194', '25KP1A6194', 'Shaik', 'Mohammad Nissar', 'CSE-AI', bid, 1, 'B', '25kp1a6194@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6195@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6195', '25KP1A6195', 'Shaik', 'Mohammad Umar Farooq', 'CSE-AI', bid, 1, 'B', '25kp1a6195@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6196@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6196', '25KP1A6196', 'Shaik', 'Mohammed Jakeer Hasan', 'CSE-AI', bid, 1, 'B', '25kp1a6196@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6197@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6197', '25KP1A6197', 'Shaik', 'Nagur Babu', 'CSE-AI', bid, 1, 'B', '25kp1a6197@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6198@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6198', '25KP1A6198', 'Shaik', 'Noorunnisa', 'CSE-AI', bid, 1, 'B', '25kp1a6198@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6199@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6199', '25KP1A6199', 'Shaik', 'Patalam Mahammad Umar', 'CSE-AI', bid, 1, 'B', '25kp1a6199@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a61a0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A61A0', '25KP1A61A0', 'Shaik', 'Reshma', 'CSE-AI', bid, 1, 'B', '25kp1a61a0@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a61a1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A61A1', '25KP1A61A1', 'Shaik', 'Soni Begum', 'CSE-AI', bid, 1, 'B', '25kp1a61a1@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a61a2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A61A2', '25KP1A61A2', 'Shaik', 'Sumaira', 'CSE-AI', bid, 1, 'B', '25kp1a61a2@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a61a3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A61A3', '25KP1A61A3', 'Sunkari', 'Lokesh', 'CSE-AI', bid, 1, 'B', '25kp1a61a3@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a61a4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A61A4', '25KP1A61A4', 'Tadepalli', 'Navya Sri', 'CSE-AI', bid, 1, 'B', '25kp1a61a4@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a61a5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A61A5', '25KP1A61A5', 'Talupula', 'Naveen Kumar', 'CSE-AI', bid, 1, 'B', '25kp1a61a5@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a61a6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A61A6', '25KP1A61A6', 'Tangirala', 'Kotesh', 'CSE-AI', bid, 1, 'B', '25kp1a61a6@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a61a7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A61A7', '25KP1A61A7', 'Tata', 'Soma Siva Sai Karthik Ram', 'CSE-AI', bid, 1, 'B', '25kp1a61a7@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a61a8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A61A8', '25KP1A61A8', 'Tata', 'Vedha Sri', 'CSE-AI', bid, 1, 'B', '25kp1a61a8@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a61a9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A61A9', '25KP1A61A9', 'Telluri', 'Papa', 'CSE-AI', bid, 1, 'B', '25kp1a61a9@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a61b0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A61B0', '25KP1A61B0', 'Thadikonda', 'Hima Sree', 'CSE-AI', bid, 1, 'B', '25kp1a61b0@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a61b1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A61B1', '25KP1A61B1', 'Thaya', 'Gopichand', 'CSE-AI', bid, 1, 'B', '25kp1a61b1@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a61b2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A61B2', '25KP1A61B2', 'Thipparthi', 'Lakshmi Charitha', 'CSE-AI', bid, 1, 'B', '25kp1a61b2@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a61b3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A61B3', '25KP1A61B3', 'Thirumalakonda', 'Guru Swami', 'CSE-AI', bid, 1, 'B', '25kp1a61b3@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a61b4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A61B4', '25KP1A61B4', 'Thirupathi', 'Rebca Rani', 'CSE-AI', bid, 1, 'B', '25kp1a61b4@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a61b5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A61B5', '25KP1A61B5', 'Thupakula', 'Bhavya', 'CSE-AI', bid, 1, 'B', '25kp1a61b5@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a61b6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A61B6', '25KP1A61B6', 'Tokala', 'Keertana', 'CSE-AI', bid, 1, 'B', '25kp1a61b6@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a61b7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A61B7', '25KP1A61B7', 'Tokala', 'Krithika', 'CSE-AI', bid, 1, 'B', '25kp1a61b7@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a61b8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A61B8', '25KP1A61B8', 'Udayagiri', 'Sai Mouni', 'CSE-AI', bid, 1, 'B', '25kp1a61b8@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a61b9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A61B9', '25KP1A61B9', 'Vadlamani', 'Ganesh Sai Kumar', 'CSE-AI', bid, 1, 'B', '25kp1a61b9@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a61c0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A61C0', '25KP1A61C0', 'Vadlamudi', 'Krishnaveni', 'CSE-AI', bid, 1, 'B', '25kp1a61c0@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a61c1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A61C1', '25KP1A61C1', 'Vallapuneni', 'Mallika', 'CSE-AI', bid, 1, 'B', '25kp1a61c1@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a61c2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A61C2', '25KP1A61C2', 'Vallapuneni', 'Venkata Prasad', 'CSE-AI', bid, 1, 'B', '25kp1a61c2@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a61c3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A61C3', '25KP1A61C3', 'Velpuri', 'Hemanth', 'CSE-AI', bid, 1, 'B', '25kp1a61c3@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a61c4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A61C4', '25KP1A61C4', 'Venigandla', 'Divya', 'CSE-AI', bid, 1, 'B', '25kp1a61c4@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a61c5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A61C5', '25KP1A61C5', 'Vukanti', 'Avinash', 'CSE-AI', bid, 1, 'B', '25kp1a61c5@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a61c6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A61C6', '25KP1A61C6', 'Vuyyuru', 'Yasasri', 'CSE-AI', bid, 1, 'B', '25kp1a61c6@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a61c7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A61C7', '25KP1A61C7', 'Shaik', 'Maseed Mahaboob Mukhith', 'CSE-AI', bid, 1, 'B', '25kp1a61c7@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a61c8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A61C8', '25KP1A61C8', 'Goswami', 'Gowtham Puri', 'CSE-AI', bid, 1, 'B', '25kp1a61c8@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a61c5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A61C5', '24KP1A61C5', 'Thirumalla', 'Raveendra', 'CSE-AI', bid, 4, 'B', '24kp1a61c5@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6101@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6101', '24KP1A6101', 'Akula', 'Sireesha', 'CSE-AI', bid, 4, 'A', '24kp1a6101@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6102@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6102', '24KP1A6102', 'Akula', 'Srihari', 'CSE-AI', bid, 4, 'A', '24kp1a6102@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6103@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6103', '24KP1A6103', 'Allu', 'Mounika Reddy', 'CSE-AI', bid, 4, 'A', '24kp1a6103@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6104@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6104', '24KP1A6104', 'Amarthaluri', 'Parithosh', 'CSE-AI', bid, 4, 'A', '24kp1a6104@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6105@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6105', '24KP1A6105', 'Angalakurthi', 'Yaswanth', 'CSE-AI', bid, 4, 'A', '24kp1a6105@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6106@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6106', '24KP1A6106', 'Annapareddy', 'Sri Sai Navadeep Reddy', 'CSE-AI', bid, 4, 'A', '24kp1a6106@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6107@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6107', '24KP1A6107', 'Arikapudi', 'Lalith Abhinav Eeswar', 'CSE-AI', bid, 4, 'A', '24kp1a6107@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6108@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6108', '24KP1A6108', 'Avula', 'Siva Sankar', 'CSE-AI', bid, 4, 'A', '24kp1a6108@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6110@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6110', '24KP1A6110', 'Badinedi', 'Venkata Teja Sree', 'CSE-AI', bid, 4, 'A', '24kp1a6110@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6112@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6112', '24KP1A6112', 'Bandarupalli', 'Teja Sri', 'CSE-AI', bid, 4, 'A', '24kp1a6112@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6113@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6113', '24KP1A6113', 'Bandi', 'Jahnavi', 'CSE-AI', bid, 4, 'A', '24kp1a6113@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6114@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6114', '24KP1A6114', 'Boniga', 'Navya', 'CSE-AI', bid, 4, 'A', '24kp1a6114@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6115@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6115', '24KP1A6115', 'Boppana', 'Sai Sree', 'CSE-AI', bid, 4, 'A', '24kp1a6115@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6116@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6116', '24KP1A6116', 'Challagundla', 'Sai Mani Kanta', 'CSE-AI', bid, 4, 'A', '24kp1a6116@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6117@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6117', '24KP1A6117', 'Chapa', 'Mahendra Babu', 'CSE-AI', bid, 4, 'A', '24kp1a6117@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6118@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6118', '24KP1A6118', 'Chatharajupalle', 'Karthik', 'CSE-AI', bid, 4, 'A', '24kp1a6118@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6119@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6119', '24KP1A6119', 'Chemitikanti', 'Lahari', 'CSE-AI', bid, 4, 'A', '24kp1a6119@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6120@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6120', '24KP1A6120', 'Cherukuri', 'Varshini', 'CSE-AI', bid, 4, 'A', '24kp1a6120@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6122@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6122', '24KP1A6122', 'Dasari', 'Gayathri Sai', 'CSE-AI', bid, 4, 'A', '24kp1a6122@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6123@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6123', '24KP1A6123', 'Dasari', 'Venkata Durga Rao', 'CSE-AI', bid, 4, 'A', '24kp1a6123@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6124@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6124', '24KP1A6124', 'Devarasetti', 'Saranya Bhavya', 'CSE-AI', bid, 4, 'A', '24kp1a6124@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6125@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6125', '24KP1A6125', 'Dharanagari', 'Vishal Singh', 'CSE-AI', bid, 4, 'A', '24kp1a6125@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6126@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6126', '24KP1A6126', 'Dheekonda', 'Venkateswarlu', 'CSE-AI', bid, 4, 'A', '24kp1a6126@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6127@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6127', '24KP1A6127', 'Didla', 'Hema', 'CSE-AI', bid, 4, 'A', '24kp1a6127@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6128@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6128', '24KP1A6128', 'Didla', 'Hepsi', 'CSE-AI', bid, 4, 'A', '24kp1a6128@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6129@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6129', '24KP1A6129', 'Dupati', 'Siva Manikanta', 'CSE-AI', bid, 4, 'A', '24kp1a6129@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6130@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6130', '24KP1A6130', 'Gajvalli', 'Chandra Sekhar', 'CSE-AI', bid, 4, 'A', '24kp1a6130@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6131@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6131', '24KP1A6131', 'Golla', 'Venkateswarlu', 'CSE-AI', bid, 4, 'A', '24kp1a6131@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6132@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6132', '24KP1A6132', 'Gongati', 'Pallavi', 'CSE-AI', bid, 4, 'A', '24kp1a6132@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6133@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6133', '24KP1A6133', 'Gudipalli', 'Sneha', 'CSE-AI', bid, 4, 'A', '24kp1a6133@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6134@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6134', '24KP1A6134', 'Gujjarlamudi', 'Sugandh Babu', 'CSE-AI', bid, 4, 'A', '24kp1a6134@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6136@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6136', '24KP1A6136', 'Gurram', 'Sudheer Babu', 'CSE-AI', bid, 4, 'A', '24kp1a6136@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6137@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6137', '24KP1A6137', 'Gutlapalli', 'Pranavi', 'CSE-AI', bid, 4, 'A', '24kp1a6137@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6138@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6138', '24KP1A6138', 'Jaladi', 'Giftglory', 'CSE-AI', bid, 4, 'A', '24kp1a6138@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6139@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6139', '24KP1A6139', 'Janapati', 'Sambasiva Rao', 'CSE-AI', bid, 4, 'A', '24kp1a6139@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6140@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6140', '24KP1A6140', 'Janga', 'Jahnavi Sai', 'CSE-AI', bid, 4, 'A', '24kp1a6140@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6141@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6141', '24KP1A6141', 'Jonnalagadda', 'Sri Lakshmi', 'CSE-AI', bid, 4, 'A', '24kp1a6141@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6142@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6142', '24KP1A6142', 'Kanatham', 'Sindhu', 'CSE-AI', bid, 4, 'A', '24kp1a6142@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6143@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6143', '24KP1A6143', 'Kancharla', 'Swaroop', 'CSE-AI', bid, 4, 'A', '24kp1a6143@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6144@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6144', '24KP1A6144', 'Katta', 'Anitha Chowdary', 'CSE-AI', bid, 4, 'A', '24kp1a6144@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6145@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6145', '24KP1A6145', 'Khagga', 'Hasini', 'CSE-AI', bid, 4, 'A', '24kp1a6145@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6147@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6147', '24KP1A6147', 'Korrapolu', 'Madhu', 'CSE-AI', bid, 4, 'A', '24kp1a6147@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6148@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6148', '24KP1A6148', 'Kota', 'Naga Jyothi', 'CSE-AI', bid, 4, 'A', '24kp1a6148@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6149@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6149', '24KP1A6149', 'Kothapalli', 'Tirumala Vasu', 'CSE-AI', bid, 4, 'A', '24kp1a6149@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6150@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6150', '24KP1A6150', 'Kuchipudi', 'Sathvika Chowdary', 'CSE-AI', bid, 4, 'A', '24kp1a6150@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6152@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6152', '24KP1A6152', 'Machavarapu', 'Vasanth Kumar', 'CSE-AI', bid, 4, 'A', '24kp1a6152@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6153@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6153', '24KP1A6153', 'Mada', 'Kavya', 'CSE-AI', bid, 4, 'A', '24kp1a6153@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6154@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6154', '24KP1A6154', 'Maddikuntla', 'Kasimahesh', 'CSE-AI', bid, 4, 'A', '24kp1a6154@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6155@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6155', '24KP1A6155', 'Makkena', 'Venkata Ramana', 'CSE-AI', bid, 4, 'A', '24kp1a6155@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6157@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6157', '24KP1A6157', 'Marri', 'Srilatha', 'CSE-AI', bid, 4, 'A', '24kp1a6157@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6158@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6158', '24KP1A6158', 'Masabathini', 'Sri Bhavani Venkata Puneeth', 'CSE-AI', bid, 4, 'A', '24kp1a6158@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6159@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6159', '24KP1A6159', 'Mekapati', 'Jayanth', 'CSE-AI', bid, 4, 'A', '24kp1a6159@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6160@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6160', '24KP1A6160', 'Muppasani', 'Ashok', 'CSE-AI', bid, 4, 'A', '24kp1a6160@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6161@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6161', '24KP1A6161', 'Mutyam', 'Venkata Vamsi', 'CSE-AI', bid, 4, 'A', '24kp1a6161@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6162@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6162', '24KP1A6162', 'Nallamothula', 'Kusuma', 'CSE-AI', bid, 4, 'A', '24kp1a6162@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6163@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6163', '24KP1A6163', 'Nama', 'Bhuvan Kanth', 'CSE-AI', bid, 4, 'A', '24kp1a6163@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6164@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6164', '24KP1A6164', 'Nanduri', 'Ramarao', 'CSE-AI', bid, 4, 'A', '24kp1a6164@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6165@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6165', '24KP1A6165', 'Nannapaneni', 'Sai Nikhil', 'CSE-AI', bid, 4, 'A', '24kp1a6165@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6111@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6111', '24KP1A6111', 'Bandaru', 'Aravindh', 'CSE-AI', bid, 4, 'A', '24kp1a6111@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6135@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6135', '24KP1A6135', 'Gummulla', 'Nanda Kishore', 'CSE-AI', bid, 4, 'A', '24kp1a6135@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6121@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6121', '24KP1A6121', 'Chilaka', 'Nagendra Babu', 'CSE-AI', bid, 4, 'A', '24kp1a6121@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6151@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6151', '24KP1A6151', 'Lanka', 'Vara Kumari', 'CSE-AI', bid, 4, 'A', '24kp1a6151@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6156@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6156', '24KP1A6156', 'Manikyala', 'Sri Lakshmi Tirupatamma', 'CSE-AI', bid, 4, 'A', '24kp1a6156@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6109@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6109', '24KP1A6109', 'Bachala', 'Balu', 'CSE-AI', bid, 4, 'A', '24kp1a6109@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6146@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6146', '24KP1A6146', 'Kolla', 'Lokesh', 'CSE-AI', bid, 4, 'A', '24kp1a6146@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6166@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6166', '24KP1A6166', 'Nimmala', 'Raagini', 'CSE-AI', bid, 4, 'B', '24kp1a6166@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6167@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6167', '24KP1A6167', 'Nisanam', 'Rebka Shalini', 'CSE-AI', bid, 4, 'B', '24kp1a6167@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6168@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6168', '24KP1A6168', 'Orsu', 'Neelaveni', 'CSE-AI', bid, 4, 'B', '24kp1a6168@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6169@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6169', '24KP1A6169', 'Palakaluri', 'Lakshmi', 'CSE-AI', bid, 4, 'B', '24kp1a6169@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6170@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6170', '24KP1A6170', 'Pandari', 'Polamma', 'CSE-AI', bid, 4, 'B', '24kp1a6170@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6171@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6171', '24KP1A6171', 'Pandraju', 'Bharath Sai', 'CSE-AI', bid, 4, 'B', '24kp1a6171@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6173@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6173', '24KP1A6173', 'Pasupula', 'Siddartha', 'CSE-AI', bid, 4, 'B', '24kp1a6173@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6174@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6174', '24KP1A6174', 'Patibandla', 'Venkat', 'CSE-AI', bid, 4, 'B', '24kp1a6174@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6175@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6175', '24KP1A6175', 'Perlapudi', 'Omkar', 'CSE-AI', bid, 4, 'B', '24kp1a6175@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6176@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6176', '24KP1A6176', 'Potendla', 'Venkataramana', 'CSE-AI', bid, 4, 'B', '24kp1a6176@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6179@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6179', '24KP1A6179', 'Rachamanti', 'Vara Lakshmi', 'CSE-AI', bid, 4, 'B', '24kp1a6179@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6180@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6180', '24KP1A6180', 'Seelam', 'Poojitha', 'CSE-AI', bid, 4, 'B', '24kp1a6180@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6181@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6181', '24KP1A6181', 'Shaik', 'Abdul Mannan', 'CSE-AI', bid, 4, 'B', '24kp1a6181@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6182@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6182', '24KP1A6182', 'Shaik', 'Abdulla', 'CSE-AI', bid, 4, 'B', '24kp1a6182@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6183@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6183', '24KP1A6183', 'Shaik', 'Afreen', 'CSE-AI', bid, 4, 'B', '24kp1a6183@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6184@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6184', '24KP1A6184', 'Shaik', 'Anwar', 'CSE-AI', bid, 4, 'B', '24kp1a6184@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6185@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6185', '24KP1A6185', 'Shaik', 'Fayaz Ahmad', 'CSE-AI', bid, 4, 'B', '24kp1a6185@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6186@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6186', '24KP1A6186', 'Shaik', 'Irfan', 'CSE-AI', bid, 4, 'B', '24kp1a6186@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6187@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6187', '24KP1A6187', 'Shaik', 'Khaja Mastan', 'CSE-AI', bid, 4, 'B', '24kp1a6187@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6188@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6188', '24KP1A6188', 'Shaik', 'Lathi Punisha', 'CSE-AI', bid, 4, 'B', '24kp1a6188@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6190@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6190', '24KP1A6190', 'Shaik', 'Maheer', 'CSE-AI', bid, 4, 'B', '24kp1a6190@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6191@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6191', '24KP1A6191', 'Shaik', 'Mohammad Fazal', 'CSE-AI', bid, 4, 'B', '24kp1a6191@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6192@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6192', '24KP1A6192', 'Shaik', 'Mohammad Huzefa', 'CSE-AI', bid, 4, 'B', '24kp1a6192@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6193@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6193', '24KP1A6193', 'Shaik', 'Mohammad Sahid', 'CSE-AI', bid, 4, 'B', '24kp1a6193@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6194@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6194', '24KP1A6194', 'Shaik', 'Nedanasreen', 'CSE-AI', bid, 4, 'B', '24kp1a6194@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6195@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6195', '24KP1A6195', 'Shaik', 'Nusrath Afsha', 'CSE-AI', bid, 4, 'B', '24kp1a6195@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6196@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6196', '24KP1A6196', 'Shaik', 'Peesapati Moulali', 'CSE-AI', bid, 4, 'B', '24kp1a6196@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6197@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6197', '24KP1A6197', 'Shaik', 'Rehana', 'CSE-AI', bid, 4, 'B', '24kp1a6197@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6198@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6198', '24KP1A6198', 'Shaik', 'Sadik', 'CSE-AI', bid, 4, 'B', '24kp1a6198@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6199@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6199', '24KP1A6199', 'Shaik', 'Samad', 'CSE-AI', bid, 4, 'B', '24kp1a6199@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a61a0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A61A0', '24KP1A61A0', 'Shaik', 'Tasleem', 'CSE-AI', bid, 4, 'B', '24kp1a61a0@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a61a1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A61A1', '24KP1A61A1', 'Shaik', 'Umme Shahida', 'CSE-AI', bid, 4, 'B', '24kp1a61a1@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a61a2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A61A2', '24KP1A61A2', 'Siddabathuni', 'Sai Rishi', 'CSE-AI', bid, 4, 'B', '24kp1a61a2@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a61a3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A61A3', '24KP1A61A3', 'Sivskumar', 'Bhoomika', 'CSE-AI', bid, 4, 'B', '24kp1a61a3@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a61a5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A61A5', '24KP1A61A5', 'Tammisetty', 'Siva Prasad', 'CSE-AI', bid, 4, 'B', '24kp1a61a5@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a61a7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A61A7', '24KP1A61A7', 'Thalathoti', 'Mani Kumari', 'CSE-AI', bid, 4, 'B', '24kp1a61a7@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a61a8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A61A8', '24KP1A61A8', 'Thamanampalli', 'Karthik', 'CSE-AI', bid, 4, 'B', '24kp1a61a8@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a61a9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A61A9', '24KP1A61A9', 'Thammisetti', 'Pushpanjali Devi', 'CSE-AI', bid, 4, 'B', '24kp1a61a9@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a61b0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A61B0', '24KP1A61B0', 'Tholusuri', 'Guna Sekhar', 'CSE-AI', bid, 4, 'B', '24kp1a61b0@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a61b1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A61B1', '24KP1A61B1', 'Thota', 'Bhanu Priya', 'CSE-AI', bid, 4, 'B', '24kp1a61b1@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a61b2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A61B2', '24KP1A61B2', 'Thummala', 'Gayathri', 'CSE-AI', bid, 4, 'B', '24kp1a61b2@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a61b3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A61B3', '24KP1A61B3', 'Uyyuri', 'Naga Surya Sai Mani Teja', 'CSE-AI', bid, 4, 'B', '24kp1a61b3@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a61b4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A61B4', '24KP1A61B4', 'Vadalasetti', 'Sravanthi Lakshmi', 'CSE-AI', bid, 4, 'B', '24kp1a61b4@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a61b5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A61B5', '24KP1A61B5', 'Veesa', 'Rakesh', 'CSE-AI', bid, 4, 'B', '24kp1a61b5@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a61b6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A61B6', '24KP1A61B6', 'Vijayakatu', 'Madhavi Latha', 'CSE-AI', bid, 4, 'B', '24kp1a61b6@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a61b8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A61B8', '24KP1A61B8', 'Viswanadhapalli', 'Bhanu Sai Charan', 'CSE-AI', bid, 4, 'B', '24kp1a61b8@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a61b9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A61B9', '24KP1A61B9', 'Vutla', 'Mani Kanta', 'CSE-AI', bid, 4, 'B', '24kp1a61b9@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a61c0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A61C0', '24KP1A61C0', 'Yalla', 'Rakshitha', 'CSE-AI', bid, 4, 'B', '24kp1a61c0@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a61c1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A61C1', '24KP1A61C1', 'Yanam', 'Teja Prathap', 'CSE-AI', bid, 4, 'B', '24kp1a61c1@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a61c2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A61C2', '24KP1A61C2', 'Yedluri', 'Abhinash', 'CSE-AI', bid, 4, 'B', '24kp1a61c2@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a61c3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A61C3', '24KP1A61C3', 'Yekulori', 'Srinadh Reddy', 'CSE-AI', bid, 4, 'B', '24kp1a61c3@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a6101@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A6101', '25KP5A6101', 'Chamidisetty', 'Naga Keerthana', 'CSE-AI', bid, 4, 'B', '25kp5a6101@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a6102@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A6102', '25KP5A6102', 'Dirisala', 'Uha Sri', 'CSE-AI', bid, 4, 'B', '25kp5a6102@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a6103@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A6103', '25KP5A6103', 'Korepu', 'Rajendra', 'CSE-AI', bid, 4, 'B', '25kp5a6103@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a6104@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A6104', '25KP5A6104', 'Kunapa', 'Reddy Mouli Naga Raju', 'CSE-AI', bid, 4, 'B', '25kp5a6104@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a6105@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A6105', '25KP5A6105', 'Kusampudi', 'Eeswar Uday', 'CSE-AI', bid, 4, 'B', '25kp5a6105@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a6106@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A6106', '25KP5A6106', 'Maddasani', 'Sneha Latha', 'CSE-AI', bid, 4, 'B', '25kp5a6106@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a6107@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A6107', '25KP5A6107', 'Pandi', 'Manasa', 'CSE-AI', bid, 4, 'B', '25kp5a6107@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a6108@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A6108', '25KP5A6108', 'Pandrangi', 'Sai Prasanna', 'CSE-AI', bid, 4, 'B', '25kp5a6108@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a6109@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A6109', '25KP5A6109', 'Pokuri', 'Nandini', 'CSE-AI', bid, 4, 'B', '25kp5a6109@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a6110@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A6110', '25KP5A6110', 'Polepalli', 'Anilkumar', 'CSE-AI', bid, 4, 'B', '25kp5a6110@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6178@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6178', '24KP1A6178', 'Putluri', 'Venkatesh', 'CSE-AI', bid, 4, 'B', '24kp1a6178@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6189@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6189', '24KP1A6189', 'Shaik', 'Lathif Riyaz', 'CSE-AI', bid, 4, 'B', '24kp1a6189@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a61a4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A61A4', '24KP1A61A4', 'Surepalli', 'Rajesh', 'CSE-AI', bid, 4, 'B', '24kp1a61a4@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a61a6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A61A6', '24KP1A61A6', 'Taviti', 'Venkata Naveen Kumar', 'CSE-AI', bid, 4, 'B', '24kp1a61a6@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a61c4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A61C4', '24KP1A61C4', 'Bodapati', 'Poorna Venkata Bhushaiah', 'CSE-AI', bid, 4, 'B', '24kp1a61c4@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6177@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6177', '24KP1A6177', 'Pudhota', 'Uma Maheswara Rao', 'CSE-AI', bid, 4, 'B', '24kp1a6177@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6172@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6172', '24KP1A6172', 'Panguluri', 'Anil Kumar', 'CSE-AI', bid, 4, 'B', '24kp1a6172@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a61b7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A61B7', '24KP1A61B7', 'Vinukonda', 'Jaya Vardhan Saketh', 'CSE-AI', bid, 4, 'B', '24kp1a61b7@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6101@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6101', '23KP1A6101', 'Adusumalli', 'Surya Prakash', 'CSE-AI', bid, 4, 'A', '23kp1a6101@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6102@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6102', '23KP1A6102', 'Alla', 'Gayatri', 'CSE-AI', bid, 4, 'A', '23kp1a6102@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6103@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6103', '23KP1A6103', 'Ambati', 'Akanksha', 'CSE-AI', bid, 4, 'A', '23kp1a6103@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6104@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6104', '23KP1A6104', 'Bandaru', 'John Wesly', 'CSE-AI', bid, 4, 'A', '23kp1a6104@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6106@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6106', '23KP1A6106', 'Boddapati', 'Venkata Hemanth', 'CSE-AI', bid, 4, 'A', '23kp1a6106@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6107@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6107', '23KP1A6107', 'Bogireddy', 'Pradeep', 'CSE-AI', bid, 4, 'A', '23kp1a6107@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6108@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6108', '23KP1A6108', 'Chandarlapati', 'Vignesh', 'CSE-AI', bid, 4, 'A', '23kp1a6108@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6109@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6109', '23KP1A6109', 'Chebrolu', 'Damarakeswar', 'CSE-AI', bid, 4, 'A', '23kp1a6109@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6110@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6110', '23KP1A6110', 'Chundru', 'Shashank Babu', 'CSE-AI', bid, 4, 'A', '23kp1a6110@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6111@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6111', '23KP1A6111', 'Dandamudi', 'Harshitha', 'CSE-AI', bid, 4, 'A', '23kp1a6111@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6112@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6112', '23KP1A6112', 'Darsi', 'Gagana Swarupa', 'CSE-AI', bid, 4, 'A', '23kp1a6112@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6113@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6113', '23KP1A6113', 'Deekonda', 'Sravanthi', 'CSE-AI', bid, 4, 'A', '23kp1a6113@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6114@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6114', '23KP1A6114', 'Dhanisetti', 'Manikanta', 'CSE-AI', bid, 4, 'A', '23kp1a6114@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6115@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6115', '23KP1A6115', 'Gajula', 'Dhanush', 'CSE-AI', bid, 4, 'A', '23kp1a6115@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6116@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6116', '23KP1A6116', 'Gampala', 'Rajesh', 'CSE-AI', bid, 4, 'A', '23kp1a6116@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6117@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6117', '23KP1A6117', 'Gandikota', 'Pavan Kumar', 'CSE-AI', bid, 4, 'A', '23kp1a6117@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6118@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6118', '23KP1A6118', 'Gera', 'Chandu', 'CSE-AI', bid, 4, 'A', '23kp1a6118@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6119@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6119', '23KP1A6119', 'Golla', 'Abhishek', 'CSE-AI', bid, 4, 'A', '23kp1a6119@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6121@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6121', '23KP1A6121', 'Gunnamareddy', 'Vasantha Lakshmi', 'CSE-AI', bid, 4, 'A', '23kp1a6121@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6122@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6122', '23KP1A6122', 'Jatavath', 'Anusha Bai', 'CSE-AI', bid, 4, 'A', '23kp1a6122@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6123@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6123', '23KP1A6123', 'Kancharla', 'Venkata Abhinandan', 'CSE-AI', bid, 4, 'A', '23kp1a6123@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6124@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6124', '23KP1A6124', 'Kandukuri', 'Praveen Kumar', 'CSE-AI', bid, 4, 'A', '23kp1a6124@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6125@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6125', '23KP1A6125', 'Kerala', 'Yasaswini', 'CSE-AI', bid, 4, 'A', '23kp1a6125@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6126@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6126', '23KP1A6126', 'Kilaparthi', 'S D S Sasank Narayana Murthy', 'CSE-AI', bid, 4, 'A', '23kp1a6126@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6127@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6127', '23KP1A6127', 'Kilari', 'Bhavani', 'CSE-AI', bid, 4, 'A', '23kp1a6127@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6128@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6128', '23KP1A6128', 'Kolipaka', 'Narendra', 'CSE-AI', bid, 4, 'A', '23kp1a6128@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6129@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6129', '23KP1A6129', 'Kongani', 'Venkata Tarun Krishna', 'CSE-AI', bid, 4, 'A', '23kp1a6129@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6130@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6130', '23KP1A6130', 'Koniyala', 'Charan', 'CSE-AI', bid, 4, 'A', '23kp1a6130@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6131@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6131', '23KP1A6131', 'Konkipudi', 'Naga Venkatesh', 'CSE-AI', bid, 4, 'A', '23kp1a6131@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6132@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6132', '23KP1A6132', 'Madiraju', 'Vedha Phanisri', 'CSE-AI', bid, 4, 'A', '23kp1a6132@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6133@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6133', '23KP1A6133', 'Marripudi', 'Prasanna', 'CSE-AI', bid, 4, 'A', '23kp1a6133@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6134@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6134', '23KP1A6134', 'Mokkala', 'Srinivas', 'CSE-AI', bid, 4, 'A', '23kp1a6134@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6135@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6135', '23KP1A6135', 'Mukkapati', 'Ramya', 'CSE-AI', bid, 4, 'A', '23kp1a6135@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6136@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6136', '23KP1A6136', 'Nannam', 'Varun Raj', 'CSE-AI', bid, 4, 'A', '23kp1a6136@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6137@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6137', '23KP1A6137', 'Palagani', 'Venkata Nagendra', 'CSE-AI', bid, 4, 'A', '23kp1a6137@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6138@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6138', '23KP1A6138', 'Pamulapati', 'Bhargav', 'CSE-AI', bid, 4, 'A', '23kp1a6138@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6141@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6141', '23KP1A6141', 'Pasupuleti', 'Tarun', 'CSE-AI', bid, 4, 'A', '23kp1a6141@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6142@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6142', '23KP1A6142', 'Pondugula', 'Rajani', 'CSE-AI', bid, 4, 'A', '23kp1a6142@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6143@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6143', '23KP1A6143', 'Ramisetty', 'Rama Lakshman', 'CSE-AI', bid, 4, 'A', '23kp1a6143@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6144@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6144', '23KP1A6144', 'Ramisetty', 'Venkata Naga Sai Kanaka V', 'CSE-AI', bid, 4, 'A', '23kp1a6144@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6145@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6145', '23KP1A6145', 'Rokkam', 'Sruthi', 'CSE-AI', bid, 4, 'A', '23kp1a6145@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6146@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6146', '23KP1A6146', 'Seedarla', 'Sneha', 'CSE-AI', bid, 4, 'A', '23kp1a6146@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6147@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6147', '23KP1A6147', 'Shaik', 'Abdul Hameed', 'CSE-AI', bid, 4, 'A', '23kp1a6147@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6148@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6148', '23KP1A6148', 'Shaik', 'Fayaz', 'CSE-AI', bid, 4, 'A', '23kp1a6148@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6149@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6149', '23KP1A6149', 'Shaik', 'Mastanbi', 'CSE-AI', bid, 4, 'A', '23kp1a6149@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6150@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6150', '23KP1A6150', 'Shaik', 'Rehana', 'CSE-AI', bid, 4, 'A', '23kp1a6150@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6151@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6151', '23KP1A6151', 'Singamsetty', 'Bhanu Venkat', 'CSE-AI', bid, 4, 'A', '23kp1a6151@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6152@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6152', '23KP1A6152', 'Singuluri', 'Venkata Pavan Kishor', 'CSE-AI', bid, 4, 'A', '23kp1a6152@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6154@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6154', '23KP1A6154', 'Talluri', 'Bhavyasri', 'CSE-AI', bid, 4, 'A', '23kp1a6154@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6155@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6155', '23KP1A6155', 'Talluru', 'Venkata Purna Sai', 'CSE-AI', bid, 4, 'A', '23kp1a6155@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6156@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6156', '23KP1A6156', 'Tanguturi', 'Venkata Tharun Kumar', 'CSE-AI', bid, 4, 'A', '23kp1a6156@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6157@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6157', '23KP1A6157', 'Thota', 'Sri Hemanth', 'CSE-AI', bid, 4, 'A', '23kp1a6157@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6158@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6158', '23KP1A6158', 'Venigalla', 'Theerdhankar', 'CSE-AI', bid, 4, 'A', '23kp1a6158@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6159@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6159', '23KP1A6159', 'Vippala', 'Subhashini', 'CSE-AI', bid, 4, 'A', '23kp1a6159@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6160@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6160', '23KP1A6160', 'Vissa', 'Vardhan', 'CSE-AI', bid, 4, 'A', '23kp1a6160@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6161@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6161', '23KP1A6161', 'Viswanadhapalli', 'Renusri', 'CSE-AI', bid, 4, 'A', '23kp1a6161@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6162@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6162', '23KP1A6162', 'Voleti', 'Venkata Karthikeya', 'CSE-AI', bid, 4, 'A', '23kp1a6162@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6163@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6163', '23KP1A6163', 'Yarram', 'Rupesh Reddy', 'CSE-AI', bid, 4, 'A', '23kp1a6163@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6164@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6164', '23KP1A6164', 'Yatham', 'Vineela', 'CSE-AI', bid, 4, 'A', '23kp1a6164@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6165@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6165', '23KP1A6165', 'Pavuluri', 'Gopi', 'CSE-AI', bid, 4, 'A', '23kp1a6165@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp5a6101@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP5A6101', '24KP5A6101', 'Addanki', 'Pavani', 'CSE-AI', bid, 4, 'A', '24kp5a6101@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp5a6102@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP5A6102', '24KP5A6102', 'Mekala', 'Lakshmi Gayatri', 'CSE-AI', bid, 4, 'A', '24kp5a6102@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp5a6103@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP5A6103', '24KP5A6103', 'Thirumalasetty', 'Likhita Sree', 'CSE-AI', bid, 4, 'A', '24kp5a6103@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp5a6104@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP5A6104', '24KP5A6104', 'Yarramsetti', 'Gayathri', 'CSE-AI', bid, 4, 'A', '24kp5a6104@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp5a6105@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP5A6105', '24KP5A6105', 'Thummala', 'Mounika', 'CSE-AI', bid, 4, 'A', '24kp5a6105@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6127@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6127', '22KP1A6127', 'Kutala', 'Ashok', 'CSE-AI', bid, 8, 'A', '22kp1a6127@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6132@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6132', '22KP1A6132', 'Malleboina', 'Rama Krishna', 'CSE-AI', bid, 8, 'A', '22kp1a6132@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6129@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6129', '22KP1A6129', 'Lakku', 'Tarun Kumar Reddy', 'CSE-AI', bid, 8, 'A', '22kp1a6129@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6119@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6119', '22KP1A6119', 'Kakarla', 'Prem Sagar', 'CSE-AI', bid, 8, 'A', '22kp1a6119@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6148@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6148', '22KP1A6148', 'Syed', 'Fayaz Ahemad Hussain', 'CSE-AI', bid, 8, 'A', '22kp1a6148@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6153@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6153', '23KP1A6153', 'Sinka', 'Gopi', 'CSE-AI', bid, 4, 'A', '23kp1a6153@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6120@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6120', '23KP1A6120', 'Gorantla', 'Venkata Sai Krishna', 'CSE-AI', bid, 4, 'A', '23kp1a6120@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6139@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6139', '23KP1A6139', 'Panthagani', 'Hepsibhanu', 'CSE-AI', bid, 4, 'A', '23kp1a6139@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6105@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6105', '23KP1A6105', 'Birudu', 'Mani Chandra', 'CSE-AI', bid, 4, 'A', '23kp1a6105@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6140@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6140', '23KP1A6140', 'Pasam', 'Mahesh', 'CSE-AI', bid, 4, 'A', '23kp1a6140@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6101@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6101', '22KP1A6101', 'Agadda', 'Sai Rama Satwik', 'CSE-AI', bid, 8, 'A', '22kp1a6101@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6102@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6102', '22KP1A6102', 'Ambati', 'Jaswanth', 'CSE-AI', bid, 8, 'A', '22kp1a6102@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6103@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6103', '22KP1A6103', 'Bandarupalli', 'Lakshmi Prasanna', 'CSE-AI', bid, 8, 'A', '22kp1a6103@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6104@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6104', '22KP1A6104', 'Bandlapati', 'Meghana', 'CSE-AI', bid, 8, 'A', '22kp1a6104@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6105@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6105', '22KP1A6105', 'Bayya', 'Mohini Sai Meghana', 'CSE-AI', bid, 8, 'A', '22kp1a6105@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6106@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6106', '22KP1A6106', 'Bodapati', 'Rohith Siva Ganesh', 'CSE-AI', bid, 8, 'A', '22kp1a6106@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6107@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6107', '22KP1A6107', 'Cherukuri', 'Thanuja', 'CSE-AI', bid, 8, 'A', '22kp1a6107@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6108@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6108', '22KP1A6108', 'Chilukuru', 'Susmitha', 'CSE-AI', bid, 8, 'A', '22kp1a6108@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6109@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6109', '22KP1A6109', 'Chukka', 'Mallik Sai', 'CSE-AI', bid, 8, 'A', '22kp1a6109@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6110@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6110', '22KP1A6110', 'Darsi', 'Naga Tejesh', 'CSE-AI', bid, 8, 'A', '22kp1a6110@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6112@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6112', '22KP1A6112', 'Devandla', 'Ramateja', 'CSE-AI', bid, 8, 'A', '22kp1a6112@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6113@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6113', '22KP1A6113', 'Dokku', 'Ayyappa', 'CSE-AI', bid, 8, 'A', '22kp1a6113@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6114@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6114', '22KP1A6114', 'Gadiparthi', 'Vasista Sai Chowdary', 'CSE-AI', bid, 8, 'A', '22kp1a6114@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6115@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6115', '22KP1A6115', 'Ganjapu', 'Lalitha Naga Jyothi', 'CSE-AI', bid, 8, 'A', '22kp1a6115@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6116@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6116', '22KP1A6116', 'Gottipati', 'Divya Jyothi', 'CSE-AI', bid, 8, 'A', '22kp1a6116@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6117@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6117', '22KP1A6117', 'Hem', 'Sai Manepalli', 'CSE-AI', bid, 8, 'A', '22kp1a6117@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6118@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6118', '22KP1A6118', 'Janaparapu', 'Ramya', 'CSE-AI', bid, 8, 'A', '22kp1a6118@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6120@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6120', '22KP1A6120', 'Kamepalli', 'Sravani', 'CSE-AI', bid, 8, 'A', '22kp1a6120@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6121@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6121', '22KP1A6121', 'Karanam', 'Sai Lakshmi', 'CSE-AI', bid, 8, 'A', '22kp1a6121@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6122@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6122', '22KP1A6122', 'Katuru', 'Revanth Naga Kumar', 'CSE-AI', bid, 8, 'A', '22kp1a6122@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6123@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6123', '22KP1A6123', 'Kavuru', 'Venkata Srinivasa Banu Tejash', 'CSE-AI', bid, 8, 'A', '22kp1a6123@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6124@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6124', '22KP1A6124', 'Kondaveeti', 'Haribabu', 'CSE-AI', bid, 8, 'A', '22kp1a6124@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6125@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6125', '22KP1A6125', 'Kondepogu', 'Raju', 'CSE-AI', bid, 8, 'A', '22kp1a6125@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6128@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6128', '22KP1A6128', 'Laghuvarapu', 'Lavanya', 'CSE-AI', bid, 8, 'A', '22kp1a6128@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6131@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6131', '22KP1A6131', 'Linga', 'Amulya', 'CSE-AI', bid, 8, 'A', '22kp1a6131@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6133@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6133', '22KP1A6133', 'Mettu', 'Pravallika', 'CSE-AI', bid, 8, 'A', '22kp1a6133@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6134@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6134', '22KP1A6134', 'Morla', 'Mohan Sasi Kumar', 'CSE-AI', bid, 8, 'A', '22kp1a6134@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6135@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6135', '22KP1A6135', 'Narravula', 'Manikanta Reddy', 'CSE-AI', bid, 8, 'A', '22kp1a6135@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6136@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6136', '22KP1A6136', 'Pilli', 'Venkateswarlu', 'CSE-AI', bid, 8, 'A', '22kp1a6136@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6137@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6137', '22KP1A6137', 'Pokala', 'Sirisha', 'CSE-AI', bid, 8, 'A', '22kp1a6137@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6138@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6138', '22KP1A6138', 'Ramaraju', 'Sai Thrinaya', 'CSE-AI', bid, 8, 'A', '22kp1a6138@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6139@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6139', '22KP1A6139', 'Sanampudi', 'Venkata Kavyanjali', 'CSE-AI', bid, 8, 'A', '22kp1a6139@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6141@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6141', '22KP1A6141', 'Shaik', 'Abdul Raheman', 'CSE-AI', bid, 8, 'A', '22kp1a6141@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6142@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6142', '22KP1A6142', 'Shaik', 'Jilani', 'CSE-AI', bid, 8, 'A', '22kp1a6142@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6143@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6143', '22KP1A6143', 'Shaik', 'Kamal Basha', 'CSE-AI', bid, 8, 'A', '22kp1a6143@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6146@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6146', '22KP1A6146', 'Shaik', 'Rafia Afroz', 'CSE-AI', bid, 8, 'A', '22kp1a6146@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6147@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6147', '22KP1A6147', 'Shaik', 'Shafiya', 'CSE-AI', bid, 8, 'A', '22kp1a6147@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6149@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6149', '22KP1A6149', 'Tankasala', 'Balaji', 'CSE-AI', bid, 8, 'A', '22kp1a6149@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6150@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6150', '22KP1A6150', 'Telaprolu', 'Bharath Anand', 'CSE-AI', bid, 8, 'A', '22kp1a6150@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6151@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6151', '22KP1A6151', 'Thota', 'Sai Kishore', 'CSE-AI', bid, 8, 'A', '22kp1a6151@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6152@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6152', '22KP1A6152', 'Tirupathi', 'Manohar', 'CSE-AI', bid, 8, 'A', '22kp1a6152@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6153@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6153', '22KP1A6153', 'Ulli', 'Dileep Kumar', 'CSE-AI', bid, 8, 'A', '22kp1a6153@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6154@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6154', '22KP1A6154', 'Vangara', 'Tina Amrutha', 'CSE-AI', bid, 8, 'A', '22kp1a6154@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6155@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6155', '22KP1A6155', 'Vemuri', 'Durga Bhavani', 'CSE-AI', bid, 8, 'A', '22kp1a6155@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6156@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6156', '22KP1A6156', 'Vutla', 'Sree Lakshmi', 'CSE-AI', bid, 8, 'A', '22kp1a6156@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6157@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6157', '22KP1A6157', 'Yanduri', 'Vishnu Vardhan', 'CSE-AI', bid, 8, 'A', '22kp1a6157@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp5a6101@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP5A6101', '23KP5A6101', 'Kole', 'Nithin', 'CSE-AI', bid, 8, 'A', '23kp5a6101@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2021 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('21kp1a6131@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '21KP1A6131', '21KP1A6131', 'Korripalli', 'Satya Mahesh', 'CSE-AI', bid, 8, 'A', '21kp1a6131@nriit.ac.in', '9999999999', '2021-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2021 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('21kp1a6134@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '21KP1A6134', '21KP1A6134', 'Lakku', 'Narendra Reddy', 'CSE-AI', bid, 8, 'A', '21kp1a6134@nriit.ac.in', '9999999999', '2021-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6140@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6140', '22KP1A6140', 'Savalam', 'Prabhas', 'CSE-AI', bid, 8, 'A', '22kp1a6140@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6111@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6111', '22KP1A6111', 'Datla', 'Bhaskar Reddy', 'CSE-AI', bid, 8, 'A', '22kp1a6111@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6126@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6126', '22KP1A6126', 'Kurapati', 'Mahesh Reddy', 'CSE-AI', bid, 8, 'A', '22kp1a6126@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6130@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6130', '22KP1A6130', 'Lanka', 'Sai Balaji', 'CSE-AI', bid, 8, 'A', '22kp1a6130@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6145@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6145', '22KP1A6145', 'Shaik', 'Mohammed Irfan', 'CSE-AI', bid, 8, 'A', '22kp1a6145@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a6144@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A6144', '22KP1A6144', 'Shaik', 'Mohammed Imran', 'CSE-AI', bid, 8, 'A', '22kp1a6144@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

END $$;

-- ===== CSE-DS: 726 students =====
DO $$
DECLARE
    uid UUID;
    bid UUID;
BEGIN

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4401@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4401', '25KP1A4401', 'Adimulam', 'Lakshmi Charan Kumar', 'CSE-DS', bid, 1, 'A', '25kp1a4401@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4402@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4402', '25KP1A4402', 'Agalla', 'Venkata Saida Rao', 'CSE-DS', bid, 1, 'A', '25kp1a4402@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4403@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4403', '25KP1A4403', 'Agulla', 'Narendra', 'CSE-DS', bid, 1, 'A', '25kp1a4403@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4404@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4404', '25KP1A4404', 'Alladi', 'Venu Sri Madhav', 'CSE-DS', bid, 1, 'A', '25kp1a4404@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4405@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4405', '25KP1A4405', 'Ardeti', 'Kamala', 'CSE-DS', bid, 1, 'A', '25kp1a4405@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4406@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4406', '25KP1A4406', 'Arepally', 'Yedukondalu', 'CSE-DS', bid, 1, 'A', '25kp1a4406@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4407@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4407', '25KP1A4407', 'Arlagadda', 'Mounika', 'CSE-DS', bid, 1, 'A', '25kp1a4407@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4408@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4408', '25KP1A4408', 'Aurangabad', 'Siva Mani', 'CSE-DS', bid, 1, 'A', '25kp1a4408@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4409@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4409', '25KP1A4409', 'Baliboina', 'Triveni', 'CSE-DS', bid, 1, 'A', '25kp1a4409@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4410@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4410', '25KP1A4410', 'Bandla', 'Manjula', 'CSE-DS', bid, 1, 'A', '25kp1a4410@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4411@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4411', '25KP1A4411', 'Battula', 'Varalakshmi', 'CSE-DS', bid, 1, 'A', '25kp1a4411@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4412@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4412', '25KP1A4412', 'Beerla', 'Narendra', 'CSE-DS', bid, 1, 'A', '25kp1a4412@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4413@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4413', '25KP1A4413', 'Bonta', 'Prem Kumar', 'CSE-DS', bid, 1, 'A', '25kp1a4413@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4414@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4414', '25KP1A4414', 'Borigarla', 'Eswar Rao', 'CSE-DS', bid, 1, 'A', '25kp1a4414@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4415@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4415', '25KP1A4415', 'Botta', 'Siddhardha', 'CSE-DS', bid, 1, 'A', '25kp1a4415@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4416@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4416', '25KP1A4416', 'Chinthaguntla', 'Dharani', 'CSE-DS', bid, 1, 'A', '25kp1a4416@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4417@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4417', '25KP1A4417', 'Chinthalacheruvu', 'Chandrasekhar', 'CSE-DS', bid, 1, 'A', '25kp1a4417@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4418@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4418', '25KP1A4418', 'Chiranjeevi', 'Prudhvi Sai', 'CSE-DS', bid, 1, 'A', '25kp1a4418@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4419@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4419', '25KP1A4419', 'Chitteti', 'Dhanalakshmi', 'CSE-DS', bid, 1, 'A', '25kp1a4419@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4420@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4420', '25KP1A4420', 'Dara', 'Santhosh', 'CSE-DS', bid, 1, 'A', '25kp1a4420@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4421@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4421', '25KP1A4421', 'Dasari', 'Esrayelu', 'CSE-DS', bid, 1, 'A', '25kp1a4421@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4422@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4422', '25KP1A4422', 'Dasari', 'Lakshmi Bhrama Naidu', 'CSE-DS', bid, 1, 'A', '25kp1a4422@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4423@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4423', '25KP1A4423', 'Dasi', 'Sandeep', 'CSE-DS', bid, 1, 'A', '25kp1a4423@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4424@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4424', '25KP1A4424', 'Dega', 'Datha Sai', 'CSE-DS', bid, 1, 'A', '25kp1a4424@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4425@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4425', '25KP1A4425', 'Degala', 'Mohan Sai Mani Kumar', 'CSE-DS', bid, 1, 'A', '25kp1a4425@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4426@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4426', '25KP1A4426', 'Desaboina', 'Lokesh', 'CSE-DS', bid, 1, 'A', '25kp1a4426@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4427@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4427', '25KP1A4427', 'Devanaboyina', 'Bhavya Sai', 'CSE-DS', bid, 1, 'A', '25kp1a4427@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4428@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4428', '25KP1A4428', 'Dodda', 'Mahesh', 'CSE-DS', bid, 1, 'A', '25kp1a4428@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4429@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4429', '25KP1A4429', 'Edama', 'Revanth Siva Kumar', 'CSE-DS', bid, 1, 'A', '25kp1a4429@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4430@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4430', '25KP1A4430', 'Gajulapalli', 'Vamsi Gopi Krishna', 'CSE-DS', bid, 1, 'A', '25kp1a4430@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4431@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4431', '25KP1A4431', 'Galla', 'Hari Charan', 'CSE-DS', bid, 1, 'A', '25kp1a4431@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4432@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4432', '25KP1A4432', 'Ganta', 'Manikanta', 'CSE-DS', bid, 1, 'A', '25kp1a4432@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4433@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4433', '25KP1A4433', 'Ganuboyina', 'Kanaka Sri Ram', 'CSE-DS', bid, 1, 'A', '25kp1a4433@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4434@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4434', '25KP1A4434', 'Garikapati', 'Venkata Ratna Sandeep', 'CSE-DS', bid, 1, 'A', '25kp1a4434@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4435@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4435', '25KP1A4435', 'Ghazi', 'Mohammad Arsh', 'CSE-DS', bid, 1, 'A', '25kp1a4435@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4436@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4436', '25KP1A4436', 'Gogineni', 'Lakshmi Lahari', 'CSE-DS', bid, 1, 'A', '25kp1a4436@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4437@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4437', '25KP1A4437', 'Gona', 'Rakesh', 'CSE-DS', bid, 1, 'A', '25kp1a4437@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4438@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4438', '25KP1A4438', 'Gonepalli', 'Bhavani Shankar', 'CSE-DS', bid, 1, 'A', '25kp1a4438@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4439@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4439', '25KP1A4439', 'Gongala', 'Reddy Venkata Reddy', 'CSE-DS', bid, 1, 'A', '25kp1a4439@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4440@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4440', '25KP1A4440', 'Gudaru', 'Srinivasa Rao', 'CSE-DS', bid, 1, 'A', '25kp1a4440@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4441@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4441', '25KP1A4441', 'Guntaka', 'Rama Krishna Reddy', 'CSE-DS', bid, 1, 'A', '25kp1a4441@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4442@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4442', '25KP1A4442', 'Gunturu', 'Pramodh', 'CSE-DS', bid, 1, 'A', '25kp1a4442@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4443@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4443', '25KP1A4443', 'Jirra', 'Solmon Raju', 'CSE-DS', bid, 1, 'A', '25kp1a4443@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4444@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4444', '25KP1A4444', 'Jonnakuti', 'Naga Pravallika', 'CSE-DS', bid, 1, 'A', '25kp1a4444@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4445@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4445', '25KP1A4445', 'Julakanti', 'Prathap Reddy', 'CSE-DS', bid, 1, 'A', '25kp1a4445@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4446@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4446', '25KP1A4446', 'Kakkera', 'Sri Ganga Vishnu Teja', 'CSE-DS', bid, 1, 'A', '25kp1a4446@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4447@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4447', '25KP1A4447', 'Kambampati', 'Venky', 'CSE-DS', bid, 1, 'A', '25kp1a4447@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4448@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4448', '25KP1A4448', 'Kancharala', 'Vishnu Vardhan Chari', 'CSE-DS', bid, 1, 'A', '25kp1a4448@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4449@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4449', '25KP1A4449', 'Kannedara', 'Manohara Baji', 'CSE-DS', bid, 1, 'A', '25kp1a4449@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4450@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4450', '25KP1A4450', 'Kanneganti', 'Vivek Chowdary', 'CSE-DS', bid, 1, 'A', '25kp1a4450@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4451@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4451', '25KP1A4451', 'Karamsetty', 'Lakshmi Jyothi', 'CSE-DS', bid, 1, 'A', '25kp1a4451@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4452@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4452', '25KP1A4452', 'Karamsetty', 'Rama Jyothi', 'CSE-DS', bid, 1, 'A', '25kp1a4452@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4453@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4453', '25KP1A4453', 'Karra', 'Praneeth', 'CSE-DS', bid, 1, 'A', '25kp1a4453@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4454@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4454', '25KP1A4454', 'Karravula', 'Shyam Babu', 'CSE-DS', bid, 1, 'A', '25kp1a4454@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4455@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4455', '25KP1A4455', 'Karyamsetti', 'Raju', 'CSE-DS', bid, 1, 'A', '25kp1a4455@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4456@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4456', '25KP1A4456', 'Kasindula', 'Amrutha', 'CSE-DS', bid, 1, 'B', '25kp1a4456@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4457@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4457', '25KP1A4457', 'Katteboyina', 'Anil', 'CSE-DS', bid, 1, 'B', '25kp1a4457@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4458@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4458', '25KP1A4458', 'Kattula', 'Uday', 'CSE-DS', bid, 1, 'B', '25kp1a4458@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4459@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4459', '25KP1A4459', 'Kesani', 'Gayathri', 'CSE-DS', bid, 1, 'B', '25kp1a4459@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4460@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4460', '25KP1A4460', 'Koduru', 'Seshu Babu', 'CSE-DS', bid, 1, 'B', '25kp1a4460@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4461@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4461', '25KP1A4461', 'Kolli', 'Santhi', 'CSE-DS', bid, 1, 'B', '25kp1a4461@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4462@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4462', '25KP1A4462', 'Kolluru', 'Venkata Radha Krishna', 'CSE-DS', bid, 1, 'B', '25kp1a4462@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4463@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4463', '25KP1A4463', 'Konda', 'Siva Linga Raju', 'CSE-DS', bid, 1, 'B', '25kp1a4463@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4464@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4464', '25KP1A4464', 'Kondamadugula', 'Anusha', 'CSE-DS', bid, 1, 'B', '25kp1a4464@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4465@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4465', '25KP1A4465', 'Kondamudi', 'Naga Vyshwik', 'CSE-DS', bid, 1, 'B', '25kp1a4465@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4466@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4466', '25KP1A4466', 'Korivi', 'Praveenkumar', 'CSE-DS', bid, 1, 'B', '25kp1a4466@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4467@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4467', '25KP1A4467', 'Kota', 'Sai Naga Adithya', 'CSE-DS', bid, 1, 'B', '25kp1a4467@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4468@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4468', '25KP1A4468', 'Kothamasu', 'V N Lakshmi Poornima', 'CSE-DS', bid, 1, 'B', '25kp1a4468@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4469@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4469', '25KP1A4469', 'Kotta', 'Durga Manikanta Kumar', 'CSE-DS', bid, 1, 'B', '25kp1a4469@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4470@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4470', '25KP1A4470', 'Kurra', 'Nanidini', 'CSE-DS', bid, 1, 'B', '25kp1a4470@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4471@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4471', '25KP1A4471', 'Kusumaraju', 'Lalitha', 'CSE-DS', bid, 1, 'B', '25kp1a4471@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4472@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4472', '25KP1A4472', 'Lingala', 'Prasanthi', 'CSE-DS', bid, 1, 'B', '25kp1a4472@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4473@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4473', '25KP1A4473', 'Maddu', 'Anjaneyulu', 'CSE-DS', bid, 1, 'B', '25kp1a4473@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4474@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4474', '25KP1A4474', 'Manchineni', 'Durga Naga Raju', 'CSE-DS', bid, 1, 'B', '25kp1a4474@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4475@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4475', '25KP1A4475', 'Mangenapudi', 'Bharath', 'CSE-DS', bid, 1, 'B', '25kp1a4475@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4476@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4476', '25KP1A4476', 'Marlapati', 'Poojitha', 'CSE-DS', bid, 1, 'B', '25kp1a4476@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4477@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4477', '25KP1A4477', 'Marri', 'Durga Prasad', 'CSE-DS', bid, 1, 'B', '25kp1a4477@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4478@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4478', '25KP1A4478', 'Matle', 'Datta Varaprasad', 'CSE-DS', bid, 1, 'B', '25kp1a4478@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4479@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4479', '25KP1A4479', 'Medapi', 'Gopichandu', 'CSE-DS', bid, 1, 'B', '25kp1a4479@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4480@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4480', '25KP1A4480', 'Minamanuri', 'Hareesh', 'CSE-DS', bid, 1, 'B', '25kp1a4480@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4481@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4481', '25KP1A4481', 'Minikanti', 'Shareef', 'CSE-DS', bid, 1, 'B', '25kp1a4481@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4482@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4482', '25KP1A4482', 'Motupalli', 'Venkata Sai', 'CSE-DS', bid, 1, 'B', '25kp1a4482@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4483@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4483', '25KP1A4483', 'Muppavarapu', 'Maheswari', 'CSE-DS', bid, 1, 'B', '25kp1a4483@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4484@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4484', '25KP1A4484', 'Nallaboina', 'Lakshminarayana', 'CSE-DS', bid, 1, 'B', '25kp1a4484@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4485@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4485', '25KP1A4485', 'Namburi', 'Nikith Sri', 'CSE-DS', bid, 1, 'B', '25kp1a4485@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4486@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4486', '25KP1A4486', 'Naralasetty', 'Naga Sireesha', 'CSE-DS', bid, 1, 'B', '25kp1a4486@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4487@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4487', '25KP1A4487', 'Nelam', 'Raja', 'CSE-DS', bid, 1, 'B', '25kp1a4487@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4488@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4488', '25KP1A4488', 'Noorbasha', 'Thouheed', 'CSE-DS', bid, 1, 'B', '25kp1a4488@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4489@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4489', '25KP1A4489', 'Orsu', 'Ashok', 'CSE-DS', bid, 1, 'B', '25kp1a4489@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4490@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4490', '25KP1A4490', 'Orsu', 'Chenna Kesava Rao', 'CSE-DS', bid, 1, 'B', '25kp1a4490@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4491@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4491', '25KP1A4491', 'Pachva', 'Thara Pavitra', 'CSE-DS', bid, 1, 'B', '25kp1a4491@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4492@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4492', '25KP1A4492', 'Pamidi', 'Venkata Sai Teja', 'CSE-DS', bid, 1, 'B', '25kp1a4492@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4493@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4493', '25KP1A4493', 'Pamulapati', 'Vinodini', 'CSE-DS', bid, 1, 'B', '25kp1a4493@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4494@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4494', '25KP1A4494', 'Pasala', 'Vinil Kumar', 'CSE-DS', bid, 1, 'B', '25kp1a4494@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4495@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4495', '25KP1A4495', 'Pasupuleti', 'Deekshitha', 'CSE-DS', bid, 1, 'B', '25kp1a4495@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4496@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4496', '25KP1A4496', 'Pathuri', 'Akhil', 'CSE-DS', bid, 1, 'B', '25kp1a4496@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4497@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4497', '25KP1A4497', 'Patibandla', 'Chandu', 'CSE-DS', bid, 1, 'B', '25kp1a4497@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4498@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4498', '25KP1A4498', 'Pidathala', 'Maheswari', 'CSE-DS', bid, 1, 'B', '25kp1a4498@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a4499@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A4499', '25KP1A4499', 'Pillakathupula', 'Siva Naga Raju', 'CSE-DS', bid, 1, 'B', '25kp1a4499@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44a0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44A0', '25KP1A44A0', 'Polepally', 'Anil Kumar', 'CSE-DS', bid, 1, 'B', '25kp1a44a0@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44a1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44A1', '25KP1A44A1', 'Poluri', 'Rose Mary', 'CSE-DS', bid, 1, 'B', '25kp1a44a1@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44a2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44A2', '25KP1A44A2', 'Pusapati', 'Rajesh', 'CSE-DS', bid, 1, 'B', '25kp1a44a2@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44a3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44A3', '25KP1A44A3', 'Putta', 'Venkaiah Babu', 'CSE-DS', bid, 1, 'B', '25kp1a44a3@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44a4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44A4', '25KP1A44A4', 'Rai', 'Prasanna Rani', 'CSE-DS', bid, 1, 'B', '25kp1a44a4@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44a5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44A5', '25KP1A44A5', 'Ravinuthala', 'Sruthi', 'CSE-DS', bid, 1, 'B', '25kp1a44a5@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44a6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44A6', '25KP1A44A6', 'Rayidi', 'Neelima', 'CSE-DS', bid, 1, 'B', '25kp1a44a6@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44a7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44A7', '25KP1A44A7', 'Samayam', 'Manju Satya Sai Sowjanya', 'CSE-DS', bid, 1, 'B', '25kp1a44a7@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44a8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44A8', '25KP1A44A8', 'Sanam', 'Santhosh Kumar', 'CSE-DS', bid, 1, 'B', '25kp1a44a8@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44a9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44A9', '25KP1A44A9', 'Sanisetty', 'Pushpananda Tirumala Saikumar', 'CSE-DS', bid, 1, 'B', '25kp1a44a9@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44b0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44B0', '25KP1A44B0', 'Sayini', 'Akhil Phani Kumar', 'CSE-DS', bid, 1, 'B', '25kp1a44b0@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44b1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44B1', '25KP1A44B1', 'Shaik', 'Afeefa', 'CSE-DS', bid, 1, 'C', '25kp1a44b1@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44b2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44B2', '25KP1A44B2', 'Shaik', 'Afrid', 'CSE-DS', bid, 1, 'C', '25kp1a44b2@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44b3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44B3', '25KP1A44B3', 'Shaik', 'Afrid', 'CSE-DS', bid, 1, 'C', '25kp1a44b3@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44b4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44B4', '25KP1A44B4', 'Shaik', 'Ahmad Kabir', 'CSE-DS', bid, 1, 'C', '25kp1a44b4@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44b5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44B5', '25KP1A44B5', 'Shaik', 'Althaf', 'CSE-DS', bid, 1, 'C', '25kp1a44b5@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44b6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44B6', '25KP1A44B6', 'Shaik', 'Husna Bhanu', 'CSE-DS', bid, 1, 'C', '25kp1a44b6@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44b7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44B7', '25KP1A44B7', 'Shaik', 'Imran', 'CSE-DS', bid, 1, 'C', '25kp1a44b7@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44b8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44B8', '25KP1A44B8', 'Shaik', 'Inthiyaz', 'CSE-DS', bid, 1, 'C', '25kp1a44b8@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44b9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44B9', '25KP1A44B9', 'Shaik', 'Jameel Ahamed', 'CSE-DS', bid, 1, 'C', '25kp1a44b9@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44c0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44C0', '25KP1A44C0', 'Shaik', 'Jan Basha', 'CSE-DS', bid, 1, 'C', '25kp1a44c0@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44c1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44C1', '25KP1A44C1', 'Shaik', 'Kamil Waseem', 'CSE-DS', bid, 1, 'C', '25kp1a44c1@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44c2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44C2', '25KP1A44C2', 'Shaik', 'Mabu Subhani', 'CSE-DS', bid, 1, 'C', '25kp1a44c2@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44c3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44C3', '25KP1A44C3', 'Shaik', 'Md Ayesha Farhana', 'CSE-DS', bid, 1, 'C', '25kp1a44c3@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44c4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44C4', '25KP1A44C4', 'Shaik', 'Meera Vali', 'CSE-DS', bid, 1, 'C', '25kp1a44c4@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44c5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44C5', '25KP1A44C5', 'Shaik', 'Mohoseena Mujseen', 'CSE-DS', bid, 1, 'C', '25kp1a44c5@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44c6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44C6', '25KP1A44C6', 'Shaik', 'Muzzameel', 'CSE-DS', bid, 1, 'C', '25kp1a44c6@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44c7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44C7', '25KP1A44C7', 'Shaik', 'Nageena', 'CSE-DS', bid, 1, 'C', '25kp1a44c7@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44c8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44C8', '25KP1A44C8', 'Shaik', 'Nagurbi', 'CSE-DS', bid, 1, 'C', '25kp1a44c8@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44c9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44C9', '25KP1A44C9', 'Shaik', 'Nazeer Basha', 'CSE-DS', bid, 1, 'C', '25kp1a44c9@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44d0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44D0', '25KP1A44D0', 'Shaik', 'Nimmakayala Saida', 'CSE-DS', bid, 1, 'C', '25kp1a44d0@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44d1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44D1', '25KP1A44D1', 'Shaik', 'Rehana Shainy', 'CSE-DS', bid, 1, 'C', '25kp1a44d1@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44d2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44D2', '25KP1A44D2', 'Shaik', 'Sameer', 'CSE-DS', bid, 1, 'C', '25kp1a44d2@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44d3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44D3', '25KP1A44D3', 'Shaik', 'Sana Sabeera', 'CSE-DS', bid, 1, 'C', '25kp1a44d3@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44d4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44D4', '25KP1A44D4', 'Sirsani', 'Navya', 'CSE-DS', bid, 1, 'C', '25kp1a44d4@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44d5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44D5', '25KP1A44D5', 'Sitha', 'Srinu', 'CSE-DS', bid, 1, 'C', '25kp1a44d5@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44d6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44D6', '25KP1A44D6', 'Surani', 'Venkata Tejesh', 'CSE-DS', bid, 1, 'C', '25kp1a44d6@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44d7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44D7', '25KP1A44D7', 'Syed', 'Jaheda', 'CSE-DS', bid, 1, 'C', '25kp1a44d7@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44d8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44D8', '25KP1A44D8', 'Tadiparthi', 'Srihari', 'CSE-DS', bid, 1, 'C', '25kp1a44d8@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44d9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44D9', '25KP1A44D9', 'Talluri', 'Kavyanjali', 'CSE-DS', bid, 1, 'C', '25kp1a44d9@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44e0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44E0', '25KP1A44E0', 'Tativada', 'Vandana Datta', 'CSE-DS', bid, 1, 'C', '25kp1a44e0@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44e1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44E1', '25KP1A44E1', 'Thamatam', 'Prudhvi', 'CSE-DS', bid, 1, 'C', '25kp1a44e1@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44e2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44E2', '25KP1A44E2', 'Thota', 'Chandrika', 'CSE-DS', bid, 1, 'C', '25kp1a44e2@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44e3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44E3', '25KP1A44E3', 'Thotapalli', 'Kumar Anthony Prasad', 'CSE-DS', bid, 1, 'C', '25kp1a44e3@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44e4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44E4', '25KP1A44E4', 'Tulluru', 'Anka Prasad', 'CSE-DS', bid, 1, 'C', '25kp1a44e4@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44e5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44E5', '25KP1A44E5', 'Vadduri', 'Karthik', 'CSE-DS', bid, 1, 'C', '25kp1a44e5@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44e6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44E6', '25KP1A44E6', 'Vadlamudi', 'Renuka', 'CSE-DS', bid, 1, 'C', '25kp1a44e6@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44e7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44E7', '25KP1A44E7', 'Vallala', 'Naga Babu', 'CSE-DS', bid, 1, 'C', '25kp1a44e7@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44e8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44E8', '25KP1A44E8', 'Valluri', 'Soma Nadh', 'CSE-DS', bid, 1, 'C', '25kp1a44e8@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44e9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44E9', '25KP1A44E9', 'Vechalapu', 'Bhargav', 'CSE-DS', bid, 1, 'C', '25kp1a44e9@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44f0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44F0', '25KP1A44F0', 'Velagaleti', 'Naga Sai Somesh', 'CSE-DS', bid, 1, 'C', '25kp1a44f0@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44f1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44F1', '25KP1A44F1', 'Vemireddy', 'Jyothi Maha Laxmi', 'CSE-DS', bid, 1, 'C', '25kp1a44f1@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44f2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44F2', '25KP1A44F2', 'Vunnam', 'Vijay Kumar', 'CSE-DS', bid, 1, 'C', '25kp1a44f2@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44f3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44F3', '25KP1A44F3', 'Vunnava', 'Kali Prasad', 'CSE-DS', bid, 1, 'C', '25kp1a44f3@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44f4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44F4', '25KP1A44F4', 'Yallavula', 'Tejaswini', 'CSE-DS', bid, 1, 'C', '25kp1a44f4@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44f5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44F5', '25KP1A44F5', 'Yannam', 'Venkata Lakshmi Prasanna', 'CSE-DS', bid, 1, 'C', '25kp1a44f5@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44f6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44F6', '25KP1A44F6', 'Yedpula', 'Siva Naga Raju', 'CSE-DS', bid, 1, 'C', '25kp1a44f6@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a44f7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A44F7', '25KP1A44F7', 'Veerla', 'Gopi', 'CSE-DS', bid, 1, 'C', '25kp1a44f7@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4401@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4401', '24KP1A4401', 'Adi', 'Gopi', 'CSE-DS', bid, 4, 'A', '24kp1a4401@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4402@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4402', '24KP1A4402', 'Alamuri', 'Durgamalleswara Rao', 'CSE-DS', bid, 4, 'A', '24kp1a4402@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4404@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4404', '24KP1A4404', 'Avula', 'Vamsi', 'CSE-DS', bid, 4, 'A', '24kp1a4404@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4405@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4405', '24KP1A4405', 'Avulamanda', 'Devi Pavan Kumar', 'CSE-DS', bid, 4, 'A', '24kp1a4405@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4406@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4406', '24KP1A4406', 'Avulapati', 'Yugandar', 'CSE-DS', bid, 4, 'A', '24kp1a4406@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4407@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4407', '24KP1A4407', 'Avuthu', 'Janani', 'CSE-DS', bid, 4, 'A', '24kp1a4407@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4408@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4408', '24KP1A4408', 'Avuthu', 'Kusuma', 'CSE-DS', bid, 4, 'A', '24kp1a4408@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4409@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4409', '24KP1A4409', 'Bachina', 'Sarath Chowdary', 'CSE-DS', bid, 4, 'A', '24kp1a4409@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4410@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4410', '24KP1A4410', 'Bandaru', 'Sri Vasanthi', 'CSE-DS', bid, 4, 'A', '24kp1a4410@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4411@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4411', '24KP1A4411', 'Bandi', 'Ujwal Venkata Sai', 'CSE-DS', bid, 4, 'A', '24kp1a4411@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4412@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4412', '24KP1A4412', 'Bandlamudi', 'Guru Sai Kailash', 'CSE-DS', bid, 4, 'A', '24kp1a4412@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4413@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4413', '24KP1A4413', 'Banka', 'Keerthi', 'CSE-DS', bid, 4, 'A', '24kp1a4413@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4414@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4414', '24KP1A4414', 'Bathula', 'Sravani', 'CSE-DS', bid, 4, 'A', '24kp1a4414@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4415@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4415', '24KP1A4415', 'Bathula', 'Sravani', 'CSE-DS', bid, 4, 'A', '24kp1a4415@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4416@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4416', '24KP1A4416', 'Battula', 'Jaya Bhuvaneswari', 'CSE-DS', bid, 4, 'A', '24kp1a4416@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4417@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4417', '24KP1A4417', 'Bollepalli', 'Nagarjuna', 'CSE-DS', bid, 4, 'A', '24kp1a4417@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4418@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4418', '24KP1A4418', 'Boorsu', 'Umakanth', 'CSE-DS', bid, 4, 'A', '24kp1a4418@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4419@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4419', '24KP1A4419', 'Bora', 'Pavan', 'CSE-DS', bid, 4, 'A', '24kp1a4419@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4420@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4420', '24KP1A4420', 'Budamguntla', 'Anjali', 'CSE-DS', bid, 4, 'A', '24kp1a4420@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4421@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4421', '24KP1A4421', 'Buthukuri', 'Uma Mahesh Reddy', 'CSE-DS', bid, 4, 'A', '24kp1a4421@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4422@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4422', '24KP1A4422', 'Chagamreddy', 'Sravani', 'CSE-DS', bid, 4, 'A', '24kp1a4422@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4423@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4423', '24KP1A4423', 'Chaganti', 'Yaswanth', 'CSE-DS', bid, 4, 'A', '24kp1a4423@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4424@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4424', '24KP1A4424', 'Challa', 'Lakshmi Tirupatamma', 'CSE-DS', bid, 4, 'A', '24kp1a4424@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4425@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4425', '24KP1A4425', 'Challa', 'Venkateswari', 'CSE-DS', bid, 4, 'A', '24kp1a4425@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4426@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4426', '24KP1A4426', 'Cheerla', 'Vishnu Babu', 'CSE-DS', bid, 4, 'A', '24kp1a4426@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4427@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4427', '24KP1A4427', 'Chekuri', 'Ashok Babu', 'CSE-DS', bid, 4, 'A', '24kp1a4427@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4428@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4428', '24KP1A4428', 'Chekuri', 'Rupesh', 'CSE-DS', bid, 4, 'A', '24kp1a4428@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4429@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4429', '24KP1A4429', 'Chilukuri', 'Naga Srisatya Sai Manikanta', 'CSE-DS', bid, 4, 'A', '24kp1a4429@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4430@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4430', '24KP1A4430', 'Chinka', 'Chandhana', 'CSE-DS', bid, 4, 'A', '24kp1a4430@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4431@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4431', '24KP1A4431', 'Chitteti', 'Fanindra', 'CSE-DS', bid, 4, 'A', '24kp1a4431@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4432@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4432', '24KP1A4432', 'Damarla', 'Ishtakameswari', 'CSE-DS', bid, 4, 'A', '24kp1a4432@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4433@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4433', '24KP1A4433', 'Dasari', 'Arun Kumar', 'CSE-DS', bid, 4, 'A', '24kp1a4433@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4434@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4434', '24KP1A4434', 'Dasari', 'Santhosh Pavan', 'CSE-DS', bid, 4, 'A', '24kp1a4434@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4435@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4435', '24KP1A4435', 'Davala', 'Sharon Raju', 'CSE-DS', bid, 4, 'A', '24kp1a4435@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4436@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4436', '24KP1A4436', 'Devalla', 'Roja', 'CSE-DS', bid, 4, 'A', '24kp1a4436@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4437@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4437', '24KP1A4437', 'Devalla', 'Srilakshmi', 'CSE-DS', bid, 4, 'A', '24kp1a4437@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4439@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4439', '24KP1A4439', 'Dirisala', 'Ganesh', 'CSE-DS', bid, 4, 'A', '24kp1a4439@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4440@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4440', '24KP1A4440', 'Dudekula', 'Mohudin', 'CSE-DS', bid, 4, 'A', '24kp1a4440@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4441@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4441', '24KP1A4441', 'Durgapu', 'Naga Shivathmika', 'CSE-DS', bid, 4, 'A', '24kp1a4441@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4442@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4442', '24KP1A4442', 'Ebbili', 'Raghu', 'CSE-DS', bid, 4, 'A', '24kp1a4442@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4443@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4443', '24KP1A4443', 'Elisetty', 'Sravanthi', 'CSE-DS', bid, 4, 'A', '24kp1a4443@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4444@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4444', '24KP1A4444', 'Firoj', 'Khan Patan', 'CSE-DS', bid, 4, 'A', '24kp1a4444@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4445@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4445', '24KP1A4445', 'G', 'Syamala Devi', 'CSE-DS', bid, 4, 'A', '24kp1a4445@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4447@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4447', '24KP1A4447', 'Garikamukku', 'Naga Venkata Saiteja', 'CSE-DS', bid, 4, 'A', '24kp1a4447@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4448@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4448', '24KP1A4448', 'Gattu', 'Siri Sri', 'CSE-DS', bid, 4, 'A', '24kp1a4448@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4449@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4449', '24KP1A4449', 'Gogu', 'Jaya Pravallika', 'CSE-DS', bid, 4, 'A', '24kp1a4449@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4450@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4450', '24KP1A4450', 'Golla', 'Madhavi', 'CSE-DS', bid, 4, 'A', '24kp1a4450@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4451@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4451', '24KP1A4451', 'Gopisetty', 'Aryan', 'CSE-DS', bid, 4, 'A', '24kp1a4451@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4452@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4452', '24KP1A4452', 'Guddeti', 'Jaswanth Reddy', 'CSE-DS', bid, 4, 'A', '24kp1a4452@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4453@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4453', '24KP1A4453', 'Guntupalli', 'Divya Jyothi', 'CSE-DS', bid, 4, 'A', '24kp1a4453@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4454@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4454', '24KP1A4454', 'Illuri', 'Johnson', 'CSE-DS', bid, 4, 'A', '24kp1a4454@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4455@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4455', '24KP1A4455', 'Jagarlamudi', 'Bindu Venkata Harshini', 'CSE-DS', bid, 4, 'A', '24kp1a4455@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4456@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4456', '24KP1A4456', 'Jagini', 'Pujitha', 'CSE-DS', bid, 4, 'A', '24kp1a4456@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4457@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4457', '24KP1A4457', 'Jakka', 'Jahnavi Venkata Sai Renuka', 'CSE-DS', bid, 4, 'A', '24kp1a4457@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4458@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4458', '24KP1A4458', 'Jakkula', 'Swarna Latha', 'CSE-DS', bid, 4, 'A', '24kp1a4458@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4459@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4459', '24KP1A4459', 'Jannipogu', 'Adi Lakshmi', 'CSE-DS', bid, 4, 'A', '24kp1a4459@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4460@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4460', '24KP1A4460', 'Jonnala', 'Lavanya', 'CSE-DS', bid, 4, 'A', '24kp1a4460@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4461@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4461', '24KP1A4461', 'Jonnalagadda', 'Rajesh', 'CSE-DS', bid, 4, 'A', '24kp1a4461@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4462@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4462', '24KP1A4462', 'Kakarla', 'Nandini', 'CSE-DS', bid, 4, 'A', '24kp1a4462@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4463@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4463', '24KP1A4463', 'Kallakula', 'Venkata Sai Kumar', 'CSE-DS', bid, 4, 'A', '24kp1a4463@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4464@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4464', '24KP1A4464', 'Kalluri', 'Hari Prasad', 'CSE-DS', bid, 4, 'A', '24kp1a4464@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4465@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4465', '24KP1A4465', 'Kalluri', 'Harshavardhan Reddy', 'CSE-DS', bid, 4, 'A', '24kp1a4465@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4466@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4466', '24KP1A4466', 'Kalva', 'Maxwell Diwakar', 'CSE-DS', bid, 4, 'A', '24kp1a4466@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4438@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4438', '24KP1A4438', 'Dharanikota', 'Anjali', 'CSE-DS', bid, 4, 'A', '24kp1a4438@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4446@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4446', '24KP1A4446', 'Gangisetti', 'Jagadeesh', 'CSE-DS', bid, 4, 'A', '24kp1a4446@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4403@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4403', '24KP1A4403', 'Ammanaganti', 'Ajay Kumar Reddy', 'CSE-DS', bid, 4, 'A', '24kp1a4403@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4467@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4467', '24KP1A4467', 'Kamatham', 'Bindusri', 'CSE-DS', bid, 4, 'B', '24kp1a4467@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4468@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4468', '24KP1A4468', 'Kambhampati', 'Dinesh', 'CSE-DS', bid, 4, 'B', '24kp1a4468@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4469@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4469', '24KP1A4469', 'Kamineni', 'Anusha', 'CSE-DS', bid, 4, 'B', '24kp1a4469@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4470@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4470', '24KP1A4470', 'Kamma', 'Mahalakshmi', 'CSE-DS', bid, 4, 'B', '24kp1a4470@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4471@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4471', '24KP1A4471', 'Kandukuri', 'Gopi', 'CSE-DS', bid, 4, 'B', '24kp1a4471@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4472@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4472', '24KP1A4472', 'Kantamneni', 'Manaswi', 'CSE-DS', bid, 4, 'B', '24kp1a4472@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4473@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4473', '24KP1A4473', 'Karakkayala', 'Naga Veera Ram Sunith', 'CSE-DS', bid, 4, 'B', '24kp1a4473@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4474@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4474', '24KP1A4474', 'Karanam', 'Swathi', 'CSE-DS', bid, 4, 'B', '24kp1a4474@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4475@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4475', '24KP1A4475', 'Kari', 'Bhargava Raja', 'CSE-DS', bid, 4, 'B', '24kp1a4475@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4476@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4476', '24KP1A4476', 'Karna', 'Siva Nagaraju', 'CSE-DS', bid, 4, 'B', '24kp1a4476@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4477@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4477', '24KP1A4477', 'Kasarabada', 'Harsha Nageswari', 'CSE-DS', bid, 4, 'B', '24kp1a4477@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4478@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4478', '24KP1A4478', 'Kasarabada', 'Lavanya', 'CSE-DS', bid, 4, 'B', '24kp1a4478@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4479@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4479', '24KP1A4479', 'Kasarabada', 'Tejaswini', 'CSE-DS', bid, 4, 'B', '24kp1a4479@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4480@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4480', '24KP1A4480', 'Katari', 'Charan Teja', 'CSE-DS', bid, 4, 'B', '24kp1a4480@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4481@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4481', '24KP1A4481', 'Katlakunta', 'Devendra Varma', 'CSE-DS', bid, 4, 'B', '24kp1a4481@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4482@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4482', '24KP1A4482', 'Kattupalli', 'Dimpul Kumar', 'CSE-DS', bid, 4, 'B', '24kp1a4482@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4483@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4483', '24KP1A4483', 'Koie', 'Harsha Vardhan', 'CSE-DS', bid, 4, 'B', '24kp1a4483@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4484@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4484', '24KP1A4484', 'Kolli', 'Thanvi Chowdary', 'CSE-DS', bid, 4, 'B', '24kp1a4484@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4485@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4485', '24KP1A4485', 'Kollipara', 'Teja Hansika', 'CSE-DS', bid, 4, 'B', '24kp1a4485@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4486@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4486', '24KP1A4486', 'Kommineni', 'Kavya', 'CSE-DS', bid, 4, 'B', '24kp1a4486@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4487@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4487', '24KP1A4487', 'Kommula', 'Yesumani', 'CSE-DS', bid, 4, 'B', '24kp1a4487@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4488@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4488', '24KP1A4488', 'Koppukonda', 'Kusuma Latha', 'CSE-DS', bid, 4, 'B', '24kp1a4488@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4489@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4489', '24KP1A4489', 'Kunchala', 'Lavanya', 'CSE-DS', bid, 4, 'B', '24kp1a4489@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4490@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4490', '24KP1A4490', 'Kunduru', 'Sruthi', 'CSE-DS', bid, 4, 'B', '24kp1a4490@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4491@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4491', '24KP1A4491', 'Kunduru', 'Venkata Reddy', 'CSE-DS', bid, 4, 'B', '24kp1a4491@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4492@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4492', '24KP1A4492', 'Kurra', 'Mahesh Raj', 'CSE-DS', bid, 4, 'B', '24kp1a4492@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4493@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4493', '24KP1A4493', 'M', 'Bala Phani Kumar', 'CSE-DS', bid, 4, 'B', '24kp1a4493@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4494@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4494', '24KP1A4494', 'Maddala', 'Sriram', 'CSE-DS', bid, 4, 'B', '24kp1a4494@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4495@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4495', '24KP1A4495', 'Maddineni', 'Akshaya', 'CSE-DS', bid, 4, 'B', '24kp1a4495@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4496@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4496', '24KP1A4496', 'Maddineni', 'Darani', 'CSE-DS', bid, 4, 'B', '24kp1a4496@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4497@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4497', '24KP1A4497', 'Maddu', 'Naresh', 'CSE-DS', bid, 4, 'B', '24kp1a4497@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4498@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4498', '24KP1A4498', 'Madirapalli', 'Kishore', 'CSE-DS', bid, 4, 'B', '24kp1a4498@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a4499@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A4499', '24KP1A4499', 'Makineni', 'Naga Brahmaiah', 'CSE-DS', bid, 4, 'B', '24kp1a4499@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44a0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44A0', '24KP1A44A0', 'Malepati', 'Ashok', 'CSE-DS', bid, 4, 'B', '24kp1a44a0@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44a1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44A1', '24KP1A44A1', 'Mamidipalli', 'Gopi', 'CSE-DS', bid, 4, 'B', '24kp1a44a1@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44a2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44A2', '24KP1A44A2', 'Maniganti', 'Gopi Krishna', 'CSE-DS', bid, 4, 'B', '24kp1a44a2@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44a3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44A3', '24KP1A44A3', 'Marasu', 'Subhash', 'CSE-DS', bid, 4, 'B', '24kp1a44a3@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44a4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44A4', '24KP1A44A4', 'Marthula', 'Madhusudhan Reddy', 'CSE-DS', bid, 4, 'B', '24kp1a44a4@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44a5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44A5', '24KP1A44A5', 'Massed', 'Saaniya', 'CSE-DS', bid, 4, 'B', '24kp1a44a5@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44a6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44A6', '24KP1A44A6', 'Mavuri', 'Khyathi', 'CSE-DS', bid, 4, 'B', '24kp1a44a6@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44a7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44A7', '24KP1A44A7', 'Medikonda', 'Hareesh', 'CSE-DS', bid, 4, 'B', '24kp1a44a7@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44a8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44A8', '24KP1A44A8', 'Miripalli', 'Ashok', 'CSE-DS', bid, 4, 'B', '24kp1a44a8@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44a9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44A9', '24KP1A44A9', 'Mohammad', 'Afifa Mehak', 'CSE-DS', bid, 4, 'B', '24kp1a44a9@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44b0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44B0', '24KP1A44B0', 'Mohammad', 'Aslam Sulthan', 'CSE-DS', bid, 4, 'B', '24kp1a44b0@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44b1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44B1', '24KP1A44B1', 'Mosali', 'Pavan Surya', 'CSE-DS', bid, 4, 'B', '24kp1a44b1@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44b2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44B2', '24KP1A44B2', 'Munaga', 'Yaswanth Kumar', 'CSE-DS', bid, 4, 'B', '24kp1a44b2@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44b3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44B3', '24KP1A44B3', 'Munagala', 'Chandra Sekhar Reddy', 'CSE-DS', bid, 4, 'B', '24kp1a44b3@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44b4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44B4', '24KP1A44B4', 'Mutyam', 'Sai Gopi', 'CSE-DS', bid, 4, 'B', '24kp1a44b4@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44b5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44B5', '24KP1A44B5', 'Muvvala', 'Vasavi Aruna', 'CSE-DS', bid, 4, 'B', '24kp1a44b5@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44b6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44B6', '24KP1A44B6', 'Nadikattu', 'Thirupathi Reddy', 'CSE-DS', bid, 4, 'B', '24kp1a44b6@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44b7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44B7', '24KP1A44B7', 'Namala', 'Koteswara Rao', 'CSE-DS', bid, 4, 'B', '24kp1a44b7@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44b8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44B8', '24KP1A44B8', 'Nanabala', 'Chaitanya', 'CSE-DS', bid, 4, 'B', '24kp1a44b8@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44b9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44B9', '24KP1A44B9', 'Nandavarapu', 'Kiran', 'CSE-DS', bid, 4, 'B', '24kp1a44b9@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44c0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44C0', '24KP1A44C0', 'Nidamanuru', 'Vedamallika', 'CSE-DS', bid, 4, 'B', '24kp1a44c0@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44c1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44C1', '24KP1A44C1', 'Nunna', 'Durga Mahesh', 'CSE-DS', bid, 4, 'B', '24kp1a44c1@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44c2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44C2', '24KP1A44C2', 'Obulasetty', 'Sai', 'CSE-DS', bid, 4, 'B', '24kp1a44c2@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44c3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44C3', '24KP1A44C3', 'Onteru', 'Raju', 'CSE-DS', bid, 4, 'B', '24kp1a44c3@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44c4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44C4', '24KP1A44C4', 'Ontipuli', 'Meghana', 'CSE-DS', bid, 4, 'B', '24kp1a44c4@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44c5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44C5', '24KP1A44C5', 'Oruganti', 'Harsha Vardhan', 'CSE-DS', bid, 4, 'B', '24kp1a44c5@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44c6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44C6', '24KP1A44C6', 'Pallepogu', 'Vikram Rathod', 'CSE-DS', bid, 4, 'B', '24kp1a44c6@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44c7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44C7', '24KP1A44C7', 'Pamba', 'Pavan', 'CSE-DS', bid, 4, 'B', '24kp1a44c7@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44c8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44C8', '24KP1A44C8', 'Parimi', 'Raviteja', 'CSE-DS', bid, 4, 'B', '24kp1a44c8@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44c9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44C9', '24KP1A44C9', 'Pavuluri', 'Hema Amrutha', 'CSE-DS', bid, 4, 'B', '24kp1a44c9@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44d0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44D0', '24KP1A44D0', 'Pendyala', 'Lasya Priya', 'CSE-DS', bid, 4, 'B', '24kp1a44d0@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44d1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44D1', '24KP1A44D1', 'Perecherla', 'Komalatha', 'CSE-DS', bid, 4, 'B', '24kp1a44d1@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44d2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44D2', '24KP1A44D2', 'Perla', 'Mary Suganda', 'CSE-DS', bid, 4, 'B', '24kp1a44d2@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44d3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44D3', '24KP1A44D3', 'Pilli', 'Salman Raju', 'CSE-DS', bid, 4, 'C', '24kp1a44d3@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44d4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44D4', '24KP1A44D4', 'Pittam', 'Jaya Vardhan Reddy', 'CSE-DS', bid, 4, 'C', '24kp1a44d4@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44d5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44D5', '24KP1A44D5', 'Pugala', 'Laxmi Prasanna', 'CSE-DS', bid, 4, 'C', '24kp1a44d5@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44d6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44D6', '24KP1A44D6', 'Puli', 'Indra', 'CSE-DS', bid, 4, 'C', '24kp1a44d6@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44d7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44D7', '24KP1A44D7', 'Pulibandla', 'Likhitha', 'CSE-DS', bid, 4, 'C', '24kp1a44d7@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44d8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44D8', '24KP1A44D8', 'Pulivarthi', 'Sumana', 'CSE-DS', bid, 4, 'C', '24kp1a44d8@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44d9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44D9', '24KP1A44D9', 'Pullavelugu', 'Siripriya', 'CSE-DS', bid, 4, 'C', '24kp1a44d9@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44e0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44E0', '24KP1A44E0', 'Putta', 'Sridurga', 'CSE-DS', bid, 4, 'C', '24kp1a44e0@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44e1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44E1', '24KP1A44E1', 'Racharla', 'Sanjay Karthikeya', 'CSE-DS', bid, 4, 'C', '24kp1a44e1@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44e2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44E2', '24KP1A44E2', 'Ramisetty', 'Ambica', 'CSE-DS', bid, 4, 'C', '24kp1a44e2@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44e3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44E3', '24KP1A44E3', 'Ramisetty', 'Raghavendra', 'CSE-DS', bid, 4, 'C', '24kp1a44e3@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44e4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44E4', '24KP1A44E4', 'Ravulapalli', 'Venkat', 'CSE-DS', bid, 4, 'C', '24kp1a44e4@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44e5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44E5', '24KP1A44E5', 'S', 'Mythili', 'CSE-DS', bid, 4, 'C', '24kp1a44e5@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44e6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44E6', '24KP1A44E6', 'Sadu', 'Naga Venkata Sanjay', 'CSE-DS', bid, 4, 'C', '24kp1a44e6@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44e8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44E8', '24KP1A44E8', 'Sampath', 'Garapati', 'CSE-DS', bid, 4, 'C', '24kp1a44e8@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44e9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44E9', '24KP1A44E9', 'Sana', 'Yedu Kondalu', 'CSE-DS', bid, 4, 'C', '24kp1a44e9@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44f0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44F0', '24KP1A44F0', 'Seshagiri', 'Bhargav', 'CSE-DS', bid, 4, 'C', '24kp1a44f0@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44f2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44F2', '24KP1A44F2', 'Shaik', 'Abdul Razzaq', 'CSE-DS', bid, 4, 'C', '24kp1a44f2@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44f3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44F3', '24KP1A44F3', 'Shaik', 'Ansar', 'CSE-DS', bid, 4, 'C', '24kp1a44f3@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44f4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44F4', '24KP1A44F4', 'Shaik', 'Asha', 'CSE-DS', bid, 4, 'C', '24kp1a44f4@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44f5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44F5', '24KP1A44F5', 'Shaik', 'Baba Fakruddin', 'CSE-DS', bid, 4, 'C', '24kp1a44f5@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44f6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44F6', '24KP1A44F6', 'Shaik', 'Hafsa', 'CSE-DS', bid, 4, 'C', '24kp1a44f6@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44f7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44F7', '24KP1A44F7', 'Shaik', 'Khaja Babu', 'CSE-DS', bid, 4, 'C', '24kp1a44f7@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44f8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44F8', '24KP1A44F8', 'Shaik', 'Mastanvali', 'CSE-DS', bid, 4, 'C', '24kp1a44f8@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44f9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44F9', '24KP1A44F9', 'Shaik', 'Mobeena Nasreen', 'CSE-DS', bid, 4, 'C', '24kp1a44f9@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44g1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44G1', '24KP1A44G1', 'Shaik', 'Mohammad Mahashoof', 'CSE-DS', bid, 4, 'C', '24kp1a44g1@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44g2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44G2', '24KP1A44G2', 'Shaik', 'Nagul Sharif', 'CSE-DS', bid, 4, 'C', '24kp1a44g2@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44g3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44G3', '24KP1A44G3', 'Shaik', 'Nazeerunnisa', 'CSE-DS', bid, 4, 'C', '24kp1a44g3@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44g4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44G4', '24KP1A44G4', 'Shaik', 'Noushad', 'CSE-DS', bid, 4, 'C', '24kp1a44g4@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44g5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44G5', '24KP1A44G5', 'Shaik', 'Sadhik', 'CSE-DS', bid, 4, 'C', '24kp1a44g5@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44g6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44G6', '24KP1A44G6', 'Shaik', 'Saida', 'CSE-DS', bid, 4, 'C', '24kp1a44g6@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44g7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44G7', '24KP1A44G7', 'Shaik', 'Shahida Begam', 'CSE-DS', bid, 4, 'C', '24kp1a44g7@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44g8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44G8', '24KP1A44G8', 'Shaik', 'Sharmila', 'CSE-DS', bid, 4, 'C', '24kp1a44g8@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44g9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44G9', '24KP1A44G9', 'Shaik', 'Shirintaj', 'CSE-DS', bid, 4, 'C', '24kp1a44g9@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44h0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44H0', '24KP1A44H0', 'Shaik', 'Suhana Tabasum', 'CSE-DS', bid, 4, 'C', '24kp1a44h0@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44h1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44H1', '24KP1A44H1', 'Siddi', 'Naga Siva Mani', 'CSE-DS', bid, 4, 'C', '24kp1a44h1@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44h2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44H2', '24KP1A44H2', 'Singamsetty', 'Kumara Swamy', 'CSE-DS', bid, 4, 'C', '24kp1a44h2@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44h3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44H3', '24KP1A44H3', 'Syed', 'Fathima', 'CSE-DS', bid, 4, 'C', '24kp1a44h3@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44h4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44H4', '24KP1A44H4', 'Syed', 'Nikhath', 'CSE-DS', bid, 4, 'C', '24kp1a44h4@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44h5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44H5', '24KP1A44H5', 'Telagarapu', 'Ganesh Naga Venkata Durga', 'CSE-DS', bid, 4, 'C', '24kp1a44h5@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44h6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44H6', '24KP1A44H6', 'Thetakalli', 'Venkata Rao', 'CSE-DS', bid, 4, 'C', '24kp1a44h6@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44h7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44H7', '24KP1A44H7', 'Thirumalareddy', 'Anil Kumar Reddy', 'CSE-DS', bid, 4, 'C', '24kp1a44h7@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44h8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44H8', '24KP1A44H8', 'Thota', 'Bhuvaneswar', 'CSE-DS', bid, 4, 'C', '24kp1a44h8@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44h9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44H9', '24KP1A44H9', 'Thurumella', 'Yohoshuva Mary David', 'CSE-DS', bid, 4, 'C', '24kp1a44h9@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44i0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44I0', '24KP1A44I0', 'Ulisi', 'Niharika', 'CSE-DS', bid, 4, 'C', '24kp1a44i0@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44i1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44I1', '24KP1A44I1', 'Vallamsetty', 'Sriram', 'CSE-DS', bid, 4, 'C', '24kp1a44i1@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44i2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44I2', '24KP1A44I2', 'Vallepu', 'Gopika', 'CSE-DS', bid, 4, 'C', '24kp1a44i2@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44i3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44I3', '24KP1A44I3', 'Vallepu', 'Priyanka', 'CSE-DS', bid, 4, 'C', '24kp1a44i3@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44i4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44I4', '24KP1A44I4', 'Vanga', 'Puneeth Reddy', 'CSE-DS', bid, 4, 'C', '24kp1a44i4@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44i5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44I5', '24KP1A44I5', 'Vangapalli', 'Pavani', 'CSE-DS', bid, 4, 'C', '24kp1a44i5@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44i6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44I6', '24KP1A44I6', 'Vasipilli', 'Prasad', 'CSE-DS', bid, 4, 'C', '24kp1a44i6@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44i7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44I7', '24KP1A44I7', 'Vegi', 'Sampath Sai Shanmuka', 'CSE-DS', bid, 4, 'C', '24kp1a44i7@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44i8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44I8', '24KP1A44I8', 'Veldurthy', 'Ramesh Babu', 'CSE-DS', bid, 4, 'C', '24kp1a44i8@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44i9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44I9', '24KP1A44I9', 'Vemula', 'Ramesh', 'CSE-DS', bid, 4, 'C', '24kp1a44i9@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44j0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44J0', '24KP1A44J0', 'Vemulapalli', 'Venkata Janathi', 'CSE-DS', bid, 4, 'C', '24kp1a44j0@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44j1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44J1', '24KP1A44J1', 'Viswanadhapalli', 'Mahesh', 'CSE-DS', bid, 4, 'C', '24kp1a44j1@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44j2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44J2', '24KP1A44J2', 'Vullangula', 'Rushyanthi', 'CSE-DS', bid, 4, 'C', '24kp1a44j2@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44j3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44J3', '24KP1A44J3', 'Yakkala', 'Koushik', 'CSE-DS', bid, 4, 'C', '24kp1a44j3@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44j4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44J4', '24KP1A44J4', 'Yakkanti', 'Sudharshan Naidu', 'CSE-DS', bid, 4, 'C', '24kp1a44j4@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44j5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44J5', '24KP1A44J5', 'Yalla', 'Yagneswar', 'CSE-DS', bid, 4, 'C', '24kp1a44j5@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44j7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44J7', '24KP1A44J7', 'Yerriboina', 'Venkata Sai', 'CSE-DS', bid, 4, 'C', '24kp1a44j7@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44j8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44J8', '24KP1A44J8', 'Yetukuri', 'Santhosh Pavan Kumar', 'CSE-DS', bid, 4, 'C', '24kp1a44j8@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44b3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44B3', '23KP1A44B3', 'Nandigam', 'Ijak', 'CSE-DS', bid, 4, 'B', '23kp1a44b3@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4414@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4414', '23KP1A4414', 'Bapanapalli', 'Karthik', 'CSE-DS', bid, 4, 'A', '23kp1a4414@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44f8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44F8', '23KP1A44F8', 'Shaik', 'Saida Babu', 'CSE-DS', bid, 4, 'C', '23kp1a44f8@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44a2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44A2', '23KP1A44A2', 'Midiganti', 'Paparao', 'CSE-DS', bid, 4, 'B', '23kp1a44a2@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a4402@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A4402', '25KP5A4402', 'Gonnabathula', 'Rama Krishna Parama Hamsa', 'CSE-DS', bid, 4, 'C', '25kp5a4402@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a4403@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A4403', '25KP5A4403', 'Kunchapu', 'Anilkumar', 'CSE-DS', bid, 4, 'C', '25kp5a4403@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a4404@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A4404', '25KP5A4404', 'Rentapalli', 'Surendra', 'CSE-DS', bid, 4, 'C', '25kp5a4404@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a4405@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A4405', '25KP5A4405', 'Shaik', 'Reshma', 'CSE-DS', bid, 4, 'C', '25kp5a4405@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a4406@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A4406', '25KP5A4406', 'Tupakula', 'Mahesh', 'CSE-DS', bid, 4, 'C', '25kp5a4406@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a4407@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A4407', '25KP5A4407', 'Velpula', 'Sudhakar', 'CSE-DS', bid, 4, 'C', '25kp5a4407@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a4409@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A4409', '25KP5A4409', 'Yella', 'Dhanya Suvarsha', 'CSE-DS', bid, 4, 'C', '25kp5a4409@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44f1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44F1', '24KP1A44F1', 'Shaik', 'Abdul Khadar', 'CSE-DS', bid, 4, 'C', '24kp1a44f1@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44g0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44G0', '24KP1A44G0', 'Shaik', 'Mohammad Ayesha Farhana', 'CSE-DS', bid, 4, 'C', '24kp1a44g0@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44e7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44E7', '24KP1A44E7', 'Samineni', 'Lakshmi Kanth', 'CSE-DS', bid, 4, 'C', '24kp1a44e7@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a44j6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A44J6', '24KP1A44J6', 'Yaraguni', 'Ravindra', 'CSE-DS', bid, 4, 'C', '24kp1a44j6@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a4401@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A4401', '25KP5A4401', 'Bandalapati', 'David Raju', 'CSE-DS', bid, 4, 'C', '25kp5a4401@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a4408@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A4408', '25KP5A4408', 'Vemuri', 'Naga Vishnu', 'CSE-DS', bid, 4, 'C', '25kp5a4408@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4401@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4401', '23KP1A4401', 'Adigoppula', 'Yamuna', 'CSE-DS', bid, 4, 'A', '23kp1a4401@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4402@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4402', '23KP1A4402', 'Adoni', 'Ajay', 'CSE-DS', bid, 4, 'A', '23kp1a4402@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4403@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4403', '23KP1A4403', 'Agulla', 'Narendra', 'CSE-DS', bid, 4, 'A', '23kp1a4403@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4405@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4405', '23KP1A4405', 'Annavarapu', 'Yasaswini Bramarambica Devi', 'CSE-DS', bid, 4, 'A', '23kp1a4405@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4406@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4406', '23KP1A4406', 'Atluri', 'Vinod', 'CSE-DS', bid, 4, 'A', '23kp1a4406@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4409@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4409', '23KP1A4409', 'Balantha', 'Satish', 'CSE-DS', bid, 4, 'A', '23kp1a4409@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4410@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4410', '23KP1A4410', 'Banavath', 'Srikanth Naik', 'CSE-DS', bid, 4, 'A', '23kp1a4410@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4411@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4411', '23KP1A4411', 'Bandaru', 'Gnana Keerthi', 'CSE-DS', bid, 4, 'A', '23kp1a4411@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4413@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4413', '23KP1A4413', 'Bannaravuri', 'Aswini', 'CSE-DS', bid, 4, 'A', '23kp1a4413@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4415@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4415', '23KP1A4415', 'Bathula', 'Venkata Ramaiah', 'CSE-DS', bid, 4, 'A', '23kp1a4415@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4416@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4416', '23KP1A4416', 'Battina', 'Varshitha', 'CSE-DS', bid, 4, 'A', '23kp1a4416@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4418@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4418', '23KP1A4418', 'Battula', 'Subramanyam', 'CSE-DS', bid, 4, 'A', '23kp1a4418@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4419@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4419', '23KP1A4419', 'Bethapudi', 'Bala Surya', 'CSE-DS', bid, 4, 'A', '23kp1a4419@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4420@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4420', '23KP1A4420', 'Bhavanasi', 'Yeskel', 'CSE-DS', bid, 4, 'A', '23kp1a4420@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4421@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4421', '23KP1A4421', 'Bhumireddy', 'Teja Reddy', 'CSE-DS', bid, 4, 'A', '23kp1a4421@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4422@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4422', '23KP1A4422', 'Bijjam', 'Sai Lakshmi', 'CSE-DS', bid, 4, 'A', '23kp1a4422@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4423@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4423', '23KP1A4423', 'Boina', 'Naga Supraja', 'CSE-DS', bid, 4, 'A', '23kp1a4423@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4424@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4424', '23KP1A4424', 'Bole', 'Krishna Chaitanya', 'CSE-DS', bid, 4, 'A', '23kp1a4424@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4425@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4425', '23KP1A4425', 'Bollepalli', 'Vamsi', 'CSE-DS', bid, 4, 'A', '23kp1a4425@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4427@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4427', '23KP1A4427', 'Chakka', 'Naga Venkata Nandini', 'CSE-DS', bid, 4, 'A', '23kp1a4427@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4428@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4428', '23KP1A4428', 'Challapalli', 'Yasaswitha', 'CSE-DS', bid, 4, 'A', '23kp1a4428@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4429@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4429', '23KP1A4429', 'Chandala', 'Srilakshmi', 'CSE-DS', bid, 4, 'A', '23kp1a4429@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4430@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4430', '23KP1A4430', 'Cheerla', 'Harinarayana', 'CSE-DS', bid, 4, 'A', '23kp1a4430@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4432@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4432', '23KP1A4432', 'Chevula', 'Srinivas', 'CSE-DS', bid, 4, 'A', '23kp1a4432@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4433@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4433', '23KP1A4433', 'Chilukoti', 'Sreeneelima', 'CSE-DS', bid, 4, 'A', '23kp1a4433@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4435@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4435', '23KP1A4435', 'Chintalacheruvu', 'Venkateswarlu', 'CSE-DS', bid, 4, 'A', '23kp1a4435@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4436@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4436', '23KP1A4436', 'Chinthoti', 'Raghavendra', 'CSE-DS', bid, 4, 'A', '23kp1a4436@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4437@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4437', '23KP1A4437', 'Chiruguri', 'Philip', 'CSE-DS', bid, 4, 'A', '23kp1a4437@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4438@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4438', '23KP1A4438', 'Chukka', 'Sindhu', 'CSE-DS', bid, 4, 'A', '23kp1a4438@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4439@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4439', '23KP1A4439', 'Dama', 'Anusha', 'CSE-DS', bid, 4, 'A', '23kp1a4439@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4440@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4440', '23KP1A4440', 'Dammu', 'Venky', 'CSE-DS', bid, 4, 'A', '23kp1a4440@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4441@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4441', '23KP1A4441', 'Danda', 'Sai Teja', 'CSE-DS', bid, 4, 'A', '23kp1a4441@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4442@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4442', '23KP1A4442', 'Dasu', 'Prabhu Kumar', 'CSE-DS', bid, 4, 'A', '23kp1a4442@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4443@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4443', '23KP1A4443', 'Digumarthi', 'Sairam', 'CSE-DS', bid, 4, 'A', '23kp1a4443@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4445@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4445', '23KP1A4445', 'Ekkirala', 'Chandu', 'CSE-DS', bid, 4, 'A', '23kp1a4445@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4446@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4446', '23KP1A4446', 'Elaprolu', 'Siva Krishna', 'CSE-DS', bid, 4, 'A', '23kp1a4446@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4448@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4448', '23KP1A4448', 'Gogisetty', 'Anil Kumar', 'CSE-DS', bid, 4, 'A', '23kp1a4448@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4450@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4450', '23KP1A4450', 'Gollapalli', 'Renuka', 'CSE-DS', bid, 4, 'A', '23kp1a4450@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4452@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4452', '23KP1A4452', 'Gongati', 'Tejasri', 'CSE-DS', bid, 4, 'A', '23kp1a4452@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4453@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4453', '23KP1A4453', 'Gorantla', 'Ajay Kumar', 'CSE-DS', bid, 4, 'A', '23kp1a4453@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4454@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4454', '23KP1A4454', 'Grandhi', 'Likhita', 'CSE-DS', bid, 4, 'A', '23kp1a4454@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4455@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4455', '23KP1A4455', 'Gudluru', 'Pavan', 'CSE-DS', bid, 4, 'A', '23kp1a4455@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4456@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4456', '23KP1A4456', 'Guduru', 'Abhilash', 'CSE-DS', bid, 4, 'A', '23kp1a4456@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4457@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4457', '23KP1A4457', 'Gummadi', 'Nikhil Chandu', 'CSE-DS', bid, 4, 'A', '23kp1a4457@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4458@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4458', '23KP1A4458', 'Guntur', 'Nissi', 'CSE-DS', bid, 4, 'A', '23kp1a4458@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4459@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4459', '23KP1A4459', 'Gurrala', 'Pavan Kumar', 'CSE-DS', bid, 4, 'A', '23kp1a4459@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4460@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4460', '23KP1A4460', 'Induri', 'Venkata Reddy', 'CSE-DS', bid, 4, 'A', '23kp1a4460@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4461@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4461', '23KP1A4461', 'Iragala', 'Susmitha', 'CSE-DS', bid, 4, 'A', '23kp1a4461@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4462@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4462', '23KP1A4462', 'Jammana', 'Estheru Rani', 'CSE-DS', bid, 4, 'A', '23kp1a4462@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4464@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4464', '23KP1A4464', 'Kalavakollu', 'Venkata Sai', 'CSE-DS', bid, 4, 'A', '23kp1a4464@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4465@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4465', '23KP1A4465', 'Kale', 'Sagar Babu', 'CSE-DS', bid, 4, 'A', '23kp1a4465@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4466@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4466', '23KP1A4466', 'Kunchala', 'Arya', 'CSE-DS', bid, 4, 'A', '23kp1a4466@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4451@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4451', '23KP1A4451', 'Gollapalli', 'Venkata Sai Krishna', 'CSE-DS', bid, 4, 'A', '23kp1a4451@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4404@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4404', '23KP1A4404', 'Ankamma', 'Rao Nelaturi', 'CSE-DS', bid, 4, 'A', '23kp1a4404@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4407@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4407', '23KP1A4407', 'Avanigadda', 'Naga Yaswanth', 'CSE-DS', bid, 4, 'A', '23kp1a4407@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4426@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4426', '23KP1A4426', 'Busarapu', 'Trinadh', 'CSE-DS', bid, 4, 'A', '23kp1a4426@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4434@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4434', '23KP1A4434', 'Chintaguntla', 'Teja Sree', 'CSE-DS', bid, 4, 'A', '23kp1a4434@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4447@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4447', '23KP1A4447', 'Gangula', 'Ramu', 'CSE-DS', bid, 4, 'A', '23kp1a4447@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4449@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4449', '23KP1A4449', 'Gogula', 'Akhil', 'CSE-DS', bid, 4, 'A', '23kp1a4449@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4463@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4463', '23KP1A4463', 'Jutta', 'Sivasai', 'CSE-DS', bid, 4, 'A', '23kp1a4463@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4408@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4408', '23KP1A4408', 'Avula', 'Ganesh', 'CSE-DS', bid, 4, 'A', '23kp1a4408@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4431@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4431', '23KP1A4431', 'Chevula', 'Ramoji Rao', 'CSE-DS', bid, 4, 'A', '23kp1a4431@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4412@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4412', '23KP1A4412', 'Bandharavuri', 'Srilakshmi', 'CSE-DS', bid, 4, 'A', '23kp1a4412@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4417@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4417', '23KP1A4417', 'Battula', 'Madhu', 'CSE-DS', bid, 4, 'A', '23kp1a4417@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4444@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4444', '23KP1A4444', 'Dubba', 'Avinash', 'CSE-DS', bid, 4, 'A', '23kp1a4444@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4467@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4467', '23KP1A4467', 'Kalluri', 'Renuka', 'CSE-DS', bid, 4, 'B', '23kp1a4467@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4468@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4468', '23KP1A4468', 'Kalluri', 'Vineetha', 'CSE-DS', bid, 4, 'B', '23kp1a4468@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4469@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4469', '23KP1A4469', 'Kambhampati', 'Ram Charan Teja', 'CSE-DS', bid, 4, 'B', '23kp1a4469@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4470@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4470', '23KP1A4470', 'Kamineni', 'Sharon Kumar', 'CSE-DS', bid, 4, 'B', '23kp1a4470@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4472@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4472', '23KP1A4472', 'Kanakamalla', 'Gokul', 'CSE-DS', bid, 4, 'B', '23kp1a4472@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4473@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4473', '23KP1A4473', 'Karravula', 'Sairam', 'CSE-DS', bid, 4, 'B', '23kp1a4473@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4474@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4474', '23KP1A4474', 'Kasarabada', 'Venkatesh', 'CSE-DS', bid, 4, 'B', '23kp1a4474@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4475@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4475', '23KP1A4475', 'Kasimala', 'Abhinaya', 'CSE-DS', bid, 4, 'B', '23kp1a4475@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4476@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4476', '23KP1A4476', 'Kata', 'Uday Kumar', 'CSE-DS', bid, 4, 'B', '23kp1a4476@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4477@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4477', '23KP1A4477', 'Kavati', 'Pavan Sai', 'CSE-DS', bid, 4, 'B', '23kp1a4477@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4478@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4478', '23KP1A4478', 'Khumi', 'Mohammed Siayan', 'CSE-DS', bid, 4, 'B', '23kp1a4478@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4479@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4479', '23KP1A4479', 'Kodirekka', 'Uday Keerthi', 'CSE-DS', bid, 4, 'B', '23kp1a4479@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4480@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4480', '23KP1A4480', 'Kolakaluri', 'Anand Ofir', 'CSE-DS', bid, 4, 'B', '23kp1a4480@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4481@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4481', '23KP1A4481', 'Kole', 'Rohith', 'CSE-DS', bid, 4, 'B', '23kp1a4481@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4482@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4482', '23KP1A4482', 'Kolikonda', 'Rambabu', 'CSE-DS', bid, 4, 'B', '23kp1a4482@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4484@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4484', '23KP1A4484', 'Kolluri', 'Manasa', 'CSE-DS', bid, 4, 'B', '23kp1a4484@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4485@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4485', '23KP1A4485', 'Kolusu', 'Udaya Sri', 'CSE-DS', bid, 4, 'B', '23kp1a4485@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4486@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4486', '23KP1A4486', 'Konda', 'Sivamani', 'CSE-DS', bid, 4, 'B', '23kp1a4486@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4487@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4487', '23KP1A4487', 'Kota', 'Lokeswara Koushik', 'CSE-DS', bid, 4, 'B', '23kp1a4487@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4488@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4488', '23KP1A4488', 'Kota', 'Venkata Narayana', 'CSE-DS', bid, 4, 'B', '23kp1a4488@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4489@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4489', '23KP1A4489', 'Kotla', 'Prem Sai Reddy', 'CSE-DS', bid, 4, 'B', '23kp1a4489@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4490@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4490', '23KP1A4490', 'Kotte', 'Hima Bindu', 'CSE-DS', bid, 4, 'B', '23kp1a4490@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4491@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4491', '23KP1A4491', 'Lakkineni', 'Arpitha', 'CSE-DS', bid, 4, 'B', '23kp1a4491@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4492@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4492', '23KP1A4492', 'Lotla', 'Charan Kumar', 'CSE-DS', bid, 4, 'B', '23kp1a4492@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4493@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4493', '23KP1A4493', 'Mada', 'Asritha Durga', 'CSE-DS', bid, 4, 'B', '23kp1a4493@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4495@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4495', '23KP1A4495', 'Malineni', 'Koushik Kumar', 'CSE-DS', bid, 4, 'B', '23kp1a4495@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4496@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4496', '23KP1A4496', 'Mamillapalli', 'Prasanna Lakshmi', 'CSE-DS', bid, 4, 'B', '23kp1a4496@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4498@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4498', '23KP1A4498', 'Manyam', 'Karthik', 'CSE-DS', bid, 4, 'B', '23kp1a4498@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4499@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4499', '23KP1A4499', 'Medarametla', 'Hima Bindu', 'CSE-DS', bid, 4, 'B', '23kp1a4499@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44a0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44A0', '23KP1A44A0', 'Medasani', 'Jaswanth', 'CSE-DS', bid, 4, 'B', '23kp1a44a0@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44a1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44A1', '23KP1A44A1', 'Mekapotu', 'Uday Bhaskar Reddy', 'CSE-DS', bid, 4, 'B', '23kp1a44a1@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44a3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44A3', '23KP1A44A3', 'Mogal', 'Bara Imam', 'CSE-DS', bid, 4, 'B', '23kp1a44a3@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44a4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44A4', '23KP1A44A4', 'Mohammad', 'Sania', 'CSE-DS', bid, 4, 'B', '23kp1a44a4@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44a5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44A5', '23KP1A44A5', 'Mohammad', 'Zeinath Tabassum', 'CSE-DS', bid, 4, 'B', '23kp1a44a5@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44a6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44A6', '23KP1A44A6', 'Mokkapati', 'Harsha Vardhini', 'CSE-DS', bid, 4, 'B', '23kp1a44a6@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44a7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44A7', '23KP1A44A7', 'Muppuri', 'Harish', 'CSE-DS', bid, 4, 'B', '23kp1a44a7@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44a8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44A8', '23KP1A44A8', 'Muvva', 'Bhargavi', 'CSE-DS', bid, 4, 'B', '23kp1a44a8@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44a9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44A9', '23KP1A44A9', 'Nagiri', 'Vaishnavi', 'CSE-DS', bid, 4, 'B', '23kp1a44a9@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44b0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44B0', '23KP1A44B0', 'Nakka', 'Chandrika', 'CSE-DS', bid, 4, 'B', '23kp1a44b0@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44b2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44B2', '23KP1A44B2', 'Nama', 'Aryan', 'CSE-DS', bid, 4, 'B', '23kp1a44b2@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44b4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44B4', '23KP1A44B4', 'Nannasani', 'Guru Narendra', 'CSE-DS', bid, 4, 'B', '23kp1a44b4@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44b5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44B5', '23KP1A44B5', 'Narisetti', 'Kishore', 'CSE-DS', bid, 4, 'B', '23kp1a44b5@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44b7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44B7', '23KP1A44B7', 'Padarthi', 'Shanmukha Sai Priya', 'CSE-DS', bid, 4, 'B', '23kp1a44b7@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44b8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44B8', '23KP1A44B8', 'Pagidi', 'Sudheer', 'CSE-DS', bid, 4, 'B', '23kp1a44b8@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44b9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44B9', '23KP1A44B9', 'Palaadugu', 'Srinu', 'CSE-DS', bid, 4, 'B', '23kp1a44b9@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44c0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44C0', '23KP1A44C0', 'Pallapothula', 'Jayalakshmi', 'CSE-DS', bid, 4, 'B', '23kp1a44c0@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44c1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44C1', '23KP1A44C1', 'Panidam', 'Ravi Shankar', 'CSE-DS', bid, 4, 'B', '23kp1a44c1@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44c2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44C2', '23KP1A44C2', 'Parakandla', 'Purandeshwari', 'CSE-DS', bid, 4, 'B', '23kp1a44c2@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44c4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44C4', '23KP1A44C4', 'Paruchuri', 'Lakshmi Harika', 'CSE-DS', bid, 4, 'B', '23kp1a44c4@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44c6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44C6', '23KP1A44C6', 'Pasupuleti', 'Archana', 'CSE-DS', bid, 4, 'B', '23kp1a44c6@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44c7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44C7', '23KP1A44C7', 'Patan', 'Rehana', 'CSE-DS', bid, 4, 'B', '23kp1a44c7@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44c8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44C8', '23KP1A44C8', 'Pathan', 'Gouse Mohiddin', 'CSE-DS', bid, 4, 'B', '23kp1a44c8@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44c9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44C9', '23KP1A44C9', 'Pathuri', 'Sravanthi', 'CSE-DS', bid, 4, 'B', '23kp1a44c9@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44d0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44D0', '23KP1A44D0', 'Peesapati', 'Vinay', 'CSE-DS', bid, 4, 'B', '23kp1a44d0@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44d1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44D1', '23KP1A44D1', 'Pokala', 'Maapradeep', 'CSE-DS', bid, 4, 'B', '23kp1a44d1@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44d2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44D2', '23KP1A44D2', 'Pokuri', 'Durga Sai Pavan', 'CSE-DS', bid, 4, 'B', '23kp1a44d2@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4483@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4483', '23KP1A4483', 'Kollikonda', 'Sivanaga Manikanta', 'CSE-DS', bid, 4, 'B', '23kp1a4483@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4494@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4494', '23KP1A4494', 'Maddukuri', 'Venkata Karthik', 'CSE-DS', bid, 4, 'B', '23kp1a4494@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4497@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4497', '23KP1A4497', 'Manjula', 'Nagalakshmi', 'CSE-DS', bid, 4, 'B', '23kp1a4497@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44b6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44B6', '23KP1A44B6', 'Ontipuli', 'Vinay', 'CSE-DS', bid, 4, 'B', '23kp1a44b6@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a4471@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A4471', '23KP1A4471', 'Kampa', 'Narasimha Rao', 'CSE-DS', bid, 4, 'B', '23kp1a4471@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44c3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44C3', '23KP1A44C3', 'Parimi', 'Anusha', 'CSE-DS', bid, 4, 'B', '23kp1a44c3@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44c5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44C5', '23KP1A44C5', 'Pasam', 'Ravindra', 'CSE-DS', bid, 4, 'B', '23kp1a44c5@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44b1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44B1', '23KP1A44B1', 'Nallabolu', 'Sowbhagya Lakshmi', 'CSE-DS', bid, 4, 'B', '23kp1a44b1@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44d3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44D3', '23KP1A44D3', 'Potharaju', 'V N S Manogna Srivatsa Sankar', 'CSE-DS', bid, 4, 'C', '23kp1a44d3@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44d4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44D4', '23KP1A44D4', 'Pothuraju', 'Ajay Kumar', 'CSE-DS', bid, 4, 'C', '23kp1a44d4@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44d5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44D5', '23KP1A44D5', 'Putta', 'Sailaja', 'CSE-DS', bid, 4, 'C', '23kp1a44d5@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44d6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44D6', '23KP1A44D6', 'Rajarapu', 'Venkateswarlu', 'CSE-DS', bid, 4, 'C', '23kp1a44d6@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44d7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44D7', '23KP1A44D7', 'Ramavath', 'Rambabu Naik', 'CSE-DS', bid, 4, 'C', '23kp1a44d7@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44d8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44D8', '23KP1A44D8', 'Ramavathu', 'Hanumanthu Naik', 'CSE-DS', bid, 4, 'C', '23kp1a44d8@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44d9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44D9', '23KP1A44D9', 'Ramisetty', 'Chandrashekar', 'CSE-DS', bid, 4, 'C', '23kp1a44d9@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44e0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44E0', '23KP1A44E0', 'Rangisetty', 'Durga Prasad', 'CSE-DS', bid, 4, 'C', '23kp1a44e0@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44e1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44E1', '23KP1A44E1', 'Ravipati', 'Jaya Praveen', 'CSE-DS', bid, 4, 'C', '23kp1a44e1@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44e2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44E2', '23KP1A44E2', 'Rayapati', 'Sruthi', 'CSE-DS', bid, 4, 'C', '23kp1a44e2@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44e3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44E3', '23KP1A44E3', 'Sanikommu', 'Chandrakala', 'CSE-DS', bid, 4, 'C', '23kp1a44e3@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44e4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44E4', '23KP1A44E4', 'Sattenapalli', 'Sai Sree', 'CSE-DS', bid, 4, 'C', '23kp1a44e4@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44e5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44E5', '23KP1A44E5', 'Sattenapalli', 'Venubabu', 'CSE-DS', bid, 4, 'C', '23kp1a44e5@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44e6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44E6', '23KP1A44E6', 'Shaik', 'Farzana', 'CSE-DS', bid, 4, 'C', '23kp1a44e6@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44e7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44E7', '23KP1A44E7', 'Shaik', 'Fayaz', 'CSE-DS', bid, 4, 'C', '23kp1a44e7@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44e9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44E9', '23KP1A44E9', 'Shaik', 'Juveria Zainab', 'CSE-DS', bid, 4, 'C', '23kp1a44e9@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44f0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44F0', '23KP1A44F0', 'Shaik', 'Khaja Rahamtulla', 'CSE-DS', bid, 4, 'C', '23kp1a44f0@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44f1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44F1', '23KP1A44F1', 'Shaik', 'Khasim Peera', 'CSE-DS', bid, 4, 'C', '23kp1a44f1@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44f2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44F2', '23KP1A44F2', 'Shaik', 'Nagul Meera', 'CSE-DS', bid, 4, 'C', '23kp1a44f2@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44f3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44F3', '23KP1A44F3', 'Shaik', 'Neelofar', 'CSE-DS', bid, 4, 'C', '23kp1a44f3@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44f4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44F4', '23KP1A44F4', 'Shaik', 'Rajula Ismail', 'CSE-DS', bid, 4, 'C', '23kp1a44f4@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44f5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44F5', '23KP1A44F5', 'Shaik', 'Rizwana', 'CSE-DS', bid, 4, 'C', '23kp1a44f5@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44f6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44F6', '23KP1A44F6', 'Shaik', 'Sahul Ameen', 'CSE-DS', bid, 4, 'C', '23kp1a44f6@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44f7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44F7', '23KP1A44F7', 'Shaik', 'Sai Baba', 'CSE-DS', bid, 4, 'C', '23kp1a44f7@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44g1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44G1', '23KP1A44G1', 'Shaik', 'Thouhid', 'CSE-DS', bid, 4, 'C', '23kp1a44g1@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44g2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44G2', '23KP1A44G2', 'Somula', 'Venkateswarlu', 'CSE-DS', bid, 4, 'C', '23kp1a44g2@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44g3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44G3', '23KP1A44G3', 'Sriramsetti', 'Prudhvinadh', 'CSE-DS', bid, 4, 'C', '23kp1a44g3@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44g4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44G4', '23KP1A44G4', 'Sunke', 'Divya Teja', 'CSE-DS', bid, 4, 'C', '23kp1a44g4@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44g6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44G6', '23KP1A44G6', 'Swarna', 'Raghu Prem Sai', 'CSE-DS', bid, 4, 'C', '23kp1a44g6@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44g7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44G7', '23KP1A44G7', 'Tabassum', 'Fathima', 'CSE-DS', bid, 4, 'C', '23kp1a44g7@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44g9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44G9', '23KP1A44G9', 'Tella', 'Eswar Chandra Prasad', 'CSE-DS', bid, 4, 'C', '23kp1a44g9@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44h0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44H0', '23KP1A44H0', 'Terapati', 'Supriya', 'CSE-DS', bid, 4, 'C', '23kp1a44h0@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44h1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44H1', '23KP1A44H1', 'Thoka', 'Murali', 'CSE-DS', bid, 4, 'C', '23kp1a44h1@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44h2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44H2', '23KP1A44H2', 'Thoka', 'Veera Manikanta', 'CSE-DS', bid, 4, 'C', '23kp1a44h2@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44h3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44H3', '23KP1A44H3', 'Thokala', 'Thirumala Pavan', 'CSE-DS', bid, 4, 'C', '23kp1a44h3@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44h4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44H4', '23KP1A44H4', 'Thota', 'Dharani', 'CSE-DS', bid, 4, 'C', '23kp1a44h4@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44h5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44H5', '23KP1A44H5', 'Thummapudi', 'Nagendra Babu', 'CSE-DS', bid, 4, 'C', '23kp1a44h5@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44h6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44H6', '23KP1A44H6', 'Tirri', 'Venkata Balaji', 'CSE-DS', bid, 4, 'C', '23kp1a44h6@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44h7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44H7', '23KP1A44H7', 'Trisha', 'Narnepati', 'CSE-DS', bid, 4, 'C', '23kp1a44h7@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44h8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44H8', '23KP1A44H8', 'Usthela', 'Ravi Kumar', 'CSE-DS', bid, 4, 'C', '23kp1a44h8@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44h9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44H9', '23KP1A44H9', 'Valaparla', 'Jashwa Daniel', 'CSE-DS', bid, 4, 'C', '23kp1a44h9@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44i0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44I0', '23KP1A44I0', 'Vallepu', 'Naveen Kumar', 'CSE-DS', bid, 4, 'C', '23kp1a44i0@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44i1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44I1', '23KP1A44I1', 'Vallepu', 'Renukaiah', 'CSE-DS', bid, 4, 'C', '23kp1a44i1@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44i2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44I2', '23KP1A44I2', 'Vanama', 'Greeshma Phani Bhavya Sri', 'CSE-DS', bid, 4, 'C', '23kp1a44i2@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44i3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44I3', '23KP1A44I3', 'Vanga', 'Geethika', 'CSE-DS', bid, 4, 'C', '23kp1a44i3@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44i4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44I4', '23KP1A44I4', 'Veeragandham', 'Purna Prakash', 'CSE-DS', bid, 4, 'C', '23kp1a44i4@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44i5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44I5', '23KP1A44I5', 'Velisala', 'Seetharama Raju', 'CSE-DS', bid, 4, 'C', '23kp1a44i5@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44i6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44I6', '23KP1A44I6', 'Velpula', 'Venkata Ganesh', 'CSE-DS', bid, 4, 'C', '23kp1a44i6@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44i7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44I7', '23KP1A44I7', 'Vempati', 'Sharmila Shalini', 'CSE-DS', bid, 4, 'C', '23kp1a44i7@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44i9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44I9', '23KP1A44I9', 'Vemula', 'Renuka Bhavani', 'CSE-DS', bid, 4, 'C', '23kp1a44i9@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44j0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44J0', '23KP1A44J0', 'Venna', 'Venkata Nagireddy', 'CSE-DS', bid, 4, 'C', '23kp1a44j0@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44j1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44J1', '23KP1A44J1', 'Viswanadhuni', 'Venkata Nagalakshmi Sravanthi', 'CSE-DS', bid, 4, 'C', '23kp1a44j1@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44j2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44J2', '23KP1A44J2', 'Yadla', 'Kalpana', 'CSE-DS', bid, 4, 'C', '23kp1a44j2@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44j3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44J3', '23KP1A44J3', 'Yakkala', 'Navya Deepthi', 'CSE-DS', bid, 4, 'C', '23kp1a44j3@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44j4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44J4', '23KP1A44J4', 'Yalagala', 'Seshadri', 'CSE-DS', bid, 4, 'C', '23kp1a44j4@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44j5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44J5', '23KP1A44J5', 'Yalla', 'Surekha', 'CSE-DS', bid, 4, 'C', '23kp1a44j5@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44j6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44J6', '23KP1A44J6', 'Yamani', 'Triveni', 'CSE-DS', bid, 4, 'C', '23kp1a44j6@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44j7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44J7', '23KP1A44J7', 'Yerriboina', 'Bala Krishna', 'CSE-DS', bid, 4, 'C', '23kp1a44j7@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp5a4401@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP5A4401', '24KP5A4401', 'Pokuri', 'Harsvanth', 'CSE-DS', bid, 4, 'C', '24kp5a4401@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4416@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4416', '22KP1A4416', 'Budagala', 'Karthik', 'CSE-DS', bid, 8, 'A', '22kp1a4416@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4418@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4418', '22KP1A4418', 'Chamarthi', 'Sudheer', 'CSE-DS', bid, 8, 'A', '22kp1a4418@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2021 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('21kp1a4486@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '21KP1A4486', '21KP1A4486', 'Ravulapalli', 'Sireesha', 'CSE-DS', bid, 8, 'C', '21kp1a4486@nriit.ac.in', '9999999999', '2021-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44g0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44G0', '23KP1A44G0', 'Shaik', 'Sirajun', 'CSE-DS', bid, 4, 'C', '23kp1a44g0@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44g8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44G8', '23KP1A44G8', 'Tanniru', 'Avinash', 'CSE-DS', bid, 4, 'C', '23kp1a44g8@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44i8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44I8', '23KP1A44I8', 'Vemu', 'Sudheer', 'CSE-DS', bid, 4, 'C', '23kp1a44i8@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44e8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44E8', '23KP1A44E8', 'Shaik', 'Faziya Tasneem', 'CSE-DS', bid, 4, 'C', '23kp1a44e8@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44f9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44F9', '23KP1A44F9', 'Shaik', 'Saidu Babu', 'CSE-DS', bid, 4, 'C', '23kp1a44f9@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a44g5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A44G5', '23KP1A44G5', 'Surabathini', 'Prakash', 'CSE-DS', bid, 4, 'C', '23kp1a44g5@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4401@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4401', '22KP1A4401', 'Akurathi', 'Udaya Tara', 'CSE-DS', bid, 8, 'A', '22kp1a4401@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4402@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4402', '22KP1A4402', 'Allada', 'Kalyani', 'CSE-DS', bid, 8, 'A', '22kp1a4402@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4403@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4403', '22KP1A4403', 'Ambati', 'Nandini', 'CSE-DS', bid, 8, 'A', '22kp1a4403@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4404@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4404', '22KP1A4404', 'Ande', 'Sai Kumar', 'CSE-DS', bid, 8, 'A', '22kp1a4404@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4405@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4405', '22KP1A4405', 'Ardhala', 'Venkata Karthik', 'CSE-DS', bid, 8, 'A', '22kp1a4405@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4406@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4406', '22KP1A4406', 'Badu', 'Siva Kumar Reddy', 'CSE-DS', bid, 8, 'A', '22kp1a4406@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4407@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4407', '22KP1A4407', 'Bairapuneni', 'Hema Latha', 'CSE-DS', bid, 8, 'A', '22kp1a4407@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4408@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4408', '22KP1A4408', 'Balagani', 'Naveena', 'CSE-DS', bid, 8, 'A', '22kp1a4408@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4409@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4409', '22KP1A4409', 'Bandaru', 'Tejaswini', 'CSE-DS', bid, 8, 'A', '22kp1a4409@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4410@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4410', '22KP1A4410', 'Bellamkonda', 'Ravi', 'CSE-DS', bid, 8, 'A', '22kp1a4410@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4412@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4412', '22KP1A4412', 'Boddu', 'Durga Manoj', 'CSE-DS', bid, 8, 'A', '22kp1a4412@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4413@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4413', '22KP1A4413', 'Boinaboina', 'Venkata Ajay', 'CSE-DS', bid, 8, 'A', '22kp1a4413@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4414@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4414', '22KP1A4414', 'Boppudi', 'Mani Gopal', 'CSE-DS', bid, 8, 'A', '22kp1a4414@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4415@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4415', '22KP1A4415', 'Boyapati', 'Deepthi', 'CSE-DS', bid, 8, 'A', '22kp1a4415@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4417@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4417', '22KP1A4417', 'Bynaboina', 'Jagadish', 'CSE-DS', bid, 8, 'A', '22kp1a4417@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4419@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4419', '22KP1A4419', 'Chapa', 'Ashok Kumar', 'CSE-DS', bid, 8, 'A', '22kp1a4419@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4420@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4420', '22KP1A4420', 'Chapa', 'Mani Kumar', 'CSE-DS', bid, 8, 'A', '22kp1a4420@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4422@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4422', '22KP1A4422', 'Chappidi', 'Raviteja', 'CSE-DS', bid, 8, 'A', '22kp1a4422@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4423@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4423', '22KP1A4423', 'Chikkam', 'Venkata Siva Naga Kowsalya', 'CSE-DS', bid, 8, 'A', '22kp1a4423@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4424@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4424', '22KP1A4424', 'Chinka', 'Srilatha', 'CSE-DS', bid, 8, 'A', '22kp1a4424@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4425@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4425', '22KP1A4425', 'Chintala', 'Naga Vishnu Vardhan', 'CSE-DS', bid, 8, 'A', '22kp1a4425@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4426@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4426', '22KP1A4426', 'Chinthapatla', 'Vijay Kumar', 'CSE-DS', bid, 8, 'A', '22kp1a4426@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4427@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4427', '22KP1A4427', 'Danda', 'Manasa', 'CSE-DS', bid, 8, 'A', '22kp1a4427@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4428@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4428', '22KP1A4428', 'Davuluri', 'Priyanka', 'CSE-DS', bid, 8, 'A', '22kp1a4428@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4429@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4429', '22KP1A4429', 'Devanaboina', 'Gopichand', 'CSE-DS', bid, 8, 'A', '22kp1a4429@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4430@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4430', '22KP1A4430', 'Devarampati', 'Abhilash', 'CSE-DS', bid, 8, 'A', '22kp1a4430@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4431@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4431', '22KP1A4431', 'Dodda', 'Raghavi', 'CSE-DS', bid, 8, 'A', '22kp1a4431@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4432@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4432', '22KP1A4432', 'Edara', 'Bala Naga Venkata Siva Manikanta', 'CSE-DS', bid, 8, 'A', '22kp1a4432@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4433@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4433', '22KP1A4433', 'Gadde', 'Lasya Priya', 'CSE-DS', bid, 8, 'A', '22kp1a4433@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4434@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4434', '22KP1A4434', 'Gajula', 'Harini', 'CSE-DS', bid, 8, 'A', '22kp1a4434@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4435@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4435', '22KP1A4435', 'Galam', 'Mahesh', 'CSE-DS', bid, 8, 'A', '22kp1a4435@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4436@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4436', '22KP1A4436', 'Garikapati', 'Tarun', 'CSE-DS', bid, 8, 'A', '22kp1a4436@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4437@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4437', '22KP1A4437', 'Garneni', 'Lakshmi Sai', 'CSE-DS', bid, 8, 'A', '22kp1a4437@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4438@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4438', '22KP1A4438', 'Gonugunta', 'Balaji', 'CSE-DS', bid, 8, 'A', '22kp1a4438@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4439@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4439', '22KP1A4439', 'Gosu', 'Koteswararao', 'CSE-DS', bid, 8, 'A', '22kp1a4439@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4440@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4440', '22KP1A4440', 'Gudibandi', 'Prathibha', 'CSE-DS', bid, 8, 'A', '22kp1a4440@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4441@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4441', '22KP1A4441', 'Gutta', 'Sri Ramanuja', 'CSE-DS', bid, 8, 'A', '22kp1a4441@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4442@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4442', '22KP1A4442', 'Guttimulla', 'Venkata Sai Durga', 'CSE-DS', bid, 8, 'A', '22kp1a4442@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4443@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4443', '22KP1A4443', 'Jammula', 'Kavitha', 'CSE-DS', bid, 8, 'A', '22kp1a4443@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4444@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4444', '22KP1A4444', 'Kagga', 'Shiva Krishna', 'CSE-DS', bid, 8, 'A', '22kp1a4444@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4445@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4445', '22KP1A4445', 'Kakarla', 'Devika Ramya Sri', 'CSE-DS', bid, 8, 'A', '22kp1a4445@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4446@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4446', '22KP1A4446', 'Kalagotla', 'Pallavi', 'CSE-DS', bid, 8, 'A', '22kp1a4446@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4447@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4447', '22KP1A4447', 'Kamepalli', 'Navya', 'CSE-DS', bid, 8, 'A', '22kp1a4447@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4448@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4448', '22KP1A4448', 'Kancheti', 'Lahari', 'CSE-DS', bid, 8, 'A', '22kp1a4448@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4449@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4449', '22KP1A4449', 'Kanneganti', 'Veera Venkata Sai', 'CSE-DS', bid, 8, 'A', '22kp1a4449@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4450@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4450', '22KP1A4450', 'Karravula', 'Anitha', 'CSE-DS', bid, 8, 'A', '22kp1a4450@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4451@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4451', '22KP1A4451', 'Karuvadi', 'M Venkata Sambasiva Anjaneyulu', 'CSE-DS', bid, 8, 'A', '22kp1a4451@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4452@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4452', '22KP1A4452', 'Kasireddy', 'Siva Reddy', 'CSE-DS', bid, 8, 'A', '22kp1a4452@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4453@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4453', '22KP1A4453', 'Katta', 'Mani Prasanna', 'CSE-DS', bid, 8, 'A', '22kp1a4453@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4454@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4454', '22KP1A4454', 'Keerthi', 'Sai Sri Marri', 'CSE-DS', bid, 8, 'A', '22kp1a4454@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4411@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4411', '22KP1A4411', 'Bobbala', 'Ashok', 'CSE-DS', bid, 8, 'A', '22kp1a4411@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4421@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4421', '22KP1A4421', 'Chappidi', 'Ramesh', 'CSE-DS', bid, 8, 'A', '22kp1a4421@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4455@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4455', '22KP1A4455', 'Kichamsetty', 'Naga Sai Teja', 'CSE-DS', bid, 8, 'B', '22kp1a4455@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4456@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4456', '22KP1A4456', 'Kocharla', 'Gowtham', 'CSE-DS', bid, 8, 'B', '22kp1a4456@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4458@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4458', '22KP1A4458', 'Kolikineni', 'Sai Brahmam', 'CSE-DS', bid, 8, 'B', '22kp1a4458@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4459@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4459', '22KP1A4459', 'Korukonda', 'Hema Ramya', 'CSE-DS', bid, 8, 'B', '22kp1a4459@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4460@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4460', '22KP1A4460', 'Kothamasu', 'V N Prasanna Bhagyasri', 'CSE-DS', bid, 8, 'B', '22kp1a4460@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4461@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4461', '22KP1A4461', 'M', 'Monisha Chowdhary', 'CSE-DS', bid, 8, 'B', '22kp1a4461@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4462@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4462', '22KP1A4462', 'Madala', 'Samarendra Nayudu', 'CSE-DS', bid, 8, 'B', '22kp1a4462@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4463@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4463', '22KP1A4463', 'Madhagoni', 'Kalyan', 'CSE-DS', bid, 8, 'B', '22kp1a4463@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4464@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4464', '22KP1A4464', 'Malempati', 'Teja', 'CSE-DS', bid, 8, 'B', '22kp1a4464@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4465@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4465', '22KP1A4465', 'Mandadapu', 'Ravi Teja', 'CSE-DS', bid, 8, 'B', '22kp1a4465@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4466@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4466', '22KP1A4466', 'Mandadi', 'Naga Pavani', 'CSE-DS', bid, 8, 'B', '22kp1a4466@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4467@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4467', '22KP1A4467', 'Mandala', 'Sandeep Reddy', 'CSE-DS', bid, 8, 'B', '22kp1a4467@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4468@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4468', '22KP1A4468', 'Mandalapu', 'Naga Sivamani Karthikeya', 'CSE-DS', bid, 8, 'B', '22kp1a4468@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4469@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4469', '22KP1A4469', 'Mannem', 'Madhu Kumar', 'CSE-DS', bid, 8, 'B', '22kp1a4469@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4470@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4470', '22KP1A4470', 'Marri', 'Durgaprasad', 'CSE-DS', bid, 8, 'B', '22kp1a4470@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4471@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4471', '22KP1A4471', 'Mohammad', 'Shabana', 'CSE-DS', bid, 8, 'B', '22kp1a4471@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4472@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4472', '22KP1A4472', 'Mudragada', 'Revathi', 'CSE-DS', bid, 8, 'B', '22kp1a4472@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4473@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4473', '22KP1A4473', 'Mullamuri', 'Hemalatha', 'CSE-DS', bid, 8, 'B', '22kp1a4473@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4474@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4474', '22KP1A4474', 'Mutakani', 'Triveni', 'CSE-DS', bid, 8, 'B', '22kp1a4474@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4475@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4475', '22KP1A4475', 'Myla', 'Gopi Krishna', 'CSE-DS', bid, 8, 'B', '22kp1a4475@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4476@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4476', '22KP1A4476', 'Nadendla', 'Gayathri', 'CSE-DS', bid, 8, 'B', '22kp1a4476@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4477@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4477', '22KP1A4477', 'Nagisetty', 'Srilakshmi', 'CSE-DS', bid, 8, 'B', '22kp1a4477@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4478@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4478', '22KP1A4478', 'Nalabothu', 'Pavan Kumar', 'CSE-DS', bid, 8, 'B', '22kp1a4478@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4479@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4479', '22KP1A4479', 'Nallamuthu', 'Komali', 'CSE-DS', bid, 8, 'B', '22kp1a4479@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4480@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4480', '22KP1A4480', 'Nelavalli', 'Rajasri', 'CSE-DS', bid, 8, 'B', '22kp1a4480@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4481@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4481', '22KP1A4481', 'Nimmala', 'Anuradha', 'CSE-DS', bid, 8, 'B', '22kp1a4481@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4482@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4482', '22KP1A4482', 'Pagadala', 'Manikanta', 'CSE-DS', bid, 8, 'B', '22kp1a4482@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4483@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4483', '22KP1A4483', 'Palem', 'Ojaswini', 'CSE-DS', bid, 8, 'B', '22kp1a4483@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4484@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4484', '22KP1A4484', 'Pamarthi', 'Pavani', 'CSE-DS', bid, 8, 'B', '22kp1a4484@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4485@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4485', '22KP1A4485', 'Pamudurthi', 'Arjun', 'CSE-DS', bid, 8, 'B', '22kp1a4485@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4486@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4486', '22KP1A4486', 'Panyam', 'Devi Vara Prasad', 'CSE-DS', bid, 8, 'B', '22kp1a4486@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4487@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4487', '22KP1A4487', 'Pasam', 'Syam Sundar Reddy', 'CSE-DS', bid, 8, 'B', '22kp1a4487@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4488@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4488', '22KP1A4488', 'Pedala', 'Manideep', 'CSE-DS', bid, 8, 'B', '22kp1a4488@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4489@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4489', '22KP1A4489', 'Penke', 'Sai Venkata Satyanarayana', 'CSE-DS', bid, 8, 'B', '22kp1a4489@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4490@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4490', '22KP1A4490', 'Podili', 'Manoj Kumar', 'CSE-DS', bid, 8, 'B', '22kp1a4490@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4491@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4491', '22KP1A4491', 'Polu', 'Ram Charan', 'CSE-DS', bid, 8, 'B', '22kp1a4491@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4492@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4492', '22KP1A4492', 'Pothupalepu', 'Sambasiva Rao', 'CSE-DS', bid, 8, 'B', '22kp1a4492@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4493@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4493', '22KP1A4493', 'Potla', 'Naveen', 'CSE-DS', bid, 8, 'B', '22kp1a4493@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4494@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4494', '22KP1A4494', 'Potturi', 'Venkata Lakshmi Tejaswi', 'CSE-DS', bid, 8, 'B', '22kp1a4494@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4495@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4495', '22KP1A4495', 'Prasanna', 'Veralla', 'CSE-DS', bid, 8, 'B', '22kp1a4495@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4496@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4496', '22KP1A4496', 'Puli', 'Venkata Praveen Kumar', 'CSE-DS', bid, 8, 'B', '22kp1a4496@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4497@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4497', '22KP1A4497', 'Pusuluri', 'Raja Rajeswari', 'CSE-DS', bid, 8, 'B', '22kp1a4497@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4498@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4498', '22KP1A4498', 'Ramavath', 'Dattu Naik', 'CSE-DS', bid, 8, 'B', '22kp1a4498@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4499@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4499', '22KP1A4499', 'Ravikrinda', 'Sai Arun Ganesh', 'CSE-DS', bid, 8, 'B', '22kp1a4499@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44a0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44A0', '22KP1A44A0', 'Ravuri', 'Ravi Teja', 'CSE-DS', bid, 8, 'B', '22kp1a44a0@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44a1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44A1', '22KP1A44A1', 'Sagi', 'Swapna', 'CSE-DS', bid, 8, 'B', '22kp1a44a1@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44a2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44A2', '22KP1A44A2', 'Satharajupalli', 'Rudranadh', 'CSE-DS', bid, 8, 'B', '22kp1a44a2@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44a3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44A3', '22KP1A44A3', 'Satharajupalli', 'Sunil', 'CSE-DS', bid, 8, 'B', '22kp1a44a3@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44a4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44A4', '22KP1A44A4', 'Savani', 'Bharath Satya', 'CSE-DS', bid, 8, 'B', '22kp1a44a4@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44a5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44A5', '22KP1A44A5', 'Shaik', 'Abdul Karimulla', 'CSE-DS', bid, 8, 'B', '22kp1a44a5@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44a6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44A6', '22KP1A44A6', 'Shaik', 'Afreen Firdose', 'CSE-DS', bid, 8, 'B', '22kp1a44a6@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44a7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44A7', '22KP1A44A7', 'Shaik', 'Aman', 'CSE-DS', bid, 8, 'B', '22kp1a44a7@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a4457@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A4457', '22KP1A4457', 'Kola', 'Pavan Kalyan', 'CSE-DS', bid, 8, 'B', '22kp1a4457@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44a9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44A9', '22KP1A44A9', 'Shaik', 'Asif', 'CSE-DS', bid, 8, 'C', '22kp1a44a9@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44b0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44B0', '22KP1A44B0', 'Sanka', 'Likhitha Naga Sai Lakshmi Gayathri', 'CSE-DS', bid, 8, 'C', '22kp1a44b0@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44b1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44B1', '22KP1A44B1', 'Shaik', 'Baji', 'CSE-DS', bid, 8, 'C', '22kp1a44b1@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44b2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44B2', '22KP1A44B2', 'Shaik', 'Bibi Ayesha', 'CSE-DS', bid, 8, 'C', '22kp1a44b2@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44b3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44B3', '22KP1A44B3', 'Shaik', 'Dildar', 'CSE-DS', bid, 8, 'C', '22kp1a44b3@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44b4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44B4', '22KP1A44B4', 'Shaik', 'Farhana', 'CSE-DS', bid, 8, 'C', '22kp1a44b4@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44b5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44B5', '22KP1A44B5', 'Shaik', 'Firoz', 'CSE-DS', bid, 8, 'C', '22kp1a44b5@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44b7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44B7', '22KP1A44B7', 'Shaik', 'Khayyum', 'CSE-DS', bid, 8, 'C', '22kp1a44b7@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44b8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44B8', '22KP1A44B8', 'Shaik', 'Maheb Rahila', 'CSE-DS', bid, 8, 'C', '22kp1a44b8@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44b9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44B9', '22KP1A44B9', 'Shaik', 'Meeravali', 'CSE-DS', bid, 8, 'C', '22kp1a44b9@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44c0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44C0', '22KP1A44C0', 'Shaik', 'Mustak Ahamad', 'CSE-DS', bid, 8, 'C', '22kp1a44c0@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44c1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44C1', '22KP1A44C1', 'Shaik', 'Najiya', 'CSE-DS', bid, 8, 'C', '22kp1a44c1@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44c2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44C2', '22KP1A44C2', 'Shaik', 'Nasreen', 'CSE-DS', bid, 8, 'C', '22kp1a44c2@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44c3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44C3', '22KP1A44C3', 'Shaik', 'Rahamthulla', 'CSE-DS', bid, 8, 'C', '22kp1a44c3@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44c4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44C4', '22KP1A44C4', 'Shaik', 'Sadiya Sabahad', 'CSE-DS', bid, 8, 'C', '22kp1a44c4@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44c5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44C5', '22KP1A44C5', 'Shaik', 'Tasneem Firdose', 'CSE-DS', bid, 8, 'C', '22kp1a44c5@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44c6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44C6', '22KP1A44C6', 'Somula', 'Nandini', 'CSE-DS', bid, 8, 'C', '22kp1a44c6@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44c7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44C7', '22KP1A44C7', 'Syed', 'Abid', 'CSE-DS', bid, 8, 'C', '22kp1a44c7@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44c8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44C8', '22KP1A44C8', 'T', 'Nirmala Jyothi', 'CSE-DS', bid, 8, 'C', '22kp1a44c8@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44c9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44C9', '22KP1A44C9', 'Tallapareddy', 'Anil Babu', 'CSE-DS', bid, 8, 'C', '22kp1a44c9@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44d0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44D0', '22KP1A44D0', 'Talluri', 'Ramya', 'CSE-DS', bid, 8, 'C', '22kp1a44d0@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44d2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44D2', '22KP1A44D2', 'Tedlapu', 'Srikanth', 'CSE-DS', bid, 8, 'C', '22kp1a44d2@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44d3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44D3', '22KP1A44D3', 'Tellamekala', 'Surya Prakash', 'CSE-DS', bid, 8, 'C', '22kp1a44d3@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44d4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44D4', '22KP1A44D4', 'Thanneru', 'Vani Aruna', 'CSE-DS', bid, 8, 'C', '22kp1a44d4@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44d6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44D6', '22KP1A44D6', 'Tippanaboina', 'Rajya Lakshmi', 'CSE-DS', bid, 8, 'C', '22kp1a44d6@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44d7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44D7', '22KP1A44D7', 'Tulluru', 'Venkata Gopi Naveen', 'CSE-DS', bid, 8, 'C', '22kp1a44d7@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44d8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44D8', '22KP1A44D8', 'Udarapu', 'Anusha', 'CSE-DS', bid, 8, 'C', '22kp1a44d8@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44d9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44D9', '22KP1A44D9', 'Uppalapati', 'Sai Vandani', 'CSE-DS', bid, 8, 'C', '22kp1a44d9@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44e0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44E0', '22KP1A44E0', 'Uyyuru', 'Archana', 'CSE-DS', bid, 8, 'C', '22kp1a44e0@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44e1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44E1', '22KP1A44E1', 'Vadde', 'Spoorthy Sri', 'CSE-DS', bid, 8, 'C', '22kp1a44e1@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44e4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44E4', '22KP1A44E4', 'Vallepu', 'Siva Manikanta', 'CSE-DS', bid, 8, 'C', '22kp1a44e4@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44e5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44E5', '22KP1A44E5', 'Veeravalli', 'Vasavi Gayathri', 'CSE-DS', bid, 8, 'C', '22kp1a44e5@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44e6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44E6', '22KP1A44E6', 'Veerla', 'Naveen', 'CSE-DS', bid, 8, 'C', '22kp1a44e6@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44e7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44E7', '22KP1A44E7', 'Velivela', 'Mounika', 'CSE-DS', bid, 8, 'C', '22kp1a44e7@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44e9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44E9', '22KP1A44E9', 'Venkamsetti', 'Akhil Kumar', 'CSE-DS', bid, 8, 'C', '22kp1a44e9@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44f0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44F0', '22KP1A44F0', 'Vullam', 'Aparna', 'CSE-DS', bid, 8, 'C', '22kp1a44f0@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44f1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44F1', '22KP1A44F1', 'Yaganti', 'Karthik', 'CSE-DS', bid, 8, 'C', '22kp1a44f1@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44f2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44F2', '22KP1A44F2', 'Yalamanchili', 'Sri Lakshmi', 'CSE-DS', bid, 8, 'C', '22kp1a44f2@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44f3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44F3', '22KP1A44F3', 'Yanamala', 'Chinna Pullareddy', 'CSE-DS', bid, 8, 'C', '22kp1a44f3@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44f4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44F4', '22KP1A44F4', 'Yaragarla', 'Naveen', 'CSE-DS', bid, 8, 'C', '22kp1a44f4@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44f5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44F5', '22KP1A44F5', 'Yarasani', 'Gopi Reddy', 'CSE-DS', bid, 8, 'C', '22kp1a44f5@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44f6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44F6', '22KP1A44F6', 'Panga', 'Anil Kumar Reddy', 'CSE-DS', bid, 8, 'C', '22kp1a44f6@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp5a4402@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP5A4402', '23KP5A4402', 'Siripireddy', 'Haritha', 'CSE-DS', bid, 8, 'C', '23kp5a4402@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp5a4403@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP5A4403', '23KP5A4403', 'Sugguna', 'Pavani Ananya', 'CSE-DS', bid, 8, 'C', '23kp5a4403@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2021 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('21kp1a44a5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '21KP1A44A5', '21KP1A44A5', 'Sure', 'Sivanarayana', 'CSE-DS', bid, 8, 'C', '21kp1a44a5@nriit.ac.in', '9999999999', '2021-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2021 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('21kp1a44b8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '21KP1A44B8', '21KP1A44B8', 'Tiruvengala', 'Raja', 'CSE-DS', bid, 8, 'C', '21kp1a44b8@nriit.ac.in', '9999999999', '2021-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44a8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44A8', '22KP1A44A8', 'Yarra', 'Siva Shankar Rao', 'CSE-DS', bid, 8, 'C', '22kp1a44a8@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44b6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44B6', '22KP1A44B6', 'Shaik', 'Javeed Aftar', 'CSE-DS', bid, 8, 'C', '22kp1a44b6@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2021 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('21kp1a4494@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '21KP1A4494', '21KP1A4494', 'Shaik', 'Akif Ali', 'CSE-DS', bid, 8, 'C', '21kp1a4494@nriit.ac.in', '9999999999', '2021-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44e2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44E2', '22KP1A44E2', 'Vadduri', 'Harsha Vardhan', 'CSE-DS', bid, 8, 'C', '22kp1a44e2@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44e3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44E3', '22KP1A44E3', 'Vallela', 'Govardhan Rao', 'CSE-DS', bid, 8, 'C', '22kp1a44e3@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2021 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('21kp1a4454@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '21KP1A4454', '21KP1A4454', 'Konda', 'Guru Prasad', 'CSE-DS', bid, 8, 'C', '21kp1a4454@nriit.ac.in', '9999999999', '2021-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44d1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44D1', '22KP1A44D1', 'Tanniru', 'Pavan Kumar', 'CSE-DS', bid, 8, 'C', '22kp1a44d1@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44e8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44E8', '22KP1A44E8', 'Vema', 'Satyanarayana', 'CSE-DS', bid, 8, 'C', '22kp1a44e8@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp5a4401@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP5A4401', '23KP5A4401', 'Mandla', 'Mallikharjuna', 'CSE-DS', bid, 8, 'C', '23kp5a4401@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a44d5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A44D5', '22KP1A44D5', 'Thokachichu', 'Vishnu Vardhan Raju', 'CSE-DS', bid, 8, 'C', '22kp1a44d5@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

END $$;
