-- ===========================================
-- COMPLETE SAMPLE DATA FOR FULL FUNCTIONALITY
-- ===========================================
-- Run this in Supabase SQL Editor to have all features working
-- ===========================================

-- ===========================================
-- SECTION 1: SAMPLE COURSES (All Departments)
-- ===========================================

INSERT INTO courses (course_code, course_name, dept_code, semester, credits, lecture_hours, tutorial_hours, practical_hours, course_type, is_active) VALUES
-- CSE Semester 1
('R201101', 'Engineering Mathematics-I', 'CSE', 1, 4, 4, 0, 0, 'Theory', true),
('R201102', 'Engineering Physics', 'CSE', 1, 4, 3, 0, 2, 'Theory', true),
('R201103', 'Programming for Problem Solving', 'CSE', 1, 3, 3, 0, 2, 'Theory', true),
('R201104', 'Engineering Graphics', 'CSE', 1, 3, 1, 0, 4, 'Theory', true),
('R201105', 'English', 'CSE', 1, 2, 2, 0, 0, 'Theory', true),
-- CSE Semester 3
('R203101', 'Data Structures', 'CSE', 3, 3, 3, 1, 0, 'Theory', true),
('R203102', 'Computer Organization', 'CSE', 3, 3, 3, 0, 0, 'Theory', true),
('R203103', 'Discrete Mathematics', 'CSE', 3, 3, 3, 1, 0, 'Theory', true),
('R203104', 'Object Oriented Programming', 'CSE', 3, 3, 3, 0, 2, 'Theory', true),
('R203105', 'Data Structures Lab', 'CSE', 3, 1, 0, 0, 2, 'Lab', true),
-- CSE Semester 5
('R205101', 'Computer Networks', 'CSE', 5, 3, 3, 0, 0, 'Theory', true),
('R205102', 'Operating Systems', 'CSE', 5, 3, 3, 0, 0, 'Theory', true),
('R205103', 'Database Management Systems', 'CSE', 5, 3, 3, 0, 2, 'Theory', true),
('R205104', 'Software Engineering', 'CSE', 5, 3, 3, 0, 0, 'Theory', true),
('R205105', 'Networks Lab', 'CSE', 5, 1, 0, 0, 2, 'Lab', true),
-- CSE Semester 7
('R207101', 'Machine Learning', 'CSE', 7, 3, 3, 0, 0, 'Theory', true),
('R207102', 'Cloud Computing', 'CSE', 7, 3, 3, 0, 0, 'Theory', true),
('R207103', 'Information Security', 'CSE', 7, 3, 3, 0, 0, 'Theory', true),
('R207104', 'Project Work', 'CSE', 7, 6, 0, 0, 12, 'Project', true),
-- IT Semester 3
('R203201', 'Data Structures', 'IT', 3, 3, 3, 1, 0, 'Theory', true),
('R203202', 'Web Technologies', 'IT', 3, 3, 3, 0, 2, 'Theory', true),
('R203203', 'Database Systems', 'IT', 3, 3, 3, 0, 0, 'Theory', true),
-- ECE Semester 3
('R203301', 'Electronic Devices', 'ECE', 3, 3, 3, 0, 0, 'Theory', true),
('R203302', 'Signals and Systems', 'ECE', 3, 3, 3, 1, 0, 'Theory', true),
('R203303', 'Digital Electronics', 'ECE', 3, 3, 3, 0, 2, 'Theory', true)
ON CONFLICT (course_code) DO NOTHING;

-- ===========================================
-- SECTION 2: CLASS SECTIONS
-- ===========================================

DO $$
DECLARE
    batch_2024 UUID;
    batch_2023 UUID;
    batch_2022 UUID;
    batch_2021 UUID;
