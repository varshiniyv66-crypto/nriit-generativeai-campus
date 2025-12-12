-- Seed Data for Courses
-- Run this in Supabase SQL Editor after running supabase_schema.sql

DO $$
BEGIN
    RAISE NOTICE 'Seeding Courses...';

    -- CSE Department Courses (III Year)
    INSERT INTO courses (course_code, course_name, dept_code, credits, semester, year, is_active)
    VALUES
    ('CS301', 'Computer Networks', 'CSE', 3, 5, 3, true),
    ('CS302', 'Web Technologies', 'CSE', 3, 5, 3, true),
    ('CS303', 'Data Mining', 'CSE', 3, 5, 3, true),
    ('CS304', 'Cloud Computing', 'CSE', 3, 5, 3, true),
    ('CS305', 'Software Engineering', 'CSE', 3, 5, 3, true),
    ('CS306', 'Compiler Design', 'CSE', 3, 6, 3, true)
    ON CONFLICT (course_code) DO NOTHING;

    -- IT Department Courses
    INSERT INTO courses (course_code, course_name, dept_code, credits, semester, year, is_active)
    VALUES
    ('IT301', 'Network Security', 'IT', 3, 5, 3, true),
    ('IT302', 'Mobile Application Development', 'IT', 3, 5, 3, true),
    ('IT303', 'Database Management Systems', 'IT', 3, 5, 3, true),
    ('IT304', 'Internet of Things', 'IT', 3, 5, 3, true)
    ON CONFLICT (course_code) DO NOTHING;

    -- ECE Department Courses
    INSERT INTO courses (course_code, course_name, dept_code, credits, semester, year, is_active)
    VALUES
    ('EC301', 'Digital Signal Processing', 'ECE', 3, 5, 3, true),
    ('EC302', 'VLSI Design', 'ECE', 3, 5, 3, true),
    ('EC303', 'Embedded Systems', 'ECE', 3, 5, 3, true),
    ('EC304', 'Wireless Communications', 'ECE', 3, 5, 3, true)
    ON CONFLICT (course_code) DO NOTHING;

    RAISE NOTICE 'Courses seeded successfully!';
END $$;
