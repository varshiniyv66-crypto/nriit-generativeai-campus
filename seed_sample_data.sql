-- Generate Sample Attendance and Marks Data
-- Run this AFTER seeding students, faculty, courses, and timetable

DO $$
DECLARE
    student_rec RECORD;
    course_rec RECORD;
    fac_id UUID;
    days_back INT;
BEGIN
    RAISE NOTICE 'Generating sample attendance and marks data...';

    -- Get a faculty ID for marking attendance
    SELECT id INTO fac_id FROM faculty_profiles WHERE employee_id = 'FAC001' LIMIT 1;

    -- Generate attendance for CSE students
    FOR student_rec IN 
        SELECT id, roll_number FROM student_profiles WHERE dept_code = 'CSE' LIMIT 10
    LOOP
        -- For each CSE course
        FOR course_rec IN 
            SELECT course_code FROM courses WHERE dept_code = 'CSE' LIMIT 4
        LOOP
            -- Generate 30 days of attendance (random 80-90% attendance)
            FOR days_back IN 1..30 LOOP
                INSERT INTO attendance_records (student_id, course_code, date, status, marked_by)
                VALUES (
                    student_rec.id,
                    course_rec.course_code,
                    CURRENT_DATE - (days_back || ' days')::interval,
                    CASE WHEN random() > 0.15 THEN 'present' ELSE 'absent' END,
                    fac_id
                )
                ON CONFLICT DO NOTHING;
            END LOOP;

            -- Generate marks for Mid-1 exam
            INSERT INTO student_marks (student_id, course_code, exam_type, marks_obtained, max_marks, semester, academic_year)
            VALUES (
                student_rec.id,
                course_rec.course_code,
                'mid1',
                floor(random() * 15 + 15)::int,  -- Random marks between 15-30
                30,
                5,
                '2024-25'
            )
            ON CONFLICT DO NOTHING;

            -- Generate marks for Mid-2 exam (some pending)
            IF random() > 0.3 THEN
                INSERT INTO student_marks (student_id, course_code, exam_type, marks_obtained, max_marks, semester, academic_year)
                VALUES (
                    student_rec.id,
                    course_rec.course_code,
                    'mid2',
                    floor(random() * 15 + 15)::int,
                    30,
                    5,
                    '2024-25'
                )
                ON CONFLICT DO NOTHING;
            END IF;
        END LOOP;

        RAISE NOTICE 'Generated data for student: %', student_rec.roll_number;
    END LOOP;

    -- Generate fee transactions
    FOR student_rec IN 
        SELECT id, roll_number FROM student_profiles LIMIT 20
    LOOP
        INSERT INTO fee_transactions (student_id, academic_year, semester, amount, due_date, status, payment_date, transaction_id)
        VALUES (
            student_rec.id,
            '2024-25',
            1,
            75000,
            '2024-12-15',
            CASE WHEN random() > 0.25 THEN 'paid' ELSE 'pending' END,
            CASE WHEN random() > 0.25 THEN CURRENT_DATE - (floor(random() * 30) || ' days')::interval ELSE NULL END,
            CASE WHEN random() > 0.25 THEN 'TXN' || floor(random() * 1000000)::text ELSE NULL END
        )
        ON CONFLICT DO NOTHING;

        RAISE NOTICE 'Generated fee data for student: %', student_rec.roll_number;
    END LOOP;

    RAISE NOTICE 'Sample data generation complete!';
END $$;
