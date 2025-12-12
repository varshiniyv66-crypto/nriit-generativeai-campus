-- PART 3C: Remaining Students

-- ===== ECE: 563 students =====
DO $$
DECLARE
    uid UUID;
    bid UUID;
BEGIN

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0401@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0401', '25KP1A0401', 'Ajmeera', 'Akhil Naik', 'ECE', bid, 1, 'A', '25kp1a0401@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0402@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0402', '25KP1A0402', 'Arumalla', 'Ram Lakshman Reddy', 'ECE', bid, 1, 'A', '25kp1a0402@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0403@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0403', '25KP1A0403', 'Baina', 'Sudhakar', 'ECE', bid, 1, 'A', '25kp1a0403@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0404@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0404', '25KP1A0404', 'Balijepalli', 'Manikantha', 'ECE', bid, 1, 'A', '25kp1a0404@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0405@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0405', '25KP1A0405', 'Bandi', 'Venkata Sameera Reddy', 'ECE', bid, 1, 'A', '25kp1a0405@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0406@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0406', '25KP1A0406', 'Battula', 'Srinu', 'ECE', bid, 1, 'A', '25kp1a0406@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0407@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0407', '25KP1A0407', 'Bhimisetty', 'Venkata Naga Anjaneyulu', 'ECE', bid, 1, 'A', '25kp1a0407@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0408@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0408', '25KP1A0408', 'Bhukya', 'Prasanth Kumar Nayak', 'ECE', bid, 1, 'A', '25kp1a0408@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0409@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0409', '25KP1A0409', 'Bhuvanagiri', 'Bhargavi', 'ECE', bid, 1, 'A', '25kp1a0409@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0410@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0410', '25KP1A0410', 'Busiraju', 'Vinod Kumar', 'ECE', bid, 1, 'A', '25kp1a0410@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0411@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0411', '25KP1A0411', 'Chakkera', 'Renuka', 'ECE', bid, 1, 'A', '25kp1a0411@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0412@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0412', '25KP1A0412', 'Chandarlapati', 'Bhanu Venkatrao', 'ECE', bid, 1, 'A', '25kp1a0412@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0413@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0413', '25KP1A0413', 'Devandla', 'Vega Manikanta', 'ECE', bid, 1, 'A', '25kp1a0413@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0414@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0414', '25KP1A0414', 'Doddi', 'Yaswanth Reddy', 'ECE', bid, 1, 'A', '25kp1a0414@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0415@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0415', '25KP1A0415', 'Dosakayalapati', 'Nageswara Rao', 'ECE', bid, 1, 'A', '25kp1a0415@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0416@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0416', '25KP1A0416', 'Duddugola', 'Tarun Kumar', 'ECE', bid, 1, 'A', '25kp1a0416@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0417@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0417', '25KP1A0417', 'Dudekula', 'Mojesh', 'ECE', bid, 1, 'A', '25kp1a0417@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0418@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0418', '25KP1A0418', 'Dunna', 'Durga Prasad', 'ECE', bid, 1, 'A', '25kp1a0418@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0419@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0419', '25KP1A0419', 'Ediga', 'Harikrishna', 'ECE', bid, 1, 'A', '25kp1a0419@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0420@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0420', '25KP1A0420', 'Enumula', 'Gangadhar', 'ECE', bid, 1, 'A', '25kp1a0420@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0421@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0421', '25KP1A0421', 'Ganapavarapu', 'Sisindri', 'ECE', bid, 1, 'A', '25kp1a0421@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0422@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0422', '25KP1A0422', 'Gannarapu', 'Kasim Vali', 'ECE', bid, 1, 'A', '25kp1a0422@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0423@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0423', '25KP1A0423', 'Gedala', 'Vandana', 'ECE', bid, 1, 'A', '25kp1a0423@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0424@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0424', '25KP1A0424', 'Gogulapati', 'Ananth Vaibhav', 'ECE', bid, 1, 'A', '25kp1a0424@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0425@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0425', '25KP1A0425', 'Gudipalli', 'Bharath', 'ECE', bid, 1, 'A', '25kp1a0425@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0426@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0426', '25KP1A0426', 'Gummadivelli', 'Chandu', 'ECE', bid, 1, 'A', '25kp1a0426@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0427@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0427', '25KP1A0427', 'Gurrala', 'Akhil Babu', 'ECE', bid, 1, 'A', '25kp1a0427@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0428@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0428', '25KP1A0428', 'Gurrala', 'Venkata Sai Kiran', 'ECE', bid, 1, 'A', '25kp1a0428@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0429@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0429', '25KP1A0429', 'Jakka', 'Veerendra Kumar', 'ECE', bid, 1, 'A', '25kp1a0429@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0430@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0430', '25KP1A0430', 'Kalakoti', 'Sagarika', 'ECE', bid, 1, 'A', '25kp1a0430@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0431@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0431', '25KP1A0431', 'Kambhala', 'Venkatesh', 'ECE', bid, 1, 'A', '25kp1a0431@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0432@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0432', '25KP1A0432', 'Karthik', 'Pamulapati', 'ECE', bid, 1, 'A', '25kp1a0432@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0433@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0433', '25KP1A0433', 'Kasa', 'Mani Tejesh', 'ECE', bid, 1, 'A', '25kp1a0433@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0434@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0434', '25KP1A0434', 'Katteboyina', 'Trivikram', 'ECE', bid, 1, 'A', '25kp1a0434@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0435@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0435', '25KP1A0435', 'Komarabattina', 'Divya', 'ECE', bid, 1, 'A', '25kp1a0435@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0436@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0436', '25KP1A0436', 'Kommineni', 'Keerthana', 'ECE', bid, 1, 'A', '25kp1a0436@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0437@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0437', '25KP1A0437', 'Konduri', 'Nishanth', 'ECE', bid, 1, 'A', '25kp1a0437@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0438@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0438', '25KP1A0438', 'Kuppala', 'Avinash', 'ECE', bid, 1, 'A', '25kp1a0438@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0439@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0439', '25KP1A0439', 'Lingaladinne', 'Hemanth', 'ECE', bid, 1, 'A', '25kp1a0439@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0440@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0440', '25KP1A0440', 'Maddikuntla', 'Kasi Venkata Siva', 'ECE', bid, 1, 'A', '25kp1a0440@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0441@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0441', '25KP1A0441', 'Madire', 'Siva Dasaradha Ranga Swamy Reddy', 'ECE', bid, 1, 'A', '25kp1a0441@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0442@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0442', '25KP1A0442', 'Maguluri', 'Koteswara Rao', 'ECE', bid, 1, 'A', '25kp1a0442@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0443@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0443', '25KP1A0443', 'Makkena', 'Balachandra Sekhar', 'ECE', bid, 1, 'A', '25kp1a0443@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0444@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0444', '25KP1A0444', 'Malapati', 'Chandra Shekar', 'ECE', bid, 1, 'A', '25kp1a0444@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0445@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0445', '25KP1A0445', 'Mandla', 'Surendra', 'ECE', bid, 1, 'A', '25kp1a0445@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0446@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0446', '25KP1A0446', 'Marri', 'Nagaraju', 'ECE', bid, 1, 'A', '25kp1a0446@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0447@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0447', '25KP1A0447', 'Marripudi', 'Ajay', 'ECE', bid, 1, 'A', '25kp1a0447@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0448@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0448', '25KP1A0448', 'Medarametla', 'Madhu Sai Ganesh', 'ECE', bid, 1, 'A', '25kp1a0448@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0449@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0449', '25KP1A0449', 'Melam', 'Ramaiah', 'ECE', bid, 1, 'A', '25kp1a0449@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0450@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0450', '25KP1A0450', 'Mudraboina', 'Vasantha Rao', 'ECE', bid, 1, 'A', '25kp1a0450@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0451@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0451', '25KP1A0451', 'Nagothu', 'Tarun', 'ECE', bid, 1, 'A', '25kp1a0451@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0452@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0452', '25KP1A0452', 'Nandhipati', 'Harsha', 'ECE', bid, 1, 'A', '25kp1a0452@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0453@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0453', '25KP1A0453', 'Narayanapuram', 'Manvitha', 'ECE', bid, 1, 'A', '25kp1a0453@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0454@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0454', '25KP1A0454', 'Nelapati', 'Mahendra Babu', 'ECE', bid, 1, 'A', '25kp1a0454@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0455@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0455', '25KP1A0455', 'Pandi', 'Vasavi', 'ECE', bid, 1, 'A', '25kp1a0455@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0456@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0456', '25KP1A0456', 'Parisa', 'Joyce', 'ECE', bid, 1, 'A', '25kp1a0456@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0457@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0457', '25KP1A0457', 'Peer', 'Ahamadgari Jabeer', 'ECE', bid, 1, 'A', '25kp1a0457@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0458@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0458', '25KP1A0458', 'Polisetty', 'Bhargav', 'ECE', bid, 1, 'A', '25kp1a0458@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0459@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0459', '25KP1A0459', 'Puccha', 'Vamsi', 'ECE', bid, 1, 'A', '25kp1a0459@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0460@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0460', '25KP1A0460', 'Puli', 'Chandra Vamsi', 'ECE', bid, 1, 'A', '25kp1a0460@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0461@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0461', '25KP1A0461', 'Pusuluri', 'Bhavani Sankar Prasad', 'ECE', bid, 1, 'A', '25kp1a0461@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0462@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0462', '25KP1A0462', 'Reddy', 'Sampath Kumar', 'ECE', bid, 1, 'A', '25kp1a0462@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0463@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0463', '25KP1A0463', 'Repudi', 'Pavan Kumar', 'ECE', bid, 1, 'A', '25kp1a0463@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0464@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0464', '25KP1A0464', 'Sane', 'Madhu', 'ECE', bid, 1, 'A', '25kp1a0464@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0465@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0465', '25KP1A0465', 'Shaik', 'Ayesha Fathima', 'ECE', bid, 1, 'A', '25kp1a0465@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0466@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0466', '25KP1A0466', 'Shaik', 'Bandi Shahebgari Naveed', 'ECE', bid, 1, 'A', '25kp1a0466@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0467@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0467', '25KP1A0467', 'Shaik', 'Bollaram Mahaboob Subhani', 'ECE', bid, 1, 'B', '25kp1a0467@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0468@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0468', '25KP1A0468', 'Shaik', 'Fathima', 'ECE', bid, 1, 'B', '25kp1a0468@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0469@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0469', '25KP1A0469', 'Shaik', 'Irfan', 'ECE', bid, 1, 'B', '25kp1a0469@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0470@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0470', '25KP1A0470', 'Shaik', 'Jasim', 'ECE', bid, 1, 'B', '25kp1a0470@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0471@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0471', '25KP1A0471', 'Shaik', 'Javeed', 'ECE', bid, 1, 'B', '25kp1a0471@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0472@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0472', '25KP1A0472', 'Shaik', 'Mahabu Subhani', 'ECE', bid, 1, 'B', '25kp1a0472@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0473@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0473', '25KP1A0473', 'Shaik', 'Muneera', 'ECE', bid, 1, 'B', '25kp1a0473@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0474@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0474', '25KP1A0474', 'Shaik', 'Raheem', 'ECE', bid, 1, 'B', '25kp1a0474@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0475@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0475', '25KP1A0475', 'Shaik', 'Rushda Fathima', 'ECE', bid, 1, 'B', '25kp1a0475@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0476@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0476', '25KP1A0476', 'Shaik', 'Tabasum', 'ECE', bid, 1, 'B', '25kp1a0476@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0477@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0477', '25KP1A0477', 'Shaik', 'Zainab', 'ECE', bid, 1, 'B', '25kp1a0477@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0478@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0478', '25KP1A0478', 'Syed', 'Mohsin Abbaad', 'ECE', bid, 1, 'B', '25kp1a0478@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0479@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0479', '25KP1A0479', 'Thalathoti', 'Creestu Achari', 'ECE', bid, 1, 'B', '25kp1a0479@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0480@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0480', '25KP1A0480', 'Thelukutla', 'Venkata Narayana', 'ECE', bid, 1, 'B', '25kp1a0480@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0481@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0481', '25KP1A0481', 'Thupalli', 'Siva Sankar', 'ECE', bid, 1, 'B', '25kp1a0481@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0482@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0482', '25KP1A0482', 'Tirumalasetty', 'Lakshmi Venkata Narasimha', 'ECE', bid, 1, 'B', '25kp1a0482@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0483@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0483', '25KP1A0483', 'Tullimilli', 'Sirisha', 'ECE', bid, 1, 'B', '25kp1a0483@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0484@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0484', '25KP1A0484', 'Uppu', 'Venkata Srikar', 'ECE', bid, 1, 'B', '25kp1a0484@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0485@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0485', '25KP1A0485', 'Uriti', 'Venkata Samba Siva Teja', 'ECE', bid, 1, 'B', '25kp1a0485@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0486@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0486', '25KP1A0486', 'Vatti', 'Venkata Krishna Reddy', 'ECE', bid, 1, 'B', '25kp1a0486@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0487@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0487', '25KP1A0487', 'Vemireddy', 'Soma Sekhara Reddy', 'ECE', bid, 1, 'B', '25kp1a0487@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a0488@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A0488', '25KP1A0488', 'Bandi', 'Ajay', 'ECE', bid, 1, 'B', '25kp1a0488@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0434@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0434', '24KP1A0434', 'Eerla', 'Venkateswarlu', 'ECE', bid, 4, 'A', '24kp1a0434@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0401@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0401', '24KP1A0401', 'Aatla', 'Subhashini', 'ECE', bid, 4, 'A', '24kp1a0401@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0402@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0402', '24KP1A0402', 'Adapala', 'Venkatesh', 'ECE', bid, 4, 'A', '24kp1a0402@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0403@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0403', '24KP1A0403', 'Aitha', 'Venkata Rohith', 'ECE', bid, 4, 'A', '24kp1a0403@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0404@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0404', '24KP1A0404', 'Akki', 'Jaswanth', 'ECE', bid, 4, 'A', '24kp1a0404@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0405@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0405', '24KP1A0405', 'Akula', 'Tejaswini', 'ECE', bid, 4, 'A', '24kp1a0405@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0406@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0406', '24KP1A0406', 'Ala', 'Rajeswari', 'ECE', bid, 4, 'A', '24kp1a0406@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0407@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0407', '24KP1A0407', 'Alapati', 'Sasank Venkata Sai Manikanta', 'ECE', bid, 4, 'A', '24kp1a0407@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0408@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0408', '24KP1A0408', 'Allatipalli', 'Raja Sekhar Reddy', 'ECE', bid, 4, 'A', '24kp1a0408@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0409@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0409', '24KP1A0409', 'Ankam', 'Sambasivarao', 'ECE', bid, 4, 'A', '24kp1a0409@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0411@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0411', '24KP1A0411', 'Anumula', 'Mounika', 'ECE', bid, 4, 'A', '24kp1a0411@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0412@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0412', '24KP1A0412', 'Balusupati', 'Bharath Chandra', 'ECE', bid, 4, 'A', '24kp1a0412@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0413@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0413', '24KP1A0413', 'Bandla', 'Lakshmi Prasanna', 'ECE', bid, 4, 'A', '24kp1a0413@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0414@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0414', '24KP1A0414', 'Battula', 'Hemanth Kumar', 'ECE', bid, 4, 'A', '24kp1a0414@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0415@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0415', '24KP1A0415', 'Bavireddy', 'Neelima', 'ECE', bid, 4, 'A', '24kp1a0415@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0416@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0416', '24KP1A0416', 'Bellagubbala', 'Mahinayani Revanthi', 'ECE', bid, 4, 'A', '24kp1a0416@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0417@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0417', '24KP1A0417', 'Bethala', 'Murali', 'ECE', bid, 4, 'A', '24kp1a0417@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0419@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0419', '24KP1A0419', 'Boddada', 'Akhil', 'ECE', bid, 4, 'A', '24kp1a0419@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0420@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0420', '24KP1A0420', 'Bommireddy', 'Nandini', 'ECE', bid, 4, 'A', '24kp1a0420@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0421@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0421', '24KP1A0421', 'Bulla', 'Esther Rani', 'ECE', bid, 4, 'A', '24kp1a0421@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0422@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0422', '24KP1A0422', 'Chalasani', 'Tejaswini', 'ECE', bid, 4, 'A', '24kp1a0422@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0423@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0423', '24KP1A0423', 'Challa', 'Bhanu Prasad', 'ECE', bid, 4, 'A', '24kp1a0423@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0424@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0424', '24KP1A0424', 'Challagundla', 'Shaik Hanif', 'ECE', bid, 4, 'A', '24kp1a0424@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0425@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0425', '24KP1A0425', 'Chappalli', 'Geetha Venkata Lakshmi', 'ECE', bid, 4, 'A', '24kp1a0425@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0426@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0426', '24KP1A0426', 'Chekurthi', 'Deva Naga Eswara Sumanth', 'ECE', bid, 4, 'A', '24kp1a0426@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0427@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0427', '24KP1A0427', 'Chimata', 'Baji Babu', 'ECE', bid, 4, 'A', '24kp1a0427@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0428@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0428', '24KP1A0428', 'Chimata', 'Srinu', 'ECE', bid, 4, 'A', '24kp1a0428@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0429@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0429', '24KP1A0429', 'Chintalacheruvu', 'Satyanarayana', 'ECE', bid, 4, 'A', '24kp1a0429@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0430@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0430', '24KP1A0430', 'Chittiboina', 'Venkata Sivasai', 'ECE', bid, 4, 'A', '24kp1a0430@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0431@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0431', '24KP1A0431', 'Chukka', 'Anand', 'ECE', bid, 4, 'A', '24kp1a0431@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0432@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0432', '24KP1A0432', 'Devandla', 'Pavan', 'ECE', bid, 4, 'A', '24kp1a0432@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0436@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0436', '24KP1A0436', 'Galam', 'Vasu', 'ECE', bid, 4, 'A', '24kp1a0436@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0437@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0437', '24KP1A0437', 'Gamidi', 'Ramya', 'ECE', bid, 4, 'A', '24kp1a0437@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0439@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0439', '24KP1A0439', 'Goli', 'Venkata Theerdha Sri', 'ECE', bid, 4, 'A', '24kp1a0439@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0441@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0441', '24KP1A0441', 'Gollapudi', 'Vijaya Lakshmi', 'ECE', bid, 4, 'A', '24kp1a0441@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0442@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0442', '24KP1A0442', 'Gopireddy', 'Chakravarthi', 'ECE', bid, 4, 'A', '24kp1a0442@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0443@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0443', '24KP1A0443', 'Gorre', 'Shaleam Raju', 'ECE', bid, 4, 'A', '24kp1a0443@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0444@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0444', '24KP1A0444', 'Gorrepati', 'Methishala', 'ECE', bid, 4, 'A', '24kp1a0444@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0445@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0445', '24KP1A0445', 'Gottipati', 'Hanumantha Rao', 'ECE', bid, 4, 'A', '24kp1a0445@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0446@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0446', '24KP1A0446', 'Gumma', 'Venkataraju', 'ECE', bid, 4, 'A', '24kp1a0446@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0447@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0447', '24KP1A0447', 'Indla', 'Naga Brahmeswara Rao', 'ECE', bid, 4, 'A', '24kp1a0447@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0448@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0448', '24KP1A0448', 'Jonnalagadda', 'Charan Teja', 'ECE', bid, 4, 'A', '24kp1a0448@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0449@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0449', '24KP1A0449', 'K', 'Naveen Reddy', 'ECE', bid, 4, 'A', '24kp1a0449@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0451@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0451', '24KP1A0451', 'Kamarajugadda', 'Hemanth Sai', 'ECE', bid, 4, 'A', '24kp1a0451@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0453@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0453', '24KP1A0453', 'Kanumula', 'Surendra Kumar', 'ECE', bid, 4, 'A', '24kp1a0453@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0454@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0454', '24KP1A0454', 'Karchuri', 'Naga Saidulu', 'ECE', bid, 4, 'A', '24kp1a0454@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0455@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0455', '24KP1A0455', 'Karnam', 'Prasanna', 'ECE', bid, 4, 'A', '24kp1a0455@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0456@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0456', '24KP1A0456', 'Kasani', 'Eswari', 'ECE', bid, 4, 'A', '24kp1a0456@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0458@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0458', '24KP1A0458', 'Katuri', 'Bala Sriram', 'ECE', bid, 4, 'A', '24kp1a0458@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0459@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0459', '24KP1A0459', 'Kommanaboina', 'Akhila', 'ECE', bid, 4, 'A', '24kp1a0459@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0460@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0460', '24KP1A0460', 'Kommu', 'Akash', 'ECE', bid, 4, 'A', '24kp1a0460@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0461@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0461', '24KP1A0461', 'Konda', 'Venkateswara Reddy', 'ECE', bid, 4, 'A', '24kp1a0461@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0462@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0462', '24KP1A0462', 'Kongathi', 'Siva Durga Rao', 'ECE', bid, 4, 'A', '24kp1a0462@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0463@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0463', '24KP1A0463', 'Krishnam', 'Venkata Pavani', 'ECE', bid, 4, 'A', '24kp1a0463@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0465@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0465', '24KP1A0465', 'Kunduru', 'Ganesh Reddy', 'ECE', bid, 4, 'A', '24kp1a0465@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0466@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0466', '24KP1A0466', 'Kunta', 'Vivekananda Reddy', 'ECE', bid, 4, 'A', '24kp1a0466@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0467@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0467', '24KP1A0467', 'Kuppala', 'Geethanjali', 'ECE', bid, 4, 'A', '24kp1a0467@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0468@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0468', '24KP1A0468', 'Kusaalappagari', 'Swetha', 'ECE', bid, 4, 'A', '24kp1a0468@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0469@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0469', '24KP1A0469', 'Lenka', 'Dhedeepya', 'ECE', bid, 4, 'A', '24kp1a0469@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0470@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0470', '24KP1A0470', 'Lingala', 'Charan Teja Reddy', 'ECE', bid, 4, 'A', '24kp1a0470@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0471@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0471', '24KP1A0471', 'Medarametla', 'Deepak Sushmanth', 'ECE', bid, 4, 'A', '24kp1a0471@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0472@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0472', '24KP1A0472', 'Mekala', 'Siva Koteswari', 'ECE', bid, 4, 'A', '24kp1a0472@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0474@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0474', '24KP1A0474', 'Miriyala', 'Srinu', 'ECE', bid, 4, 'A', '24kp1a0474@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0475@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0475', '24KP1A0475', 'Mogadasu', 'Venkata Mahesh Babu', 'ECE', bid, 4, 'A', '24kp1a0475@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0476@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0476', '24KP1A0476', 'Mogal', 'Akhiya', 'ECE', bid, 4, 'A', '24kp1a0476@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0477@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0477', '24KP1A0477', 'Mokharala', 'Bhavana', 'ECE', bid, 4, 'A', '24kp1a0477@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0478@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0478', '24KP1A0478', 'Mokharala', 'Chandra Naga Tilak', 'ECE', bid, 4, 'A', '24kp1a0478@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0479@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0479', '24KP1A0479', 'Mukhamatam', 'Prem Chand', 'ECE', bid, 4, 'A', '24kp1a0479@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0480@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0480', '24KP1A0480', 'Mula', 'Lakshmi', 'ECE', bid, 4, 'A', '24kp1a0480@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0481@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0481', '24KP1A0481', 'Munnangi', 'Naveen', 'ECE', bid, 4, 'A', '24kp1a0481@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0450@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0450', '24KP1A0450', 'Kallagunta', 'Sivaram', 'ECE', bid, 4, 'A', '24kp1a0450@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0452@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0452', '24KP1A0452', 'Kampa', 'Siva Koteswara Rao', 'ECE', bid, 4, 'A', '24kp1a0452@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0410@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0410', '24KP1A0410', 'Annam', 'Lakshmi Lokesh', 'ECE', bid, 4, 'A', '24kp1a0410@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0433@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0433', '24KP1A0433', 'Durga', 'Bhavani Seelam', 'ECE', bid, 4, 'A', '24kp1a0433@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0435@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0435', '24KP1A0435', 'Gade', 'Apparao', 'ECE', bid, 4, 'A', '24kp1a0435@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0418@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0418', '24KP1A0418', 'Bhutharaju', 'Guru Raghava Anjan', 'ECE', bid, 4, 'A', '24kp1a0418@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0438@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0438', '24KP1A0438', 'Gedela', 'Hemalatha', 'ECE', bid, 4, 'A', '24kp1a0438@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0440@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0440', '24KP1A0440', 'Golla', 'Srikanth', 'ECE', bid, 4, 'A', '24kp1a0440@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0473@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0473', '24KP1A0473', 'Melam', 'Sumanth', 'ECE', bid, 4, 'A', '24kp1a0473@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0482@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0482', '24KP1A0482', 'Nagipogu', 'Priyanka', 'ECE', bid, 4, 'B', '24kp1a0482@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0483@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0483', '24KP1A0483', 'Nakkala', 'Vishnu Vardhan', 'ECE', bid, 4, 'B', '24kp1a0483@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0484@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0484', '24KP1A0484', 'Nandipati', 'Govardhan Reddy', 'ECE', bid, 4, 'B', '24kp1a0484@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0485@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0485', '24KP1A0485', 'Narala', 'Venkata Kiran Kumar Reddy', 'ECE', bid, 4, 'B', '24kp1a0485@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0486@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0486', '24KP1A0486', 'Narisetty', 'Sumanth', 'ECE', bid, 4, 'B', '24kp1a0486@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0487@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0487', '24KP1A0487', 'Neelam', 'Siva Sankar', 'ECE', bid, 4, 'B', '24kp1a0487@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0488@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0488', '24KP1A0488', 'Nemalipuri', 'Kousalya', 'ECE', bid, 4, 'B', '24kp1a0488@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0490@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0490', '24KP1A0490', 'Orchu', 'Srinivasa Rao', 'ECE', bid, 4, 'B', '24kp1a0490@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0491@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0491', '24KP1A0491', 'Palavalli', 'Hemanth Reddy', 'ECE', bid, 4, 'B', '24kp1a0491@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0492@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0492', '24KP1A0492', 'Pallepogu', 'Jaya Prakash', 'ECE', bid, 4, 'B', '24kp1a0492@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0493@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0493', '24KP1A0493', 'Pampanaboina', 'Naga Lakshmi', 'ECE', bid, 4, 'B', '24kp1a0493@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0494@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0494', '24KP1A0494', 'Pandirla', 'Naveen', 'ECE', bid, 4, 'B', '24kp1a0494@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0495@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0495', '24KP1A0495', 'Panuganti', 'Venkata Anand', 'ECE', bid, 4, 'B', '24kp1a0495@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0496@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0496', '24KP1A0496', 'Pasam', 'Dileep Kumar', 'ECE', bid, 4, 'B', '24kp1a0496@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0497@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0497', '24KP1A0497', 'Patchigolla', 'Kandhit Rishi', 'ECE', bid, 4, 'B', '24kp1a0497@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0498@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0498', '24KP1A0498', 'Pathan', 'Meharaz', 'ECE', bid, 4, 'B', '24kp1a0498@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0499@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0499', '24KP1A0499', 'Pathan', 'Saniya Begum', 'ECE', bid, 4, 'B', '24kp1a0499@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04a0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04A0', '24KP1A04A0', 'Penumudi', 'Ganesh Manikanta', 'ECE', bid, 4, 'B', '24kp1a04a0@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04a1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04A1', '24KP1A04A1', 'Peravali', 'Swapna', 'ECE', bid, 4, 'B', '24kp1a04a1@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04a2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04A2', '24KP1A04A2', 'Perika', 'Dayakar', 'ECE', bid, 4, 'B', '24kp1a04a2@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04a4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04A4', '24KP1A04A4', 'Pidathala', 'Guru Harinadh Reddy', 'ECE', bid, 4, 'B', '24kp1a04a4@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04a6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04A6', '24KP1A04A6', 'Ponnekanti', 'Sai Anudeep', 'ECE', bid, 4, 'B', '24kp1a04a6@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04a7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04A7', '24KP1A04A7', 'Poola', 'Ashok', 'ECE', bid, 4, 'B', '24kp1a04a7@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04a8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04A8', '24KP1A04A8', 'Pothula', 'Vinay', 'ECE', bid, 4, 'B', '24kp1a04a8@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04a9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04A9', '24KP1A04A9', 'Potlapalli', 'Venkata Durga', 'ECE', bid, 4, 'B', '24kp1a04a9@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04b0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04B0', '24KP1A04B0', 'Prasadam', 'Devi Charan Likhith Kumar', 'ECE', bid, 4, 'B', '24kp1a04b0@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04b1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04B1', '24KP1A04B1', 'Pusuluri', 'Thrikumar', 'ECE', bid, 4, 'B', '24kp1a04b1@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04b5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04B5', '24KP1A04B5', 'Sathuluru', 'Preethi', 'ECE', bid, 4, 'B', '24kp1a04b5@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04b6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04B6', '24KP1A04B6', 'Seelam', 'Mounika', 'ECE', bid, 4, 'B', '24kp1a04b6@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04b7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04B7', '24KP1A04B7', 'Seelam', 'Rajesh Reddy', 'ECE', bid, 4, 'B', '24kp1a04b7@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04b8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04B8', '24KP1A04B8', 'Seru', 'Narasimha Rao', 'ECE', bid, 4, 'B', '24kp1a04b8@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04b9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04B9', '24KP1A04B9', 'Shaik', 'Asrin', 'ECE', bid, 4, 'B', '24kp1a04b9@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04c0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04C0', '24KP1A04C0', 'Shaik', 'Nagul Meera', 'ECE', bid, 4, 'B', '24kp1a04c0@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04c1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04C1', '24KP1A04C1', 'Shaik', 'Peeru Saheb', 'ECE', bid, 4, 'B', '24kp1a04c1@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04c2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04C2', '24KP1A04C2', 'Shaik', 'Rizwana', 'ECE', bid, 4, 'B', '24kp1a04c2@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04c3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04C3', '24KP1A04C3', 'Shaik', 'Sajitha', 'ECE', bid, 4, 'B', '24kp1a04c3@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04c4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04C4', '24KP1A04C4', 'Shaik', 'Sameer Basha', 'ECE', bid, 4, 'B', '24kp1a04c4@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04c5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04C5', '24KP1A04C5', 'Shaik', 'Sameera', 'ECE', bid, 4, 'B', '24kp1a04c5@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04c7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04C7', '24KP1A04C7', 'Sidhabattuni', 'Jignesh', 'ECE', bid, 4, 'B', '24kp1a04c7@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04c8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04C8', '24KP1A04C8', 'Sivaratri', 'Sri Hari Krishna', 'ECE', bid, 4, 'B', '24kp1a04c8@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04c9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04C9', '24KP1A04C9', 'Songala', 'Leela Babi Krishna', 'ECE', bid, 4, 'B', '24kp1a04c9@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04d0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04D0', '24KP1A04D0', 'Sripathi', 'Pavan Kumar', 'ECE', bid, 4, 'B', '24kp1a04d0@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04d1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04D1', '24KP1A04D1', 'Sriramsetty', 'Vijaya Venkata Muralikrishna', 'ECE', bid, 4, 'B', '24kp1a04d1@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04d2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04D2', '24KP1A04D2', 'Syed', 'Allabaksh', 'ECE', bid, 4, 'B', '24kp1a04d2@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04d3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04D3', '24KP1A04D3', 'Talari', 'Pradeep', 'ECE', bid, 4, 'B', '24kp1a04d3@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04d4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04D4', '24KP1A04D4', 'Tammu', 'Nagajyothi', 'ECE', bid, 4, 'B', '24kp1a04d4@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04d5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04D5', '24KP1A04D5', 'Tanniru', 'Srikanth', 'ECE', bid, 4, 'B', '24kp1a04d5@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04d6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04D6', '24KP1A04D6', 'Tenali', 'Manna Joseph Therissa', 'ECE', bid, 4, 'B', '24kp1a04d6@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04d7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04D7', '24KP1A04D7', 'Tera', 'Yeswanth Babu', 'ECE', bid, 4, 'B', '24kp1a04d7@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04d8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04D8', '24KP1A04D8', 'Thempalli', 'Venkata Durga Sai', 'ECE', bid, 4, 'B', '24kp1a04d8@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04d9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04D9', '24KP1A04D9', 'Thodeti', 'Prabhuteja', 'ECE', bid, 4, 'B', '24kp1a04d9@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04e0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04E0', '24KP1A04E0', 'Thokkula', 'Hemalatha', 'ECE', bid, 4, 'B', '24kp1a04e0@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04e1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04E1', '24KP1A04E1', 'Thondamallu', 'Teja Sri', 'ECE', bid, 4, 'B', '24kp1a04e1@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04e2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04E2', '24KP1A04E2', 'Thummapudi', 'Swathi', 'ECE', bid, 4, 'B', '24kp1a04e2@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04e3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04E3', '24KP1A04E3', 'Timirisa', 'Anjani', 'ECE', bid, 4, 'B', '24kp1a04e3@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04e4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04E4', '24KP1A04E4', 'Tirumalasetty', 'Venkata Naga Durga Prasad', 'ECE', bid, 4, 'B', '24kp1a04e4@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04e5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04E5', '24KP1A04E5', 'Tolchuri', 'Karthik', 'ECE', bid, 4, 'B', '24kp1a04e5@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04e6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04E6', '24KP1A04E6', 'Valaparla', 'Lakshmana Rao', 'ECE', bid, 4, 'B', '24kp1a04e6@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04e7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04E7', '24KP1A04E7', 'Vallapuneni', 'Uma Maheswari', 'ECE', bid, 4, 'B', '24kp1a04e7@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04e8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04E8', '24KP1A04E8', 'Varra', 'Venkata Reddy', 'ECE', bid, 4, 'B', '24kp1a04e8@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04e9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04E9', '24KP1A04E9', 'Vasi', 'Venkata Padma Teja', 'ECE', bid, 4, 'B', '24kp1a04e9@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04f0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04F0', '24KP1A04F0', 'Vavilala', 'Durga Prasad', 'ECE', bid, 4, 'B', '24kp1a04f0@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04f1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04F1', '24KP1A04F1', 'Vavilala', 'Kasinadh', 'ECE', bid, 4, 'B', '24kp1a04f1@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04f2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04F2', '24KP1A04F2', 'Velpula', 'Yuvaraj', 'ECE', bid, 4, 'B', '24kp1a04f2@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04f3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04F3', '24KP1A04F3', 'Vemula', 'Venkata Ramana', 'ECE', bid, 4, 'B', '24kp1a04f3@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04f5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04F5', '24KP1A04F5', 'Vinukonda', 'Leela Chalapathi Rao', 'ECE', bid, 4, 'B', '24kp1a04f5@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04f6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04F6', '24KP1A04F6', 'Visanagiri', 'Lokesh', 'ECE', bid, 4, 'B', '24kp1a04f6@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04f7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04F7', '24KP1A04F7', 'Voleti', 'Laxmi', 'ECE', bid, 4, 'B', '24kp1a04f7@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04f8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04F8', '24KP1A04F8', 'Yarramsetti', 'Venkateswra Rao', 'ECE', bid, 4, 'B', '24kp1a04f8@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04f9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04F9', '24KP1A04F9', 'Yeginathi', 'Naga Lakshmi', 'ECE', bid, 4, 'B', '24kp1a04f9@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0464@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0464', '24KP1A0464', 'Kuchipudi', 'Keerthana', 'ECE', bid, 4, 'B', '24kp1a0464@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0457@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0457', '24KP1A0457', 'Katta', 'Vamsi', 'ECE', bid, 4, 'B', '24kp1a0457@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04a3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04A3', '24KP1A04A3', 'Peruri', 'Ganesh', 'ECE', bid, 4, 'B', '24kp1a04a3@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04a5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04A5', '24KP1A04A5', 'Ponnala', 'Rahul', 'ECE', bid, 4, 'B', '24kp1a04a5@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a0489@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A0489', '24KP1A0489', 'Nuthalapati', 'Siva Kumar', 'ECE', bid, 4, 'B', '24kp1a0489@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04b3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04B3', '24KP1A04B3', 'Ravella', 'Anil Kumar', 'ECE', bid, 4, 'B', '24kp1a04b3@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04b4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04B4', '24KP1A04B4', 'Sandireddy', 'Sirisha', 'ECE', bid, 4, 'B', '24kp1a04b4@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04c6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04C6', '24KP1A04C6', 'Shaik', 'Shahethulla', 'ECE', bid, 4, 'B', '24kp1a04c6@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0401@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0401', '25KP5A0401', 'Bodavula', 'Jai Kumar', 'ECE', bid, 4, 'C', '25kp5a0401@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0402@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0402', '25KP5A0402', 'Bondala', 'Purna Shankar', 'ECE', bid, 4, 'C', '25kp5a0402@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0403@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0403', '25KP5A0403', 'Chittimeni', 'Venkata Pramod', 'ECE', bid, 4, 'C', '25kp5a0403@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0404@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0404', '25KP5A0404', 'Choudaboina', 'Venkata Nikhil', 'ECE', bid, 4, 'C', '25kp5a0404@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0405@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0405', '25KP5A0405', 'Dalai', 'Prabhash', 'ECE', bid, 4, 'C', '25kp5a0405@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0406@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0406', '25KP5A0406', 'Dasari', 'Naveen Babu', 'ECE', bid, 4, 'C', '25kp5a0406@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0407@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0407', '25KP5A0407', 'Duddu', 'Ajay', 'ECE', bid, 4, 'C', '25kp5a0407@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0408@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0408', '25KP5A0408', 'Ganitham', 'Guru Mukunda', 'ECE', bid, 4, 'C', '25kp5a0408@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0409@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0409', '25KP5A0409', 'Ganta', 'Hasan', 'ECE', bid, 4, 'C', '25kp5a0409@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0410@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0410', '25KP5A0410', 'Gorla', 'Uma Ranga Rao', 'ECE', bid, 4, 'C', '25kp5a0410@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0411@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0411', '25KP5A0411', 'Kamireddy', 'Nagachaitanya Reddy', 'ECE', bid, 4, 'C', '25kp5a0411@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0412@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0412', '25KP5A0412', 'Kancherla', 'Gopi', 'ECE', bid, 4, 'C', '25kp5a0412@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0413@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0413', '25KP5A0413', 'Karravula', 'Mahesh Reddy', 'ECE', bid, 4, 'C', '25kp5a0413@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0414@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0414', '25KP5A0414', 'Kilugu', 'Sivasai', 'ECE', bid, 4, 'C', '25kp5a0414@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0415@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0415', '25KP5A0415', 'Kolusu', 'Lakshmana Swamy', 'ECE', bid, 4, 'C', '25kp5a0415@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0416@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0416', '25KP5A0416', 'Koyyana', 'Rohith Naidu', 'ECE', bid, 4, 'C', '25kp5a0416@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0417@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0417', '25KP5A0417', 'Majji', 'Lakshmi Sai Prasad', 'ECE', bid, 4, 'C', '25kp5a0417@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0418@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0418', '25KP5A0418', 'Malineni', 'Gnanendra Chowdari', 'ECE', bid, 4, 'C', '25kp5a0418@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0419@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0419', '25KP5A0419', 'Mallela', 'Purandeswari', 'ECE', bid, 4, 'C', '25kp5a0419@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0420@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0420', '25KP5A0420', 'Matam', 'Gowrisankar', 'ECE', bid, 4, 'C', '25kp5a0420@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0421@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0421', '25KP5A0421', 'Mayakuntla', 'Akhil', 'ECE', bid, 4, 'C', '25kp5a0421@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0422@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0422', '25KP5A0422', 'Mekala', 'Sri Ram', 'ECE', bid, 4, 'C', '25kp5a0422@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0423@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0423', '25KP5A0423', 'Melam', 'Prasanth', 'ECE', bid, 4, 'C', '25kp5a0423@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0424@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0424', '25KP5A0424', 'Muvvala', 'Karthik', 'ECE', bid, 4, 'C', '25kp5a0424@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0425@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0425', '25KP5A0425', 'Nakkala', 'Bhargavi', 'ECE', bid, 4, 'C', '25kp5a0425@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0426@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0426', '25KP5A0426', 'Namburi', 'Praveen Kumar', 'ECE', bid, 4, 'C', '25kp5a0426@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0427@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0427', '25KP5A0427', 'Nandigana', 'Ajith', 'ECE', bid, 4, 'C', '25kp5a0427@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0428@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0428', '25KP5A0428', 'Naraharisetty', 'Dileep Venkata Pandu Ranganadh', 'ECE', bid, 4, 'C', '25kp5a0428@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0429@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0429', '25KP5A0429', 'Pagelli', 'Prasanna Kumar', 'ECE', bid, 4, 'C', '25kp5a0429@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0430@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0430', '25KP5A0430', 'Pasala', 'Rajesh', 'ECE', bid, 4, 'C', '25kp5a0430@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0431@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0431', '25KP5A0431', 'Peddireddy', 'Billy Paul', 'ECE', bid, 4, 'C', '25kp5a0431@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0432@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0432', '25KP5A0432', 'Pinjari', 'Ibrahim', 'ECE', bid, 4, 'C', '25kp5a0432@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0433@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0433', '25KP5A0433', 'Podatharapu', 'Brahma Sravanthi', 'ECE', bid, 4, 'C', '25kp5a0433@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0434@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0434', '25KP5A0434', 'Prasadapu', 'Naga Rani', 'ECE', bid, 4, 'C', '25kp5a0434@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0435@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0435', '25KP5A0435', 'Pudi', 'Koushik', 'ECE', bid, 4, 'C', '25kp5a0435@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0436@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0436', '25KP5A0436', 'Rachamalli', 'Sravan Kumar', 'ECE', bid, 4, 'C', '25kp5a0436@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0437@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0437', '25KP5A0437', 'Ragipindi', 'Venkatasivasai Reddy', 'ECE', bid, 4, 'C', '25kp5a0437@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0438@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0438', '25KP5A0438', 'Seelam', 'Prasanth Babu', 'ECE', bid, 4, 'C', '25kp5a0438@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0439@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0439', '25KP5A0439', 'Seeramsetty', 'Tarak Nadh', 'ECE', bid, 4, 'C', '25kp5a0439@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0440@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0440', '25KP5A0440', 'Vanga', 'Santosh Reddy', 'ECE', bid, 4, 'C', '25kp5a0440@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0441@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0441', '25KP5A0441', 'Velisala', 'Srinivas', 'ECE', bid, 4, 'C', '25kp5a0441@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0442@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0442', '25KP5A0442', 'Vendra', 'Durga Sri Sai', 'ECE', bid, 4, 'C', '25kp5a0442@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0443@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0443', '25KP5A0443', 'Verriboyina', 'Naga Pardhu', 'ECE', bid, 4, 'C', '25kp5a0443@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0444@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0444', '25KP5A0444', 'Yakkanti', 'Tejaswi Koti Reddy', 'ECE', bid, 4, 'C', '25kp5a0444@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a0445@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A0445', '25KP5A0445', 'Yele', 'Saiteja', 'ECE', bid, 4, 'C', '25kp5a0445@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04f4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04F4', '24KP1A04F4', 'Venna', 'Ayyappa Reddy', 'ECE', bid, 4, 'C', '24kp1a04f4@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a04b2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A04B2', '24KP1A04B2', 'Rama', 'Sandeep', 'ECE', bid, 4, 'C', '24kp1a04b2@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0401@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0401', '23KP1A0401', 'Aarambaka', 'Sujitha', 'ECE', bid, 4, 'A', '23kp1a0401@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0402@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0402', '23KP1A0402', 'Ala', 'Navya', 'ECE', bid, 4, 'A', '23kp1a0402@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0403@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0403', '23KP1A0403', 'Ala', 'Sri Murali Krishna', 'ECE', bid, 4, 'A', '23kp1a0403@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0404@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0404', '23KP1A0404', 'Amaroji', 'Nanda Kumar', 'ECE', bid, 4, 'A', '23kp1a0404@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0405@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0405', '23KP1A0405', 'Ammisetti', 'Veera Babu', 'ECE', bid, 4, 'A', '23kp1a0405@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0407@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0407', '23KP1A0407', 'Anna', 'Siva Naga Ashok Kumar', 'ECE', bid, 4, 'A', '23kp1a0407@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0408@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0408', '23KP1A0408', 'Appikatla', 'Havirshitha', 'ECE', bid, 4, 'A', '23kp1a0408@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0409@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0409', '23KP1A0409', 'Atmakuri', 'Kusumanth', 'ECE', bid, 4, 'A', '23kp1a0409@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0410@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0410', '23KP1A0410', 'Avula', 'Raja Gopal', 'ECE', bid, 4, 'A', '23kp1a0410@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0411@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0411', '23KP1A0411', 'Bahatam', 'Sai Ganesh', 'ECE', bid, 4, 'A', '23kp1a0411@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0412@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0412', '23KP1A0412', 'Bandi', 'Venkata Vara Prasad Reddy', 'ECE', bid, 4, 'A', '23kp1a0412@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0413@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0413', '23KP1A0413', 'Bannaravuri', 'Caleb Kiran', 'ECE', bid, 4, 'A', '23kp1a0413@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0414@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0414', '23KP1A0414', 'Bathula', 'Lavanya', 'ECE', bid, 4, 'A', '23kp1a0414@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0415@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0415', '23KP1A0415', 'Borra', 'Chennakesava Mutheswara Rao', 'ECE', bid, 4, 'A', '23kp1a0415@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0416@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0416', '23KP1A0416', 'Buradagunta', 'Sandeep', 'ECE', bid, 4, 'A', '23kp1a0416@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0417@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0417', '23KP1A0417', 'Challa', 'Karthi', 'ECE', bid, 4, 'A', '23kp1a0417@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0418@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0418', '23KP1A0418', 'Chandu', 'Praveen', 'ECE', bid, 4, 'A', '23kp1a0418@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0419@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0419', '23KP1A0419', 'Chaparapu', 'Anuhya', 'ECE', bid, 4, 'A', '23kp1a0419@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0420@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0420', '23KP1A0420', 'Chennakeshavula', 'Sridhar', 'ECE', bid, 4, 'A', '23kp1a0420@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0421@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0421', '23KP1A0421', 'Chintalacheruvu', 'Anjaneyulu Reddy', 'ECE', bid, 4, 'A', '23kp1a0421@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0422@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0422', '23KP1A0422', 'Chintaparthi', 'Nikhil', 'ECE', bid, 4, 'A', '23kp1a0422@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0423@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0423', '23KP1A0423', 'Chundu', 'Ravi', 'ECE', bid, 4, 'A', '23kp1a0423@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0424@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0424', '23KP1A0424', 'Dama', 'Rajitha', 'ECE', bid, 4, 'A', '23kp1a0424@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0425@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0425', '23KP1A0425', 'Dande', 'Ramesh', 'ECE', bid, 4, 'A', '23kp1a0425@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0426@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0426', '23KP1A0426', 'Davuluri', 'Dumdi Ganesh Shanmukha Manidhar', 'ECE', bid, 4, 'A', '23kp1a0426@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0427@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0427', '23KP1A0427', 'Devireddy', 'Sai Krishna Reddy', 'ECE', bid, 4, 'A', '23kp1a0427@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0428@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0428', '23KP1A0428', 'Dudekula', 'Gafoor', 'ECE', bid, 4, 'A', '23kp1a0428@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0429@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0429', '23KP1A0429', 'Evuri', 'Dinesh Babu', 'ECE', bid, 4, 'A', '23kp1a0429@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0430@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0430', '23KP1A0430', 'Gaddam', 'Rahul', 'ECE', bid, 4, 'A', '23kp1a0430@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0431@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0431', '23KP1A0431', 'Gaddiparthi', 'Prasanna Kumar', 'ECE', bid, 4, 'A', '23kp1a0431@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0432@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0432', '23KP1A0432', 'Gannavarapu', 'Vamsi', 'ECE', bid, 4, 'A', '23kp1a0432@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0433@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0433', '23KP1A0433', 'Gatta', 'Ramakrishna', 'ECE', bid, 4, 'A', '23kp1a0433@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0434@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0434', '23KP1A0434', 'Golla', 'Ashok', 'ECE', bid, 4, 'A', '23kp1a0434@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0435@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0435', '23KP1A0435', 'Gopidesi', 'Harika', 'ECE', bid, 4, 'A', '23kp1a0435@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0436@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0436', '23KP1A0436', 'Guda', 'Sarada Reddy', 'ECE', bid, 4, 'A', '23kp1a0436@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0437@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0437', '23KP1A0437', 'Gunja', 'Kalyan', 'ECE', bid, 4, 'A', '23kp1a0437@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0438@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0438', '23KP1A0438', 'Gurram', 'Baji', 'ECE', bid, 4, 'A', '23kp1a0438@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0439@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0439', '23KP1A0439', 'Gurram', 'Sumanth', 'ECE', bid, 4, 'A', '23kp1a0439@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0440@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0440', '23KP1A0440', 'Jada', 'Siva Sai', 'ECE', bid, 4, 'A', '23kp1a0440@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0442@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0442', '23KP1A0442', 'Javvaji', 'Revanth', 'ECE', bid, 4, 'A', '23kp1a0442@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0443@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0443', '23KP1A0443', 'Jonnakuti', 'Linga Venkata Ramakrishna', 'ECE', bid, 4, 'A', '23kp1a0443@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0444@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0444', '23KP1A0444', 'Jonnalagadda', 'Swathi', 'ECE', bid, 4, 'A', '23kp1a0444@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0445@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0445', '23KP1A0445', 'Karnata', 'Prasanth', 'ECE', bid, 4, 'A', '23kp1a0445@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0447@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0447', '23KP1A0447', 'Karumuri', 'Anantha Kumar', 'ECE', bid, 4, 'A', '23kp1a0447@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0448@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0448', '23KP1A0448', 'Katteboina', 'Veeranjaneyulu', 'ECE', bid, 4, 'A', '23kp1a0448@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0449@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0449', '23KP1A0449', 'Katuru', 'Sai Harsha Vardhan', 'ECE', bid, 4, 'A', '23kp1a0449@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0450@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0450', '23KP1A0450', 'Kondeddula', 'Purna Chandrarao', 'ECE', bid, 4, 'A', '23kp1a0450@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0451@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0451', '23KP1A0451', 'Konide', 'Yaswanth', 'ECE', bid, 4, 'A', '23kp1a0451@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0452@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0452', '23KP1A0452', 'Kotaru', 'Krishna Pavan', 'ECE', bid, 4, 'A', '23kp1a0452@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0453@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0453', '23KP1A0453', 'Kotte', 'Sri Kavya', 'ECE', bid, 4, 'A', '23kp1a0453@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0454@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0454', '23KP1A0454', 'Kovvili', 'Sameera Devi', 'ECE', bid, 4, 'A', '23kp1a0454@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0455@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0455', '23KP1A0455', 'Kuchipudi', 'Ajay', 'ECE', bid, 4, 'A', '23kp1a0455@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0456@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0456', '23KP1A0456', 'Kudumula', 'Eswara Reddy', 'ECE', bid, 4, 'A', '23kp1a0456@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0457@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0457', '23KP1A0457', 'Kukkapalli', 'Venkata Sai Krishna', 'ECE', bid, 4, 'A', '23kp1a0457@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0458@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0458', '23KP1A0458', 'Kurapati', 'Dhanunjay', 'ECE', bid, 4, 'A', '23kp1a0458@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0459@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0459', '23KP1A0459', 'Lankireddy', 'Srikanth Reddy', 'ECE', bid, 4, 'A', '23kp1a0459@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0460@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0460', '23KP1A0460', 'Malle', 'Vyshnavi', 'ECE', bid, 4, 'A', '23kp1a0460@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0461@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0461', '23KP1A0461', 'Manam', 'Naga Jyothi', 'ECE', bid, 4, 'A', '23kp1a0461@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0463@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0463', '23KP1A0463', 'Maragani', 'Hemanthkumar', 'ECE', bid, 4, 'A', '23kp1a0463@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0464@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0464', '23KP1A0464', 'Martha', 'Lakshman', 'ECE', bid, 4, 'A', '23kp1a0464@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0465@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0465', '23KP1A0465', 'Matte', 'Naga Naresh Kumar', 'ECE', bid, 4, 'A', '23kp1a0465@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0466@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0466', '23KP1A0466', 'Mortha', 'Lakshminarendra', 'ECE', bid, 4, 'A', '23kp1a0466@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp5a0401@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP5A0401', '24KP5A0401', 'Bhimisetti', 'Madhu Latha', 'ECE', bid, 4, 'A', '24kp5a0401@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp5a0403@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP5A0403', '24KP5A0403', 'Korrapati', 'Samyelu', 'ECE', bid, 4, 'A', '24kp5a0403@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp5a0404@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP5A0404', '24KP5A0404', 'Kovuri', 'Mahesh Ram', 'ECE', bid, 4, 'A', '24kp5a0404@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp5a0405@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP5A0405', '24KP5A0405', 'Kunchala', 'Venkateswarlu', 'ECE', bid, 4, 'A', '24kp5a0405@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp5a0406@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP5A0406', '24KP5A0406', 'Parasa', 'Uttej', 'ECE', bid, 4, 'A', '24kp5a0406@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0462@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0462', '23KP1A0462', 'Mandapati', 'Nava Sandya', 'ECE', bid, 4, 'A', '23kp1a0462@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0406@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0406', '23KP1A0406', 'Anguluri', 'Venkata Durga Prasad', 'ECE', bid, 4, 'A', '23kp1a0406@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0446@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0446', '23KP1A0446', 'Karnati', 'Siva Sankar', 'ECE', bid, 4, 'A', '23kp1a0446@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0441@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0441', '23KP1A0441', 'Jakkuluri', 'Priyadarshini', 'ECE', bid, 4, 'A', '23kp1a0441@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0467@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0467', '23KP1A0467', 'Mothukuru', 'Chanakya Ram', 'ECE', bid, 4, 'B', '23kp1a0467@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0468@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0468', '23KP1A0468', 'Moturi', 'Praveen Babu', 'ECE', bid, 4, 'B', '23kp1a0468@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0469@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0469', '23KP1A0469', 'Mudraboyina', 'Venkata Easwar', 'ECE', bid, 4, 'B', '23kp1a0469@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0470@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0470', '23KP1A0470', 'Mule', 'Ramana Reddy', 'ECE', bid, 4, 'B', '23kp1a0470@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0472@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0472', '23KP1A0472', 'Muppalla', 'Koteswara Rao', 'ECE', bid, 4, 'B', '23kp1a0472@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0473@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0473', '23KP1A0473', 'Muvva', 'Naveen', 'ECE', bid, 4, 'B', '23kp1a0473@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0474@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0474', '23KP1A0474', 'Nalukurthi', 'Santhosh Kumar', 'ECE', bid, 4, 'B', '23kp1a0474@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0475@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0475', '23KP1A0475', 'Nandam', 'Naga Rohit', 'ECE', bid, 4, 'B', '23kp1a0475@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0476@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0476', '23KP1A0476', 'Nannam', 'Guru Sankar', 'ECE', bid, 4, 'B', '23kp1a0476@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0477@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0477', '23KP1A0477', 'Neelagiri', 'Avinash', 'ECE', bid, 4, 'B', '23kp1a0477@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0478@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0478', '23KP1A0478', 'Nutakki', 'Gopi', 'ECE', bid, 4, 'B', '23kp1a0478@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0479@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0479', '23KP1A0479', 'Ontipuli', 'Anil Kumar', 'ECE', bid, 4, 'B', '23kp1a0479@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0480@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0480', '23KP1A0480', 'Orchu', 'Sai Naveen', 'ECE', bid, 4, 'B', '23kp1a0480@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0481@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0481', '23KP1A0481', 'Orsu', 'Hemanth Kumar', 'ECE', bid, 4, 'B', '23kp1a0481@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0482@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0482', '23KP1A0482', 'Pachava', 'Rajeswari', 'ECE', bid, 4, 'B', '23kp1a0482@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0483@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0483', '23KP1A0483', 'Pagadala', 'Navya', 'ECE', bid, 4, 'B', '23kp1a0483@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0484@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0484', '23KP1A0484', 'Palika', 'Nithin Sai Durga', 'ECE', bid, 4, 'B', '23kp1a0484@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0485@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0485', '23KP1A0485', 'Pallapati', 'Srinu', 'ECE', bid, 4, 'B', '23kp1a0485@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0486@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0486', '23KP1A0486', 'Parimi', 'Akhil Tej', 'ECE', bid, 4, 'B', '23kp1a0486@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0487@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0487', '23KP1A0487', 'Pathan', 'Salma', 'ECE', bid, 4, 'B', '23kp1a0487@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0488@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0488', '23KP1A0488', 'Pathapati', 'Hemanth', 'ECE', bid, 4, 'B', '23kp1a0488@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0489@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0489', '23KP1A0489', 'Pathapati', 'Lakshminarayana', 'ECE', bid, 4, 'B', '23kp1a0489@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0490@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0490', '23KP1A0490', 'Pathikonda', 'Veera Brahmaaiah', 'ECE', bid, 4, 'B', '23kp1a0490@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0491@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0491', '23KP1A0491', 'Peddisetti', 'Venkatesh', 'ECE', bid, 4, 'B', '23kp1a0491@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0492@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0492', '23KP1A0492', 'Peepala', 'Madhavi', 'ECE', bid, 4, 'B', '23kp1a0492@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0493@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0493', '23KP1A0493', 'Polaboina', 'Shiva Raju', 'ECE', bid, 4, 'B', '23kp1a0493@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0494@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0494', '23KP1A0494', 'Punuru', 'Renusri', 'ECE', bid, 4, 'B', '23kp1a0494@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0495@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0495', '23KP1A0495', 'Rajesh', 'Nalgonda', 'ECE', bid, 4, 'B', '23kp1a0495@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0496@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0496', '23KP1A0496', 'Sadhu', 'Hari Susmitha', 'ECE', bid, 4, 'B', '23kp1a0496@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0497@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0497', '23KP1A0497', 'Sammeta', 'Anand', 'ECE', bid, 4, 'B', '23kp1a0497@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0498@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0498', '23KP1A0498', 'Sampatam', 'Venkata Raveendra', 'ECE', bid, 4, 'B', '23kp1a0498@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0499@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0499', '23KP1A0499', 'Seelam', 'Syam', 'ECE', bid, 4, 'B', '23kp1a0499@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a04a0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A04A0', '23KP1A04A0', 'Shaik', 'Abdul Aziz', 'ECE', bid, 4, 'B', '23kp1a04a0@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a04a1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A04A1', '23KP1A04A1', 'Shaik', 'Abdul Khadri', 'ECE', bid, 4, 'B', '23kp1a04a1@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a04a2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A04A2', '23KP1A04A2', 'Shaik', 'Abdul Khaja Mohiddin', 'ECE', bid, 4, 'B', '23kp1a04a2@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a04a4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A04A4', '23KP1A04A4', 'Shaik', 'Adnan', 'ECE', bid, 4, 'B', '23kp1a04a4@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a04a5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A04A5', '23KP1A04A5', 'Shaik', 'Asif Basha', 'ECE', bid, 4, 'B', '23kp1a04a5@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a04a6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A04A6', '23KP1A04A6', 'Shaik', 'Fareed', 'ECE', bid, 4, 'B', '23kp1a04a6@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a04a7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A04A7', '23KP1A04A7', 'Shaik', 'Nagoor Mastan', 'ECE', bid, 4, 'B', '23kp1a04a7@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a04a9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A04A9', '23KP1A04A9', 'Shaik', 'Ridha Anjum', 'ECE', bid, 4, 'B', '23kp1a04a9@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a04b0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A04B0', '23KP1A04B0', 'Shaik', 'Sumiya', 'ECE', bid, 4, 'B', '23kp1a04b0@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a04b2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A04B2', '23KP1A04B2', 'Sudhavarapu', 'Venkata Nandini', 'ECE', bid, 4, 'B', '23kp1a04b2@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a04b3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A04B3', '23KP1A04B3', 'Talanki', 'Venkata Susmitha', 'ECE', bid, 4, 'B', '23kp1a04b3@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a04b4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A04B4', '23KP1A04B4', 'Tangellapalli', 'Srinivas', 'ECE', bid, 4, 'B', '23kp1a04b4@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a04b5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A04B5', '23KP1A04B5', 'Tenali', 'Lakshmi Karthikeya Ganesh', 'ECE', bid, 4, 'B', '23kp1a04b5@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a04b6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A04B6', '23KP1A04B6', 'Thirumalasetty', 'Swapna', 'ECE', bid, 4, 'B', '23kp1a04b6@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a04b7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A04B7', '23KP1A04B7', 'Thondapi', 'Phani Bhargavi', 'ECE', bid, 4, 'B', '23kp1a04b7@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a04b9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A04B9', '23KP1A04B9', 'Tirupathi', 'Venkatanarayana', 'ECE', bid, 4, 'B', '23kp1a04b9@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a04c0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A04C0', '23KP1A04C0', 'Uppathi', 'Chandana', 'ECE', bid, 4, 'B', '23kp1a04c0@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a04c1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A04C1', '23KP1A04C1', 'Vanama', 'Sai Venkata Naga Srikar', 'ECE', bid, 4, 'B', '23kp1a04c1@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a04c2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A04C2', '23KP1A04C2', 'Vasantapuram', 'Vinod', 'ECE', bid, 4, 'B', '23kp1a04c2@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a04c3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A04C3', '23KP1A04C3', 'Veeramasu', 'Naga Sri Keerthana', 'ECE', bid, 4, 'B', '23kp1a04c3@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a04c4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A04C4', '23KP1A04C4', 'Veeranki', 'Siva Mani Kanta', 'ECE', bid, 4, 'B', '23kp1a04c4@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a04c5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A04C5', '23KP1A04C5', 'Vemula', 'Gopi', 'ECE', bid, 4, 'B', '23kp1a04c5@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a04c6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A04C6', '23KP1A04C6', 'Vemula', 'Vishnuteja', 'ECE', bid, 4, 'B', '23kp1a04c6@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a04c7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A04C7', '23KP1A04C7', 'Venna', 'Sudharshan Reddy', 'ECE', bid, 4, 'B', '23kp1a04c7@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a04c8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A04C8', '23KP1A04C8', 'Yakkateela', 'Gowri', 'ECE', bid, 4, 'B', '23kp1a04c8@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a04c9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A04C9', '23KP1A04C9', 'Yalnati', 'Keswara Rao', 'ECE', bid, 4, 'B', '23kp1a04c9@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a04d0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A04D0', '23KP1A04D0', 'Yandrapalli', 'Sai Krishna', 'ECE', bid, 4, 'B', '23kp1a04d0@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a04d1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A04D1', '23KP1A04D1', 'Yarra', 'Kaleswara Rao', 'ECE', bid, 4, 'B', '23kp1a04d1@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a04d2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A04D2', '23KP1A04D2', 'Tammisetty', 'Venkata Brahmam', 'ECE', bid, 4, 'B', '23kp1a04d2@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp5a0407@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP5A0407', '24KP5A0407', 'Shaik', 'Sai Mastan Vali', 'ECE', bid, 4, 'B', '24kp5a0407@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp5a0408@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP5A0408', '24KP5A0408', 'Tankala', 'Manohara Rao', 'ECE', bid, 4, 'B', '24kp5a0408@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp5a0409@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP5A0409', '24KP5A0409', 'Venna', 'Kavya Deepthi Reddy', 'ECE', bid, 4, 'B', '24kp5a0409@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp5a0410@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP5A0410', '24KP5A0410', 'Vipparthi', 'Praicee', 'ECE', bid, 4, 'B', '24kp5a0410@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp5a0411@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP5A0411', '24KP5A0411', 'Bollimuntha', 'Pavan Kumar', 'ECE', bid, 4, 'B', '24kp5a0411@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp5a0412@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP5A0412', '24KP5A0412', 'Shaik', 'Ashik', 'ECE', bid, 4, 'B', '24kp5a0412@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0445@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0445', '22KP1A0445', 'Kurakula', 'Vasu', 'ECE', bid, 8, 'A', '22kp1a0445@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0458@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0458', '22KP1A0458', 'Mekala', 'Balayesu', 'ECE', bid, 8, 'B', '22kp1a0458@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0475@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0475', '22KP1A0475', 'Potham', 'Setti Balaji', 'ECE', bid, 8, 'B', '22kp1a0475@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a04b8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A04B8', '23KP1A04B8', 'Thota', 'Chaitanya', 'ECE', bid, 4, 'B', '23kp1a04b8@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a0471@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A0471', '23KP1A0471', 'Mule', 'Venkata Ganesh Reddy', 'ECE', bid, 4, 'B', '23kp1a0471@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a04a3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A04A3', '23KP1A04A3', 'Shaik', 'Abdul Mujeer', 'ECE', bid, 4, 'B', '23kp1a04a3@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a04a8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A04A8', '23KP1A04A8', 'Shaik', 'Rasool Mohiddin', 'ECE', bid, 4, 'B', '23kp1a04a8@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp5a0402@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP5A0402', '24KP5A0402', 'Gannepalli', 'Atchibabu', 'ECE', bid, 4, 'B', '24kp5a0402@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a04b1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A04B1', '23KP1A04B1', 'Shaik', 'Yasin Sharif', 'ECE', bid, 4, 'B', '23kp1a04b1@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0401@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0401', '22KP1A0401', 'Adusumalli', 'Jhansi', 'ECE', bid, 8, 'A', '22kp1a0401@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0402@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0402', '22KP1A0402', 'Annapa', 'Reddy Rajeswari', 'ECE', bid, 8, 'A', '22kp1a0402@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0403@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0403', '22KP1A0403', 'Annem', 'Sireesha', 'ECE', bid, 8, 'A', '22kp1a0403@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0404@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0404', '22KP1A0404', 'Bandaru', 'Sri Krishna Chaitanya', 'ECE', bid, 8, 'A', '22kp1a0404@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0405@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0405', '22KP1A0405', 'Bandi', 'Shamala Devi', 'ECE', bid, 8, 'A', '22kp1a0405@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0407@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0407', '22KP1A0407', 'Bathula', 'Siva Bhavya', 'ECE', bid, 8, 'A', '22kp1a0407@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0408@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0408', '22KP1A0408', 'Besi', 'Sekhar Rao', 'ECE', bid, 8, 'A', '22kp1a0408@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0409@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0409', '22KP1A0409', 'Bommisetti', 'Kavya Sri', 'ECE', bid, 8, 'A', '22kp1a0409@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0410@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0410', '22KP1A0410', 'Bondala', 'Bala Maneesha', 'ECE', bid, 8, 'A', '22kp1a0410@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0411@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0411', '22KP1A0411', 'Boyina', 'Guru Lingam', 'ECE', bid, 8, 'A', '22kp1a0411@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0412@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0412', '22KP1A0412', 'Buthukuri', 'Naveena', 'ECE', bid, 8, 'A', '22kp1a0412@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0413@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0413', '22KP1A0413', 'Chagam', 'Venkata Sai Lakshmi', 'ECE', bid, 8, 'A', '22kp1a0413@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0414@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0414', '22KP1A0414', 'Chakkera', 'Revathi', 'ECE', bid, 8, 'A', '22kp1a0414@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0415@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0415', '22KP1A0415', 'Chalavadi', 'Vinitha', 'ECE', bid, 8, 'A', '22kp1a0415@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0416@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0416', '22KP1A0416', 'Challagundla', 'Thriveni', 'ECE', bid, 8, 'A', '22kp1a0416@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0417@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0417', '22KP1A0417', 'Chaparapu', 'Gayathri', 'ECE', bid, 8, 'A', '22kp1a0417@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0420@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0420', '22KP1A0420', 'Chintalacheruvu', 'Sai Ganesh Reddy', 'ECE', bid, 8, 'A', '22kp1a0420@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0421@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0421', '22KP1A0421', 'Damerla', 'Adithya Mani Kumar', 'ECE', bid, 8, 'A', '22kp1a0421@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0422@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0422', '22KP1A0422', 'Damerla', 'Akhil Sai Kumar', 'ECE', bid, 8, 'A', '22kp1a0422@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0423@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0423', '22KP1A0423', 'Danda', 'Siva Sankara Rddy', 'ECE', bid, 8, 'A', '22kp1a0423@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0425@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0425', '22KP1A0425', 'Ragula', 'Venkatesh', 'ECE', bid, 8, 'A', '22kp1a0425@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0426@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0426', '22KP1A0426', 'Derangula', 'Laazar', 'ECE', bid, 8, 'A', '22kp1a0426@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0427@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0427', '22KP1A0427', 'Devineni', 'Venkata Sushma', 'ECE', bid, 8, 'A', '22kp1a0427@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0430@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0430', '22KP1A0430', 'Gangasani', 'Veeranjaneyalu Reddy', 'ECE', bid, 8, 'A', '22kp1a0430@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0431@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0431', '22KP1A0431', 'Ganteni', 'Venkata Chaitanaya', 'ECE', bid, 8, 'A', '22kp1a0431@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0432@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0432', '22KP1A0432', 'Gobburi', 'Naga Malleswara Rao', 'ECE', bid, 8, 'A', '22kp1a0432@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0433@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0433', '22KP1A0433', 'Gorijala', 'Harshavardhan', 'ECE', bid, 8, 'A', '22kp1a0433@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0434@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0434', '22KP1A0434', 'Gottipati', 'Gopaali', 'ECE', bid, 8, 'A', '22kp1a0434@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0435@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0435', '22KP1A0435', 'Gummadi', 'Srinu', 'ECE', bid, 8, 'A', '22kp1a0435@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0436@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0436', '22KP1A0436', 'Ilam', 'Jai Sai Krishna', 'ECE', bid, 8, 'A', '22kp1a0436@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0437@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0437', '22KP1A0437', 'Inakollu', 'Sai Gopala Krishna', 'ECE', bid, 8, 'A', '22kp1a0437@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0438@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0438', '22KP1A0438', 'Kandula', 'Manikanta Reddy', 'ECE', bid, 8, 'A', '22kp1a0438@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0439@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0439', '22KP1A0439', 'Kantu', 'Narendra', 'ECE', bid, 8, 'A', '22kp1a0439@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0441@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0441', '22KP1A0441', 'Kotaru', 'Venkata Lokesh', 'ECE', bid, 8, 'A', '22kp1a0441@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0442@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0442', '22KP1A0442', 'Kukkala', 'Umasrivalli', 'ECE', bid, 8, 'A', '22kp1a0442@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0451@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0451', '22KP1A0451', 'Lukka', 'Dola Siva Krishna', 'ECE', bid, 8, 'A', '22kp1a0451@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp5a0401@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP5A0401', '23KP5A0401', 'Bharath', 'Kumar Reddy Lingala', 'ECE', bid, 8, 'A', '23kp5a0401@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp5a0402@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP5A0402', '23KP5A0402', 'Bommisetti', 'Bhavani Vasundhara Devi', 'ECE', bid, 8, 'A', '23kp5a0402@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp5a0403@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP5A0403', '23KP5A0403', 'Cherukuri', 'Purnapradeep', 'ECE', bid, 8, 'A', '23kp5a0403@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp5a0405@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP5A0405', '23KP5A0405', 'Gummalla', 'Mohan Krishna', 'ECE', bid, 8, 'A', '23kp5a0405@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp5a0406@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP5A0406', '23KP5A0406', 'Gurrapusala', 'Hanumanthu', 'ECE', bid, 8, 'A', '23kp5a0406@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp5a0407@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP5A0407', '23KP5A0407', 'Jilakara', 'Amarnath', 'ECE', bid, 8, 'A', '23kp5a0407@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0419@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0419', '22KP1A0419', 'Chinnaebbili', 'Gokul Krishna', 'ECE', bid, 8, 'A', '22kp1a0419@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0443@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0443', '22KP1A0443', 'Kundara', 'Kalyan Sai', 'ECE', bid, 8, 'A', '22kp1a0443@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0444@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0444', '22KP1A0444', 'Kurakula', 'Anil', 'ECE', bid, 8, 'A', '22kp1a0444@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0447@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0447', '22KP1A0447', 'Kutala', 'Manikanta Naidu', 'ECE', bid, 8, 'A', '22kp1a0447@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0448@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0448', '22KP1A0448', 'Lam', 'Rajesh', 'ECE', bid, 8, 'A', '22kp1a0448@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0450@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0450', '22KP1A0450', 'Loknad', 'Lebaka', 'ECE', bid, 8, 'A', '22kp1a0450@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp5a0404@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP5A0404', '23KP5A0404', 'Dasam', 'Venkata Naga Sai Kumar Raju', 'ECE', bid, 8, 'A', '23kp5a0404@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0406@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0406', '22KP1A0406', 'Bandi', 'Venkata Kishore', 'ECE', bid, 8, 'A', '22kp1a0406@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0424@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0424', '22KP1A0424', 'Dasari', 'Ajay Siva Krishna', 'ECE', bid, 8, 'A', '22kp1a0424@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0446@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0446', '22KP1A0446', 'Kuruguntla', 'Mahendra Reddy', 'ECE', bid, 8, 'A', '22kp1a0446@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0449@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0449', '22KP1A0449', 'Lavudiya', 'Sairamnaik', 'ECE', bid, 8, 'A', '22kp1a0449@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0418@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0418', '22KP1A0418', 'Chimalamarri', 'Narasimha Reddy', 'ECE', bid, 8, 'A', '22kp1a0418@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0429@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0429', '22KP1A0429', 'Gajula', 'Venkata Swami', 'ECE', bid, 8, 'A', '22kp1a0429@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0428@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0428', '22KP1A0428', 'Dokka', 'Venkata Tanuja', 'ECE', bid, 8, 'A', '22kp1a0428@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0440@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0440', '22KP1A0440', 'Koppula', 'Vara Prasad', 'ECE', bid, 8, 'A', '22kp1a0440@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0452@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0452', '22KP1A0452', 'Maguluri', 'Triveni', 'ECE', bid, 8, 'B', '22kp1a0452@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0453@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0453', '22KP1A0453', 'Mahanthi', 'Niteesh Kumar', 'ECE', bid, 8, 'B', '22kp1a0453@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0454@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0454', '22KP1A0454', 'Mandapati', 'Ratna Teja', 'ECE', bid, 8, 'B', '22kp1a0454@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0455@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0455', '22KP1A0455', 'Mannem', 'Sambasiva Rao', 'ECE', bid, 8, 'B', '22kp1a0455@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0456@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0456', '22KP1A0456', 'Matte', 'Naga Harish Kumar', 'ECE', bid, 8, 'B', '22kp1a0456@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0457@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0457', '22KP1A0457', 'Meda', 'Venkateswarlu', 'ECE', bid, 8, 'B', '22kp1a0457@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0459@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0459', '22KP1A0459', 'Mekala', 'Lakshmi Ramya', 'ECE', bid, 8, 'B', '22kp1a0459@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0461@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0461', '22KP1A0461', 'Mothukuri', 'Venu Babu', 'ECE', bid, 8, 'B', '22kp1a0461@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0462@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0462', '22KP1A0462', 'Mundarinti', 'Vamshi Krishna', 'ECE', bid, 8, 'B', '22kp1a0462@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0463@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0463', '22KP1A0463', 'Nallagatla', 'Veerachari', 'ECE', bid, 8, 'B', '22kp1a0463@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0464@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0464', '22KP1A0464', 'Pandaga', 'Kiran Kumar', 'ECE', bid, 8, 'B', '22kp1a0464@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0466@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0466', '22KP1A0466', 'Pantyala', 'Naveen Kumar', 'ECE', bid, 8, 'B', '22kp1a0466@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0468@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0468', '22KP1A0468', 'Pasyavula', 'Pedhaiah Naidu', 'ECE', bid, 8, 'B', '22kp1a0468@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0472@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0472', '22KP1A0472', 'Pathuri', 'Lakshmi Jyothirmayi', 'ECE', bid, 8, 'B', '22kp1a0472@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0473@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0473', '22KP1A0473', 'Pikkili', 'Ramanjaneyulu', 'ECE', bid, 8, 'B', '22kp1a0473@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0476@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0476', '22KP1A0476', 'Prasanna', 'Lakshmi Cherukuri', 'ECE', bid, 8, 'B', '22kp1a0476@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0477@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0477', '22KP1A0477', 'Guddeti', 'Sridevi', 'ECE', bid, 8, 'B', '22kp1a0477@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0478@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0478', '22KP1A0478', 'Ranga', 'Shanmukha Vinay Kumar', 'ECE', bid, 8, 'B', '22kp1a0478@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0479@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0479', '22KP1A0479', 'Rayapudi', 'Thriveni', 'ECE', bid, 8, 'B', '22kp1a0479@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0480@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0480', '22KP1A0480', 'Sakhamuri', 'Koushik', 'ECE', bid, 8, 'B', '22kp1a0480@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0481@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0481', '22KP1A0481', 'Shaik', 'Abdul Razak', 'ECE', bid, 8, 'B', '22kp1a0481@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0482@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0482', '22KP1A0482', 'Shaik', 'Nagur Sharif', 'ECE', bid, 8, 'B', '22kp1a0482@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0483@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0483', '22KP1A0483', 'Shaik', 'Sharukh', 'ECE', bid, 8, 'B', '22kp1a0483@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0484@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0484', '22KP1A0484', 'Shaik', 'Shoaib Malik', 'ECE', bid, 8, 'B', '22kp1a0484@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0485@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0485', '22KP1A0485', 'Shaik', 'Suhana', 'ECE', bid, 8, 'B', '22kp1a0485@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0486@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0486', '22KP1A0486', 'Swarna', 'Srinadha Venkata Sastry', 'ECE', bid, 8, 'B', '22kp1a0486@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0487@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0487', '22KP1A0487', 'Sykam', 'Basava Raju', 'ECE', bid, 8, 'B', '22kp1a0487@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0488@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0488', '22KP1A0488', 'Tammisetti', 'Sushmitha', 'ECE', bid, 8, 'B', '22kp1a0488@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0489@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0489', '22KP1A0489', 'Thirumalasetty', 'Luhith Paul', 'ECE', bid, 8, 'B', '22kp1a0489@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0490@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0490', '22KP1A0490', 'Thontla', 'Yamuna', 'ECE', bid, 8, 'B', '22kp1a0490@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0491@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0491', '22KP1A0491', 'Tummalapenta', 'Sai Vyshnavi', 'ECE', bid, 8, 'B', '22kp1a0491@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0492@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0492', '22KP1A0492', 'Uppala', 'Nagaraju', 'ECE', bid, 8, 'B', '22kp1a0492@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0494@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0494', '22KP1A0494', 'Upputholla', 'Chinna Rao', 'ECE', bid, 8, 'B', '22kp1a0494@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0495@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0495', '22KP1A0495', 'Vakkalagadda', 'Jai Krishna', 'ECE', bid, 8, 'B', '22kp1a0495@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0497@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0497', '22KP1A0497', 'Vemula', 'Kotaiah', 'ECE', bid, 8, 'B', '22kp1a0497@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0498@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0498', '22KP1A0498', 'Vissarapu', 'Haritha', 'ECE', bid, 8, 'B', '22kp1a0498@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a04a0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A04A0', '22KP1A04A0', 'Yannam', 'Tirumalesh', 'ECE', bid, 8, 'B', '22kp1a04a0@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a04a2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A04A2', '22KP1A04A2', 'Thota', 'Navya', 'ECE', bid, 8, 'B', '22kp1a04a2@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp5a0408@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP5A0408', '23KP5A0408', 'Kandrekula', 'Shanmukha', 'ECE', bid, 8, 'B', '23kp5a0408@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp5a0409@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP5A0409', '23KP5A0409', 'Kanna', 'Ashok Balaji', 'ECE', bid, 8, 'B', '23kp5a0409@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp5a0410@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP5A0410', '23KP5A0410', 'Korivi', 'Narasimha Yadav', 'ECE', bid, 8, 'B', '23kp5a0410@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp5a0411@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP5A0411', '23KP5A0411', 'Narasani', 'Mahesh Babu', 'ECE', bid, 8, 'B', '23kp5a0411@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp5a0412@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP5A0412', '23KP5A0412', 'Narra', 'Sai Sasi Kumar', 'ECE', bid, 8, 'B', '23kp5a0412@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp5a0413@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP5A0413', '23KP5A0413', 'Rajaneedi', 'Sree Poojitha', 'ECE', bid, 8, 'B', '23kp5a0413@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp5a0415@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP5A0415', '23KP5A0415', 'Tatinati', 'Venkata Prasad', 'ECE', bid, 8, 'B', '23kp5a0415@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp5a0416@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP5A0416', '23KP5A0416', 'Vejendla', 'Gayatri', 'ECE', bid, 8, 'B', '23kp5a0416@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp5a0417@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP5A0417', '23KP5A0417', 'Yepuri', 'Pavan Sai', 'ECE', bid, 8, 'B', '23kp5a0417@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2021 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('21kp1a0416@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '21KP1A0416', '21KP1A0416', 'Bongarala', 'Nikhitha', 'ECE', bid, 8, 'B', '21kp1a0416@nriit.ac.in', '9999999999', '2021-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2021 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('21kp1a0475@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '21KP1A0475', '21KP1A0475', 'Medida', 'Praveen', 'ECE', bid, 8, 'B', '21kp1a0475@nriit.ac.in', '9999999999', '2021-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0467@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0467', '22KP1A0467', 'Pappula', 'Sai Kumar Reddy', 'ECE', bid, 8, 'B', '22kp1a0467@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0496@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0496', '22KP1A0496', 'Vanipenta', 'Pedda Gurava Reddy', 'ECE', bid, 8, 'B', '22kp1a0496@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a04a1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A04A1', '22KP1A04A1', 'Dasari', 'Sandhya', 'ECE', bid, 8, 'B', '22kp1a04a1@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0460@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0460', '22KP1A0460', 'Moguluri', 'Manikanta', 'ECE', bid, 8, 'B', '22kp1a0460@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0474@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0474', '22KP1A0474', 'Pittala', 'Praveen Kumar', 'ECE', bid, 8, 'B', '22kp1a0474@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0470@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0470', '22KP1A0470', 'Pathan', 'Imran', 'ECE', bid, 8, 'B', '22kp1a0470@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2021 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('21kp1a0406@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '21KP1A0406', '21KP1A0406', 'Bandla', 'Mahesh', 'ECE', bid, 8, 'B', '21kp1a0406@nriit.ac.in', '9999999999', '2021-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2021 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('21kp1a0483@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '21KP1A0483', '21KP1A0483', 'N.Anjan', 'Kumar', 'ECE', bid, 8, 'B', '21kp1a0483@nriit.ac.in', '9999999999', '2021-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0493@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0493', '22KP1A0493', 'Upputholla', 'Ashok', 'ECE', bid, 8, 'B', '22kp1a0493@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp5a0414@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP5A0414', '23KP5A0414', 'Sheik', 'Hajarath', 'ECE', bid, 8, 'B', '23kp5a0414@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0465@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0465', '22KP1A0465', 'Pandi', 'Lakshmi Narayana', 'ECE', bid, 8, 'B', '22kp1a0465@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0499@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0499', '22KP1A0499', 'Yakama', 'Dhanush', 'ECE', bid, 8, 'B', '22kp1a0499@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0469@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0469', '22KP1A0469', 'Patan', 'Nadeem Khan', 'ECE', bid, 8, 'B', '22kp1a0469@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a0471@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A0471', '22KP1A0471', 'Pathan', 'Suraj', 'ECE', bid, 8, 'B', '22kp1a0471@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d3801@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D3801', '25KP1D3801', 'Modugula', 'Manasa', 'ECE', bid, 1, 'A', '25kp1d3801@nriit.ac.in', '9014701054', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d3802@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D3802', '25KP1D3802', 'Vijaya', 'Kumar Garigipati', 'ECE', bid, 1, 'A', '25kp1d3802@nriit.ac.in', '9849562675', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d3803@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D3803', '25KP1D3803', 'Thokala', 'Sireesha', 'ECE', bid, 1, 'A', '25kp1d3803@nriit.ac.in', '9182338922', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d3801@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D3801', '24KP1D3801', 'Mekala', 'Naga Sirisha', 'ECE', bid, 4, 'A', '24kp1d3801@nriit.ac.in', '7893555990', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

END $$;

-- ===== EVT: 169 students =====
DO $$
DECLARE
    uid UUID;
    bid UUID;
BEGIN

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6601@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6601', '25KP1A6601', 'Ammisetti', 'Manikanta', 'EVT', bid, 1, 'A', '25kp1a6601@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6602@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6602', '25KP1A6602', 'Annapureddy', 'Ramya', 'EVT', bid, 1, 'A', '25kp1a6602@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6603@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6603', '25KP1A6603', 'Atchanala', 'Prasanna Mahesh', 'EVT', bid, 1, 'A', '25kp1a6603@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6604@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6604', '25KP1A6604', 'Billa', 'Sanjanita', 'EVT', bid, 1, 'A', '25kp1a6604@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6605@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6605', '25KP1A6605', 'Bommalapuram', 'Pavitra', 'EVT', bid, 1, 'A', '25kp1a6605@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6606@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6606', '25KP1A6606', 'Daggula', 'Akhila', 'EVT', bid, 1, 'A', '25kp1a6606@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6607@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6607', '25KP1A6607', 'Gannavarapu', 'Vinyay Kumar', 'EVT', bid, 1, 'A', '25kp1a6607@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6608@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6608', '25KP1A6608', 'Garikapati', 'Anusha', 'EVT', bid, 1, 'A', '25kp1a6608@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6609@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6609', '25KP1A6609', 'Gudipati', 'Banny', 'EVT', bid, 1, 'A', '25kp1a6609@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6610@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6610', '25KP1A6610', 'Hemanth', 'Ramulaalli', 'EVT', bid, 1, 'A', '25kp1a6610@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6611@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6611', '25KP1A6611', 'Issireddy', 'Venkata Nagendra Reddy', 'EVT', bid, 1, 'A', '25kp1a6611@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6612@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6612', '25KP1A6612', 'Kolluri', 'Lakshmi Manoj', 'EVT', bid, 1, 'A', '25kp1a6612@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6613@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6613', '25KP1A6613', 'Mannem', 'Siva', 'EVT', bid, 1, 'A', '25kp1a6613@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6614@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6614', '25KP1A6614', 'Mattupalli', 'Kishan Kumar', 'EVT', bid, 1, 'A', '25kp1a6614@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6615@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6615', '25KP1A6615', 'Meghavathu', 'Deepika Bai', 'EVT', bid, 1, 'A', '25kp1a6615@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6616@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6616', '25KP1A6616', 'Mutukuri', 'Syam', 'EVT', bid, 1, 'A', '25kp1a6616@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6617@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6617', '25KP1A6617', 'Namani', 'Narendra Kumar', 'EVT', bid, 1, 'A', '25kp1a6617@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6618@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6618', '25KP1A6618', 'Nanneboina', 'Srinivasa Rao', 'EVT', bid, 1, 'A', '25kp1a6618@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6619@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6619', '25KP1A6619', 'Padamati', 'Manideep Goud', 'EVT', bid, 1, 'A', '25kp1a6619@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6620@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6620', '25KP1A6620', 'Sayyad', 'Asiya', 'EVT', bid, 1, 'A', '25kp1a6620@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6621@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6621', '25KP1A6621', 'Shaik', 'Anifa', 'EVT', bid, 1, 'A', '25kp1a6621@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6622@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6622', '25KP1A6622', 'Shaik', 'Farhana', 'EVT', bid, 1, 'A', '25kp1a6622@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6623@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6623', '25KP1A6623', 'Shaik', 'Javeed', 'EVT', bid, 1, 'A', '25kp1a6623@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6624@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6624', '25KP1A6624', 'Shaik', 'Parvin Begam', 'EVT', bid, 1, 'A', '25kp1a6624@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6625@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6625', '25KP1A6625', 'Shaik', 'Sohel', 'EVT', bid, 1, 'A', '25kp1a6625@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6626@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6626', '25KP1A6626', 'Singu', 'Vyshnavi', 'EVT', bid, 1, 'A', '25kp1a6626@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6627@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6627', '25KP1A6627', 'Sonteni', 'Srijoshitha', 'EVT', bid, 1, 'A', '25kp1a6627@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6628@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6628', '25KP1A6628', 'Vangipurapu', 'Usha Tejaswi', 'EVT', bid, 1, 'A', '25kp1a6628@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6629@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6629', '25KP1A6629', 'Velpuri', 'Gopi Viswanadh', 'EVT', bid, 1, 'A', '25kp1a6629@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6630@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6630', '25KP1A6630', 'Yaddala', 'Yaswanth Pavan', 'EVT', bid, 1, 'A', '25kp1a6630@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6631@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6631', '25KP1A6631', 'Yalavarthi', 'Lokesh', 'EVT', bid, 1, 'A', '25kp1a6631@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a6632@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A6632', '25KP1A6632', 'Botla', 'Srinivasulu', 'EVT', bid, 1, 'A', '25kp1a6632@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6601@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6601', '24KP1A6601', 'Annapureddy', 'Sri Teja', 'EVT', bid, 4, 'A', '24kp1a6601@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6602@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6602', '24KP1A6602', 'Annem', 'Poojitha', 'EVT', bid, 4, 'A', '24kp1a6602@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6603@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6603', '24KP1A6603', 'Arabolu', 'Anil Kumar', 'EVT', bid, 4, 'A', '24kp1a6603@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6604@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6604', '24KP1A6604', 'Avulamanda', 'Hemanth', 'EVT', bid, 4, 'A', '24kp1a6604@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6605@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6605', '24KP1A6605', 'Bareddy', 'Srinivasa Reddy', 'EVT', bid, 4, 'A', '24kp1a6605@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6607@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6607', '24KP1A6607', 'Devalla', 'Anitha', 'EVT', bid, 4, 'A', '24kp1a6607@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6608@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6608', '24KP1A6608', 'Dhoolla', 'Hemalatha', 'EVT', bid, 4, 'A', '24kp1a6608@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6609@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6609', '24KP1A6609', 'Divi', 'Rajya Lakshmi', 'EVT', bid, 4, 'A', '24kp1a6609@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6611@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6611', '24KP1A6611', 'Edha', 'Baby Navya Sri', 'EVT', bid, 4, 'A', '24kp1a6611@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6612@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6612', '24KP1A6612', 'Garneni', 'Nikhila', 'EVT', bid, 4, 'A', '24kp1a6612@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6613@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6613', '24KP1A6613', 'Gella', 'Teja', 'EVT', bid, 4, 'A', '24kp1a6613@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6614@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6614', '24KP1A6614', 'Guda', 'Pavan Kumar Reddy', 'EVT', bid, 4, 'A', '24kp1a6614@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6615@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6615', '24KP1A6615', 'Gudibandi', 'Jyothiswar Reddy', 'EVT', bid, 4, 'A', '24kp1a6615@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6616@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6616', '24KP1A6616', 'Gundemadugula', 'Pranay Teja', 'EVT', bid, 4, 'A', '24kp1a6616@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6617@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6617', '24KP1A6617', 'Inturi', 'Naveen', 'EVT', bid, 4, 'A', '24kp1a6617@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6618@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6618', '24KP1A6618', 'Itham', 'Teja', 'EVT', bid, 4, 'A', '24kp1a6618@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6619@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6619', '24KP1A6619', 'Jada', 'Venkata Sai Jeethendra', 'EVT', bid, 4, 'A', '24kp1a6619@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6621@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6621', '24KP1A6621', 'Kadavakollu', 'Ramya Sri', 'EVT', bid, 4, 'A', '24kp1a6621@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6622@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6622', '24KP1A6622', 'Kurra', 'Chandragiri', 'EVT', bid, 4, 'A', '24kp1a6622@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6623@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6623', '24KP1A6623', 'Maidukuri', 'Dhanush', 'EVT', bid, 4, 'A', '24kp1a6623@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6624@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6624', '24KP1A6624', 'Malapati', 'Venkata Saikumar', 'EVT', bid, 4, 'A', '24kp1a6624@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6625@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6625', '24KP1A6625', 'Medisetty', 'Bharath Kumar', 'EVT', bid, 4, 'A', '24kp1a6625@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6626@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6626', '24KP1A6626', 'Narala', 'Tirumala Narasimha Teja Reddy', 'EVT', bid, 4, 'A', '24kp1a6626@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6627@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6627', '24KP1A6627', 'Padarthi', 'Mallika', 'EVT', bid, 4, 'A', '24kp1a6627@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6628@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6628', '24KP1A6628', 'Pala', 'Sai Krishna', 'EVT', bid, 4, 'A', '24kp1a6628@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6629@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6629', '24KP1A6629', 'Pasala', 'Jaswanth Raju', 'EVT', bid, 4, 'A', '24kp1a6629@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6630@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6630', '24KP1A6630', 'Patan', 'Rijwana', 'EVT', bid, 4, 'A', '24kp1a6630@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6631@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6631', '24KP1A6631', 'Pathapati', 'Keerthi', 'EVT', bid, 4, 'A', '24kp1a6631@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6632@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6632', '24KP1A6632', 'Pati', 'Govardhan', 'EVT', bid, 4, 'A', '24kp1a6632@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6633@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6633', '24KP1A6633', 'Pemmasani', 'Koteswara Rao', 'EVT', bid, 4, 'A', '24kp1a6633@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6634@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6634', '24KP1A6634', 'Phatan', 'Jalali', 'EVT', bid, 4, 'A', '24kp1a6634@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6635@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6635', '24KP1A6635', 'Potti', 'Yeswanth Ram Sai', 'EVT', bid, 4, 'A', '24kp1a6635@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6636@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6636', '24KP1A6636', 'Prattipati', 'Naga Triveni', 'EVT', bid, 4, 'A', '24kp1a6636@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6637@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6637', '24KP1A6637', 'Puli', 'Rosaiah', 'EVT', bid, 4, 'A', '24kp1a6637@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6638@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6638', '24KP1A6638', 'Rallabhandi', 'Venkata Naga Sai Sreekar', 'EVT', bid, 4, 'A', '24kp1a6638@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6639@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6639', '24KP1A6639', 'Ratcha', 'Keerthi Sasi Rekha', 'EVT', bid, 4, 'A', '24kp1a6639@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6640@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6640', '24KP1A6640', 'Sanikommu', 'Saranya Reddy', 'EVT', bid, 4, 'A', '24kp1a6640@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6643@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6643', '24KP1A6643', 'Shaik', 'Baasith', 'EVT', bid, 4, 'A', '24kp1a6643@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6645@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6645', '24KP1A6645', 'Shaik', 'John Ahmed', 'EVT', bid, 4, 'A', '24kp1a6645@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6646@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6646', '24KP1A6646', 'Shaik', 'Mahammad Saleem', 'EVT', bid, 4, 'A', '24kp1a6646@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6647@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6647', '24KP1A6647', 'Shaik', 'Mohammad Arif', 'EVT', bid, 4, 'A', '24kp1a6647@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6649@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6649', '24KP1A6649', 'Shaik', 'Shareef', 'EVT', bid, 4, 'A', '24kp1a6649@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6650@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6650', '24KP1A6650', 'Thota', 'Pavan Gopi', 'EVT', bid, 4, 'A', '24kp1a6650@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6651@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6651', '24KP1A6651', 'Thota', 'Venkata Vinod Kumar', 'EVT', bid, 4, 'A', '24kp1a6651@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6652@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6652', '24KP1A6652', 'Ubbarapu', 'Gopi', 'EVT', bid, 4, 'A', '24kp1a6652@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6653@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6653', '24KP1A6653', 'Vadlamudi', 'Maheswararao', 'EVT', bid, 4, 'A', '24kp1a6653@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6654@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6654', '24KP1A6654', 'Vallapaneni', 'Ganesh', 'EVT', bid, 4, 'A', '24kp1a6654@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6655@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6655', '24KP1A6655', 'Yarru', 'Gangadhar Rao', 'EVT', bid, 4, 'A', '24kp1a6655@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a6601@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A6601', '25KP5A6601', 'Addepalli', 'Subramanyam', 'EVT', bid, 4, 'A', '25kp5a6601@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a6602@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A6602', '25KP5A6602', 'Annapaneni', 'Sai Ram', 'EVT', bid, 4, 'A', '25kp5a6602@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a6603@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A6603', '25KP5A6603', 'Bangaru', 'Manjunadha Chari', 'EVT', bid, 4, 'A', '25kp5a6603@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a6604@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A6604', '25KP5A6604', 'Chattu', 'Sasi Kira Nsai', 'EVT', bid, 4, 'A', '25kp5a6604@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a6605@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A6605', '25KP5A6605', 'Dosakayalapati', 'Manoj Kumar', 'EVT', bid, 4, 'A', '25kp5a6605@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a6606@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A6606', '25KP5A6606', 'Gavvalapalli', 'Revanth Kumar', 'EVT', bid, 4, 'A', '25kp5a6606@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a6607@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A6607', '25KP5A6607', 'Jampa', 'Raju', 'EVT', bid, 4, 'A', '25kp5a6607@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a6608@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A6608', '25KP5A6608', 'Kancharla', 'Bhargav Ramu', 'EVT', bid, 4, 'A', '25kp5a6608@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a6609@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A6609', '25KP5A6609', 'Lomada', 'Baya Reddy Jaswanth Reddy', 'EVT', bid, 4, 'A', '25kp5a6609@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a6610@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A6610', '25KP5A6610', 'Simma', 'Rakesh', 'EVT', bid, 4, 'A', '25kp5a6610@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a6611@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A6611', '25KP5A6611', 'Thimmareddy', 'Dhanya Shri', 'EVT', bid, 4, 'A', '25kp5a6611@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6606@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6606', '24KP1A6606', 'Chopparapu', 'Pavan Kumar-Detained', 'EVT', bid, 4, 'A', '24kp1a6606@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6644@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6644', '24KP1A6644', 'Shaik', 'Bangaram', 'EVT', bid, 4, 'A', '24kp1a6644@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6620@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6620', '24KP1A6620', 'Juturi', 'Teja Sai', 'EVT', bid, 4, 'A', '24kp1a6620@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6641@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6641', '24KP1A6641', 'Shaik', 'Abdul Munaf', 'EVT', bid, 4, 'A', '24kp1a6641@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6642@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6642', '24KP1A6642', 'Shaik', 'Abdul Rasheed', 'EVT', bid, 4, 'A', '24kp1a6642@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6648@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6648', '24KP1A6648', 'Shaik', 'Rahamthula Shareef', 'EVT', bid, 4, 'A', '24kp1a6648@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a6610@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A6610', '24KP1A6610', 'Dondeti', 'Jyothirlatha Reddy', 'EVT', bid, 4, 'A', '24kp1a6610@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6602@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6602', '23KP1A6602', 'Battula', 'Sri Lakshmi', 'EVT', bid, 4, 'A', '23kp1a6602@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6603@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6603', '23KP1A6603', 'Bhimireddy', 'Rajyalakshmi', 'EVT', bid, 4, 'A', '23kp1a6603@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6605@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6605', '23KP1A6605', 'Chavali', 'Venkata Sankar Ayyannar', 'EVT', bid, 4, 'A', '23kp1a6605@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6606@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6606', '23KP1A6606', 'Daggupati', 'Lakshmi Venkat', 'EVT', bid, 4, 'A', '23kp1a6606@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6607@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6607', '23KP1A6607', 'Desam', 'Vyshnavi', 'EVT', bid, 4, 'A', '23kp1a6607@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6608@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6608', '23KP1A6608', 'Duggi', 'Bhanu Prathap Reddy', 'EVT', bid, 4, 'A', '23kp1a6608@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6610@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6610', '23KP1A6610', 'Gangisetty', 'Hema Siva Sai Kiran', 'EVT', bid, 4, 'A', '23kp1a6610@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6611@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6611', '23KP1A6611', 'Garla', 'Naveen', 'EVT', bid, 4, 'A', '23kp1a6611@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6612@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6612', '23KP1A6612', 'Guntupalli', 'Vidhya Jyothi', 'EVT', bid, 4, 'A', '23kp1a6612@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6613@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6613', '23KP1A6613', 'Kalisetty', 'Deepika', 'EVT', bid, 4, 'A', '23kp1a6613@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6614@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6614', '23KP1A6614', 'Karedla', 'Vinod Kumar', 'EVT', bid, 4, 'A', '23kp1a6614@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6616@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6616', '23KP1A6616', 'Kode', 'Hemanth Suresh Kumar', 'EVT', bid, 4, 'A', '23kp1a6616@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6617@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6617', '23KP1A6617', 'Koduru', 'Purna', 'EVT', bid, 4, 'A', '23kp1a6617@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6618@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6618', '23KP1A6618', 'Kommineni', 'Tulasiram', 'EVT', bid, 4, 'A', '23kp1a6618@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6621@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6621', '23KP1A6621', 'Maddipatla', 'Naga Rajesh', 'EVT', bid, 4, 'A', '23kp1a6621@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6622@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6622', '23KP1A6622', 'Maddirala', 'Venkatesh', 'EVT', bid, 4, 'A', '23kp1a6622@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6623@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6623', '23KP1A6623', 'Makkena', 'Lokesh', 'EVT', bid, 4, 'A', '23kp1a6623@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6625@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6625', '23KP1A6625', 'Mohammed', 'Junaid Ahmed', 'EVT', bid, 4, 'A', '23kp1a6625@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6626@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6626', '23KP1A6626', 'Mudraboina', 'Bhargava Narasimha', 'EVT', bid, 4, 'A', '23kp1a6626@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6627@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6627', '23KP1A6627', 'Mudraboina', 'Dinesh Kumar', 'EVT', bid, 4, 'A', '23kp1a6627@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6628@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6628', '23KP1A6628', 'Mule', 'Anji Reddy', 'EVT', bid, 4, 'A', '23kp1a6628@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6629@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6629', '23KP1A6629', 'Muvva', 'Sai Teja', 'EVT', bid, 4, 'A', '23kp1a6629@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6630@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6630', '23KP1A6630', 'Muvvala', 'Mahendra Sai', 'EVT', bid, 4, 'A', '23kp1a6630@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6631@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6631', '23KP1A6631', 'Nagam', 'Hemanth Nag', 'EVT', bid, 4, 'A', '23kp1a6631@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6632@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6632', '23KP1A6632', 'Nakka', 'Harsha Vardhan', 'EVT', bid, 4, 'A', '23kp1a6632@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6633@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6633', '23KP1A6633', 'Nandyala', 'Obula Reddy', 'EVT', bid, 4, 'A', '23kp1a6633@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6634@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6634', '23KP1A6634', 'Nimmala', 'Chiranjeevi', 'EVT', bid, 4, 'A', '23kp1a6634@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6635@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6635', '23KP1A6635', 'Palava', 'Gopaiah', 'EVT', bid, 4, 'A', '23kp1a6635@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6636@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6636', '23KP1A6636', 'Palvai', 'Ajay Kuamr', 'EVT', bid, 4, 'A', '23kp1a6636@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6637@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6637', '23KP1A6637', 'Pemmasani', 'Ashok', 'EVT', bid, 4, 'A', '23kp1a6637@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6638@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6638', '23KP1A6638', 'Pula', 'Rama Krishna', 'EVT', bid, 4, 'A', '23kp1a6638@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6639@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6639', '23KP1A6639', 'Puli', 'Srinadh Reddy', 'EVT', bid, 4, 'A', '23kp1a6639@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6640@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6640', '23KP1A6640', 'Pullagura', 'Sruthi', 'EVT', bid, 4, 'A', '23kp1a6640@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6641@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6641', '23KP1A6641', 'Reddy', 'Sravan Chandu', 'EVT', bid, 4, 'A', '23kp1a6641@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6642@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6642', '23KP1A6642', 'Shaik', 'Bellamkonda Pedda Nagur Hussain', 'EVT', bid, 4, 'A', '23kp1a6642@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6643@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6643', '23KP1A6643', 'Shaik', 'Janibasha', 'EVT', bid, 4, 'A', '23kp1a6643@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6644@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6644', '23KP1A6644', 'Shaik', 'Khalid Saifulla', 'EVT', bid, 4, 'A', '23kp1a6644@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6645@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6645', '23KP1A6645', 'Shaik', 'Mahammad Iqbal', 'EVT', bid, 4, 'A', '23kp1a6645@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6646@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6646', '23KP1A6646', 'Shaik', 'Mahammad Mahaboob', 'EVT', bid, 4, 'A', '23kp1a6646@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6648@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6648', '23KP1A6648', 'Shaik', 'Mohammad Faruk', 'EVT', bid, 4, 'A', '23kp1a6648@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6649@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6649', '23KP1A6649', 'Shaik', 'Rahamtulla', 'EVT', bid, 4, 'A', '23kp1a6649@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6650@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6650', '23KP1A6650', 'Shaik', 'Sameer Ahmed', 'EVT', bid, 4, 'A', '23kp1a6650@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6651@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6651', '23KP1A6651', 'Sunkara', 'Pavan Kumar', 'EVT', bid, 4, 'A', '23kp1a6651@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6653@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6653', '23KP1A6653', 'Yerragopu', 'Naga Moulika', 'EVT', bid, 4, 'A', '23kp1a6653@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6654@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6654', '23KP1A6654', 'Tellagadla', 'Amareswara Rao', 'EVT', bid, 4, 'A', '23kp1a6654@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6655@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6655', '23KP1A6655', 'Thodima', 'Venkata Harsha Vardhan Reddy', 'EVT', bid, 4, 'A', '23kp1a6655@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6656@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6656', '23KP1A6656', 'Thollamadugu', 'Jagadeesh', 'EVT', bid, 4, 'A', '23kp1a6656@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6657@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6657', '23KP1A6657', 'Thorati', 'Pravallika', 'EVT', bid, 4, 'A', '23kp1a6657@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6658@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6658', '23KP1A6658', 'Thota', 'Ashok', 'EVT', bid, 4, 'A', '23kp1a6658@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6659@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6659', '23KP1A6659', 'Thota', 'Saisekhar', 'EVT', bid, 4, 'A', '23kp1a6659@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6660@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6660', '23KP1A6660', 'Tumboora', 'Sri Lakshmi', 'EVT', bid, 4, 'A', '23kp1a6660@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6661@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6661', '23KP1A6661', 'Ummadisetti', 'Sridhar', 'EVT', bid, 4, 'A', '23kp1a6661@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6662@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6662', '23KP1A6662', 'Vangara', 'Raga Chandrika', 'EVT', bid, 4, 'A', '23kp1a6662@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6663@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6663', '23KP1A6663', 'Varikuti', 'Bharath Kumar', 'EVT', bid, 4, 'A', '23kp1a6663@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6664@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6664', '23KP1A6664', 'Veernapu', 'Avinash', 'EVT', bid, 4, 'A', '23kp1a6664@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6665@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6665', '23KP1A6665', 'Yarramsetty', 'Niranjan', 'EVT', bid, 4, 'A', '23kp1a6665@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp5a6601@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP5A6601', '24KP5A6601', 'Kali', 'Abhishek', 'EVT', bid, 4, 'A', '24kp5a6601@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp5a6602@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP5A6602', '24KP5A6602', 'Kandula', 'Lavanya', 'EVT', bid, 4, 'A', '24kp5a6602@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp5a6603@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP5A6603', '24KP5A6603', 'Lingam', 'Charan', 'EVT', bid, 4, 'A', '24kp5a6603@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp5a6604@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP5A6604', '24KP5A6604', 'Peddinti', 'Yugandhar', 'EVT', bid, 4, 'A', '24kp5a6604@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp5a6606@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP5A6606', '24KP5A6606', 'Syed', 'Asrarali', 'EVT', bid, 4, 'A', '24kp5a6606@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6624@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6624', '23KP1A6624', 'Manelli', 'Sarada', 'EVT', bid, 4, 'A', '23kp1a6624@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6647@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6647', '23KP1A6647', 'Shaik', 'Masthanvali', 'EVT', bid, 4, 'A', '23kp1a6647@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6652@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6652', '23KP1A6652', 'Tammisetti', 'Ganesh', 'EVT', bid, 4, 'A', '23kp1a6652@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6619@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6619', '23KP1A6619', 'Lakku', 'Madhava Reddy', 'EVT', bid, 4, 'A', '23kp1a6619@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp5a6605@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP5A6605', '24KP5A6605', 'Shaik', 'Nazma', 'EVT', bid, 4, 'A', '24kp5a6605@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6604@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6604', '23KP1A6604', 'Bollimuntha', 'Sri Lakshmi Priyanka', 'EVT', bid, 4, 'A', '23kp1a6604@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6615@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6615', '23KP1A6615', 'Kode', 'Gopi Krishna', 'EVT', bid, 4, 'A', '23kp1a6615@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6601@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6601', '23KP1A6601', 'Baligodugula', 'Manikanta', 'EVT', bid, 4, 'A', '23kp1a6601@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6609@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6609', '23KP1A6609', 'Enimireddy', 'Yalamanda Reddy', 'EVT', bid, 4, 'A', '23kp1a6609@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a6620@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A6620', '23KP1A6620', 'Lekkala', 'Venkatareddy', 'EVT', bid, 4, 'A', '23kp1a6620@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

END $$;

-- ===== IT: 331 students =====
DO $$
DECLARE
    uid UUID;
    bid UUID;
BEGIN

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1201@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1201', '25KP1A1201', 'Addanki', 'Kavya', 'IT', bid, 1, 'A', '25kp1a1201@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1202@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1202', '25KP1A1202', 'Ande', 'Mohan Kota Venkata Mahesh', 'IT', bid, 1, 'A', '25kp1a1202@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1203@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1203', '25KP1A1203', 'Arava', 'Deva Raj Kumar', 'IT', bid, 1, 'A', '25kp1a1203@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1204@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1204', '25KP1A1204', 'Avula', 'Gopala Krishna', 'IT', bid, 1, 'A', '25kp1a1204@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1205@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1205', '25KP1A1205', 'Bapathu', 'Sri Charith Reddy', 'IT', bid, 1, 'A', '25kp1a1205@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1206@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1206', '25KP1A1206', 'Battu', 'Mahesh', 'IT', bid, 1, 'A', '25kp1a1206@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1207@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1207', '25KP1A1207', 'Bolla', 'Saida Rao', 'IT', bid, 1, 'A', '25kp1a1207@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1208@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1208', '25KP1A1208', 'Botla', 'Gopi', 'IT', bid, 1, 'A', '25kp1a1208@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1209@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1209', '25KP1A1209', 'Challagunta', 'Kavitha', 'IT', bid, 1, 'A', '25kp1a1209@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1210@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1210', '25KP1A1210', 'Chattala', 'Dhanunjay', 'IT', bid, 1, 'A', '25kp1a1210@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1211@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1211', '25KP1A1211', 'Chavapati', 'Baji', 'IT', bid, 1, 'A', '25kp1a1211@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1212@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1212', '25KP1A1212', 'Dabbugottu', 'Yaswanth', 'IT', bid, 1, 'A', '25kp1a1212@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1213@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1213', '25KP1A1213', 'Dabbugottu', 'Nikhil', 'IT', bid, 1, 'A', '25kp1a1213@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1214@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1214', '25KP1A1214', 'Dammu', 'Ramanjaneyulu', 'IT', bid, 1, 'A', '25kp1a1214@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1215@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1215', '25KP1A1215', 'Danda', 'Venkata Nagarjuna Reddy', 'IT', bid, 1, 'A', '25kp1a1215@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1216@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1216', '25KP1A1216', 'Devangalla', 'Anitha', 'IT', bid, 1, 'A', '25kp1a1216@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1217@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1217', '25KP1A1217', 'Duggempudi', 'Akhil', 'IT', bid, 1, 'A', '25kp1a1217@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1218@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1218', '25KP1A1218', 'Eesireddy', 'Madhulatha Reddy', 'IT', bid, 1, 'A', '25kp1a1218@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1219@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1219', '25KP1A1219', 'Elchuri', 'Sivakrishna', 'IT', bid, 1, 'A', '25kp1a1219@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1220@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1220', '25KP1A1220', 'Gampala', 'Naveen', 'IT', bid, 1, 'A', '25kp1a1220@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1221@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1221', '25KP1A1221', 'Gannavarapu', 'Nagamani', 'IT', bid, 1, 'A', '25kp1a1221@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1222@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1222', '25KP1A1222', 'Gollapalli', 'Venu', 'IT', bid, 1, 'A', '25kp1a1222@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1223@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1223', '25KP1A1223', 'Gunturu', 'Prema Kannaiah', 'IT', bid, 1, 'A', '25kp1a1223@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1224@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1224', '25KP1A1224', 'Kaparouthu', 'Naga Venkata Sai', 'IT', bid, 1, 'A', '25kp1a1224@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1225@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1225', '25KP1A1225', 'Karnati', 'Indu', 'IT', bid, 1, 'A', '25kp1a1225@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1226@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1226', '25KP1A1226', 'Katta', 'Vanaja', 'IT', bid, 1, 'A', '25kp1a1226@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1227@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1227', '25KP1A1227', 'Kolakaluri', 'Yeswanth', 'IT', bid, 1, 'A', '25kp1a1227@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1228@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1228', '25KP1A1228', 'Kommirisetty', 'Pavan Kumar', 'IT', bid, 1, 'A', '25kp1a1228@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1229@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1229', '25KP1A1229', 'Kunisetti', 'Gopi Krishna', 'IT', bid, 1, 'A', '25kp1a1229@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1230@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1230', '25KP1A1230', 'Lingam', 'Lokesh', 'IT', bid, 1, 'A', '25kp1a1230@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1231@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1231', '25KP1A1231', 'Madathala', 'Mahendra Reddy', 'IT', bid, 1, 'A', '25kp1a1231@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1232@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1232', '25KP1A1232', 'Mandadi', 'Ramgopal Varma', 'IT', bid, 1, 'A', '25kp1a1232@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1233@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1233', '25KP1A1233', 'Maseedu', 'Mohammad Afroz', 'IT', bid, 1, 'A', '25kp1a1233@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1234@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1234', '25KP1A1234', 'Medarametla', 'Khyathi Sri', 'IT', bid, 1, 'A', '25kp1a1234@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1235@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1235', '25KP1A1235', 'Mekala', 'Tharun Kumar', 'IT', bid, 1, 'A', '25kp1a1235@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1236@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1236', '25KP1A1236', 'Mikkili', 'Prabhu Kiran', 'IT', bid, 1, 'A', '25kp1a1236@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1237@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1237', '25KP1A1237', 'Momin', 'Heera Yasmin', 'IT', bid, 1, 'A', '25kp1a1237@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1238@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1238', '25KP1A1238', 'Naga', 'Soujanya', 'IT', bid, 1, 'A', '25kp1a1238@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1239@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1239', '25KP1A1239', 'Nalabolu', 'Srinivasu', 'IT', bid, 1, 'A', '25kp1a1239@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1240@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1240', '25KP1A1240', 'Nandyala', 'Praveen Reddy', 'IT', bid, 1, 'A', '25kp1a1240@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1241@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1241', '25KP1A1241', 'Narra', 'Syam Babu', 'IT', bid, 1, 'A', '25kp1a1241@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1242@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1242', '25KP1A1242', 'Narra', 'Vikaas Chowdary', 'IT', bid, 1, 'A', '25kp1a1242@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1243@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1243', '25KP1A1243', 'Pachabatla', 'Ravi Babu', 'IT', bid, 1, 'A', '25kp1a1243@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1244@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1244', '25KP1A1244', 'Pagadala', 'Jaya Mallikarjun', 'IT', bid, 1, 'A', '25kp1a1244@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1245@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1245', '25KP1A1245', 'Panchakatla', 'Vijaya Babu', 'IT', bid, 1, 'A', '25kp1a1245@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1246@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1246', '25KP1A1246', 'Pandaraboina', 'Swami Yelu', 'IT', bid, 1, 'B', '25kp1a1246@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1247@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1247', '25KP1A1247', 'Pathan', 'Mohammad Sameer', 'IT', bid, 1, 'B', '25kp1a1247@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1248@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1248', '25KP1A1248', 'Peddarapu', 'Vijay Kumar', 'IT', bid, 1, 'B', '25kp1a1248@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1249@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1249', '25KP1A1249', 'Raavi', 'Bhavya', 'IT', bid, 1, 'B', '25kp1a1249@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1250@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1250', '25KP1A1250', 'Ravuri', 'Teja', 'IT', bid, 1, 'B', '25kp1a1250@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1251@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1251', '25KP1A1251', 'Rayala', 'Uma Harshitha', 'IT', bid, 1, 'B', '25kp1a1251@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1252@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1252', '25KP1A1252', 'Sarikonda', 'Pujitha', 'IT', bid, 1, 'B', '25kp1a1252@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1253@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1253', '25KP1A1253', 'Seepana', 'Karthik', 'IT', bid, 1, 'B', '25kp1a1253@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1254@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1254', '25KP1A1254', 'Shaik', 'Asif', 'IT', bid, 1, 'B', '25kp1a1254@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1255@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1255', '25KP1A1255', 'Shaik', 'Fahima Apsin', 'IT', bid, 1, 'B', '25kp1a1255@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1256@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1256', '25KP1A1256', 'Shaik', 'Hussen', 'IT', bid, 1, 'B', '25kp1a1256@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1257@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1257', '25KP1A1257', 'Shaik', 'Jahir Hossain', 'IT', bid, 1, 'B', '25kp1a1257@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1258@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1258', '25KP1A1258', 'Shaik', 'Moinuddin', 'IT', bid, 1, 'B', '25kp1a1258@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1259@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1259', '25KP1A1259', 'Shaik', 'Muneer', 'IT', bid, 1, 'B', '25kp1a1259@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1260@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1260', '25KP1A1260', 'Shaik', 'Nagur Hussain', 'IT', bid, 1, 'B', '25kp1a1260@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1261@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1261', '25KP1A1261', 'Shaik', 'Shafeer Ur Rehman', 'IT', bid, 1, 'B', '25kp1a1261@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1262@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1262', '25KP1A1262', 'Shaik', 'Shahid', 'IT', bid, 1, 'B', '25kp1a1262@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1263@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1263', '25KP1A1263', 'Shaik', 'Shoeb', 'IT', bid, 1, 'B', '25kp1a1263@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1264@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1264', '25KP1A1264', 'Shaik', 'Tanveer Raza', 'IT', bid, 1, 'B', '25kp1a1264@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1265@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1265', '25KP1A1265', 'Siddi', 'Suresh', 'IT', bid, 1, 'B', '25kp1a1265@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1266@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1266', '25KP1A1266', 'Somanaboyaina', 'Govinda Rajulu', 'IT', bid, 1, 'B', '25kp1a1266@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1267@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1267', '25KP1A1267', 'Syed', 'Umar Ali', 'IT', bid, 1, 'B', '25kp1a1267@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1268@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1268', '25KP1A1268', 'Tattugolla', 'Lakshmi Rajesh', 'IT', bid, 1, 'B', '25kp1a1268@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1269@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1269', '25KP1A1269', 'Thati', 'Avinash', 'IT', bid, 1, 'B', '25kp1a1269@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1270@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1270', '25KP1A1270', 'Thota', 'Sai Priya', 'IT', bid, 1, 'B', '25kp1a1270@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1271@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1271', '25KP1A1271', 'Uppu', 'Ashok', 'IT', bid, 1, 'B', '25kp1a1271@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1272@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1272', '25KP1A1272', 'Uyyuru', 'Ganesh', 'IT', bid, 1, 'B', '25kp1a1272@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1273@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1273', '25KP1A1273', 'Vallapuneni', 'Sudharani', 'IT', bid, 1, 'B', '25kp1a1273@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1274@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1274', '25KP1A1274', 'Veeravalli', 'Pradeep', 'IT', bid, 1, 'B', '25kp1a1274@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1275@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1275', '25KP1A1275', 'Vemula', 'Eswaraiah', 'IT', bid, 1, 'B', '25kp1a1275@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1276@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1276', '25KP1A1276', 'Vudara', 'Venkata Vijaya Lakshmi', 'IT', bid, 1, 'B', '25kp1a1276@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1277@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1277', '25KP1A1277', 'Yalamati', 'Manikanta Chowdary', 'IT', bid, 1, 'B', '25kp1a1277@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1278@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1278', '25KP1A1278', 'Yaragarla', 'Satyanarayana', 'IT', bid, 1, 'B', '25kp1a1278@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1279@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1279', '25KP1A1279', 'Yarrabothula', 'Vennela', 'IT', bid, 1, 'B', '25kp1a1279@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1280@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1280', '25KP1A1280', 'Yarragarla', 'Narendra Kumar', 'IT', bid, 1, 'B', '25kp1a1280@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1a1281@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1A1281', '25KP1A1281', 'Yenumula', 'Naga Ganesh', 'IT', bid, 1, 'B', '25kp1a1281@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1201@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1201', '24KP1A1201', 'Aravapalli', 'Venkata Supriya', 'IT', bid, 4, 'A', '24kp1a1201@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1202@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1202', '24KP1A1202', 'Bareddy', 'Lakshmi Kalyani', 'IT', bid, 4, 'A', '24kp1a1202@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1203@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1203', '24KP1A1203', 'Basam', 'Manohar', 'IT', bid, 4, 'A', '24kp1a1203@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1204@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1204', '24KP1A1204', 'Battula', 'Teja Sai', 'IT', bid, 4, 'A', '24kp1a1204@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1206@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1206', '24KP1A1206', 'Bhogireddy', 'Pardha Venkata Sai', 'IT', bid, 4, 'A', '24kp1a1206@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1208@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1208', '24KP1A1208', 'Bommisetty', 'Manjula', 'IT', bid, 4, 'A', '24kp1a1208@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1209@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1209', '24KP1A1209', 'Boppa', 'Lokesh Naga Kumar', 'IT', bid, 4, 'A', '24kp1a1209@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1210@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1210', '24KP1A1210', 'Challa', 'Raja Sree', 'IT', bid, 4, 'A', '24kp1a1210@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1212@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1212', '24KP1A1212', 'Durgam', 'Sanjeevan Datta', 'IT', bid, 4, 'A', '24kp1a1212@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1213@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1213', '24KP1A1213', 'Enibera', 'Manohar', 'IT', bid, 4, 'A', '24kp1a1213@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1214@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1214', '24KP1A1214', 'Gandham', 'Sandeep', 'IT', bid, 4, 'A', '24kp1a1214@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1215@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1215', '24KP1A1215', 'Gannupalli', 'Prem Chand', 'IT', bid, 4, 'A', '24kp1a1215@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1216@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1216', '24KP1A1216', 'Garnipudi', 'Gershome', 'IT', bid, 4, 'A', '24kp1a1216@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1217@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1217', '24KP1A1217', 'Godavarthi', 'Ram Charan', 'IT', bid, 4, 'A', '24kp1a1217@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1219@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1219', '24KP1A1219', 'Golla', 'Srinivasa Rao', 'IT', bid, 4, 'A', '24kp1a1219@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1220@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1220', '24KP1A1220', 'Guntupalli', 'Bharath Kumar', 'IT', bid, 4, 'A', '24kp1a1220@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1221@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1221', '24KP1A1221', 'Gurram', 'Sandeep', 'IT', bid, 4, 'A', '24kp1a1221@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1222@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1222', '24KP1A1222', 'Gurram', 'Srujana', 'IT', bid, 4, 'A', '24kp1a1222@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1223@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1223', '24KP1A1223', 'Inturi', 'Karthik', 'IT', bid, 4, 'A', '24kp1a1223@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1224@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1224', '24KP1A1224', 'Jada', 'Raja Naga Rajeswari', 'IT', bid, 4, 'A', '24kp1a1224@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1225@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1225', '24KP1A1225', 'Jonnalagadda', 'Mouni Sri', 'IT', bid, 4, 'A', '24kp1a1225@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1226@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1226', '24KP1A1226', 'Kakarla', 'Radha Krishna Mohan', 'IT', bid, 4, 'A', '24kp1a1226@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1227@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1227', '24KP1A1227', 'Kakumanu', 'Chandana', 'IT', bid, 4, 'A', '24kp1a1227@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1228@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1228', '24KP1A1228', 'Kamatham', 'Anuvendra Reddy', 'IT', bid, 4, 'A', '24kp1a1228@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1229@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1229', '24KP1A1229', 'Kambala', 'Anil', 'IT', bid, 4, 'A', '24kp1a1229@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1231@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1231', '24KP1A1231', 'Katuru', 'Lakshman', 'IT', bid, 4, 'A', '24kp1a1231@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1232@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1232', '24KP1A1232', 'Kelam', 'Sravanthi', 'IT', bid, 4, 'A', '24kp1a1232@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1233@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1233', '24KP1A1233', 'Krishtamsetty', 'Trinadh', 'IT', bid, 4, 'A', '24kp1a1233@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1234@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1234', '24KP1A1234', 'Kurapati', 'Santosh Kumar', 'IT', bid, 4, 'A', '24kp1a1234@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1235@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1235', '24KP1A1235', 'Kurra', 'Ganesh', 'IT', bid, 4, 'A', '24kp1a1235@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1236@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1236', '24KP1A1236', 'Linga', 'Triveni', 'IT', bid, 4, 'A', '24kp1a1236@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1237@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1237', '24KP1A1237', 'Madala', 'Purna Venkat', 'IT', bid, 4, 'A', '24kp1a1237@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1238@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1238', '24KP1A1238', 'Maguluri', 'Venkata Sruthi', 'IT', bid, 4, 'A', '24kp1a1238@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1239@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1239', '24KP1A1239', 'Mallampati', 'Karthik', 'IT', bid, 4, 'A', '24kp1a1239@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1240@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1240', '24KP1A1240', 'Manchala', 'Akhil', 'IT', bid, 4, 'A', '24kp1a1240@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1241@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1241', '24KP1A1241', 'Mandapati', 'Ramu', 'IT', bid, 4, 'A', '24kp1a1241@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1242@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1242', '24KP1A1242', 'Meerja', 'Asif Baig', 'IT', bid, 4, 'A', '24kp1a1242@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1243@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1243', '24KP1A1243', 'Meriga', 'Raju', 'IT', bid, 4, 'A', '24kp1a1243@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1244@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1244', '24KP1A1244', 'Moghal', 'Fahim Baig', 'IT', bid, 4, 'A', '24kp1a1244@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1245@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1245', '24KP1A1245', 'Mooraboina', 'Venkata Srinu', 'IT', bid, 4, 'A', '24kp1a1245@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1246@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1246', '24KP1A1246', 'Mudigonda', 'Naga Yesaswi Bhargav', 'IT', bid, 4, 'A', '24kp1a1246@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1247@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1247', '24KP1A1247', 'Mulaparthi', 'Charan Teja', 'IT', bid, 4, 'A', '24kp1a1247@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1248@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1248', '24KP1A1248', 'Munnaluri', 'N V S D S Ch K Jayanth', 'IT', bid, 4, 'A', '24kp1a1248@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1249@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1249', '24KP1A1249', 'Muthyam', 'Sudarshan Reddy', 'IT', bid, 4, 'A', '24kp1a1249@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1250@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1250', '24KP1A1250', 'Naga', 'Aravind', 'IT', bid, 4, 'A', '24kp1a1250@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1251@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1251', '24KP1A1251', 'Nagisetti', 'Sarika', 'IT', bid, 4, 'A', '24kp1a1251@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1252@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1252', '24KP1A1252', 'Namala', 'Venkata Chiranjeevi', 'IT', bid, 4, 'A', '24kp1a1252@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1253@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1253', '24KP1A1253', 'Narala', 'Bharghavi', 'IT', bid, 4, 'A', '24kp1a1253@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1254@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1254', '24KP1A1254', 'Narayana', 'Tharun Kumar', 'IT', bid, 4, 'A', '24kp1a1254@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1255@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1255', '24KP1A1255', 'Narravula', 'Navya', 'IT', bid, 4, 'A', '24kp1a1255@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1256@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1256', '24KP1A1256', 'Nimmakayala', 'Manvitha', 'IT', bid, 4, 'A', '24kp1a1256@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1257@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1257', '24KP1A1257', 'Nulu', 'Shankara Vara Prasad', 'IT', bid, 4, 'A', '24kp1a1257@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1258@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1258', '24KP1A1258', 'Palem', 'Venkatesh', 'IT', bid, 4, 'A', '24kp1a1258@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1259@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1259', '24KP1A1259', 'Pallapothula', 'Kotaiah', 'IT', bid, 4, 'A', '24kp1a1259@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1260@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1260', '24KP1A1260', 'Pallapu', 'Ajay', 'IT', bid, 4, 'A', '24kp1a1260@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1205@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1205', '24KP1A1205', 'Beeram', 'Nikhitha', 'IT', bid, 4, 'A', '24kp1a1205@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1211@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1211', '24KP1A1211', 'Chinthalapudi', 'Venkata Tharun', 'IT', bid, 4, 'A', '24kp1a1211@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1218@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1218', '24KP1A1218', 'Gogineni', 'Kiran', 'IT', bid, 4, 'A', '24kp1a1218@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1207@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1207', '24KP1A1207', 'Bole', 'Purna Chandu', 'IT', bid, 4, 'A', '24kp1a1207@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1230@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1230', '24KP1A1230', 'Katakam', 'Anil Kumar Reddy', 'IT', bid, 4, 'A', '24kp1a1230@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1261@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1261', '24KP1A1261', 'Pasumarthi', 'Venu', 'IT', bid, 4, 'B', '24kp1a1261@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1262@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1262', '24KP1A1262', 'Pasupuleti', 'Rahul', 'IT', bid, 4, 'B', '24kp1a1262@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1263@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1263', '24KP1A1263', 'Patan', 'Musthafa', 'IT', bid, 4, 'B', '24kp1a1263@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1264@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1264', '24KP1A1264', 'Pinapati', 'Akhil', 'IT', bid, 4, 'B', '24kp1a1264@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1266@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1266', '24KP1A1266', 'Poguluri', 'Nehemya', 'IT', bid, 4, 'B', '24kp1a1266@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1267@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1267', '24KP1A1267', 'Ponnekanti', 'Lakshmi Rajeswari', 'IT', bid, 4, 'B', '24kp1a1267@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1268@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1268', '24KP1A1268', 'Posina', 'Jaswanth Siva Ram', 'IT', bid, 4, 'B', '24kp1a1268@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1270@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1270', '24KP1A1270', 'Purimetla', 'Varaprasad', 'IT', bid, 4, 'B', '24kp1a1270@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1271@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1271', '24KP1A1271', 'Putta', 'Jahnavi', 'IT', bid, 4, 'B', '24kp1a1271@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1272@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1272', '24KP1A1272', 'Rallapalli', 'Sarath Chandra', 'IT', bid, 4, 'B', '24kp1a1272@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1273@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1273', '24KP1A1273', 'Ravipudi', 'Rohith Kumar', 'IT', bid, 4, 'B', '24kp1a1273@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1274@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1274', '24KP1A1274', 'Rudrapogu', 'Srinu', 'IT', bid, 4, 'B', '24kp1a1274@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1275@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1275', '24KP1A1275', 'Saanikommu', 'Jagadeshwar Reddy', 'IT', bid, 4, 'B', '24kp1a1275@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1276@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1276', '24KP1A1276', 'Shaik', 'Abdul Mathin', 'IT', bid, 4, 'B', '24kp1a1276@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1277@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1277', '24KP1A1277', 'Shaik', 'Ameer', 'IT', bid, 4, 'B', '24kp1a1277@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1278@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1278', '24KP1A1278', 'Shaik', 'Arshiya', 'IT', bid, 4, 'B', '24kp1a1278@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1279@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1279', '24KP1A1279', 'Shaik', 'Bifathima', 'IT', bid, 4, 'B', '24kp1a1279@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1280@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1280', '24KP1A1280', 'Shaik', 'Chandini', 'IT', bid, 4, 'B', '24kp1a1280@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1281@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1281', '24KP1A1281', 'Shaik', 'Mohammad Ali', 'IT', bid, 4, 'B', '24kp1a1281@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1282@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1282', '24KP1A1282', 'Shaik', 'Mohammed Gouse', 'IT', bid, 4, 'B', '24kp1a1282@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1283@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1283', '24KP1A1283', 'Shaik', 'Naseer', 'IT', bid, 4, 'B', '24kp1a1283@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1284@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1284', '24KP1A1284', 'Shaik', 'Rizwan', 'IT', bid, 4, 'B', '24kp1a1284@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1285@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1285', '24KP1A1285', 'Shaik', 'Sameera', 'IT', bid, 4, 'B', '24kp1a1285@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1287@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1287', '24KP1A1287', 'Siddu', 'Purna Sai', 'IT', bid, 4, 'B', '24kp1a1287@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1288@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1288', '24KP1A1288', 'Sivadhi', 'Manoj Kumar', 'IT', bid, 4, 'B', '24kp1a1288@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1289@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1289', '24KP1A1289', 'Somula', 'Ankitha', 'IT', bid, 4, 'B', '24kp1a1289@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1290@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1290', '24KP1A1290', 'Swarna', 'Venkata Sai Vinay', 'IT', bid, 4, 'B', '24kp1a1290@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1291@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1291', '24KP1A1291', 'Syed', 'Irfan', 'IT', bid, 4, 'B', '24kp1a1291@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1292@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1292', '24KP1A1292', 'Syed', 'Saloni', 'IT', bid, 4, 'B', '24kp1a1292@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1293@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1293', '24KP1A1293', 'Telukutla', 'Venkatesh', 'IT', bid, 4, 'B', '24kp1a1293@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1294@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1294', '24KP1A1294', 'Tumati', 'V V Prem Kumar', 'IT', bid, 4, 'B', '24kp1a1294@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1295@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1295', '24KP1A1295', 'Vallu', 'Manogna', 'IT', bid, 4, 'B', '24kp1a1295@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1296@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1296', '24KP1A1296', 'Vattikuti', 'Mounika Sri', 'IT', bid, 4, 'B', '24kp1a1296@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1297@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1297', '24KP1A1297', 'Veeralla', 'Jaswanth', 'IT', bid, 4, 'B', '24kp1a1297@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1298@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1298', '24KP1A1298', 'Vemula', 'Hari Vardhan', 'IT', bid, 4, 'B', '24kp1a1298@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1299@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1299', '24KP1A1299', 'Yaddanapudi', 'Sai Charanya', 'IT', bid, 4, 'B', '24kp1a1299@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a12a0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A12A0', '24KP1A12A0', 'Yarragopula', 'Sai Naga Krishna', 'IT', bid, 4, 'B', '24kp1a12a0@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp5a1201@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP5A1201', '25KP5A1201', 'Peddisetty', 'Venkata Subramanyam', 'IT', bid, 4, 'B', '25kp5a1201@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1265@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1265', '24KP1A1265', 'Pindrathi', 'Vijay Kumar', 'IT', bid, 4, 'B', '24kp1a1265@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1269@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1269', '24KP1A1269', 'Pulagam', 'Naga Karthikeya Reddy', 'IT', bid, 4, 'B', '24kp1a1269@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1a1286@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1A1286', '24KP1A1286', 'Shaik', 'Subhani', 'IT', bid, 4, 'B', '24kp1a1286@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1231@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1231', '23KP1A1231', 'Nalluri', 'Charan Sai', 'IT', bid, 4, 'A', '23kp1a1231@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1201@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1201', '23KP1A1201', 'Annaladasu', 'Gopi Chandu', 'IT', bid, 4, 'A', '23kp1a1201@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1202@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1202', '23KP1A1202', 'Appapurapu', 'Sumanth', 'IT', bid, 4, 'A', '23kp1a1202@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1203@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1203', '23KP1A1203', 'Arekuti', 'Sowmya', 'IT', bid, 4, 'A', '23kp1a1203@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1204@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1204', '23KP1A1204', 'Bellamkonda', 'Mohan Teja', 'IT', bid, 4, 'A', '23kp1a1204@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1205@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1205', '23KP1A1205', 'Birudugadda', 'Dilleep Kumar', 'IT', bid, 4, 'A', '23kp1a1205@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1206@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1206', '23KP1A1206', 'Bulla', 'Jagadeesh', 'IT', bid, 4, 'A', '23kp1a1206@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1207@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1207', '23KP1A1207', 'Yelnidhi', 'Kiran Kumar Chowdary', 'IT', bid, 4, 'A', '23kp1a1207@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1208@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1208', '23KP1A1208', 'Chukka', 'Sparjan Raju', 'IT', bid, 4, 'A', '23kp1a1208@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1209@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1209', '23KP1A1209', 'Daggupati', 'Venkateswarlu', 'IT', bid, 4, 'A', '23kp1a1209@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1210@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1210', '23KP1A1210', 'Eesirrddy', 'Sai Prasanna Reddy', 'IT', bid, 4, 'A', '23kp1a1210@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1212@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1212', '23KP1A1212', 'Gollapudi', 'Nani', 'IT', bid, 4, 'A', '23kp1a1212@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1214@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1214', '23KP1A1214', 'Kandrakonda', 'Karthik', 'IT', bid, 4, 'A', '23kp1a1214@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1215@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1215', '23KP1A1215', 'Kante', 'Sai Teja', 'IT', bid, 4, 'A', '23kp1a1215@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1216@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1216', '23KP1A1216', 'Kilaru', 'Ramya Sree', 'IT', bid, 4, 'A', '23kp1a1216@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1217@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1217', '23KP1A1217', 'Kolusu', 'Durga Srihari', 'IT', bid, 4, 'A', '23kp1a1217@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1218@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1218', '23KP1A1218', 'Kommu', 'Niteesh Kumar', 'IT', bid, 4, 'A', '23kp1a1218@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1219@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1219', '23KP1A1219', 'Koppolu', 'Mounika', 'IT', bid, 4, 'A', '23kp1a1219@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1220@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1220', '23KP1A1220', 'Kuchipudi', 'Siva Koteswara Rao', 'IT', bid, 4, 'A', '23kp1a1220@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1222@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1222', '23KP1A1222', 'Maguluri', 'Gopi', 'IT', bid, 4, 'A', '23kp1a1222@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1223@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1223', '23KP1A1223', 'Malleboyina', 'Harish', 'IT', bid, 4, 'A', '23kp1a1223@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1225@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1225', '23KP1A1225', 'Medarametla', 'Hema', 'IT', bid, 4, 'A', '23kp1a1225@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1226@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1226', '23KP1A1226', 'Mohammad', 'Saifulla Baig', 'IT', bid, 4, 'A', '23kp1a1226@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1228@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1228', '23KP1A1228', 'Naga', 'Venkata Sudarshan Medepalli', 'IT', bid, 4, 'A', '23kp1a1228@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1229@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1229', '23KP1A1229', 'Nagandla', 'Sowmya', 'IT', bid, 4, 'A', '23kp1a1229@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1230@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1230', '23KP1A1230', 'Nagisetty', 'Sandeep', 'IT', bid, 4, 'A', '23kp1a1230@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1232@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1232', '23KP1A1232', 'Nimmala', 'Gowtham Sai', 'IT', bid, 4, 'A', '23kp1a1232@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1233@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1233', '23KP1A1233', 'Pamarthi', 'Sivamanikanta', 'IT', bid, 4, 'A', '23kp1a1233@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1234@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1234', '23KP1A1234', 'Parimi', 'Prem Tej', 'IT', bid, 4, 'A', '23kp1a1234@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1235@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1235', '23KP1A1235', 'Patapati', 'Anil', 'IT', bid, 4, 'A', '23kp1a1235@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1236@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1236', '23KP1A1236', 'Patchikarla', 'Naveen', 'IT', bid, 4, 'A', '23kp1a1236@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1237@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1237', '23KP1A1237', 'Pathan', 'Inthiyaz Khan', 'IT', bid, 4, 'A', '23kp1a1237@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1238@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1238', '23KP1A1238', 'Pathan', 'Subhani', 'IT', bid, 4, 'A', '23kp1a1238@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1240@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1240', '23KP1A1240', 'Poluri', 'Lakshmi Aswitha', 'IT', bid, 4, 'A', '23kp1a1240@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1241@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1241', '23KP1A1241', 'Puli', 'Anitha', 'IT', bid, 4, 'A', '23kp1a1241@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1244@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1244', '23KP1A1244', 'Rayala', 'Vijay Kumar', 'IT', bid, 4, 'A', '23kp1a1244@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1245@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1245', '23KP1A1245', 'Rayidi', 'Surendra', 'IT', bid, 4, 'A', '23kp1a1245@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1246@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1246', '23KP1A1246', 'Shaik', 'Afiya', 'IT', bid, 4, 'A', '23kp1a1246@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1247@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1247', '23KP1A1247', 'Shaik', 'Afroz', 'IT', bid, 4, 'A', '23kp1a1247@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1248@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1248', '23KP1A1248', 'Shaik', 'Akhil Basha', 'IT', bid, 4, 'A', '23kp1a1248@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1249@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1249', '23KP1A1249', 'Shaik', 'Azhar', 'IT', bid, 4, 'A', '23kp1a1249@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1250@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1250', '23KP1A1250', 'Shaik', 'Dodleru Peer Vali', 'IT', bid, 4, 'A', '23kp1a1250@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1251@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1251', '23KP1A1251', 'Shaik', 'Fayaz', 'IT', bid, 4, 'A', '23kp1a1251@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1252@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1252', '23KP1A1252', 'Shaik', 'Mubeena', 'IT', bid, 4, 'A', '23kp1a1252@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1253@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1253', '23KP1A1253', 'Shaik', 'Sadhika', 'IT', bid, 4, 'A', '23kp1a1253@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1254@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1254', '23KP1A1254', 'Suripogu', 'Vijay', 'IT', bid, 4, 'A', '23kp1a1254@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1255@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1255', '23KP1A1255', 'Syed', 'Tanzeela', 'IT', bid, 4, 'A', '23kp1a1255@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1256@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1256', '23KP1A1256', 'Thorlikonda', 'Manisha', 'IT', bid, 4, 'A', '23kp1a1256@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1257@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1257', '23KP1A1257', 'Thota', 'Srilekha', 'IT', bid, 4, 'A', '23kp1a1257@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1258@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1258', '23KP1A1258', 'Tippanaboina', 'Sirisha', 'IT', bid, 4, 'A', '23kp1a1258@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1260@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1260', '23KP1A1260', 'Vallepu', 'Lakshmi Narayana', 'IT', bid, 4, 'A', '23kp1a1260@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1262@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1262', '23KP1A1262', 'Velchuri', 'Rajasekhar', 'IT', bid, 4, 'A', '23kp1a1262@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1263@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1263', '23KP1A1263', 'Viswanadhapalli', 'Gopi Charan', 'IT', bid, 4, 'A', '23kp1a1263@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1264@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1264', '23KP1A1264', 'Voleti', 'Kavya Sri', 'IT', bid, 4, 'A', '23kp1a1264@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp5a1201@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP5A1201', '24KP5A1201', 'Gurram', 'Vamsi Krishna', 'IT', bid, 4, 'A', '24kp5a1201@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp5a1202@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP5A1202', '24KP5A1202', 'Patan', 'Heena Begun', 'IT', bid, 4, 'A', '24kp5a1202@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp5a1203@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP5A1203', '24KP5A1203', 'Shaik', 'Althaf', 'IT', bid, 4, 'A', '24kp5a1203@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1224@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1224', '23KP1A1224', 'Matturi', 'Prasannanjaneyulu', 'IT', bid, 4, 'A', '23kp1a1224@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1242@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1242', '23KP1A1242', 'Ramireddy', 'Navya', 'IT', bid, 4, 'A', '23kp1a1242@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1259@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1259', '23KP1A1259', 'Uppathi', 'Sri Lakshmi', 'IT', bid, 4, 'A', '23kp1a1259@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1243@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1243', '23KP1A1243', 'Ravipati', 'Manasa', 'IT', bid, 4, 'A', '23kp1a1243@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1211@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1211', '23KP1A1211', 'Elasagaram', 'Mahesh', 'IT', bid, 4, 'A', '23kp1a1211@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1221@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1221', '23KP1A1221', 'Kunchala', 'Ganesh', 'IT', bid, 4, 'A', '23kp1a1221@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1239@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1239', '23KP1A1239', 'Pathapati', 'Sanjay Reddy', 'IT', bid, 4, 'A', '23kp1a1239@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1213@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1213', '23KP1A1213', 'Kanadam', 'Sai Vijayendranadh', 'IT', bid, 4, 'A', '23kp1a1213@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1227@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1227', '23KP1A1227', 'Morla', 'Ramu', 'IT', bid, 4, 'A', '23kp1a1227@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('23kp1a1261@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '23KP1A1261', '23KP1A1261', 'Vangala', 'Koteswara Rao', 'IT', bid, 4, 'A', '23kp1a1261@nriit.ac.in', '9999999999', '2023-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1201@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1201', '22KP1A1201', 'Ambati', 'Venkateswara Rao', 'IT', bid, 8, 'A', '22kp1a1201@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1202@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1202', '22KP1A1202', 'Annaparthi', 'Anil Kumar', 'IT', bid, 8, 'A', '22kp1a1202@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1204@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1204', '22KP1A1204', 'Bitragunta', 'Prabhu Anil Kumar', 'IT', bid, 8, 'A', '22kp1a1204@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1205@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1205', '22KP1A1205', 'Bommineni', 'Manasa', 'IT', bid, 8, 'A', '22kp1a1205@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1207@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1207', '22KP1A1207', 'Buddula', 'Rama Devi', 'IT', bid, 8, 'A', '22kp1a1207@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1208@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1208', '22KP1A1208', 'Daggubati', 'Jaya Durga Srinivas', 'IT', bid, 8, 'A', '22kp1a1208@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1209@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1209', '22KP1A1209', 'Damineni', 'Sri Lakshmi Triveni', 'IT', bid, 8, 'A', '22kp1a1209@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1210@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1210', '22KP1A1210', 'Dodda', 'Rakesh', 'IT', bid, 8, 'A', '22kp1a1210@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1211@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1211', '22KP1A1211', 'Dudekula', 'Gousya Bi', 'IT', bid, 8, 'A', '22kp1a1211@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1212@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1212', '22KP1A1212', 'Eeda', 'Sivaramakrishna Reddy', 'IT', bid, 8, 'A', '22kp1a1212@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1213@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1213', '22KP1A1213', 'Gandra', 'Srinivasa Reddy', 'IT', bid, 8, 'A', '22kp1a1213@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1214@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1214', '22KP1A1214', 'Gangiredla', 'Satish Naidu', 'IT', bid, 8, 'A', '22kp1a1214@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1215@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1215', '22KP1A1215', 'Gayam', 'Tulasiram Reddy', 'IT', bid, 8, 'A', '22kp1a1215@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1216@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1216', '22KP1A1216', 'Gongati', 'Yaswanth', 'IT', bid, 8, 'A', '22kp1a1216@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1217@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1217', '22KP1A1217', 'Gorrepati', 'Prasanna', 'IT', bid, 8, 'A', '22kp1a1217@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1218@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1218', '22KP1A1218', 'Gosipatala', 'Samialu', 'IT', bid, 8, 'A', '22kp1a1218@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1220@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1220', '22KP1A1220', 'Gutha', 'Bharath Kumar', 'IT', bid, 8, 'A', '22kp1a1220@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1221@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1221', '22KP1A1221', 'Guttikonda', 'Chandra Manobhiram', 'IT', bid, 8, 'A', '22kp1a1221@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1223@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1223', '22KP1A1223', 'Kota', 'Sai Koti', 'IT', bid, 8, 'A', '22kp1a1223@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1224@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1224', '22KP1A1224', 'Kothamasu', 'Surya Brahma Tej', 'IT', bid, 8, 'A', '22kp1a1224@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1225@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1225', '22KP1A1225', 'Mirimpalli', 'Asha Jyothi', 'IT', bid, 8, 'A', '22kp1a1225@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1226@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1226', '22KP1A1226', 'Nagulapati', 'Tejaswi Rama', 'IT', bid, 8, 'A', '22kp1a1226@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1227@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1227', '22KP1A1227', 'Nalabolu', 'Kishore', 'IT', bid, 8, 'A', '22kp1a1227@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1228@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1228', '22KP1A1228', 'Nallamothu', 'Dhanush', 'IT', bid, 8, 'A', '22kp1a1228@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1229@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1229', '22KP1A1229', 'Namburu', 'Dheeraj', 'IT', bid, 8, 'A', '22kp1a1229@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1230@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1230', '22KP1A1230', 'Nanduri', 'John Vesli', 'IT', bid, 8, 'A', '22kp1a1230@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1231@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1231', '22KP1A1231', 'Narapureddy', 'Nagaraju', 'IT', bid, 8, 'A', '22kp1a1231@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1232@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1232', '22KP1A1232', 'Nemalithoka', 'Phanendra Kumar', 'IT', bid, 8, 'A', '22kp1a1232@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1233@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1233', '22KP1A1233', 'Nimmagadda', 'Naga Phanimdra', 'IT', bid, 8, 'A', '22kp1a1233@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1234@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1234', '22KP1A1234', 'Pagidipalli', 'Rajesh', 'IT', bid, 8, 'A', '22kp1a1234@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1235@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1235', '22KP1A1235', 'Palisetty', 'Usha Rani', 'IT', bid, 8, 'A', '22kp1a1235@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1237@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1237', '22KP1A1237', 'Pendli', 'Ravi Teja', 'IT', bid, 8, 'A', '22kp1a1237@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1238@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1238', '22KP1A1238', 'Podapati', 'Thirumala Rao', 'IT', bid, 8, 'A', '22kp1a1238@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1239@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1239', '22KP1A1239', 'Podhila', 'Anil Kumar', 'IT', bid, 8, 'A', '22kp1a1239@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1240@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1240', '22KP1A1240', 'Potla', 'Anitha', 'IT', bid, 8, 'A', '22kp1a1240@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1241@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1241', '22KP1A1241', 'Pula', 'Sandeep', 'IT', bid, 8, 'A', '22kp1a1241@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1242@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1242', '22KP1A1242', 'Saleendra', 'Abhi Ram', 'IT', bid, 8, 'A', '22kp1a1242@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1243@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1243', '22KP1A1243', 'Shaik', 'Abdul Rafiya', 'IT', bid, 8, 'A', '22kp1a1243@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1244@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1244', '22KP1A1244', 'Shaik', 'Shahista', 'IT', bid, 8, 'A', '22kp1a1244@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1245@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1245', '22KP1A1245', 'Shaik', 'Sharmila', 'IT', bid, 8, 'A', '22kp1a1245@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1246@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1246', '22KP1A1246', 'Shaik', 'Shaziya', 'IT', bid, 8, 'A', '22kp1a1246@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1247@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1247', '22KP1A1247', 'Singu', 'Bhavani', 'IT', bid, 8, 'A', '22kp1a1247@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1248@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1248', '22KP1A1248', 'Suda', 'Kishore Babu', 'IT', bid, 8, 'A', '22kp1a1248@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1250@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1250', '22KP1A1250', 'Tadi', 'Mohana Pavani', 'IT', bid, 8, 'A', '22kp1a1250@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1251@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1251', '22KP1A1251', 'Tanniru', 'Raju', 'IT', bid, 8, 'A', '22kp1a1251@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1252@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1252', '22KP1A1252', 'Tatikonda', 'Madhav Sharath', 'IT', bid, 8, 'A', '22kp1a1252@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1253@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1253', '22KP1A1253', 'Tholuchuri', 'Sudheer Raju', 'IT', bid, 8, 'A', '22kp1a1253@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1254@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1254', '22KP1A1254', 'Thota', 'Naveen', 'IT', bid, 8, 'A', '22kp1a1254@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1255@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1255', '22KP1A1255', 'Thummapudi', 'Sunil', 'IT', bid, 8, 'A', '22kp1a1255@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1256@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1256', '22KP1A1256', 'Tupakula', 'Shaik Sameer', 'IT', bid, 8, 'A', '22kp1a1256@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1258@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1258', '22KP1A1258', 'Vemula', 'Dakshayani', 'IT', bid, 8, 'A', '22kp1a1258@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1259@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1259', '22KP1A1259', 'Vunnam', 'Gopi', 'IT', bid, 8, 'A', '22kp1a1259@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1260@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1260', '22KP1A1260', 'Yalamandala', 'Srinivas', 'IT', bid, 8, 'A', '22kp1a1260@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1261@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1261', '22KP1A1261', 'Yarra', 'Rajesh', 'IT', bid, 8, 'A', '22kp1a1261@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1203@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1203', '22KP1A1203', 'Bejjam', 'Surya Teja', 'IT', bid, 8, 'A', '22kp1a1203@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1222@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1222', '22KP1A1222', 'Kaki', 'Siri Babu', 'IT', bid, 8, 'A', '22kp1a1222@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1236@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1236', '22KP1A1236', 'Panidam', 'Lakshmi Narasimha Manohar', 'IT', bid, 8, 'A', '22kp1a1236@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1249@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1249', '22KP1A1249', 'Suram', 'Abhani', 'IT', bid, 8, 'A', '22kp1a1249@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1219@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1219', '22KP1A1219', 'Gurram', 'Naresh', 'IT', bid, 8, 'A', '22kp1a1219@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1206@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1206', '22KP1A1206', 'Boreddy', 'Venkata Subba Rami Reddy', 'IT', bid, 8, 'A', '22kp1a1206@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('22kp1a1257@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '22KP1A1257', '22KP1A1257', 'Veerisetty', 'Vijaya Lakshmi', 'IT', bid, 8, 'A', '22kp1a1257@nriit.ac.in', '9999999999', '2022-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2021 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('21kp1a1204@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '21KP1A1204', '21KP1A1204', 'Chennamsetty', 'Chandrika', 'IT', bid, 8, 'A', '21kp1a1204@nriit.ac.in', '9999999999', '2021-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d8701@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D8701', '25KP1D8701', 'Bhavanam', 'Ganesh Kumar Reddy', 'IT', bid, 1, 'A', '25kp1d8701@nriit.ac.in', '8985665926', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d8702@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D8702', '25KP1D8702', 'Ch', 'Prasanakumar', 'IT', bid, 1, 'A', '25kp1d8702@nriit.ac.in', '9440440455', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d8703@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D8703', '25KP1D8703', 'Cheedara', 'Venkatesh', 'IT', bid, 1, 'A', '25kp1d8703@nriit.ac.in', '7075900900', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d8704@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D8704', '25KP1D8704', 'Darukumalli', 'Vedavathi', 'IT', bid, 1, 'A', '25kp1d8704@nriit.ac.in', '6381372135', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d8705@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D8705', '25KP1D8705', 'Kothakota', 'Sai Bhanu', 'IT', bid, 1, 'A', '25kp1d8705@nriit.ac.in', '9398421968', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d8706@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D8706', '25KP1D8706', 'Nelavalli', 'Saraswathi Devi', 'IT', bid, 1, 'A', '25kp1d8706@nriit.ac.in', '7386785618', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d8707@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D8707', '25KP1D8707', 'Pasupuleti', 'Gopi', 'IT', bid, 1, 'A', '25kp1d8707@nriit.ac.in', '9948541932', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d8708@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D8708', '25KP1D8708', 'Ramisetty', 'Bhargav', 'IT', bid, 1, 'A', '25kp1d8708@nriit.ac.in', '9553257301', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d8709@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D8709', '25KP1D8709', 'Sanikommu', 'Madhava', 'IT', bid, 1, 'A', '25kp1d8709@nriit.ac.in', '8309533210', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d8710@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D8710', '25KP1D8710', 'Shaik', 'Mohammad Mansoor Shariff', 'IT', bid, 1, 'A', '25kp1d8710@nriit.ac.in', '9182077913', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1d8711@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1D8711', '25KP1D8711', 'Vejalla', 'Balakrishna Chowdary', 'IT', bid, 1, 'A', '25kp1d8711@nriit.ac.in', '9490959844', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d8701@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D8701', '24KP1D8701', 'Bhavana', 'Ravali', 'IT', bid, 4, 'A', '24kp1d8701@nriit.ac.in', '7036350555', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d8702@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D8702', '24KP1D8702', 'Pathan', 'Bahadur Khan', 'IT', bid, 4, 'A', '24kp1d8702@nriit.ac.in', '7032317232', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d8703@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D8703', '24KP1D8703', 'Shaik', 'Nazeerahmad', 'IT', bid, 4, 'A', '24kp1d8703@nriit.ac.in', '9963169046', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d8704@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D8704', '24KP1D8704', 'Tirapataiah', 'Muvva', 'IT', bid, 4, 'A', '24kp1d8704@nriit.ac.in', '9000771282', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d8705@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D8705', '24KP1D8705', 'Kommineni', 'Sravanthi', 'IT', bid, 4, 'A', '24kp1d8705@nriit.ac.in', '9030929215', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d8706@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D8706', '24KP1D8706', 'Tirumasetty', 'Gopi Trinadh', 'IT', bid, 4, 'A', '24kp1d8706@nriit.ac.in', '8501004518', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d8707@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D8707', '24KP1D8707', 'Mannam', 'Kumari', 'IT', bid, 4, 'A', '24kp1d8707@nriit.ac.in', '9110583586', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d8708@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D8708', '24KP1D8708', 'Alla', 'Ashakiran', 'IT', bid, 4, 'A', '24kp1d8708@nriit.ac.in', '9581119411', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1d8709@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1D8709', '24KP1D8709', 'Sagani', 'Lakshmi Narayana Reddy', 'IT', bid, 4, 'A', '24kp1d8709@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

END $$;

-- ===== MBA: 206 students =====
DO $$
DECLARE
    uid UUID;
    bid UUID;
BEGIN

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0001@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0001', '25KP1E0001', 'Akkinapalli', 'Haritha', 'MBA', bid, 1, 'A', '25kp1e0001@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0002@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0002', '25KP1E0002', 'Alawala', 'Priyanka', 'MBA', bid, 1, 'A', '25kp1e0002@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0003@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0003', '25KP1E0003', 'Aleti', 'Ashok Kumar', 'MBA', bid, 1, 'A', '25kp1e0003@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0004@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0004', '25KP1E0004', 'Annapureddy', 'Vishnupriya', 'MBA', bid, 1, 'A', '25kp1e0004@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0005@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0005', '25KP1E0005', 'Arekonda', 'Adikesava', 'MBA', bid, 1, 'A', '25kp1e0005@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0006@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0006', '25KP1E0006', 'Balasani', 'Ravi', 'MBA', bid, 1, 'A', '25kp1e0006@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0007@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0007', '25KP1E0007', 'Baluguri', 'Premchand', 'MBA', bid, 1, 'A', '25kp1e0007@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0008@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0008', '25KP1E0008', 'Balusupati', 'Anil Kumar', 'MBA', bid, 1, 'A', '25kp1e0008@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0009@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0009', '25KP1E0009', 'Bandaru', 'Sravani', 'MBA', bid, 1, 'A', '25kp1e0009@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0010@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0010', '25KP1E0010', 'Bandhanadham', 'Harshitha', 'MBA', bid, 1, 'A', '25kp1e0010@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0011@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0011', '25KP1E0011', 'Bandi', 'Chandu', 'MBA', bid, 1, 'A', '25kp1e0011@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0012@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0012', '25KP1E0012', 'Bellamkonda', 'Gopi Babu', 'MBA', bid, 1, 'A', '25kp1e0012@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0013@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0013', '25KP1E0013', 'Bolla', 'Venkata Mohan Reddy', 'MBA', bid, 1, 'A', '25kp1e0013@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0014@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0014', '25KP1E0014', 'Bollikonda', 'Anil Kumar', 'MBA', bid, 1, 'A', '25kp1e0014@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0015@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0015', '25KP1E0015', 'Bonda', 'Bala Venkata Sumanth', 'MBA', bid, 1, 'A', '25kp1e0015@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0016@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0016', '25KP1E0016', 'Bondalapati', 'Raja Srinivasa Rao', 'MBA', bid, 1, 'A', '25kp1e0016@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0017@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0017', '25KP1E0017', 'Bondili', 'Varsha', 'MBA', bid, 1, 'A', '25kp1e0017@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0018@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0018', '25KP1E0018', 'Borupothu', 'Sudheer', 'MBA', bid, 1, 'A', '25kp1e0018@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0019@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0019', '25KP1E0019', 'Chandaluri', 'Sathish', 'MBA', bid, 1, 'A', '25kp1e0019@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0020@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0020', '25KP1E0020', 'Chilaka', 'Harsha Vardhan', 'MBA', bid, 1, 'A', '25kp1e0020@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0021@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0021', '25KP1E0021', 'Chillapalli', 'Srilakshmi', 'MBA', bid, 1, 'A', '25kp1e0021@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0022@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0022', '25KP1E0022', 'Chintabattina', 'Raja Sekhar', 'MBA', bid, 1, 'A', '25kp1e0022@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0023@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0023', '25KP1E0023', 'Chintala', 'Cheruvu Sameera', 'MBA', bid, 1, 'A', '25kp1e0023@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0024@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0024', '25KP1E0024', 'Chirumamilla', 'Lakshmi Prasanna', 'MBA', bid, 1, 'A', '25kp1e0024@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0025@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0025', '25KP1E0025', 'Chirumamilla', 'Narendra', 'MBA', bid, 1, 'A', '25kp1e0025@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0026@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0026', '25KP1E0026', 'Chunchu', 'Ravi Sankar', 'MBA', bid, 1, 'A', '25kp1e0026@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0027@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0027', '25KP1E0027', 'Dasari', 'Aswani', 'MBA', bid, 1, 'A', '25kp1e0027@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0028@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0028', '25KP1E0028', 'Dasari', 'Venkata Kalpana', 'MBA', bid, 1, 'A', '25kp1e0028@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0029@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0029', '25KP1E0029', 'Devandla', 'Pavani', 'MBA', bid, 1, 'A', '25kp1e0029@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0030@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0030', '25KP1E0030', 'Shaik', 'Mahaboob Subhani', 'MBA', bid, 1, 'A', '25kp1e0030@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0031@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0031', '25KP1E0031', 'Erugula', 'Srilatha', 'MBA', bid, 1, 'A', '25kp1e0031@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0032@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0032', '25KP1E0032', 'Gaddam', 'Sampath', 'MBA', bid, 1, 'A', '25kp1e0032@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0033@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0033', '25KP1E0033', 'Ganta', 'Bhavani', 'MBA', bid, 1, 'A', '25kp1e0033@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0034@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0034', '25KP1E0034', 'Garikipati', 'Teja', 'MBA', bid, 1, 'A', '25kp1e0034@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0035@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0035', '25KP1E0035', 'Kutam', 'Avinash', 'MBA', bid, 1, 'A', '25kp1e0035@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0036@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0036', '25KP1E0036', 'Govindu', 'Venkatesh', 'MBA', bid, 1, 'A', '25kp1e0036@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0037@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0037', '25KP1E0037', 'Gowri', 'Sri Chandana', 'MBA', bid, 1, 'A', '25kp1e0037@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0038@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0038', '25KP1E0038', 'Gowripattapu', 'Chandra Skhar', 'MBA', bid, 1, 'A', '25kp1e0038@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0039@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0039', '25KP1E0039', 'Gudikandula', 'Sravanthi', 'MBA', bid, 1, 'A', '25kp1e0039@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0040@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0040', '25KP1E0040', 'Gudipudi', 'Vamsi', 'MBA', bid, 1, 'A', '25kp1e0040@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0041@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0041', '25KP1E0041', 'Gujjarlapudi', 'Yaswanth Raju', 'MBA', bid, 1, 'A', '25kp1e0041@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0042@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0042', '25KP1E0042', 'Gundala', 'Saloman', 'MBA', bid, 1, 'A', '25kp1e0042@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0043@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0043', '25KP1E0043', 'Jillella', 'Adi Kesava Reddy', 'MBA', bid, 1, 'A', '25kp1e0043@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0044@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0044', '25KP1E0044', 'Kambhampati', 'Nivas', 'MBA', bid, 1, 'A', '25kp1e0044@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0045@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0045', '25KP1E0045', 'Kancharala', 'Ankineeduprasad', 'MBA', bid, 1, 'A', '25kp1e0045@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0046@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0046', '25KP1E0046', 'Kancharla', 'Enesh', 'MBA', bid, 1, 'A', '25kp1e0046@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0047@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0047', '25KP1E0047', 'Katamreddy', 'Sravani', 'MBA', bid, 1, 'A', '25kp1e0047@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0048@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0048', '25KP1E0048', 'Katteboina', 'Durga Soujanya', 'MBA', bid, 1, 'A', '25kp1e0048@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0049@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0049', '25KP1E0049', 'Kethavath', 'Sri Lekha', 'MBA', bid, 1, 'A', '25kp1e0049@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0050@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0050', '25KP1E0050', 'Kodimela', 'Annamaiah', 'MBA', bid, 1, 'A', '25kp1e0050@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0051@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0051', '25KP1E0051', 'Kolakaluri', 'Bharghavi', 'MBA', bid, 1, 'A', '25kp1e0051@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0052@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0052', '25KP1E0052', 'Kommalapati', 'Amulya', 'MBA', bid, 1, 'A', '25kp1e0052@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0053@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0053', '25KP1E0053', 'Konda', 'Amith Vardhan', 'MBA', bid, 1, 'A', '25kp1e0053@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0054@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0054', '25KP1E0054', 'Kondeti', 'Chandra Sekhar Nag Amahesh', 'MBA', bid, 1, 'A', '25kp1e0054@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0055@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0055', '25KP1E0055', 'Kornepati', 'Dayakar', 'MBA', bid, 1, 'A', '25kp1e0055@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0056@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0056', '25KP1E0056', 'Kudala', 'Vinay Ramesh', 'MBA', bid, 1, 'A', '25kp1e0056@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0057@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0057', '25KP1E0057', 'Kumkam', 'Ramalingam', 'MBA', bid, 1, 'A', '25kp1e0057@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0058@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0058', '25KP1E0058', 'Kummari', 'Supriya', 'MBA', bid, 1, 'A', '25kp1e0058@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0059@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0059', '25KP1E0059', 'Macherla', 'Mary Sangeetha', 'MBA', bid, 1, 'A', '25kp1e0059@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0060@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0060', '25KP1E0060', 'Maddu', 'Roshini', 'MBA', bid, 1, 'A', '25kp1e0060@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0061@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0061', '25KP1E0061', 'Maganti', 'Sruthi', 'MBA', bid, 1, 'B', '25kp1e0061@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0062@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0062', '25KP1E0062', 'Macherla', 'Kotesh', 'MBA', bid, 1, 'B', '25kp1e0062@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0063@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0063', '25KP1E0063', 'Mannem', 'Vimala Jyothi', 'MBA', bid, 1, 'B', '25kp1e0063@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0064@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0064', '25KP1E0064', 'Matta', 'Yugandhar Surya Prakash', 'MBA', bid, 1, 'B', '25kp1e0064@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0065@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0065', '25KP1E0065', 'Meesala', 'Manikanta Venkata Gopi', 'MBA', bid, 1, 'B', '25kp1e0065@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0066@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0066', '25KP1E0066', 'Melam', 'Ambedkar', 'MBA', bid, 1, 'B', '25kp1e0066@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0067@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0067', '25KP1E0067', 'Naga', 'Phanindra Akkinapali', 'MBA', bid, 1, 'B', '25kp1e0067@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0068@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0068', '25KP1E0068', 'Nagendla', 'Prathyusha', 'MBA', bid, 1, 'B', '25kp1e0068@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0069@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0069', '25KP1E0069', 'Yenibera', 'Ruben', 'MBA', bid, 1, 'B', '25kp1e0069@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0070@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0070', '25KP1E0070', 'Nakka', 'Srinivasa Rao', 'MBA', bid, 1, 'B', '25kp1e0070@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0071@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0071', '25KP1E0071', 'Nallagorla', 'Jhansi Asha', 'MBA', bid, 1, 'B', '25kp1e0071@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0072@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0072', '25KP1E0072', 'Nandala', 'Mamata', 'MBA', bid, 1, 'B', '25kp1e0072@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0073@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0073', '25KP1E0073', 'Nasana', 'Anka Venu', 'MBA', bid, 1, 'B', '25kp1e0073@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0074@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0074', '25KP1E0074', 'Neelam', 'Lakshmi Bhuvaneswari', 'MBA', bid, 1, 'B', '25kp1e0074@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0075@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0075', '25KP1E0075', 'Pagadala', 'Venkata Siva Rama Krishna', 'MBA', bid, 1, 'B', '25kp1e0075@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0076@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0076', '25KP1E0076', 'Palla', 'Gopi', 'MBA', bid, 1, 'B', '25kp1e0076@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0077@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0077', '25KP1E0077', 'Pallapu', 'Harsha Sai Pavani', 'MBA', bid, 1, 'B', '25kp1e0077@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0078@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0078', '25KP1E0078', 'Pallepogu', 'Sasidhar', 'MBA', bid, 1, 'B', '25kp1e0078@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0079@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0079', '25KP1E0079', 'Pandi', 'Venkata Mohana Krishna', 'MBA', bid, 1, 'B', '25kp1e0079@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0080@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0080', '25KP1E0080', 'Pathan', 'Sharmila Farhana', 'MBA', bid, 1, 'B', '25kp1e0080@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0081@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0081', '25KP1E0081', 'Pathan', 'Sufiya', 'MBA', bid, 1, 'B', '25kp1e0081@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0082@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0082', '25KP1E0082', 'Peddeeti', 'Chinna', 'MBA', bid, 1, 'B', '25kp1e0082@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0083@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0083', '25KP1E0083', 'Peddinti', 'Siva Ganesh', 'MBA', bid, 1, 'B', '25kp1e0083@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0084@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0084', '25KP1E0084', 'Perusomula', 'Lakshman', 'MBA', bid, 1, 'B', '25kp1e0084@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0085@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0085', '25KP1E0085', 'Pilli', 'Bharathi', 'MBA', bid, 1, 'B', '25kp1e0085@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0086@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0086', '25KP1E0086', 'Pinneboyina', 'Ushasri', 'MBA', bid, 1, 'B', '25kp1e0086@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0087@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0087', '25KP1E0087', 'Ponnekanti', 'Priyanka', 'MBA', bid, 1, 'B', '25kp1e0087@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0088@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0088', '25KP1E0088', 'Ponugupati', 'Mohan Sankar', 'MBA', bid, 1, 'B', '25kp1e0088@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0089@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0089', '25KP1E0089', 'Prathipati', 'Dharani', 'MBA', bid, 1, 'B', '25kp1e0089@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0090@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0090', '25KP1E0090', 'Ps', 'Harish Chndra Prasad', 'MBA', bid, 1, 'B', '25kp1e0090@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0091@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0091', '25KP1E0091', 'Puchakayala', 'Govardhan Reddy', 'MBA', bid, 1, 'B', '25kp1e0091@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0092@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0092', '25KP1E0092', 'Pulamala', 'Venu', 'MBA', bid, 1, 'B', '25kp1e0092@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0093@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0093', '25KP1E0093', 'Puli', 'Sukhumar Raj', 'MBA', bid, 1, 'B', '25kp1e0093@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0094@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0094', '25KP1E0094', 'Ramayanam', 'Naresh', 'MBA', bid, 1, 'B', '25kp1e0094@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0095@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0095', '25KP1E0095', 'Rayadurga', 'Raji', 'MBA', bid, 1, 'B', '25kp1e0095@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0096@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0096', '25KP1E0096', 'Sandepagu', 'Persi', 'MBA', bid, 1, 'B', '25kp1e0096@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0097@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0097', '25KP1E0097', 'Shaik', 'Aneef', 'MBA', bid, 1, 'B', '25kp1e0097@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0098@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0098', '25KP1E0098', 'Shaik', 'Asish', 'MBA', bid, 1, 'B', '25kp1e0098@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e0099@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E0099', '25KP1E0099', 'Shaik', 'Jansaidha', 'MBA', bid, 1, 'B', '25kp1e0099@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e00a0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E00A0', '25KP1E00A0', 'Shaik', 'Natal Rafi', 'MBA', bid, 1, 'B', '25kp1e00a0@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e00a1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E00A1', '25KP1E00A1', 'Shaik', 'Vaseem Akram', 'MBA', bid, 1, 'B', '25kp1e00a1@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e00a2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E00A2', '25KP1E00A2', 'Siddu', 'Naga Bhuvanesh', 'MBA', bid, 1, 'B', '25kp1e00a2@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e00a3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E00A3', '25KP1E00A3', 'Soma', 'Lakshmi Archana', 'MBA', bid, 1, 'B', '25kp1e00a3@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e00a4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E00A4', '25KP1E00A4', 'Suvvana', 'Manikanta', 'MBA', bid, 1, 'B', '25kp1e00a4@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e00a5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E00A5', '25KP1E00A5', 'Syed', 'Madhar Vali', 'MBA', bid, 1, 'B', '25kp1e00a5@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e00a6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E00A6', '25KP1E00A6', 'Talluri', 'Vijaya Kumar', 'MBA', bid, 1, 'B', '25kp1e00a6@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e00a7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E00A7', '25KP1E00A7', 'Tavvagunta', 'Farhana', 'MBA', bid, 1, 'B', '25kp1e00a7@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e00a8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E00A8', '25KP1E00A8', 'Thalathoti', 'Sandhya', 'MBA', bid, 1, 'B', '25kp1e00a8@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e00a9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E00A9', '25KP1E00A9', 'Thoka', 'Anusha', 'MBA', bid, 1, 'B', '25kp1e00a9@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e00b0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E00B0', '25KP1E00B0', 'Tumati', 'Naga Jyothi', 'MBA', bid, 1, 'B', '25kp1e00b0@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e00b1@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E00B1', '25KP1E00B1', 'Tumati', 'Venugopal', 'MBA', bid, 1, 'B', '25kp1e00b1@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e00b2@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E00B2', '25KP1E00B2', 'Tummala', 'Yedukondalu', 'MBA', bid, 1, 'B', '25kp1e00b2@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e00b3@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E00B3', '25KP1E00B3', 'Turaka', 'Rahul Kumar', 'MBA', bid, 1, 'B', '25kp1e00b3@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e00b4@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E00B4', '25KP1E00B4', 'Udatha', 'Sri Lakshmi Thirupathamma', 'MBA', bid, 1, 'B', '25kp1e00b4@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e00b5@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E00B5', '25KP1E00B5', 'Vadalasetti', 'Maruthi Sai', 'MBA', bid, 1, 'B', '25kp1e00b5@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e00b6@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E00B6', '25KP1E00B6', 'Vangipuri', 'Yamini', 'MBA', bid, 1, 'B', '25kp1e00b6@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e00b7@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E00B7', '25KP1E00B7', 'Vattikonda', 'Yagna Prasanna Bala Gopi', 'MBA', bid, 1, 'B', '25kp1e00b7@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e00b8@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E00B8', '25KP1E00B8', 'Venna', 'Giri Chandra', 'MBA', bid, 1, 'B', '25kp1e00b8@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e00b9@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E00B9', '25KP1E00B9', 'Yalamaledi', 'Anand', 'MBA', bid, 1, 'B', '25kp1e00b9@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1e00c0@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1E00C0', '25KP1E00C0', 'Yanamadala', 'Usha Rani', 'MBA', bid, 1, 'B', '25kp1e00c0@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0001@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0001', '24KP1E0001', 'A', 'Sirisa', 'MBA', bid, 4, 'A', '24kp1e0001@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0002@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0002', '24KP1E0002', 'Andhe', 'Naga Siva Reddy', 'MBA', bid, 4, 'A', '24kp1e0002@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0003@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0003', '24KP1E0003', 'Annem', 'Ravi Sekhar Reddy', 'MBA', bid, 4, 'A', '24kp1e0003@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0004@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0004', '24KP1E0004', 'Bainaboyina', 'Sai Prasanna Lakshmi', 'MBA', bid, 4, 'A', '24kp1e0004@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0005@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0005', '24KP1E0005', 'Bontha', 'Vamsi', 'MBA', bid, 4, 'A', '24kp1e0005@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0006@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0006', '24KP1E0006', 'Bontha', 'Vineel Gautham', 'MBA', bid, 4, 'A', '24kp1e0006@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0009@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0009', '24KP1E0009', 'Chavapati', 'Sowhel', 'MBA', bid, 4, 'A', '24kp1e0009@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0010@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0010', '24KP1E0010', 'Chilaka', 'Chinnari Ooha', 'MBA', bid, 4, 'A', '24kp1e0010@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0013@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0013', '24KP1E0013', 'Deevarapalli', 'Kusuma', 'MBA', bid, 4, 'A', '24kp1e0013@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0014@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0014', '24KP1E0014', 'Duggi', 'Rajesh', 'MBA', bid, 4, 'A', '24kp1e0014@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0016@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0016', '24KP1E0016', 'Gade', 'Pavani', 'MBA', bid, 4, 'A', '24kp1e0016@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0017@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0017', '24KP1E0017', 'Gangarapu', 'Pavan Kumar', 'MBA', bid, 4, 'A', '24kp1e0017@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0018@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0018', '24KP1E0018', 'Gangavarapu', 'Venkatesh', 'MBA', bid, 4, 'A', '24kp1e0018@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0019@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0019', '24KP1E0019', 'Gangula', 'Raju', 'MBA', bid, 4, 'A', '24kp1e0019@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0020@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0020', '24KP1E0020', 'Ganji', 'Triveni', 'MBA', bid, 4, 'A', '24kp1e0020@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0021@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0021', '24KP1E0021', 'Gogula', 'Tharun Babu', 'MBA', bid, 4, 'A', '24kp1e0021@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0022@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0022', '24KP1E0022', 'Gorantla', 'Krishna', 'MBA', bid, 4, 'A', '24kp1e0022@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0023@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0023', '24KP1E0023', 'Gorantla', 'Padma Jyothi', 'MBA', bid, 4, 'A', '24kp1e0023@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0024@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0024', '24KP1E0024', 'Gottam', 'Gayathri', 'MBA', bid, 4, 'A', '24kp1e0024@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0025@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0025', '24KP1E0025', 'Inturi', 'Praveen', 'MBA', bid, 4, 'A', '24kp1e0025@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0026@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0026', '24KP1E0026', 'Jallella', 'Bharath Singh', 'MBA', bid, 4, 'A', '24kp1e0026@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0027@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0027', '24KP1E0027', 'Jallella', 'Gopal Singh', 'MBA', bid, 4, 'A', '24kp1e0027@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0028@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0028', '24KP1E0028', 'Kadiyala', 'Anvesh', 'MBA', bid, 4, 'A', '24kp1e0028@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0029@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0029', '24KP1E0029', 'Kaniguntla', 'Christu Raju', 'MBA', bid, 4, 'A', '24kp1e0029@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0030@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0030', '24KP1E0030', 'Katari', 'Srinivasarao', 'MBA', bid, 4, 'A', '24kp1e0030@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0031@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0031', '24KP1E0031', 'Kattula', 'Ganesh Babu', 'MBA', bid, 4, 'A', '24kp1e0031@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0033@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0033', '24KP1E0033', 'Kondameeda', 'Sailaja', 'MBA', bid, 4, 'A', '24kp1e0033@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0034@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0034', '24KP1E0034', 'Kotapati', 'Abhinaya Karthik', 'MBA', bid, 4, 'A', '24kp1e0034@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0036@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0036', '24KP1E0036', 'Kunchapu', 'Bhargavi', 'MBA', bid, 4, 'A', '24kp1e0036@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0037@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0037', '24KP1E0037', 'Kunisetti', 'Punyavathi', 'MBA', bid, 4, 'A', '24kp1e0037@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0038@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0038', '24KP1E0038', 'Madana', 'Samba Siva Reddy', 'MBA', bid, 4, 'A', '24kp1e0038@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0039@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0039', '24KP1E0039', 'Madasu', 'Bharath Manoj Kumar', 'MBA', bid, 4, 'A', '24kp1e0039@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0040@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0040', '24KP1E0040', 'Mannam', 'Sanny', 'MBA', bid, 4, 'A', '24kp1e0040@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0041@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0041', '24KP1E0041', 'Mannem', 'Lakshmikanth', 'MBA', bid, 4, 'A', '24kp1e0041@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0042@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0042', '24KP1E0042', 'Merikapudi', 'Sireesha', 'MBA', bid, 4, 'A', '24kp1e0042@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0043@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0043', '24KP1E0043', 'Mohammad', 'Karishma', 'MBA', bid, 4, 'A', '24kp1e0043@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0044@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0044', '24KP1E0044', 'Mohammad', 'Rasool', 'MBA', bid, 4, 'A', '24kp1e0044@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0045@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0045', '24KP1E0045', 'Mudimelapu', 'Venkata Ramana Reddy', 'MBA', bid, 4, 'A', '24kp1e0045@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0046@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0046', '24KP1E0046', 'Nagisetty', 'Yedukondalu', 'MBA', bid, 4, 'A', '24kp1e0046@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0048@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0048', '24KP1E0048', 'Nallabothula', 'Venkata Nithyesh', 'MBA', bid, 4, 'A', '24kp1e0048@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0049@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0049', '24KP1E0049', 'Neelam', 'Nagalakshmi', 'MBA', bid, 4, 'A', '24kp1e0049@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0050@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0050', '24KP1E0050', 'Nekarukanti', 'Srilatha', 'MBA', bid, 4, 'A', '24kp1e0050@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0051@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0051', '24KP1E0051', 'Nimmaganti', 'Veena', 'MBA', bid, 4, 'A', '24kp1e0051@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0052@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0052', '24KP1E0052', 'Prathipati', 'Rohit Babu', 'MBA', bid, 4, 'A', '24kp1e0052@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0053@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0053', '24KP1E0053', 'Patibandla', 'Jhonson', 'MBA', bid, 4, 'A', '24kp1e0053@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0054@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0054', '24KP1E0054', 'Pentiboina', 'Mounika Sai', 'MBA', bid, 4, 'A', '24kp1e0054@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0055@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0055', '24KP1E0055', 'Seshani', 'Siva Shankar', 'MBA', bid, 4, 'A', '24kp1e0055@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0056@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0056', '24KP1E0056', 'Shaik', 'Karishma', 'MBA', bid, 4, 'A', '24kp1e0056@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0058@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0058', '24KP1E0058', 'Singadi', 'Mahesh Babu', 'MBA', bid, 4, 'A', '24kp1e0058@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0059@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0059', '24KP1E0059', 'Sivangula', 'Srinivasa Rao', 'MBA', bid, 4, 'A', '24kp1e0059@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0060@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0060', '24KP1E0060', 'Sure', 'Lavanya', 'MBA', bid, 4, 'A', '24kp1e0060@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0061@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0061', '24KP1E0061', 'Sure', 'Ravi Teja', 'MBA', bid, 4, 'A', '24kp1e0061@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0062@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0062', '24KP1E0062', 'Syed', 'Ashraf', 'MBA', bid, 4, 'A', '24kp1e0062@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0063@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0063', '24KP1E0063', 'Syed', 'Jan Bi', 'MBA', bid, 4, 'A', '24kp1e0063@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0064@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0064', '24KP1E0064', 'Tata', 'Vishnu Vardhan Babu', 'MBA', bid, 4, 'A', '24kp1e0064@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0067@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0067', '24KP1E0067', 'Tumma', 'Anusha', 'MBA', bid, 4, 'A', '24kp1e0067@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0068@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0068', '24KP1E0068', 'Veeranki', 'Tarun', 'MBA', bid, 4, 'A', '24kp1e0068@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0070@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0070', '24KP1E0070', 'Vasa', 'Ravindra', 'MBA', bid, 4, 'A', '24kp1e0070@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0072@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0072', '24KP1E0072', 'Yaragalla', 'Sai Venkata Prakash', 'MBA', bid, 4, 'A', '24kp1e0072@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0076@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0076', '24KP1E0076', 'Laghuvarapu', 'Jyothi', 'MBA', bid, 4, 'A', '24kp1e0076@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0077@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0077', '24KP1E0077', 'Satuluri', 'Harika Sravanthi', 'MBA', bid, 4, 'A', '24kp1e0077@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0079@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0079', '24KP1E0079', 'Shaik', 'Sardar', 'MBA', bid, 4, 'A', '24kp1e0079@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0081@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0081', '24KP1E0081', 'Bathula', 'Pavan Kalyan', 'MBA', bid, 4, 'A', '24kp1e0081@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0082@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0082', '24KP1E0082', 'Sankula', 'Sankar', 'MBA', bid, 4, 'A', '24kp1e0082@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0085@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0085', '24KP1E0085', 'Dokka', 'Nithin', 'MBA', bid, 4, 'A', '24kp1e0085@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0086@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0086', '24KP1E0086', 'Grandhi', 'Anil Anka Rao', 'MBA', bid, 4, 'A', '24kp1e0086@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0007@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0007', '24KP1E0007', 'Buddareddy', 'Ramana Reddy', 'MBA', bid, 4, 'A', '24kp1e0007@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0008@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0008', '24KP1E0008', 'Chandolu', 'Manneiah', 'MBA', bid, 4, 'A', '24kp1e0008@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0011@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0011', '24KP1E0011', 'Chinnam', 'Ashok', 'MBA', bid, 4, 'A', '24kp1e0011@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0012@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0012', '24KP1E0012', 'Chinthakayala', 'Nagasri Gowri', 'MBA', bid, 4, 'A', '24kp1e0012@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0015@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0015', '24KP1E0015', 'Endla', 'Srikanth', 'MBA', bid, 4, 'A', '24kp1e0015@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0035@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0035', '24KP1E0035', 'Kumbha', 'Venkateswarlu', 'MBA', bid, 4, 'A', '24kp1e0035@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0047@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0047', '24KP1E0047', 'Nallabothula', 'Srilatha', 'MBA', bid, 4, 'A', '24kp1e0047@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0057@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0057', '24KP1E0057', 'Shaikmothadu', 'Abdulla', 'MBA', bid, 4, 'A', '24kp1e0057@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0065@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0065', '24KP1E0065', 'Thorlikonda', 'Tirupathi Rao', 'MBA', bid, 4, 'A', '24kp1e0065@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0066@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0066', '24KP1E0066', 'Thokala', 'Harish', 'MBA', bid, 4, 'A', '24kp1e0066@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0069@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0069', '24KP1E0069', 'Vasa', 'Devi Vara Prasad', 'MBA', bid, 4, 'A', '24kp1e0069@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0071@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0071', '24KP1E0071', 'Yalagala', 'Siva Prasad', 'MBA', bid, 4, 'A', '24kp1e0071@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0073@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0073', '24KP1E0073', 'Akula', 'John Victor Avinash', 'MBA', bid, 4, 'A', '24kp1e0073@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0074@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0074', '24KP1E0074', 'Bondalapati', 'Amrutha Kumar', 'MBA', bid, 4, 'A', '24kp1e0074@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0075@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0075', '24KP1E0075', 'Jangam', 'Munendra', 'MBA', bid, 4, 'A', '24kp1e0075@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0080@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0080', '24KP1E0080', 'Myla', 'Siva Sai', 'MBA', bid, 4, 'A', '24kp1e0080@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0083@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0083', '24KP1E0083', 'Janjanam', 'Vasu', 'MBA', bid, 4, 'A', '24kp1e0083@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0084@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0084', '24KP1E0084', 'Lakkepogu', 'Venkateswarlu', 'MBA', bid, 4, 'A', '24kp1e0084@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0032@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0032', '24KP1E0032', 'Kommula', 'Kartheek Babu', 'MBA', bid, 4, 'A', '24kp1e0032@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1e0078@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1E0078', '24KP1E0078', 'Kathi', 'Meghana', 'MBA', bid, 4, 'A', '24kp1e0078@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

END $$;

-- ===== MCA: 148 students =====
DO $$
DECLARE
    uid UUID;
    bid UUID;
BEGIN

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0001@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0001', '25KP1F0001', 'Abburi', 'Anjali', 'MCA', bid, 1, 'A', '25kp1f0001@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0002@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0002', '25KP1F0002', 'Avula', 'Pavani', 'MCA', bid, 1, 'A', '25kp1f0002@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0003@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0003', '25KP1F0003', 'Ayyapuraju', 'Himabindu', 'MCA', bid, 1, 'A', '25kp1f0003@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0004@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0004', '25KP1F0004', 'Battula', 'Anusha', 'MCA', bid, 1, 'A', '25kp1f0004@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0005@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0005', '25KP1F0005', 'Basam', 'Gayathri', 'MCA', bid, 1, 'A', '25kp1f0005@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0006@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0006', '25KP1F0006', 'Bellamkonda', 'Bhoomika', 'MCA', bid, 1, 'A', '25kp1f0006@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0007@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0007', '25KP1F0007', 'Boddu', 'Naga Sai Akhila', 'MCA', bid, 1, 'A', '25kp1f0007@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0008@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0008', '25KP1F0008', 'Bodduluri', 'Gnana Lakshmi Prasanna', 'MCA', bid, 1, 'A', '25kp1f0008@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0009@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0009', '25KP1F0009', 'Boyapati', 'Vamsi', 'MCA', bid, 1, 'A', '25kp1f0009@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0010@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0010', '25KP1F0010', 'Cheboina', 'Bhavani', 'MCA', bid, 1, 'A', '25kp1f0010@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0011@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0011', '25KP1F0011', 'Chimakurthi', 'Mastanamma', 'MCA', bid, 1, 'A', '25kp1f0011@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0012@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0012', '25KP1F0012', 'Chirala', 'Pallavi', 'MCA', bid, 1, 'A', '25kp1f0012@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0013@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0013', '25KP1F0013', 'Dakshiraju', 'Venkata Sambasiva Raju', 'MCA', bid, 1, 'A', '25kp1f0013@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0014@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0014', '25KP1F0014', 'Dara', 'Kiran Kumar', 'MCA', bid, 1, 'A', '25kp1f0014@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0015@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0015', '25KP1F0015', 'Ganta', 'Lakshmi Priya', 'MCA', bid, 1, 'A', '25kp1f0015@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0016@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0016', '25KP1F0016', 'Gonuguntla', 'Padmaja', 'MCA', bid, 1, 'A', '25kp1f0016@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0017@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0017', '25KP1F0017', 'Guntakala', 'Vara Prasad', 'MCA', bid, 1, 'A', '25kp1f0017@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0018@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0018', '25KP1F0018', 'Gunturu', 'Sowmya', 'MCA', bid, 1, 'A', '25kp1f0018@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0019@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0019', '25KP1F0019', 'Gutlapalli', 'Aswitha', 'MCA', bid, 1, 'A', '25kp1f0019@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0020@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0020', '25KP1F0020', 'Jami', 'Shanmukh Sai Charan', 'MCA', bid, 1, 'A', '25kp1f0020@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0021@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0021', '25KP1F0021', 'Jetti', 'Vijay', 'MCA', bid, 1, 'A', '25kp1f0021@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0022@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0022', '25KP1F0022', 'Karna', 'Sai Ramya', 'MCA', bid, 1, 'A', '25kp1f0022@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0023@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0023', '25KP1F0023', 'Katevarapu', 'Sri Vidya', 'MCA', bid, 1, 'A', '25kp1f0023@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0024@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0024', '25KP1F0024', 'Kesamsetty', 'Renuka', 'MCA', bid, 1, 'A', '25kp1f0024@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0025@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0025', '25KP1F0025', 'Kokkiligadda', 'Tejasree', 'MCA', bid, 1, 'A', '25kp1f0025@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0026@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0026', '25KP1F0026', 'Konangi', 'Anil Kumar', 'MCA', bid, 1, 'A', '25kp1f0026@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0027@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0027', '25KP1F0027', 'Konangi', 'Bhagyalakshmi', 'MCA', bid, 1, 'A', '25kp1f0027@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0028@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0028', '25KP1F0028', 'Kuchipudi', 'Rufas Paul', 'MCA', bid, 1, 'A', '25kp1f0028@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0029@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0029', '25KP1F0029', 'Kurukuti', 'Renuka', 'MCA', bid, 1, 'A', '25kp1f0029@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0030@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0030', '25KP1F0030', 'Maddi', 'Jyothi', 'MCA', bid, 1, 'A', '25kp1f0030@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0031@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0031', '25KP1F0031', 'Mahankali', 'Krishna Sai Srikanth', 'MCA', bid, 1, 'A', '25kp1f0031@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0032@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0032', '25KP1F0032', 'Mandi', 'Manasa', 'MCA', bid, 1, 'A', '25kp1f0032@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0033@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0033', '25KP1F0033', 'Mandula', 'Mary Grace', 'MCA', bid, 1, 'A', '25kp1f0033@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0034@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0034', '25KP1F0034', 'Mannam', 'Abhinaya', 'MCA', bid, 1, 'A', '25kp1f0034@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0035@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0035', '25KP1F0035', 'Melam', 'Theresa', 'MCA', bid, 1, 'A', '25kp1f0035@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0036@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0036', '25KP1F0036', 'Mukku', 'Prakasa Rao', 'MCA', bid, 1, 'A', '25kp1f0036@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0037@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0037', '25KP1F0037', 'Mutukuri', 'Ramya Sri', 'MCA', bid, 1, 'A', '25kp1f0037@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0038@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0038', '25KP1F0038', 'Nerusu', 'Gnapika Gayathri', 'MCA', bid, 1, 'A', '25kp1f0038@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0039@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0039', '25KP1F0039', 'Nutalapati', 'Divya Teja', 'MCA', bid, 1, 'A', '25kp1f0039@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0040@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0040', '25KP1F0040', 'Patchala', 'Amal Raju', 'MCA', bid, 1, 'A', '25kp1f0040@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0041@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0041', '25KP1F0041', 'Pati', 'Yazra', 'MCA', bid, 1, 'A', '25kp1f0041@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0042@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0042', '25KP1F0042', 'Peela', 'Lakshmi Bhuvaneswari', 'MCA', bid, 1, 'A', '25kp1f0042@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0043@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0043', '25KP1F0043', 'Pikkili', 'Padmaleela', 'MCA', bid, 1, 'A', '25kp1f0043@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0044@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0044', '25KP1F0044', 'Poli', 'Sailaja', 'MCA', bid, 1, 'A', '25kp1f0044@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0045@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0045', '25KP1F0045', 'Rajarapu', 'Anil Kumar', 'MCA', bid, 1, 'A', '25kp1f0045@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0046@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0046', '25KP1F0046', 'Sanku', 'Katyayani Jyothi Swaroopa', 'MCA', bid, 1, 'A', '25kp1f0046@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0047@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0047', '25KP1F0047', 'Shaik', 'Akhila', 'MCA', bid, 1, 'A', '25kp1f0047@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0048@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0048', '25KP1F0048', 'Shaik', 'Anju', 'MCA', bid, 1, 'A', '25kp1f0048@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0049@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0049', '25KP1F0049', 'Shaik', 'Ayesha Farheen', 'MCA', bid, 1, 'A', '25kp1f0049@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0050@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0050', '25KP1F0050', 'Shaik', 'Karishma', 'MCA', bid, 1, 'A', '25kp1f0050@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0051@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0051', '25KP1F0051', 'Shaik', 'Khadar Jani', 'MCA', bid, 1, 'A', '25kp1f0051@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0052@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0052', '25KP1F0052', 'Shaik', 'Mahammed Taj', 'MCA', bid, 1, 'A', '25kp1f0052@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0053@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0053', '25KP1F0053', 'Shaik', 'Mohammad Salman', 'MCA', bid, 1, 'A', '25kp1f0053@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0054@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0054', '25KP1F0054', 'Shaik', 'Mubeena', 'MCA', bid, 1, 'A', '25kp1f0054@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0055@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0055', '25KP1F0055', 'Shaik', 'Mubeena', 'MCA', bid, 1, 'A', '25kp1f0055@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0056@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0056', '25KP1F0056', 'Shaik', 'Salim', 'MCA', bid, 1, 'A', '25kp1f0056@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0057@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0057', '25KP1F0057', 'Shaik', 'Salma', 'MCA', bid, 1, 'A', '25kp1f0057@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0058@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0058', '25KP1F0058', 'Shaik', 'Shaheena Parveen', 'MCA', bid, 1, 'A', '25kp1f0058@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0059@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0059', '25KP1F0059', 'Tadi', 'Sri Lekha', 'MCA', bid, 1, 'A', '25kp1f0059@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0060@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0060', '25KP1F0060', 'Vadithe', 'Madhu Sai Naik', 'MCA', bid, 1, 'A', '25kp1f0060@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0061@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0061', '25KP1F0061', 'Vema', 'Lakshmi Narasimha', 'MCA', bid, 1, 'A', '25kp1f0061@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0062@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0062', '25KP1F0062', 'Vennapusa', 'Jhansi', 'MCA', bid, 1, 'A', '25kp1f0062@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0063@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0063', '25KP1F0063', 'Yamana', 'Aravind Reddy', 'MCA', bid, 1, 'A', '25kp1f0063@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0064@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0064', '25KP1F0064', 'Yasarapu', 'Vara Satya Srija', 'MCA', bid, 1, 'A', '25kp1f0064@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0065@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0065', '25KP1F0065', 'M', 'Manohar', 'MCA', bid, 1, 'A', '25kp1f0065@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0066@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0066', '25KP1F0066', 'Kanna', 'Vineela', 'MCA', bid, 1, 'A', '25kp1f0066@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0067@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0067', '25KP1F0067', 'Banka', 'Laya', 'MCA', bid, 1, 'A', '25kp1f0067@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2025 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('25kp1f0068@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '25KP1F0068', '25KP1F0068', 'Meda', 'Yamuna', 'MCA', bid, 1, 'A', '25kp1f0068@nriit.ac.in', '9999999999', '2025-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0001@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0001', '24KP1F0001', 'Alavalapati', 'Kiran Kumar Reddy', 'MCA', bid, 1, 'A', '24kp1f0001@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0002@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0002', '24KP1F0002', 'Allampuri', 'Krishna Mohan', 'MCA', bid, 1, 'A', '24kp1f0002@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0004@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0004', '24KP1F0004', 'Bandarupalli', 'Ramya Sri', 'MCA', bid, 1, 'A', '24kp1f0004@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0005@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0005', '24KP1F0005', 'Bandikatla', 'Naga Tejaswini', 'MCA', bid, 1, 'A', '24kp1f0005@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0006@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0006', '24KP1F0006', 'Burla', 'Leela Krishna', 'MCA', bid, 1, 'A', '24kp1f0006@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0007@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0007', '24KP1F0007', 'Burri', 'Pundareek', 'MCA', bid, 1, 'A', '24kp1f0007@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0008@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0008', '24KP1F0008', 'Chalasani', 'Madhavi Latha', 'MCA', bid, 1, 'A', '24kp1f0008@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0009@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0009', '24KP1F0009', 'Challa', 'Vishnuvardhan Reddy', 'MCA', bid, 1, 'A', '24kp1f0009@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0010@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0010', '24KP1F0010', 'Chennamsetty', 'Praharshini', 'MCA', bid, 1, 'A', '24kp1f0010@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0011@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0011', '24KP1F0011', 'Cherukula', 'Mounika', 'MCA', bid, 1, 'A', '24kp1f0011@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0012@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0012', '24KP1F0012', 'Dhanemkula', 'Kavya', 'MCA', bid, 1, 'A', '24kp1f0012@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0013@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0013', '24KP1F0013', 'Dokinaboina', 'Jhansi Lakshmi', 'MCA', bid, 1, 'A', '24kp1f0013@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0014@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0014', '24KP1F0014', 'Dudiki', 'Anusha', 'MCA', bid, 1, 'A', '24kp1f0014@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0015@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0015', '24KP1F0015', 'Dugge', 'Suresh', 'MCA', bid, 1, 'A', '24kp1f0015@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0016@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0016', '24KP1F0016', 'Emmadisetti', 'Bhavya Chandrika', 'MCA', bid, 1, 'A', '24kp1f0016@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0017@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0017', '24KP1F0017', 'Gaddae', 'Lakshmi Sriharshini', 'MCA', bid, 1, 'A', '24kp1f0017@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0018@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0018', '24KP1F0018', 'Gajjala', 'Bala Narayana', 'MCA', bid, 1, 'A', '24kp1f0018@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0020@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0020', '24KP1F0020', 'Gunji', 'Vyshnavi', 'MCA', bid, 1, 'A', '24kp1f0020@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0021@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0021', '24KP1F0021', 'Isthala', 'Anil Kumar', 'MCA', bid, 1, 'A', '24kp1f0021@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0022@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0022', '24KP1F0022', 'Kakarla', 'Vidhya', 'MCA', bid, 1, 'A', '24kp1f0022@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0023@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0023', '24KP1F0023', 'Kamisetti', 'Anusha', 'MCA', bid, 1, 'A', '24kp1f0023@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0025@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0025', '24KP1F0025', 'Katepalli', 'Sreya', 'MCA', bid, 1, 'A', '24kp1f0025@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0026@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0026', '24KP1F0026', 'Katta', 'Siva', 'MCA', bid, 1, 'A', '24kp1f0026@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0027@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0027', '24KP1F0027', 'Katukuri', 'Lavanya', 'MCA', bid, 1, 'A', '24kp1f0027@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0029@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0029', '24KP1F0029', 'Kumaran', 'Chandra Sekhar', 'MCA', bid, 1, 'A', '24kp1f0029@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0030@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0030', '24KP1F0030', 'Kurapati', 'Lourdhu Raju', 'MCA', bid, 1, 'A', '24kp1f0030@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0031@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0031', '24KP1F0031', 'Lankireddy', 'Anil Reddy', 'MCA', bid, 1, 'A', '24kp1f0031@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0032@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0032', '24KP1F0032', 'Lella', 'Nandini Shankar Ganesh', 'MCA', bid, 1, 'A', '24kp1f0032@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0033@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0033', '24KP1F0033', 'Macherla', 'Tulasi', 'MCA', bid, 1, 'A', '24kp1f0033@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0034@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0034', '24KP1F0034', 'Mallu', 'Nagaiah', 'MCA', bid, 1, 'A', '24kp1f0034@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0035@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0035', '24KP1F0035', 'Mandati', 'Rajasekhar', 'MCA', bid, 1, 'A', '24kp1f0035@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0036@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0036', '24KP1F0036', 'Mandhula', 'Venkatesh', 'MCA', bid, 1, 'A', '24kp1f0036@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0039@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0039', '24KP1F0039', 'Muppalla', 'Harika', 'MCA', bid, 1, 'A', '24kp1f0039@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0040@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0040', '24KP1F0040', 'Nosina', 'Yerusha', 'MCA', bid, 1, 'A', '24kp1f0040@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0041@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0041', '24KP1F0041', 'Obulareddy', 'Siva Naga Sekhar Reddy', 'MCA', bid, 1, 'A', '24kp1f0041@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0042@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0042', '24KP1F0042', 'Orchu', 'Nagaraju', 'MCA', bid, 1, 'A', '24kp1f0042@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0043@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0043', '24KP1F0043', 'Pamidimukkala', 'Veena Vallabhi', 'MCA', bid, 1, 'A', '24kp1f0043@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0044@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0044', '24KP1F0044', 'Papineni', 'Triveni', 'MCA', bid, 1, 'A', '24kp1f0044@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0045@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0045', '24KP1F0045', 'Perecharla', 'Divya Sree Durga', 'MCA', bid, 1, 'A', '24kp1f0045@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0046@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0046', '24KP1F0046', 'Perumalla', 'Nagendra Babu', 'MCA', bid, 1, 'A', '24kp1f0046@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0047@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0047', '24KP1F0047', 'Pinneboina', 'Rajya Lakshmi', 'MCA', bid, 1, 'A', '24kp1f0047@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0048@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0048', '24KP1F0048', 'Pokala', 'Surendra Babu', 'MCA', bid, 1, 'A', '24kp1f0048@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0049@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0049', '24KP1F0049', 'Poluri', 'Chandra Neelakanteswara Chari', 'MCA', bid, 1, 'A', '24kp1f0049@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0050@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0050', '24KP1F0050', 'Ponnapula', 'Sri Ram', 'MCA', bid, 1, 'A', '24kp1f0050@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0051@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0051', '24KP1F0051', 'Pulla', 'Anil', 'MCA', bid, 1, 'A', '24kp1f0051@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0052@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0052', '24KP1F0052', 'Ramisetty', 'Brijesh', 'MCA', bid, 1, 'A', '24kp1f0052@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0053@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0053', '24KP1F0053', 'Sanikommu', 'Ramanjaneyula Reddy', 'MCA', bid, 1, 'A', '24kp1f0053@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0054@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0054', '24KP1F0054', 'Sankula', 'Vamsi', 'MCA', bid, 1, 'A', '24kp1f0054@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0055@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0055', '24KP1F0055', 'Sayyed', 'Nagur Mastanvali', 'MCA', bid, 1, 'A', '24kp1f0055@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0056@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0056', '24KP1F0056', 'Shaik', 'Aasha', 'MCA', bid, 1, 'A', '24kp1f0056@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0057@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0057', '24KP1F0057', 'Shaik', 'Johara Zabeen', 'MCA', bid, 1, 'A', '24kp1f0057@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0058@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0058', '24KP1F0058', 'Shaik', 'Karishma', 'MCA', bid, 1, 'A', '24kp1f0058@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0059@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0059', '24KP1F0059', 'Shaik', 'Mohammad Jakir Hussain', 'MCA', bid, 1, 'A', '24kp1f0059@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0060@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0060', '24KP1F0060', 'Shaik', 'Nagur Bi', 'MCA', bid, 1, 'A', '24kp1f0060@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0061@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0061', '24KP1F0061', 'Shaik', 'Sameena', 'MCA', bid, 1, 'A', '24kp1f0061@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0062@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0062', '24KP1F0062', 'Shaik', 'Sameer', 'MCA', bid, 1, 'A', '24kp1f0062@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0063@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0063', '24KP1F0063', 'Shaik', 'Sameera', 'MCA', bid, 1, 'A', '24kp1f0063@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0064@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0064', '24KP1F0064', 'Singu', 'Aruna Jyothi', 'MCA', bid, 1, 'A', '24kp1f0064@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0065@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0065', '24KP1F0065', 'Somasi', 'Sasi Kiran', 'MCA', bid, 1, 'A', '24kp1f0065@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0066@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0066', '24KP1F0066', 'Sudireddy', 'Pujitha', 'MCA', bid, 1, 'A', '24kp1f0066@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0068@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0068', '24KP1F0068', 'Tadigadapa', 'Durgabhavani', 'MCA', bid, 1, 'A', '24kp1f0068@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0070@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0070', '24KP1F0070', 'Yannam', 'Vijaya Lakshmi', 'MCA', bid, 1, 'A', '24kp1f0070@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0071@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0071', '24KP1F0071', 'Yenugula', 'Lakshmi Ganesh', 'MCA', bid, 1, 'A', '24kp1f0071@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0072@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0072', '24KP1F0072', 'Dulla', 'Venkatakrishna', 'MCA', bid, 1, 'A', '24kp1f0072@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0073@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0073', '24KP1F0073', 'Vatti', 'Poojitha', 'MCA', bid, 1, 'A', '24kp1f0073@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0077@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0077', '24KP1F0077', 'Sirigiri', 'Uday Kiran', 'MCA', bid, 1, 'A', '24kp1f0077@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0078@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0078', '24KP1F0078', 'Mohammed', 'Ameema', 'MCA', bid, 1, 'A', '24kp1f0078@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0079@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0079', '24KP1F0079', 'Unnam', 'Hemanth', 'MCA', bid, 1, 'A', '24kp1f0079@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0080@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0080', '24KP1F0080', 'Yasarapu', 'Srikanth', 'MCA', bid, 1, 'A', '24kp1f0080@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0003@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0003', '24KP1F0003', 'Annadasu', 'Bhagyasri', 'MCA', bid, 1, 'A', '24kp1f0003@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0024@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0024', '24KP1F0024', 'Karna', 'Sai Ramya', 'MCA', bid, 1, 'A', '24kp1f0024@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0074@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0074', '24KP1F0074', 'Shaik', 'Janibasha', 'MCA', bid, 1, 'A', '24kp1f0074@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0075@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0075', '24KP1F0075', 'Kanakam', 'Veeranjaneyulu', 'MCA', bid, 1, 'A', '24kp1f0075@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0019@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0019', '24KP1F0019', 'Gorantla', 'Sumanth', 'MCA', bid, 1, 'A', '24kp1f0019@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0028@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0028', '24KP1F0028', 'Kovuri', 'Eswar', 'MCA', bid, 1, 'A', '24kp1f0028@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0037@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0037', '24KP1F0037', 'Mangalagiri', 'Narendra Babu', 'MCA', bid, 1, 'A', '24kp1f0037@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0038@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0038', '24KP1F0038', 'Munna', 'Naveen', 'MCA', bid, 1, 'A', '24kp1f0038@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0067@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0067', '24KP1F0067', 'Tadepalli', 'Besvaja', 'MCA', bid, 1, 'A', '24kp1f0067@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0069@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0069', '24KP1F0069', 'Thokala', 'Chandu', 'MCA', bid, 1, 'A', '24kp1f0069@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

    SELECT id INTO bid FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    INSERT INTO users (email, role, is_active) VALUES ('24kp1f0076@nriit.ac.in', 'student', true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW() RETURNING id INTO uid;
    INSERT INTO student_profiles (user_id, roll_number, registration_number, first_name, last_name, dept_code, batch_id, current_semester, section, email, phone, admission_date, is_active)
    VALUES (uid, '24KP1F0076', '24KP1F0076', 'Jasti', 'Gopi', 'MCA', bid, 1, 'A', '24kp1f0076@nriit.ac.in', '9999999999', '2024-07-15', true)
    ON CONFLICT (roll_number) DO NOTHING;

END $$;

-- SUMMARY: 3598 students imported across 9 departments
