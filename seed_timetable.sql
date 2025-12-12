-- Seed Data for Timetable
-- Run this AFTER seeding courses and faculty

DO $$
DECLARE
    fac001_id UUID;
    fac002_id UUID;
BEGIN
    RAISE NOTICE 'Seeding Timetable...';

    -- Get faculty IDs
    SELECT id INTO fac001_id FROM faculty_profiles WHERE employee_id = 'FAC001' LIMIT 1;
    SELECT id INTO fac002_id FROM faculty_profiles WHERE employee_id = 'FAC002' LIMIT 1;

    -- Monday Schedule for FAC001 (CSE)
    INSERT INTO timetable (day_of_week, period_number, course_code, faculty_id, section, room_number, start_time, end_time)
    VALUES
    ('Monday', 1, 'CS301', fac001_id, 'III-A', 'LH-101', '09:00', '09:50'),
    ('Monday', 2, 'CS302', fac001_id, 'III-A', 'LH-101', '09:50', '10:40'),
    ('Monday', 4, 'CS303', fac001_id, 'III-B', 'LH-102', '11:30', '12:20')
    ON CONFLICT DO NOTHING;

    -- Tuesday Schedule for FAC001
    INSERT INTO timetable (day_of_week, period_number, course_code, faculty_id, section, room_number, start_time, end_time)
    VALUES
    ('Tuesday', 1, 'CS301', fac001_id, 'III-A', 'LH-101', '09:00', '09:50'),
    ('Tuesday', 3, 'CS304', fac001_id, 'III-A', 'LH-101', '10:50', '11:40')
    ON CONFLICT DO NOTHING;

    -- Wednesday Schedule for FAC001
    INSERT INTO timetable (day_of_week, period_number, course_code, faculty_id, section, room_number, start_time, end_time)
    VALUES
    ('Wednesday', 1, 'CS301', fac001_id, 'III-A', 'LH-101', '09:00', '09:50'),
    ('Wednesday', 2, 'CS302', fac001_id, 'III-B', 'LH-203', '09:50', '10:40'),
    ('Wednesday', 5, 'CS305', fac001_id, 'III-A', 'LAB-3', '13:30', '16:10')
    ON CONFLICT DO NOTHING;

    -- Monday Schedule for FAC002 (IT)
    INSERT INTO timetable (day_of_week, period_number, course_code, faculty_id, section, room_number, start_time, end_time)
    VALUES
    ('Monday', 1, 'IT301', fac002_id, 'III-A', 'LH-201', '09:00', '09:50'),
    ('Monday', 2, 'IT302', fac002_id, 'III-A', 'LH-201', '09:50', '10:40')
    ON CONFLICT DO NOTHING;

    RAISE NOTICE 'Timetable seeded successfully!';
END $$;