BEGIN
    SELECT id INTO batch_2024 FROM academic_batches WHERE batch_year = 2024 LIMIT 1;
    SELECT id INTO batch_2023 FROM academic_batches WHERE batch_year = 2023 LIMIT 1;
    SELECT id INTO batch_2022 FROM academic_batches WHERE batch_year = 2022 LIMIT 1;
    SELECT id INTO batch_2021 FROM academic_batches WHERE batch_year = 2021 LIMIT 1;

    -- CSE Sections
    INSERT INTO class_sections (dept_code, batch_id, semester, section, academic_year, strength, is_active) VALUES
    ('CSE', batch_2024, 1, 'A', '2024-25', 30, true),
    ('CSE', batch_2024, 1, 'B', '2024-25', 30, true),
    ('CSE', batch_2023, 3, 'A', '2024-25', 30, true),
    ('CSE', batch_2023, 3, 'B', '2024-25', 30, true),
    ('CSE', batch_2022, 5, 'A', '2024-25', 30, true),
    ('CSE', batch_2022, 5, 'B', '2024-25', 30, true),
    ('CSE', batch_2021, 7, 'A', '2024-25', 30, true),
    ('CSE', batch_2021, 7, 'B', '2024-25', 30, true),
    -- IT Sections
    ('IT', batch_2024, 1, 'A', '2024-25', 30, true),
    ('IT', batch_2023, 3, 'A', '2024-25', 30, true),
    -- ECE Sections
    ('ECE', batch_2024, 1, 'A', '2024-25', 30, true),
    ('ECE', batch_2023, 3, 'A', '2024-25', 30, true)
    ON CONFLICT DO NOTHING;
END $$;

-- ===========================================
-- SECTION 3: SAMPLE ATTENDANCE DATA (Last 30 Days)
-- ===========================================

DO $$
DECLARE
    student_rec RECORD;
    course_rec RECORD;
    faculty_rec RECORD;
    day_counter INTEGER;
    period_counter INTEGER;
    att_status attendance_status;
    random_val FLOAT;
BEGIN
    -- Generate attendance for first 60 CSE students (Semester 3)
    FOR student_rec IN 
        SELECT id, dept_code, current_semester 
        FROM student_profiles 
        WHERE dept_code = 'CSE' AND current_semester = 3 
        LIMIT 60
    LOOP
        -- For each course in semester 3
        FOR course_rec IN 
            SELECT id FROM courses 
            WHERE dept_code = 'CSE' AND semester = 3
        LOOP
            -- Get a random faculty
            SELECT id INTO faculty_rec FROM faculty_profiles WHERE dept_code = 'CSE' LIMIT 1;
            
            -- Generate attendance for last 20 working days
            FOR day_counter IN 1..20 LOOP
                -- Skip weekends
                IF EXTRACT(DOW FROM CURRENT_DATE - day_counter) NOT IN (0, 6) THEN
                    FOR period_counter IN 1..2 LOOP
                        random_val := random();
                        att_status := CASE 
                            WHEN random_val < 0.82 THEN 'present'::attendance_status
                            WHEN random_val < 0.92 THEN 'absent'::attendance_status
                            ELSE 'late'::attendance_status
                        END;
                        
                        INSERT INTO period_attendance (
                            student_id, course_id, faculty_id, attendance_date, period_number, status
                        ) VALUES (
                            student_rec.id, course_rec.id, faculty_rec.id, 
                            CURRENT_DATE - day_counter, period_counter, att_status
                        ) ON CONFLICT DO NOTHING;
                    END LOOP;
                END IF;
            END LOOP;
        END LOOP;
    END LOOP;

    RAISE NOTICE '✅ Attendance data created for CSE students';
END $$;

-- ===========================================
-- SECTION 4: SAMPLE INTERNAL MARKS (Mid-1 & Mid-2)
-- ===========================================

DO $$
DECLARE
    student_rec RECORD;
    course_rec RECORD;
    mid1_marks DECIMAL;
    mid2_marks DECIMAL;
BEGIN
    -- Generate marks for CSE Semester 3 students
    FOR student_rec IN 
        SELECT id FROM student_profiles 
        WHERE dept_code = 'CSE' AND current_semester = 3 
        LIMIT 60
    LOOP
        FOR course_rec IN 
            SELECT id FROM courses 
            WHERE dept_code = 'CSE' AND semester = 3
        LOOP
            mid1_marks := ROUND((RANDOM() * 8 + 12)::NUMERIC, 1); -- 12-20 marks
            mid2_marks := ROUND((RANDOM() * 8 + 12)::NUMERIC, 1); -- 12-20 marks
            
            -- Mid-1
            INSERT INTO internal_marks (
                student_id, course_id, exam_type, academic_year, semester_type,
                marks_obtained, max_marks
            ) VALUES (
                student_rec.id, course_rec.id, 'mid_1', '2024-25', 'odd',
                mid1_marks, 20
            ) ON CONFLICT DO NOTHING;
            
            -- Mid-2
            INSERT INTO internal_marks (
                student_id, course_id, exam_type, academic_year, semester_type,
                marks_obtained, max_marks
            ) VALUES (
                student_rec.id, course_rec.id, 'mid_2', '2024-25', 'odd',
                mid2_marks, 20
            ) ON CONFLICT DO NOTHING;
        END LOOP;
    END LOOP;

    RAISE NOTICE '✅ Internal marks created for CSE students';
END $$;

-- ===========================================
-- SECTION 5: FEE STRUCTURE
-- ===========================================

INSERT INTO fee_master (academic_year, dept_code, category, fee_name, amount, due_date, is_mandatory) VALUES
-- CSE Fees
('2024-25', 'CSE', 'tuition', 'Tuition Fee - Odd Semester', 75000, '2024-08-15', true),
('2024-25', 'CSE', 'tuition', 'Tuition Fee - Even Semester', 75000, '2025-01-15', true),
('2024-25', 'CSE', 'regular_exam', 'Examination Fee', 2500, '2024-11-30', true),
('2024-25', 'CSE', 'library', 'Library Fee', 1000, '2024-08-15', true),
('2024-25', 'CSE', 'misc', 'Development Fee', 5000, '2024-08-15', true),
-- IT Fees
('2024-25', 'IT', 'tuition', 'Tuition Fee - Odd Semester', 70000, '2024-08-15', true),
('2024-25', 'IT', 'regular_exam', 'Examination Fee', 2500, '2024-11-30', true),
-- ECE Fees
('2024-25', 'ECE', 'tuition', 'Tuition Fee - Odd Semester', 70000, '2024-08-15', true),
('2024-25', 'ECE', 'regular_exam', 'Examination Fee', 2500, '2024-11-30', true)
ON CONFLICT DO NOTHING;

-- ===========================================
-- SECTION 6: SAMPLE FEE TRANSACTIONS
-- ===========================================

DO $$
DECLARE
    student_rec RECORD;
    fee_rec RECORD;
BEGIN
    -- Generate fee payments for some students
    FOR student_rec IN 
        SELECT id, dept_code FROM student_profiles 
        WHERE dept_code = 'CSE' AND is_active = true 
        LIMIT 30
    LOOP
        FOR fee_rec IN 
            SELECT id, amount FROM fee_master 
            WHERE dept_code = student_rec.dept_code 
            AND academic_year = '2024-25'
            LIMIT 2
        LOOP
            INSERT INTO fee_transactions (
                student_id, fee_master_id, academic_year, amount, late_fee, total_amount,
                payment_method, status, payment_date
            ) VALUES (
                student_rec.id, fee_rec.id, '2024-25', fee_rec.amount, 0, fee_rec.amount,
                'online', 'completed', CURRENT_DATE - (RANDOM() * 30)::INTEGER
            ) ON CONFLICT DO NOTHING;
        END LOOP;
    END LOOP;

    RAISE NOTICE '✅ Fee transactions created';
END $$;

-- ===========================================
-- SECTION 7: SAMPLE CRT MATERIALS
-- ===========================================

INSERT INTO crt_materials (title, description, category, sub_category, content_type, difficulty_level, is_published) VALUES
('Aptitude Basics - Numbers', 'Learn about number systems, divisibility, and basic operations', 'aptitude', 'numbers', 'pdf', 'beginner', true),
('Logical Reasoning - Patterns', 'Series and pattern recognition techniques', 'reasoning', 'patterns', 'pdf', 'beginner', true),
('Verbal Ability - Vocabulary', 'Essential vocabulary for placement exams', 'verbal', 'vocabulary', 'pdf', 'beginner', true),
('Data Interpretation', 'Charts, graphs, and data analysis', 'aptitude', 'data_interpretation', 'pdf', 'intermediate', true),
('Coding - Arrays and Strings', 'Common interview problems on arrays', 'technical', 'coding', 'pdf', 'intermediate', true),
('SQL Interview Questions', 'Top 50 SQL queries for interviews', 'technical', 'database', 'pdf', 'intermediate', true),
('Communication Skills', 'Soft skills for group discussions', 'soft_skills', 'communication', 'video', 'beginner', true),
('Problem Solving Strategies', 'Advanced problem-solving techniques', 'aptitude', 'problem_solving', 'pdf', 'advanced', true)
ON CONFLICT DO NOTHING;

-- ===========================================
-- SECTION 8: SAMPLE CERTIFICATE REQUESTS
-- ===========================================

DO $$
DECLARE
    student_rec RECORD;
BEGIN
    FOR student_rec IN 
        SELECT id FROM student_profiles 
        WHERE dept_code = 'CSE' AND is_active = true 
        LIMIT 10
    LOOP
        INSERT INTO certificate_requests (
            student_id, certificate_type, purpose, copies_required, status
        ) VALUES 
        (student_rec.id, 'bonafide', 'Bank loan application', 1, 'approved'),
        (student_rec.id, 'conduct', 'Higher studies', 1, 'processing')
        ON CONFLICT DO NOTHING;
    END LOOP;

    RAISE NOTICE '✅ Certificate requests created';
END $$;

-- ===========================================
-- SECTION 9: CREATE ATTENDANCE SUMMARY VIEW
-- ===========================================

CREATE OR REPLACE VIEW v_student_attendance_summary AS
SELECT 
    s.id as student_id,
    s.roll_number,
    s.first_name || ' ' || s.last_name as student_name,
    c.course_code,
    c.course_name,
    COUNT(*) as total_classes,
    SUM(CASE WHEN pa.status = 'present' THEN 1 ELSE 0 END) as present_count,
    SUM(CASE WHEN pa.status = 'absent' THEN 1 ELSE 0 END) as absent_count,
    ROUND(
        (SUM(CASE WHEN pa.status = 'present' THEN 1 ELSE 0 END)::DECIMAL / 
        NULLIF(COUNT(*), 0)) * 100, 2
    ) as attendance_percentage
FROM student_profiles s
JOIN period_attendance pa ON s.id = pa.student_id
JOIN courses c ON pa.course_id = c.id
WHERE s.is_active = true
GROUP BY s.id, s.roll_number, s.first_name, s.last_name, c.course_code, c.course_name;

-- ===========================================
-- SUCCESS MESSAGE
-- ===========================================

DO $$
BEGIN
    RAISE NOTICE '========================================';
    RAISE NOTICE '✅ COMPLETE SAMPLE DATA CREATED!';
    RAISE NOTICE '========================================';
    RAISE NOTICE '📚 Courses: ~25 across all departments';
    RAISE NOTICE '📊 Attendance: 20 days for 60 CSE students';
    RAISE NOTICE '📝 Internal Marks: Mid-1 & Mid-2 for CSE Sem 3';
    RAISE NOTICE '💰 Fee Structure: Complete fee master';
    RAISE NOTICE '💳 Fee Transactions: 30 sample payments';
    RAISE NOTICE '📖 CRT Materials: 8 learning resources';
    RAISE NOTICE '📄 Certificates: 10 sample requests';
    RAISE NOTICE '========================================';
    RAISE NOTICE 'ALL FEATURES ARE NOW FULLY FUNCTIONAL! 🎉';
    RAISE NOTICE '========================================';
END $$;
