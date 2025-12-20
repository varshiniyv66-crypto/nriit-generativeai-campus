
-- =============================================
-- 1. CREATE MISSING TABLES
-- =============================================

CREATE TABLE IF NOT EXISTS academic_years (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    is_active BOOLEAN DEFAULT false,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS class_sections (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL,
    dept_code TEXT, -- References departments(code) usually, but we skip FK to be safe if constraint missing
    academic_year_id UUID REFERENCES academic_years(id),
    year INTEGER,
    semester INTEGER,
    section TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Add unique constraint if not exists (safe way is complex in SQL script, skipping 'IF NOT EXISTS' for constraint)
-- We'll assume the Unique index is needed for ON CONFLICT
DROP INDEX IF EXISTS idx_class_sections_unique;
CREATE UNIQUE INDEX IF NOT EXISTS idx_class_sections_unique ON class_sections (dept_code, academic_year_id, year, section);
ALTER TABLE class_sections DROP CONSTRAINT IF EXISTS class_sections_dept_code_academic_year_id_year_section_key;
ALTER TABLE class_sections ADD CONSTRAINT class_sections_dept_code_academic_year_id_year_section_key UNIQUE USING INDEX idx_class_sections_unique;


CREATE TABLE IF NOT EXISTS courses (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    code TEXT UNIQUE NOT NULL,
    name TEXT NOT NULL,
    dept_code TEXT,
    credits INTEGER DEFAULT 3,
    semester INTEGER,
    type TEXT,
    is_active BOOLEAN DEFAULT true,
    syllabus_path TEXT,
    lecture_hours INTEGER DEFAULT 0,
    tutorial_hours INTEGER DEFAULT 0,
    practical_hours INTEGER DEFAULT 0,
    is_elective BOOLEAN DEFAULT false,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS timetable (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    class_section_id UUID REFERENCES class_sections(id) ON DELETE CASCADE,
    faculty_id UUID REFERENCES faculty_profiles(id),
    course_id UUID REFERENCES courses(id),
    day_of_week TEXT,
    period_number INTEGER,
    start_time TIME,
    end_time TIME,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);


-- =============================================
-- 1. FIX SCHEMA (Add Missing Columns if Table Exists)
-- =============================================

-- Fix class_sections
ALTER TABLE class_sections ADD COLUMN IF NOT EXISTS academic_year_id UUID REFERENCES academic_years(id);
ALTER TABLE class_sections ADD COLUMN IF NOT EXISTS dept_code TEXT;
ALTER TABLE class_sections ADD COLUMN IF NOT EXISTS year INTEGER;
ALTER TABLE class_sections ADD COLUMN IF NOT EXISTS semester INTEGER;
ALTER TABLE class_sections ADD COLUMN IF NOT EXISTS section TEXT;

-- Fix courses
ALTER TABLE courses ADD COLUMN IF NOT EXISTS code TEXT;
ALTER TABLE courses ADD COLUMN IF NOT EXISTS dept_code TEXT;
ALTER TABLE courses ADD COLUMN IF NOT EXISTS type TEXT;
ALTER TABLE courses ADD COLUMN IF NOT EXISTS semester INTEGER;
ALTER TABLE courses ADD COLUMN IF NOT EXISTS credits INTEGER DEFAULT 3;

-- Re-create unique index for Upsert to work
DROP INDEX IF EXISTS idx_class_sections_unique;
CREATE UNIQUE INDEX IF NOT EXISTS idx_class_sections_unique ON class_sections (dept_code, academic_year_id, year, section);
ALTER TABLE class_sections DROP CONSTRAINT IF EXISTS class_sections_dept_code_academic_year_id_year_section_key;
ALTER TABLE class_sections ADD CONSTRAINT class_sections_dept_code_academic_year_id_year_section_key UNIQUE USING INDEX idx_class_sections_unique;


-- =============================================
-- 2. SEED DATA
-- =============================================

-- SEED TIMETABLES FOR ALL DEPARTMENTS
BEGIN;

INSERT INTO academic_years (id, name, start_date, end_date, is_active)
VALUES ('d860d5fb-d5f0-4497-a7ea-073004d80500', '2025-2026', '2025-06-01', '2026-05-30', true)
ON CONFLICT (id) DO NOTHING;


DO $$
DECLARE
    v_ay_id UUID := 'd860d5fb-d5f0-4497-a7ea-073004d80500';
    v_sec_id UUID;
    v_course_ids UUID[];
    v_fac_id UUID;
    v_dept text := 'CSE';
BEGIN
    -- 1. Ensure Section Exists
    INSERT INTO class_sections (name, dept_code, academic_year_id, academic_year, year, semester, section)
    VALUES ('CSE-2-A', v_dept::department_code, v_ay_id, '2025-2026', 2, 4, 'A')
    ON CONFLICT (dept_code, academic_year_id, year, section) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO v_sec_id;

    -- If we missed ID (due to no update), fetch it
    IF v_sec_id IS NULL THEN
        SELECT id INTO v_sec_id FROM class_sections 
        WHERE dept_code = v_dept AND academic_year_id = v_ay_id AND year = 2 AND section = 'A';
    END IF;

    -- 2. Clear existing timetable for this section to avoid clutter
    DELETE FROM timetable WHERE class_section_id = v_sec_id;

    -- 3. Loop and Insert Periods


    -- Monday Period 1: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-2-CLO', 'Cloud Computing', 'CSE-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '053c286b-7842-44cc-b9f2-f6ab213341a0', 
        (SELECT id FROM courses WHERE code = 'CSE-2-CLO'), 
        'Monday', 
        1, 
        '09:00', 
        '09:50';


    -- Monday Period 2: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-2-DEE', 'Deep Learning', 'CSE-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a8fde9b9-d80c-4874-b4c1-92707f715ad9', 
        (SELECT id FROM courses WHERE code = 'CSE-2-DEE'), 
        'Monday', 
        2, 
        '09:50', 
        '10:40';


    -- Monday Period 3: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-2-DAT', 'Data Visualization', 'CSE-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '69bbf5c8-d65d-46e6-a78b-7aba5155fac4', 
        (SELECT id FROM courses WHERE code = 'CSE-2-DAT'), 
        'Monday', 
        3, 
        '10:50', 
        '11:40';


    -- Monday Period 4: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-2-OPE', 'Operating Systems', 'CSE-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd0315d6-b7de-475c-a353-6cb629f81bcb', 
        (SELECT id FROM courses WHERE code = 'CSE-2-OPE'), 
        'Monday', 
        4, 
        '11:40', 
        '12:30';


    -- Monday Period 5: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-2-SOF', 'Software Project Management', 'CSE-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '65052824-8d73-4a2b-aad6-af55a1d78d0b', 
        (SELECT id FROM courses WHERE code = 'CSE-2-SOF'), 
        'Monday', 
        5, 
        '13:10', 
        '14:00';


    -- Monday Period 6: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-2-DEE', 'Deep Learning Lab', 'CSE-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '85f92cb1-eae2-4087-a966-cea8c59a4cd9', 
        (SELECT id FROM courses WHERE code = 'CSE-2-DEE'), 
        'Monday', 
        6, 
        '14:00', 
        '14:50';


    -- Monday Period 7: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-2-DAT', 'Data Visualization Lab', 'CSE-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'faea698c-094d-41ff-8b47-eb23046f1941', 
        (SELECT id FROM courses WHERE code = 'CSE-2-DAT'), 
        'Monday', 
        7, 
        '15:00', 
        '15:40';


    -- Monday Period 8: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-2-COU', 'Counseling', 'CSE-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '9026f2cd-58a5-4d83-b95a-e92255da908b', 
        (SELECT id FROM courses WHERE code = 'CSE-2-COU'), 
        'Monday', 
        8, 
        '15:40', 
        '16:20';


    -- Tuesday Period 1: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-2-DEE', 'Deep Learning', 'CSE-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a8fde9b9-d80c-4874-b4c1-92707f715ad9', 
        (SELECT id FROM courses WHERE code = 'CSE-2-DEE'), 
        'Tuesday', 
        1, 
        '09:00', 
        '09:50';


    -- Tuesday Period 2: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-2-DAT', 'Data Visualization', 'CSE-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '69bbf5c8-d65d-46e6-a78b-7aba5155fac4', 
        (SELECT id FROM courses WHERE code = 'CSE-2-DAT'), 
        'Tuesday', 
        2, 
        '09:50', 
        '10:40';


    -- Tuesday Period 3: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-2-OPE', 'Operating Systems', 'CSE-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd0315d6-b7de-475c-a353-6cb629f81bcb', 
        (SELECT id FROM courses WHERE code = 'CSE-2-OPE'), 
        'Tuesday', 
        3, 
        '10:50', 
        '11:40';


    -- Tuesday Period 4: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-2-SOF', 'Software Project Management', 'CSE-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '65052824-8d73-4a2b-aad6-af55a1d78d0b', 
        (SELECT id FROM courses WHERE code = 'CSE-2-SOF'), 
        'Tuesday', 
        4, 
        '11:40', 
        '12:30';


    -- Tuesday Period 5: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-2-DEE', 'Deep Learning Lab', 'CSE-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '85f92cb1-eae2-4087-a966-cea8c59a4cd9', 
        (SELECT id FROM courses WHERE code = 'CSE-2-DEE'), 
        'Tuesday', 
        5, 
        '13:10', 
        '14:00';


    -- Tuesday Period 6: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-2-DAT', 'Data Visualization Lab', 'CSE-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'faea698c-094d-41ff-8b47-eb23046f1941', 
        (SELECT id FROM courses WHERE code = 'CSE-2-DAT'), 
        'Tuesday', 
        6, 
        '14:00', 
        '14:50';


    -- Tuesday Period 7: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-2-COU', 'Counseling', 'CSE-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '9026f2cd-58a5-4d83-b95a-e92255da908b', 
        (SELECT id FROM courses WHERE code = 'CSE-2-COU'), 
        'Tuesday', 
        7, 
        '15:00', 
        '15:40';


    -- Tuesday Period 8: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-2-CLO', 'Cloud Computing', 'CSE-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '053c286b-7842-44cc-b9f2-f6ab213341a0', 
        (SELECT id FROM courses WHERE code = 'CSE-2-CLO'), 
        'Tuesday', 
        8, 
        '15:40', 
        '16:20';


    -- Wednesday Period 1: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-2-DAT', 'Data Visualization', 'CSE-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '69bbf5c8-d65d-46e6-a78b-7aba5155fac4', 
        (SELECT id FROM courses WHERE code = 'CSE-2-DAT'), 
        'Wednesday', 
        1, 
        '09:00', 
        '09:50';


    -- Wednesday Period 2: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-2-OPE', 'Operating Systems', 'CSE-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd0315d6-b7de-475c-a353-6cb629f81bcb', 
        (SELECT id FROM courses WHERE code = 'CSE-2-OPE'), 
        'Wednesday', 
        2, 
        '09:50', 
        '10:40';


    -- Wednesday Period 3: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-2-SOF', 'Software Project Management', 'CSE-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '65052824-8d73-4a2b-aad6-af55a1d78d0b', 
        (SELECT id FROM courses WHERE code = 'CSE-2-SOF'), 
        'Wednesday', 
        3, 
        '10:50', 
        '11:40';


    -- Wednesday Period 4: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-2-DEE', 'Deep Learning Lab', 'CSE-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '85f92cb1-eae2-4087-a966-cea8c59a4cd9', 
        (SELECT id FROM courses WHERE code = 'CSE-2-DEE'), 
        'Wednesday', 
        4, 
        '11:40', 
        '12:30';


    -- Wednesday Period 5: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-2-DAT', 'Data Visualization Lab', 'CSE-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'faea698c-094d-41ff-8b47-eb23046f1941', 
        (SELECT id FROM courses WHERE code = 'CSE-2-DAT'), 
        'Wednesday', 
        5, 
        '13:10', 
        '14:00';


    -- Wednesday Period 6: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-2-COU', 'Counseling', 'CSE-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '9026f2cd-58a5-4d83-b95a-e92255da908b', 
        (SELECT id FROM courses WHERE code = 'CSE-2-COU'), 
        'Wednesday', 
        6, 
        '14:00', 
        '14:50';


    -- Wednesday Period 7: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-2-CLO', 'Cloud Computing', 'CSE-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '053c286b-7842-44cc-b9f2-f6ab213341a0', 
        (SELECT id FROM courses WHERE code = 'CSE-2-CLO'), 
        'Wednesday', 
        7, 
        '15:00', 
        '15:40';


    -- Wednesday Period 8: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-2-DEE', 'Deep Learning', 'CSE-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a8fde9b9-d80c-4874-b4c1-92707f715ad9', 
        (SELECT id FROM courses WHERE code = 'CSE-2-DEE'), 
        'Wednesday', 
        8, 
        '15:40', 
        '16:20';


    -- Thursday Period 1: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-2-OPE', 'Operating Systems', 'CSE-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd0315d6-b7de-475c-a353-6cb629f81bcb', 
        (SELECT id FROM courses WHERE code = 'CSE-2-OPE'), 
        'Thursday', 
        1, 
        '09:00', 
        '09:50';


    -- Thursday Period 2: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-2-SOF', 'Software Project Management', 'CSE-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '65052824-8d73-4a2b-aad6-af55a1d78d0b', 
        (SELECT id FROM courses WHERE code = 'CSE-2-SOF'), 
        'Thursday', 
        2, 
        '09:50', 
        '10:40';


    -- Thursday Period 3: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-2-DEE', 'Deep Learning Lab', 'CSE-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '85f92cb1-eae2-4087-a966-cea8c59a4cd9', 
        (SELECT id FROM courses WHERE code = 'CSE-2-DEE'), 
        'Thursday', 
        3, 
        '10:50', 
        '11:40';


    -- Thursday Period 4: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-2-DAT', 'Data Visualization Lab', 'CSE-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'faea698c-094d-41ff-8b47-eb23046f1941', 
        (SELECT id FROM courses WHERE code = 'CSE-2-DAT'), 
        'Thursday', 
        4, 
        '11:40', 
        '12:30';


    -- Thursday Period 5: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-2-COU', 'Counseling', 'CSE-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '9026f2cd-58a5-4d83-b95a-e92255da908b', 
        (SELECT id FROM courses WHERE code = 'CSE-2-COU'), 
        'Thursday', 
        5, 
        '13:10', 
        '14:00';


    -- Thursday Period 6: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-2-CLO', 'Cloud Computing', 'CSE-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '053c286b-7842-44cc-b9f2-f6ab213341a0', 
        (SELECT id FROM courses WHERE code = 'CSE-2-CLO'), 
        'Thursday', 
        6, 
        '14:00', 
        '14:50';


    -- Thursday Period 7: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-2-DEE', 'Deep Learning', 'CSE-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a8fde9b9-d80c-4874-b4c1-92707f715ad9', 
        (SELECT id FROM courses WHERE code = 'CSE-2-DEE'), 
        'Thursday', 
        7, 
        '15:00', 
        '15:40';


    -- Thursday Period 8: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-2-DAT', 'Data Visualization', 'CSE-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '69bbf5c8-d65d-46e6-a78b-7aba5155fac4', 
        (SELECT id FROM courses WHERE code = 'CSE-2-DAT'), 
        'Thursday', 
        8, 
        '15:40', 
        '16:20';


    -- Friday Period 1: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-2-SOF', 'Software Project Management', 'CSE-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '65052824-8d73-4a2b-aad6-af55a1d78d0b', 
        (SELECT id FROM courses WHERE code = 'CSE-2-SOF'), 
        'Friday', 
        1, 
        '09:00', 
        '09:50';


    -- Friday Period 2: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-2-DEE', 'Deep Learning Lab', 'CSE-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '85f92cb1-eae2-4087-a966-cea8c59a4cd9', 
        (SELECT id FROM courses WHERE code = 'CSE-2-DEE'), 
        'Friday', 
        2, 
        '09:50', 
        '10:40';


    -- Friday Period 3: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-2-DAT', 'Data Visualization Lab', 'CSE-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'faea698c-094d-41ff-8b47-eb23046f1941', 
        (SELECT id FROM courses WHERE code = 'CSE-2-DAT'), 
        'Friday', 
        3, 
        '10:50', 
        '11:40';


    -- Friday Period 4: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-2-COU', 'Counseling', 'CSE-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '9026f2cd-58a5-4d83-b95a-e92255da908b', 
        (SELECT id FROM courses WHERE code = 'CSE-2-COU'), 
        'Friday', 
        4, 
        '11:40', 
        '12:30';


    -- Friday Period 5: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-2-CLO', 'Cloud Computing', 'CSE-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '053c286b-7842-44cc-b9f2-f6ab213341a0', 
        (SELECT id FROM courses WHERE code = 'CSE-2-CLO'), 
        'Friday', 
        5, 
        '13:10', 
        '14:00';


    -- Friday Period 6: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-2-DEE', 'Deep Learning', 'CSE-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a8fde9b9-d80c-4874-b4c1-92707f715ad9', 
        (SELECT id FROM courses WHERE code = 'CSE-2-DEE'), 
        'Friday', 
        6, 
        '14:00', 
        '14:50';


    -- Friday Period 7: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-2-DAT', 'Data Visualization', 'CSE-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '69bbf5c8-d65d-46e6-a78b-7aba5155fac4', 
        (SELECT id FROM courses WHERE code = 'CSE-2-DAT'), 
        'Friday', 
        7, 
        '15:00', 
        '15:40';


    -- Friday Period 8: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-2-OPE', 'Operating Systems', 'CSE-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd0315d6-b7de-475c-a353-6cb629f81bcb', 
        (SELECT id FROM courses WHERE code = 'CSE-2-OPE'), 
        'Friday', 
        8, 
        '15:40', 
        '16:20';


    -- Saturday Period 1: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-2-DEE', 'Deep Learning Lab', 'CSE-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '85f92cb1-eae2-4087-a966-cea8c59a4cd9', 
        (SELECT id FROM courses WHERE code = 'CSE-2-DEE'), 
        'Saturday', 
        1, 
        '09:00', 
        '09:50';


    -- Saturday Period 2: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-2-DAT', 'Data Visualization Lab', 'CSE-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'faea698c-094d-41ff-8b47-eb23046f1941', 
        (SELECT id FROM courses WHERE code = 'CSE-2-DAT'), 
        'Saturday', 
        2, 
        '09:50', 
        '10:40';


    -- Saturday Period 3: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-2-COU', 'Counseling', 'CSE-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '9026f2cd-58a5-4d83-b95a-e92255da908b', 
        (SELECT id FROM courses WHERE code = 'CSE-2-COU'), 
        'Saturday', 
        3, 
        '10:50', 
        '11:40';


    -- Saturday Period 4: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-2-CLO', 'Cloud Computing', 'CSE-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '053c286b-7842-44cc-b9f2-f6ab213341a0', 
        (SELECT id FROM courses WHERE code = 'CSE-2-CLO'), 
        'Saturday', 
        4, 
        '11:40', 
        '12:30';


    -- Saturday Period 5: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-2-DEE', 'Deep Learning', 'CSE-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a8fde9b9-d80c-4874-b4c1-92707f715ad9', 
        (SELECT id FROM courses WHERE code = 'CSE-2-DEE'), 
        'Saturday', 
        5, 
        '13:10', 
        '14:00';


    -- Saturday Period 6: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-2-DAT', 'Data Visualization', 'CSE-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '69bbf5c8-d65d-46e6-a78b-7aba5155fac4', 
        (SELECT id FROM courses WHERE code = 'CSE-2-DAT'), 
        'Saturday', 
        6, 
        '14:00', 
        '14:50';


    -- Saturday Period 7: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-2-OPE', 'Operating Systems', 'CSE-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd0315d6-b7de-475c-a353-6cb629f81bcb', 
        (SELECT id FROM courses WHERE code = 'CSE-2-OPE'), 
        'Saturday', 
        7, 
        '15:00', 
        '15:40';


    -- Saturday Period 8: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-2-SOF', 'Software Project Management', 'CSE-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '65052824-8d73-4a2b-aad6-af55a1d78d0b', 
        (SELECT id FROM courses WHERE code = 'CSE-2-SOF'), 
        'Saturday', 
        8, 
        '15:40', 
        '16:20';

END $$;

DO $$
DECLARE
    v_ay_id UUID := 'd860d5fb-d5f0-4497-a7ea-073004d80500';
    v_sec_id UUID;
    v_course_ids UUID[];
    v_fac_id UUID;
    v_dept text := 'CSE';
BEGIN
    -- 1. Ensure Section Exists
    INSERT INTO class_sections (name, dept_code, academic_year_id, academic_year, year, semester, section)
    VALUES ('CSE-3-A', v_dept::department_code, v_ay_id, '2025-2026', 3, 6, 'A')
    ON CONFLICT (dept_code, academic_year_id, year, section) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO v_sec_id;

    -- If we missed ID (due to no update), fetch it
    IF v_sec_id IS NULL THEN
        SELECT id INTO v_sec_id FROM class_sections 
        WHERE dept_code = v_dept AND academic_year_id = v_ay_id AND year = 3 AND section = 'A';
    END IF;

    -- 2. Clear existing timetable for this section to avoid clutter
    DELETE FROM timetable WHERE class_section_id = v_sec_id;

    -- 3. Loop and Insert Periods


    -- Monday Period 1: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-3-CLO', 'Cloud Computing', 'CSE-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '053c286b-7842-44cc-b9f2-f6ab213341a0', 
        (SELECT id FROM courses WHERE code = 'CSE-3-CLO'), 
        'Monday', 
        1, 
        '09:00', 
        '09:50';


    -- Monday Period 2: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-3-DEE', 'Deep Learning', 'CSE-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a8fde9b9-d80c-4874-b4c1-92707f715ad9', 
        (SELECT id FROM courses WHERE code = 'CSE-3-DEE'), 
        'Monday', 
        2, 
        '09:50', 
        '10:40';


    -- Monday Period 3: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-3-DAT', 'Data Visualization', 'CSE-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '69bbf5c8-d65d-46e6-a78b-7aba5155fac4', 
        (SELECT id FROM courses WHERE code = 'CSE-3-DAT'), 
        'Monday', 
        3, 
        '10:50', 
        '11:40';


    -- Monday Period 4: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-3-OPE', 'Operating Systems', 'CSE-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd0315d6-b7de-475c-a353-6cb629f81bcb', 
        (SELECT id FROM courses WHERE code = 'CSE-3-OPE'), 
        'Monday', 
        4, 
        '11:40', 
        '12:30';


    -- Monday Period 5: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-3-SOF', 'Software Project Management', 'CSE-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '65052824-8d73-4a2b-aad6-af55a1d78d0b', 
        (SELECT id FROM courses WHERE code = 'CSE-3-SOF'), 
        'Monday', 
        5, 
        '13:10', 
        '14:00';


    -- Monday Period 6: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-3-DEE', 'Deep Learning Lab', 'CSE-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '85f92cb1-eae2-4087-a966-cea8c59a4cd9', 
        (SELECT id FROM courses WHERE code = 'CSE-3-DEE'), 
        'Monday', 
        6, 
        '14:00', 
        '14:50';


    -- Monday Period 7: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-3-DAT', 'Data Visualization Lab', 'CSE-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'faea698c-094d-41ff-8b47-eb23046f1941', 
        (SELECT id FROM courses WHERE code = 'CSE-3-DAT'), 
        'Monday', 
        7, 
        '15:00', 
        '15:40';


    -- Monday Period 8: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-3-COU', 'Counseling', 'CSE-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '9026f2cd-58a5-4d83-b95a-e92255da908b', 
        (SELECT id FROM courses WHERE code = 'CSE-3-COU'), 
        'Monday', 
        8, 
        '15:40', 
        '16:20';


    -- Tuesday Period 1: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-3-DEE', 'Deep Learning', 'CSE-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a8fde9b9-d80c-4874-b4c1-92707f715ad9', 
        (SELECT id FROM courses WHERE code = 'CSE-3-DEE'), 
        'Tuesday', 
        1, 
        '09:00', 
        '09:50';


    -- Tuesday Period 2: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-3-DAT', 'Data Visualization', 'CSE-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '69bbf5c8-d65d-46e6-a78b-7aba5155fac4', 
        (SELECT id FROM courses WHERE code = 'CSE-3-DAT'), 
        'Tuesday', 
        2, 
        '09:50', 
        '10:40';


    -- Tuesday Period 3: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-3-OPE', 'Operating Systems', 'CSE-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd0315d6-b7de-475c-a353-6cb629f81bcb', 
        (SELECT id FROM courses WHERE code = 'CSE-3-OPE'), 
        'Tuesday', 
        3, 
        '10:50', 
        '11:40';


    -- Tuesday Period 4: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-3-SOF', 'Software Project Management', 'CSE-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '65052824-8d73-4a2b-aad6-af55a1d78d0b', 
        (SELECT id FROM courses WHERE code = 'CSE-3-SOF'), 
        'Tuesday', 
        4, 
        '11:40', 
        '12:30';


    -- Tuesday Period 5: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-3-DEE', 'Deep Learning Lab', 'CSE-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '85f92cb1-eae2-4087-a966-cea8c59a4cd9', 
        (SELECT id FROM courses WHERE code = 'CSE-3-DEE'), 
        'Tuesday', 
        5, 
        '13:10', 
        '14:00';


    -- Tuesday Period 6: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-3-DAT', 'Data Visualization Lab', 'CSE-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'faea698c-094d-41ff-8b47-eb23046f1941', 
        (SELECT id FROM courses WHERE code = 'CSE-3-DAT'), 
        'Tuesday', 
        6, 
        '14:00', 
        '14:50';


    -- Tuesday Period 7: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-3-COU', 'Counseling', 'CSE-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '9026f2cd-58a5-4d83-b95a-e92255da908b', 
        (SELECT id FROM courses WHERE code = 'CSE-3-COU'), 
        'Tuesday', 
        7, 
        '15:00', 
        '15:40';


    -- Tuesday Period 8: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-3-CLO', 'Cloud Computing', 'CSE-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '053c286b-7842-44cc-b9f2-f6ab213341a0', 
        (SELECT id FROM courses WHERE code = 'CSE-3-CLO'), 
        'Tuesday', 
        8, 
        '15:40', 
        '16:20';


    -- Wednesday Period 1: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-3-DAT', 'Data Visualization', 'CSE-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '69bbf5c8-d65d-46e6-a78b-7aba5155fac4', 
        (SELECT id FROM courses WHERE code = 'CSE-3-DAT'), 
        'Wednesday', 
        1, 
        '09:00', 
        '09:50';


    -- Wednesday Period 2: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-3-OPE', 'Operating Systems', 'CSE-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd0315d6-b7de-475c-a353-6cb629f81bcb', 
        (SELECT id FROM courses WHERE code = 'CSE-3-OPE'), 
        'Wednesday', 
        2, 
        '09:50', 
        '10:40';


    -- Wednesday Period 3: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-3-SOF', 'Software Project Management', 'CSE-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '65052824-8d73-4a2b-aad6-af55a1d78d0b', 
        (SELECT id FROM courses WHERE code = 'CSE-3-SOF'), 
        'Wednesday', 
        3, 
        '10:50', 
        '11:40';


    -- Wednesday Period 4: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-3-DEE', 'Deep Learning Lab', 'CSE-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '85f92cb1-eae2-4087-a966-cea8c59a4cd9', 
        (SELECT id FROM courses WHERE code = 'CSE-3-DEE'), 
        'Wednesday', 
        4, 
        '11:40', 
        '12:30';


    -- Wednesday Period 5: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-3-DAT', 'Data Visualization Lab', 'CSE-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'faea698c-094d-41ff-8b47-eb23046f1941', 
        (SELECT id FROM courses WHERE code = 'CSE-3-DAT'), 
        'Wednesday', 
        5, 
        '13:10', 
        '14:00';


    -- Wednesday Period 6: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-3-COU', 'Counseling', 'CSE-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '9026f2cd-58a5-4d83-b95a-e92255da908b', 
        (SELECT id FROM courses WHERE code = 'CSE-3-COU'), 
        'Wednesday', 
        6, 
        '14:00', 
        '14:50';


    -- Wednesday Period 7: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-3-CLO', 'Cloud Computing', 'CSE-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '053c286b-7842-44cc-b9f2-f6ab213341a0', 
        (SELECT id FROM courses WHERE code = 'CSE-3-CLO'), 
        'Wednesday', 
        7, 
        '15:00', 
        '15:40';


    -- Wednesday Period 8: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-3-DEE', 'Deep Learning', 'CSE-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a8fde9b9-d80c-4874-b4c1-92707f715ad9', 
        (SELECT id FROM courses WHERE code = 'CSE-3-DEE'), 
        'Wednesday', 
        8, 
        '15:40', 
        '16:20';


    -- Thursday Period 1: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-3-OPE', 'Operating Systems', 'CSE-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd0315d6-b7de-475c-a353-6cb629f81bcb', 
        (SELECT id FROM courses WHERE code = 'CSE-3-OPE'), 
        'Thursday', 
        1, 
        '09:00', 
        '09:50';


    -- Thursday Period 2: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-3-SOF', 'Software Project Management', 'CSE-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '65052824-8d73-4a2b-aad6-af55a1d78d0b', 
        (SELECT id FROM courses WHERE code = 'CSE-3-SOF'), 
        'Thursday', 
        2, 
        '09:50', 
        '10:40';


    -- Thursday Period 3: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-3-DEE', 'Deep Learning Lab', 'CSE-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '85f92cb1-eae2-4087-a966-cea8c59a4cd9', 
        (SELECT id FROM courses WHERE code = 'CSE-3-DEE'), 
        'Thursday', 
        3, 
        '10:50', 
        '11:40';


    -- Thursday Period 4: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-3-DAT', 'Data Visualization Lab', 'CSE-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'faea698c-094d-41ff-8b47-eb23046f1941', 
        (SELECT id FROM courses WHERE code = 'CSE-3-DAT'), 
        'Thursday', 
        4, 
        '11:40', 
        '12:30';


    -- Thursday Period 5: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-3-COU', 'Counseling', 'CSE-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '9026f2cd-58a5-4d83-b95a-e92255da908b', 
        (SELECT id FROM courses WHERE code = 'CSE-3-COU'), 
        'Thursday', 
        5, 
        '13:10', 
        '14:00';


    -- Thursday Period 6: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-3-CLO', 'Cloud Computing', 'CSE-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '053c286b-7842-44cc-b9f2-f6ab213341a0', 
        (SELECT id FROM courses WHERE code = 'CSE-3-CLO'), 
        'Thursday', 
        6, 
        '14:00', 
        '14:50';


    -- Thursday Period 7: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-3-DEE', 'Deep Learning', 'CSE-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a8fde9b9-d80c-4874-b4c1-92707f715ad9', 
        (SELECT id FROM courses WHERE code = 'CSE-3-DEE'), 
        'Thursday', 
        7, 
        '15:00', 
        '15:40';


    -- Thursday Period 8: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-3-DAT', 'Data Visualization', 'CSE-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '69bbf5c8-d65d-46e6-a78b-7aba5155fac4', 
        (SELECT id FROM courses WHERE code = 'CSE-3-DAT'), 
        'Thursday', 
        8, 
        '15:40', 
        '16:20';


    -- Friday Period 1: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-3-SOF', 'Software Project Management', 'CSE-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '65052824-8d73-4a2b-aad6-af55a1d78d0b', 
        (SELECT id FROM courses WHERE code = 'CSE-3-SOF'), 
        'Friday', 
        1, 
        '09:00', 
        '09:50';


    -- Friday Period 2: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-3-DEE', 'Deep Learning Lab', 'CSE-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '85f92cb1-eae2-4087-a966-cea8c59a4cd9', 
        (SELECT id FROM courses WHERE code = 'CSE-3-DEE'), 
        'Friday', 
        2, 
        '09:50', 
        '10:40';


    -- Friday Period 3: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-3-DAT', 'Data Visualization Lab', 'CSE-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'faea698c-094d-41ff-8b47-eb23046f1941', 
        (SELECT id FROM courses WHERE code = 'CSE-3-DAT'), 
        'Friday', 
        3, 
        '10:50', 
        '11:40';


    -- Friday Period 4: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-3-COU', 'Counseling', 'CSE-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '9026f2cd-58a5-4d83-b95a-e92255da908b', 
        (SELECT id FROM courses WHERE code = 'CSE-3-COU'), 
        'Friday', 
        4, 
        '11:40', 
        '12:30';


    -- Friday Period 5: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-3-CLO', 'Cloud Computing', 'CSE-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '053c286b-7842-44cc-b9f2-f6ab213341a0', 
        (SELECT id FROM courses WHERE code = 'CSE-3-CLO'), 
        'Friday', 
        5, 
        '13:10', 
        '14:00';


    -- Friday Period 6: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-3-DEE', 'Deep Learning', 'CSE-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a8fde9b9-d80c-4874-b4c1-92707f715ad9', 
        (SELECT id FROM courses WHERE code = 'CSE-3-DEE'), 
        'Friday', 
        6, 
        '14:00', 
        '14:50';


    -- Friday Period 7: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-3-DAT', 'Data Visualization', 'CSE-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '69bbf5c8-d65d-46e6-a78b-7aba5155fac4', 
        (SELECT id FROM courses WHERE code = 'CSE-3-DAT'), 
        'Friday', 
        7, 
        '15:00', 
        '15:40';


    -- Friday Period 8: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-3-OPE', 'Operating Systems', 'CSE-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd0315d6-b7de-475c-a353-6cb629f81bcb', 
        (SELECT id FROM courses WHERE code = 'CSE-3-OPE'), 
        'Friday', 
        8, 
        '15:40', 
        '16:20';


    -- Saturday Period 1: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-3-DEE', 'Deep Learning Lab', 'CSE-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '85f92cb1-eae2-4087-a966-cea8c59a4cd9', 
        (SELECT id FROM courses WHERE code = 'CSE-3-DEE'), 
        'Saturday', 
        1, 
        '09:00', 
        '09:50';


    -- Saturday Period 2: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-3-DAT', 'Data Visualization Lab', 'CSE-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'faea698c-094d-41ff-8b47-eb23046f1941', 
        (SELECT id FROM courses WHERE code = 'CSE-3-DAT'), 
        'Saturday', 
        2, 
        '09:50', 
        '10:40';


    -- Saturday Period 3: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-3-COU', 'Counseling', 'CSE-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '9026f2cd-58a5-4d83-b95a-e92255da908b', 
        (SELECT id FROM courses WHERE code = 'CSE-3-COU'), 
        'Saturday', 
        3, 
        '10:50', 
        '11:40';


    -- Saturday Period 4: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-3-CLO', 'Cloud Computing', 'CSE-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '053c286b-7842-44cc-b9f2-f6ab213341a0', 
        (SELECT id FROM courses WHERE code = 'CSE-3-CLO'), 
        'Saturday', 
        4, 
        '11:40', 
        '12:30';


    -- Saturday Period 5: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-3-DEE', 'Deep Learning', 'CSE-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a8fde9b9-d80c-4874-b4c1-92707f715ad9', 
        (SELECT id FROM courses WHERE code = 'CSE-3-DEE'), 
        'Saturday', 
        5, 
        '13:10', 
        '14:00';


    -- Saturday Period 6: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-3-DAT', 'Data Visualization', 'CSE-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '69bbf5c8-d65d-46e6-a78b-7aba5155fac4', 
        (SELECT id FROM courses WHERE code = 'CSE-3-DAT'), 
        'Saturday', 
        6, 
        '14:00', 
        '14:50';


    -- Saturday Period 7: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-3-OPE', 'Operating Systems', 'CSE-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd0315d6-b7de-475c-a353-6cb629f81bcb', 
        (SELECT id FROM courses WHERE code = 'CSE-3-OPE'), 
        'Saturday', 
        7, 
        '15:00', 
        '15:40';


    -- Saturday Period 8: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-3-SOF', 'Software Project Management', 'CSE-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '65052824-8d73-4a2b-aad6-af55a1d78d0b', 
        (SELECT id FROM courses WHERE code = 'CSE-3-SOF'), 
        'Saturday', 
        8, 
        '15:40', 
        '16:20';

END $$;

DO $$
DECLARE
    v_ay_id UUID := 'd860d5fb-d5f0-4497-a7ea-073004d80500';
    v_sec_id UUID;
    v_course_ids UUID[];
    v_fac_id UUID;
    v_dept text := 'CSE';
BEGIN
    -- 1. Ensure Section Exists
    INSERT INTO class_sections (name, dept_code, academic_year_id, academic_year, year, semester, section)
    VALUES ('CSE-4-A', v_dept::department_code, v_ay_id, '2025-2026', 4, 8, 'A')
    ON CONFLICT (dept_code, academic_year_id, year, section) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO v_sec_id;

    -- If we missed ID (due to no update), fetch it
    IF v_sec_id IS NULL THEN
        SELECT id INTO v_sec_id FROM class_sections 
        WHERE dept_code = v_dept AND academic_year_id = v_ay_id AND year = 4 AND section = 'A';
    END IF;

    -- 2. Clear existing timetable for this section to avoid clutter
    DELETE FROM timetable WHERE class_section_id = v_sec_id;

    -- 3. Loop and Insert Periods


    -- Monday Period 1: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-4-CLO', 'Cloud Computing', 'CSE-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '053c286b-7842-44cc-b9f2-f6ab213341a0', 
        (SELECT id FROM courses WHERE code = 'CSE-4-CLO'), 
        'Monday', 
        1, 
        '09:00', 
        '09:50';


    -- Monday Period 2: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-4-DEE', 'Deep Learning', 'CSE-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a8fde9b9-d80c-4874-b4c1-92707f715ad9', 
        (SELECT id FROM courses WHERE code = 'CSE-4-DEE'), 
        'Monday', 
        2, 
        '09:50', 
        '10:40';


    -- Monday Period 3: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-4-DAT', 'Data Visualization', 'CSE-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '69bbf5c8-d65d-46e6-a78b-7aba5155fac4', 
        (SELECT id FROM courses WHERE code = 'CSE-4-DAT'), 
        'Monday', 
        3, 
        '10:50', 
        '11:40';


    -- Monday Period 4: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-4-OPE', 'Operating Systems', 'CSE-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd0315d6-b7de-475c-a353-6cb629f81bcb', 
        (SELECT id FROM courses WHERE code = 'CSE-4-OPE'), 
        'Monday', 
        4, 
        '11:40', 
        '12:30';


    -- Monday Period 5: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-4-SOF', 'Software Project Management', 'CSE-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '65052824-8d73-4a2b-aad6-af55a1d78d0b', 
        (SELECT id FROM courses WHERE code = 'CSE-4-SOF'), 
        'Monday', 
        5, 
        '13:10', 
        '14:00';


    -- Monday Period 6: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-4-DEE', 'Deep Learning Lab', 'CSE-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '85f92cb1-eae2-4087-a966-cea8c59a4cd9', 
        (SELECT id FROM courses WHERE code = 'CSE-4-DEE'), 
        'Monday', 
        6, 
        '14:00', 
        '14:50';


    -- Monday Period 7: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-4-DAT', 'Data Visualization Lab', 'CSE-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'faea698c-094d-41ff-8b47-eb23046f1941', 
        (SELECT id FROM courses WHERE code = 'CSE-4-DAT'), 
        'Monday', 
        7, 
        '15:00', 
        '15:40';


    -- Monday Period 8: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-4-COU', 'Counseling', 'CSE-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '9026f2cd-58a5-4d83-b95a-e92255da908b', 
        (SELECT id FROM courses WHERE code = 'CSE-4-COU'), 
        'Monday', 
        8, 
        '15:40', 
        '16:20';


    -- Tuesday Period 1: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-4-DEE', 'Deep Learning', 'CSE-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a8fde9b9-d80c-4874-b4c1-92707f715ad9', 
        (SELECT id FROM courses WHERE code = 'CSE-4-DEE'), 
        'Tuesday', 
        1, 
        '09:00', 
        '09:50';


    -- Tuesday Period 2: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-4-DAT', 'Data Visualization', 'CSE-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '69bbf5c8-d65d-46e6-a78b-7aba5155fac4', 
        (SELECT id FROM courses WHERE code = 'CSE-4-DAT'), 
        'Tuesday', 
        2, 
        '09:50', 
        '10:40';


    -- Tuesday Period 3: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-4-OPE', 'Operating Systems', 'CSE-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd0315d6-b7de-475c-a353-6cb629f81bcb', 
        (SELECT id FROM courses WHERE code = 'CSE-4-OPE'), 
        'Tuesday', 
        3, 
        '10:50', 
        '11:40';


    -- Tuesday Period 4: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-4-SOF', 'Software Project Management', 'CSE-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '65052824-8d73-4a2b-aad6-af55a1d78d0b', 
        (SELECT id FROM courses WHERE code = 'CSE-4-SOF'), 
        'Tuesday', 
        4, 
        '11:40', 
        '12:30';


    -- Tuesday Period 5: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-4-DEE', 'Deep Learning Lab', 'CSE-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '85f92cb1-eae2-4087-a966-cea8c59a4cd9', 
        (SELECT id FROM courses WHERE code = 'CSE-4-DEE'), 
        'Tuesday', 
        5, 
        '13:10', 
        '14:00';


    -- Tuesday Period 6: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-4-DAT', 'Data Visualization Lab', 'CSE-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'faea698c-094d-41ff-8b47-eb23046f1941', 
        (SELECT id FROM courses WHERE code = 'CSE-4-DAT'), 
        'Tuesday', 
        6, 
        '14:00', 
        '14:50';


    -- Tuesday Period 7: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-4-COU', 'Counseling', 'CSE-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '9026f2cd-58a5-4d83-b95a-e92255da908b', 
        (SELECT id FROM courses WHERE code = 'CSE-4-COU'), 
        'Tuesday', 
        7, 
        '15:00', 
        '15:40';


    -- Tuesday Period 8: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-4-CLO', 'Cloud Computing', 'CSE-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '053c286b-7842-44cc-b9f2-f6ab213341a0', 
        (SELECT id FROM courses WHERE code = 'CSE-4-CLO'), 
        'Tuesday', 
        8, 
        '15:40', 
        '16:20';


    -- Wednesday Period 1: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-4-DAT', 'Data Visualization', 'CSE-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '69bbf5c8-d65d-46e6-a78b-7aba5155fac4', 
        (SELECT id FROM courses WHERE code = 'CSE-4-DAT'), 
        'Wednesday', 
        1, 
        '09:00', 
        '09:50';


    -- Wednesday Period 2: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-4-OPE', 'Operating Systems', 'CSE-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd0315d6-b7de-475c-a353-6cb629f81bcb', 
        (SELECT id FROM courses WHERE code = 'CSE-4-OPE'), 
        'Wednesday', 
        2, 
        '09:50', 
        '10:40';


    -- Wednesday Period 3: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-4-SOF', 'Software Project Management', 'CSE-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '65052824-8d73-4a2b-aad6-af55a1d78d0b', 
        (SELECT id FROM courses WHERE code = 'CSE-4-SOF'), 
        'Wednesday', 
        3, 
        '10:50', 
        '11:40';


    -- Wednesday Period 4: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-4-DEE', 'Deep Learning Lab', 'CSE-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '85f92cb1-eae2-4087-a966-cea8c59a4cd9', 
        (SELECT id FROM courses WHERE code = 'CSE-4-DEE'), 
        'Wednesday', 
        4, 
        '11:40', 
        '12:30';


    -- Wednesday Period 5: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-4-DAT', 'Data Visualization Lab', 'CSE-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'faea698c-094d-41ff-8b47-eb23046f1941', 
        (SELECT id FROM courses WHERE code = 'CSE-4-DAT'), 
        'Wednesday', 
        5, 
        '13:10', 
        '14:00';


    -- Wednesday Period 6: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-4-COU', 'Counseling', 'CSE-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '9026f2cd-58a5-4d83-b95a-e92255da908b', 
        (SELECT id FROM courses WHERE code = 'CSE-4-COU'), 
        'Wednesday', 
        6, 
        '14:00', 
        '14:50';


    -- Wednesday Period 7: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-4-CLO', 'Cloud Computing', 'CSE-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '053c286b-7842-44cc-b9f2-f6ab213341a0', 
        (SELECT id FROM courses WHERE code = 'CSE-4-CLO'), 
        'Wednesday', 
        7, 
        '15:00', 
        '15:40';


    -- Wednesday Period 8: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-4-DEE', 'Deep Learning', 'CSE-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a8fde9b9-d80c-4874-b4c1-92707f715ad9', 
        (SELECT id FROM courses WHERE code = 'CSE-4-DEE'), 
        'Wednesday', 
        8, 
        '15:40', 
        '16:20';


    -- Thursday Period 1: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-4-OPE', 'Operating Systems', 'CSE-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd0315d6-b7de-475c-a353-6cb629f81bcb', 
        (SELECT id FROM courses WHERE code = 'CSE-4-OPE'), 
        'Thursday', 
        1, 
        '09:00', 
        '09:50';


    -- Thursday Period 2: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-4-SOF', 'Software Project Management', 'CSE-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '65052824-8d73-4a2b-aad6-af55a1d78d0b', 
        (SELECT id FROM courses WHERE code = 'CSE-4-SOF'), 
        'Thursday', 
        2, 
        '09:50', 
        '10:40';


    -- Thursday Period 3: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-4-DEE', 'Deep Learning Lab', 'CSE-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '85f92cb1-eae2-4087-a966-cea8c59a4cd9', 
        (SELECT id FROM courses WHERE code = 'CSE-4-DEE'), 
        'Thursday', 
        3, 
        '10:50', 
        '11:40';


    -- Thursday Period 4: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-4-DAT', 'Data Visualization Lab', 'CSE-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'faea698c-094d-41ff-8b47-eb23046f1941', 
        (SELECT id FROM courses WHERE code = 'CSE-4-DAT'), 
        'Thursday', 
        4, 
        '11:40', 
        '12:30';


    -- Thursday Period 5: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-4-COU', 'Counseling', 'CSE-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '9026f2cd-58a5-4d83-b95a-e92255da908b', 
        (SELECT id FROM courses WHERE code = 'CSE-4-COU'), 
        'Thursday', 
        5, 
        '13:10', 
        '14:00';


    -- Thursday Period 6: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-4-CLO', 'Cloud Computing', 'CSE-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '053c286b-7842-44cc-b9f2-f6ab213341a0', 
        (SELECT id FROM courses WHERE code = 'CSE-4-CLO'), 
        'Thursday', 
        6, 
        '14:00', 
        '14:50';


    -- Thursday Period 7: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-4-DEE', 'Deep Learning', 'CSE-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a8fde9b9-d80c-4874-b4c1-92707f715ad9', 
        (SELECT id FROM courses WHERE code = 'CSE-4-DEE'), 
        'Thursday', 
        7, 
        '15:00', 
        '15:40';


    -- Thursday Period 8: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-4-DAT', 'Data Visualization', 'CSE-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '69bbf5c8-d65d-46e6-a78b-7aba5155fac4', 
        (SELECT id FROM courses WHERE code = 'CSE-4-DAT'), 
        'Thursday', 
        8, 
        '15:40', 
        '16:20';


    -- Friday Period 1: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-4-SOF', 'Software Project Management', 'CSE-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '65052824-8d73-4a2b-aad6-af55a1d78d0b', 
        (SELECT id FROM courses WHERE code = 'CSE-4-SOF'), 
        'Friday', 
        1, 
        '09:00', 
        '09:50';


    -- Friday Period 2: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-4-DEE', 'Deep Learning Lab', 'CSE-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '85f92cb1-eae2-4087-a966-cea8c59a4cd9', 
        (SELECT id FROM courses WHERE code = 'CSE-4-DEE'), 
        'Friday', 
        2, 
        '09:50', 
        '10:40';


    -- Friday Period 3: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-4-DAT', 'Data Visualization Lab', 'CSE-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'faea698c-094d-41ff-8b47-eb23046f1941', 
        (SELECT id FROM courses WHERE code = 'CSE-4-DAT'), 
        'Friday', 
        3, 
        '10:50', 
        '11:40';


    -- Friday Period 4: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-4-COU', 'Counseling', 'CSE-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '9026f2cd-58a5-4d83-b95a-e92255da908b', 
        (SELECT id FROM courses WHERE code = 'CSE-4-COU'), 
        'Friday', 
        4, 
        '11:40', 
        '12:30';


    -- Friday Period 5: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-4-CLO', 'Cloud Computing', 'CSE-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '053c286b-7842-44cc-b9f2-f6ab213341a0', 
        (SELECT id FROM courses WHERE code = 'CSE-4-CLO'), 
        'Friday', 
        5, 
        '13:10', 
        '14:00';


    -- Friday Period 6: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-4-DEE', 'Deep Learning', 'CSE-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a8fde9b9-d80c-4874-b4c1-92707f715ad9', 
        (SELECT id FROM courses WHERE code = 'CSE-4-DEE'), 
        'Friday', 
        6, 
        '14:00', 
        '14:50';


    -- Friday Period 7: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-4-DAT', 'Data Visualization', 'CSE-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '69bbf5c8-d65d-46e6-a78b-7aba5155fac4', 
        (SELECT id FROM courses WHERE code = 'CSE-4-DAT'), 
        'Friday', 
        7, 
        '15:00', 
        '15:40';


    -- Friday Period 8: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-4-OPE', 'Operating Systems', 'CSE-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd0315d6-b7de-475c-a353-6cb629f81bcb', 
        (SELECT id FROM courses WHERE code = 'CSE-4-OPE'), 
        'Friday', 
        8, 
        '15:40', 
        '16:20';


    -- Saturday Period 1: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-4-DEE', 'Deep Learning Lab', 'CSE-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '85f92cb1-eae2-4087-a966-cea8c59a4cd9', 
        (SELECT id FROM courses WHERE code = 'CSE-4-DEE'), 
        'Saturday', 
        1, 
        '09:00', 
        '09:50';


    -- Saturday Period 2: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-4-DAT', 'Data Visualization Lab', 'CSE-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'faea698c-094d-41ff-8b47-eb23046f1941', 
        (SELECT id FROM courses WHERE code = 'CSE-4-DAT'), 
        'Saturday', 
        2, 
        '09:50', 
        '10:40';


    -- Saturday Period 3: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-4-COU', 'Counseling', 'CSE-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '9026f2cd-58a5-4d83-b95a-e92255da908b', 
        (SELECT id FROM courses WHERE code = 'CSE-4-COU'), 
        'Saturday', 
        3, 
        '10:50', 
        '11:40';


    -- Saturday Period 4: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-4-CLO', 'Cloud Computing', 'CSE-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '053c286b-7842-44cc-b9f2-f6ab213341a0', 
        (SELECT id FROM courses WHERE code = 'CSE-4-CLO'), 
        'Saturday', 
        4, 
        '11:40', 
        '12:30';


    -- Saturday Period 5: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-4-DEE', 'Deep Learning', 'CSE-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a8fde9b9-d80c-4874-b4c1-92707f715ad9', 
        (SELECT id FROM courses WHERE code = 'CSE-4-DEE'), 
        'Saturday', 
        5, 
        '13:10', 
        '14:00';


    -- Saturday Period 6: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-4-DAT', 'Data Visualization', 'CSE-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '69bbf5c8-d65d-46e6-a78b-7aba5155fac4', 
        (SELECT id FROM courses WHERE code = 'CSE-4-DAT'), 
        'Saturday', 
        6, 
        '14:00', 
        '14:50';


    -- Saturday Period 7: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-4-OPE', 'Operating Systems', 'CSE-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd0315d6-b7de-475c-a353-6cb629f81bcb', 
        (SELECT id FROM courses WHERE code = 'CSE-4-OPE'), 
        'Saturday', 
        7, 
        '15:00', 
        '15:40';


    -- Saturday Period 8: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-4-SOF', 'Software Project Management', 'CSE-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '65052824-8d73-4a2b-aad6-af55a1d78d0b', 
        (SELECT id FROM courses WHERE code = 'CSE-4-SOF'), 
        'Saturday', 
        8, 
        '15:40', 
        '16:20';

END $$;

DO $$
DECLARE
    v_ay_id UUID := 'd860d5fb-d5f0-4497-a7ea-073004d80500';
    v_sec_id UUID;
    v_course_ids UUID[];
    v_fac_id UUID;
    v_dept text := 'CSE-DS';
BEGIN
    -- 1. Ensure Section Exists
    INSERT INTO class_sections (name, dept_code, academic_year_id, academic_year, year, semester, section)
    VALUES ('CSE-DS-2-A', v_dept::department_code, v_ay_id, '2025-2026', 2, 4, 'A')
    ON CONFLICT (dept_code, academic_year_id, year, section) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO v_sec_id;

    -- If we missed ID (due to no update), fetch it
    IF v_sec_id IS NULL THEN
        SELECT id INTO v_sec_id FROM class_sections 
        WHERE dept_code = v_dept AND academic_year_id = v_ay_id AND year = 2 AND section = 'A';
    END IF;

    -- 2. Clear existing timetable for this section to avoid clutter
    DELETE FROM timetable WHERE class_section_id = v_sec_id;

    -- 3. Loop and Insert Periods


    -- Monday Period 1: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-2-CLO', 'Cloud Computing', 'CSE-DS-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ba46b8c1-4e2c-4023-a724-bab3d5d3a1f1', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-2-CLO'), 
        'Monday', 
        1, 
        '09:00', 
        '09:50';


    -- Monday Period 2: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-2-DEE', 'Deep Learning', 'CSE-DS-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4b006460-430b-4ffe-b988-dfc5ba5ed69d', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-2-DEE'), 
        'Monday', 
        2, 
        '09:50', 
        '10:40';


    -- Monday Period 3: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-2-DAT', 'Data Visualization', 'CSE-DS-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '5df3c21c-3914-4325-83f5-65363b0febe0', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-2-DAT'), 
        'Monday', 
        3, 
        '10:50', 
        '11:40';


    -- Monday Period 4: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-2-OPE', 'Operating Systems', 'CSE-DS-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f5501be3-3f54-4824-ab65-38e5c0596d08', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-2-OPE'), 
        'Monday', 
        4, 
        '11:40', 
        '12:30';


    -- Monday Period 5: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-2-SOF', 'Software Project Management', 'CSE-DS-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f697a7da-b4b3-4c3a-9319-c11183a3e2c6', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-2-SOF'), 
        'Monday', 
        5, 
        '13:10', 
        '14:00';


    -- Monday Period 6: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-2-DEE', 'Deep Learning Lab', 'CSE-DS-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '61cdebee-2a5d-46ae-af3f-7c809c5d73d2', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-2-DEE'), 
        'Monday', 
        6, 
        '14:00', 
        '14:50';


    -- Monday Period 7: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-2-DAT', 'Data Visualization Lab', 'CSE-DS-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '3a539444-9c6a-477f-a45e-87b7fc362a9c', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-2-DAT'), 
        'Monday', 
        7, 
        '15:00', 
        '15:40';


    -- Monday Period 8: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-2-COU', 'Counseling', 'CSE-DS-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f544301c-c574-4edf-8ebd-20db6da445cb', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-2-COU'), 
        'Monday', 
        8, 
        '15:40', 
        '16:20';


    -- Tuesday Period 1: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-2-DEE', 'Deep Learning', 'CSE-DS-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4b006460-430b-4ffe-b988-dfc5ba5ed69d', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-2-DEE'), 
        'Tuesday', 
        1, 
        '09:00', 
        '09:50';


    -- Tuesday Period 2: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-2-DAT', 'Data Visualization', 'CSE-DS-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '5df3c21c-3914-4325-83f5-65363b0febe0', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-2-DAT'), 
        'Tuesday', 
        2, 
        '09:50', 
        '10:40';


    -- Tuesday Period 3: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-2-OPE', 'Operating Systems', 'CSE-DS-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f5501be3-3f54-4824-ab65-38e5c0596d08', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-2-OPE'), 
        'Tuesday', 
        3, 
        '10:50', 
        '11:40';


    -- Tuesday Period 4: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-2-SOF', 'Software Project Management', 'CSE-DS-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f697a7da-b4b3-4c3a-9319-c11183a3e2c6', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-2-SOF'), 
        'Tuesday', 
        4, 
        '11:40', 
        '12:30';


    -- Tuesday Period 5: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-2-DEE', 'Deep Learning Lab', 'CSE-DS-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '61cdebee-2a5d-46ae-af3f-7c809c5d73d2', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-2-DEE'), 
        'Tuesday', 
        5, 
        '13:10', 
        '14:00';


    -- Tuesday Period 6: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-2-DAT', 'Data Visualization Lab', 'CSE-DS-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '3a539444-9c6a-477f-a45e-87b7fc362a9c', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-2-DAT'), 
        'Tuesday', 
        6, 
        '14:00', 
        '14:50';


    -- Tuesday Period 7: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-2-COU', 'Counseling', 'CSE-DS-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f544301c-c574-4edf-8ebd-20db6da445cb', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-2-COU'), 
        'Tuesday', 
        7, 
        '15:00', 
        '15:40';


    -- Tuesday Period 8: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-2-CLO', 'Cloud Computing', 'CSE-DS-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ba46b8c1-4e2c-4023-a724-bab3d5d3a1f1', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-2-CLO'), 
        'Tuesday', 
        8, 
        '15:40', 
        '16:20';


    -- Wednesday Period 1: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-2-DAT', 'Data Visualization', 'CSE-DS-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '5df3c21c-3914-4325-83f5-65363b0febe0', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-2-DAT'), 
        'Wednesday', 
        1, 
        '09:00', 
        '09:50';


    -- Wednesday Period 2: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-2-OPE', 'Operating Systems', 'CSE-DS-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f5501be3-3f54-4824-ab65-38e5c0596d08', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-2-OPE'), 
        'Wednesday', 
        2, 
        '09:50', 
        '10:40';


    -- Wednesday Period 3: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-2-SOF', 'Software Project Management', 'CSE-DS-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f697a7da-b4b3-4c3a-9319-c11183a3e2c6', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-2-SOF'), 
        'Wednesday', 
        3, 
        '10:50', 
        '11:40';


    -- Wednesday Period 4: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-2-DEE', 'Deep Learning Lab', 'CSE-DS-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '61cdebee-2a5d-46ae-af3f-7c809c5d73d2', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-2-DEE'), 
        'Wednesday', 
        4, 
        '11:40', 
        '12:30';


    -- Wednesday Period 5: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-2-DAT', 'Data Visualization Lab', 'CSE-DS-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '3a539444-9c6a-477f-a45e-87b7fc362a9c', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-2-DAT'), 
        'Wednesday', 
        5, 
        '13:10', 
        '14:00';


    -- Wednesday Period 6: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-2-COU', 'Counseling', 'CSE-DS-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f544301c-c574-4edf-8ebd-20db6da445cb', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-2-COU'), 
        'Wednesday', 
        6, 
        '14:00', 
        '14:50';


    -- Wednesday Period 7: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-2-CLO', 'Cloud Computing', 'CSE-DS-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ba46b8c1-4e2c-4023-a724-bab3d5d3a1f1', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-2-CLO'), 
        'Wednesday', 
        7, 
        '15:00', 
        '15:40';


    -- Wednesday Period 8: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-2-DEE', 'Deep Learning', 'CSE-DS-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4b006460-430b-4ffe-b988-dfc5ba5ed69d', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-2-DEE'), 
        'Wednesday', 
        8, 
        '15:40', 
        '16:20';


    -- Thursday Period 1: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-2-OPE', 'Operating Systems', 'CSE-DS-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f5501be3-3f54-4824-ab65-38e5c0596d08', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-2-OPE'), 
        'Thursday', 
        1, 
        '09:00', 
        '09:50';


    -- Thursday Period 2: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-2-SOF', 'Software Project Management', 'CSE-DS-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f697a7da-b4b3-4c3a-9319-c11183a3e2c6', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-2-SOF'), 
        'Thursday', 
        2, 
        '09:50', 
        '10:40';


    -- Thursday Period 3: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-2-DEE', 'Deep Learning Lab', 'CSE-DS-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '61cdebee-2a5d-46ae-af3f-7c809c5d73d2', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-2-DEE'), 
        'Thursday', 
        3, 
        '10:50', 
        '11:40';


    -- Thursday Period 4: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-2-DAT', 'Data Visualization Lab', 'CSE-DS-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '3a539444-9c6a-477f-a45e-87b7fc362a9c', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-2-DAT'), 
        'Thursday', 
        4, 
        '11:40', 
        '12:30';


    -- Thursday Period 5: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-2-COU', 'Counseling', 'CSE-DS-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f544301c-c574-4edf-8ebd-20db6da445cb', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-2-COU'), 
        'Thursday', 
        5, 
        '13:10', 
        '14:00';


    -- Thursday Period 6: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-2-CLO', 'Cloud Computing', 'CSE-DS-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ba46b8c1-4e2c-4023-a724-bab3d5d3a1f1', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-2-CLO'), 
        'Thursday', 
        6, 
        '14:00', 
        '14:50';


    -- Thursday Period 7: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-2-DEE', 'Deep Learning', 'CSE-DS-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4b006460-430b-4ffe-b988-dfc5ba5ed69d', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-2-DEE'), 
        'Thursday', 
        7, 
        '15:00', 
        '15:40';


    -- Thursday Period 8: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-2-DAT', 'Data Visualization', 'CSE-DS-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '5df3c21c-3914-4325-83f5-65363b0febe0', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-2-DAT'), 
        'Thursday', 
        8, 
        '15:40', 
        '16:20';


    -- Friday Period 1: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-2-SOF', 'Software Project Management', 'CSE-DS-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f697a7da-b4b3-4c3a-9319-c11183a3e2c6', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-2-SOF'), 
        'Friday', 
        1, 
        '09:00', 
        '09:50';


    -- Friday Period 2: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-2-DEE', 'Deep Learning Lab', 'CSE-DS-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '61cdebee-2a5d-46ae-af3f-7c809c5d73d2', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-2-DEE'), 
        'Friday', 
        2, 
        '09:50', 
        '10:40';


    -- Friday Period 3: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-2-DAT', 'Data Visualization Lab', 'CSE-DS-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '3a539444-9c6a-477f-a45e-87b7fc362a9c', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-2-DAT'), 
        'Friday', 
        3, 
        '10:50', 
        '11:40';


    -- Friday Period 4: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-2-COU', 'Counseling', 'CSE-DS-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f544301c-c574-4edf-8ebd-20db6da445cb', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-2-COU'), 
        'Friday', 
        4, 
        '11:40', 
        '12:30';


    -- Friday Period 5: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-2-CLO', 'Cloud Computing', 'CSE-DS-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ba46b8c1-4e2c-4023-a724-bab3d5d3a1f1', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-2-CLO'), 
        'Friday', 
        5, 
        '13:10', 
        '14:00';


    -- Friday Period 6: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-2-DEE', 'Deep Learning', 'CSE-DS-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4b006460-430b-4ffe-b988-dfc5ba5ed69d', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-2-DEE'), 
        'Friday', 
        6, 
        '14:00', 
        '14:50';


    -- Friday Period 7: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-2-DAT', 'Data Visualization', 'CSE-DS-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '5df3c21c-3914-4325-83f5-65363b0febe0', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-2-DAT'), 
        'Friday', 
        7, 
        '15:00', 
        '15:40';


    -- Friday Period 8: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-2-OPE', 'Operating Systems', 'CSE-DS-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f5501be3-3f54-4824-ab65-38e5c0596d08', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-2-OPE'), 
        'Friday', 
        8, 
        '15:40', 
        '16:20';


    -- Saturday Period 1: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-2-DEE', 'Deep Learning Lab', 'CSE-DS-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '61cdebee-2a5d-46ae-af3f-7c809c5d73d2', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-2-DEE'), 
        'Saturday', 
        1, 
        '09:00', 
        '09:50';


    -- Saturday Period 2: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-2-DAT', 'Data Visualization Lab', 'CSE-DS-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '3a539444-9c6a-477f-a45e-87b7fc362a9c', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-2-DAT'), 
        'Saturday', 
        2, 
        '09:50', 
        '10:40';


    -- Saturday Period 3: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-2-COU', 'Counseling', 'CSE-DS-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f544301c-c574-4edf-8ebd-20db6da445cb', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-2-COU'), 
        'Saturday', 
        3, 
        '10:50', 
        '11:40';


    -- Saturday Period 4: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-2-CLO', 'Cloud Computing', 'CSE-DS-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ba46b8c1-4e2c-4023-a724-bab3d5d3a1f1', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-2-CLO'), 
        'Saturday', 
        4, 
        '11:40', 
        '12:30';


    -- Saturday Period 5: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-2-DEE', 'Deep Learning', 'CSE-DS-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4b006460-430b-4ffe-b988-dfc5ba5ed69d', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-2-DEE'), 
        'Saturday', 
        5, 
        '13:10', 
        '14:00';


    -- Saturday Period 6: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-2-DAT', 'Data Visualization', 'CSE-DS-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '5df3c21c-3914-4325-83f5-65363b0febe0', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-2-DAT'), 
        'Saturday', 
        6, 
        '14:00', 
        '14:50';


    -- Saturday Period 7: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-2-OPE', 'Operating Systems', 'CSE-DS-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f5501be3-3f54-4824-ab65-38e5c0596d08', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-2-OPE'), 
        'Saturday', 
        7, 
        '15:00', 
        '15:40';


    -- Saturday Period 8: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-2-SOF', 'Software Project Management', 'CSE-DS-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f697a7da-b4b3-4c3a-9319-c11183a3e2c6', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-2-SOF'), 
        'Saturday', 
        8, 
        '15:40', 
        '16:20';

END $$;

DO $$
DECLARE
    v_ay_id UUID := 'd860d5fb-d5f0-4497-a7ea-073004d80500';
    v_sec_id UUID;
    v_course_ids UUID[];
    v_fac_id UUID;
    v_dept text := 'CSE-DS';
BEGIN
    -- 1. Ensure Section Exists
    INSERT INTO class_sections (name, dept_code, academic_year_id, academic_year, year, semester, section)
    VALUES ('CSE-DS-3-A', v_dept::department_code, v_ay_id, '2025-2026', 3, 6, 'A')
    ON CONFLICT (dept_code, academic_year_id, year, section) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO v_sec_id;

    -- If we missed ID (due to no update), fetch it
    IF v_sec_id IS NULL THEN
        SELECT id INTO v_sec_id FROM class_sections 
        WHERE dept_code = v_dept AND academic_year_id = v_ay_id AND year = 3 AND section = 'A';
    END IF;

    -- 2. Clear existing timetable for this section to avoid clutter
    DELETE FROM timetable WHERE class_section_id = v_sec_id;

    -- 3. Loop and Insert Periods


    -- Monday Period 1: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-3-CLO', 'Cloud Computing', 'CSE-DS-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ba46b8c1-4e2c-4023-a724-bab3d5d3a1f1', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-3-CLO'), 
        'Monday', 
        1, 
        '09:00', 
        '09:50';


    -- Monday Period 2: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-3-DEE', 'Deep Learning', 'CSE-DS-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4b006460-430b-4ffe-b988-dfc5ba5ed69d', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-3-DEE'), 
        'Monday', 
        2, 
        '09:50', 
        '10:40';


    -- Monday Period 3: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-3-DAT', 'Data Visualization', 'CSE-DS-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '5df3c21c-3914-4325-83f5-65363b0febe0', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-3-DAT'), 
        'Monday', 
        3, 
        '10:50', 
        '11:40';


    -- Monday Period 4: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-3-OPE', 'Operating Systems', 'CSE-DS-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f5501be3-3f54-4824-ab65-38e5c0596d08', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-3-OPE'), 
        'Monday', 
        4, 
        '11:40', 
        '12:30';


    -- Monday Period 5: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-3-SOF', 'Software Project Management', 'CSE-DS-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f697a7da-b4b3-4c3a-9319-c11183a3e2c6', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-3-SOF'), 
        'Monday', 
        5, 
        '13:10', 
        '14:00';


    -- Monday Period 6: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-3-DEE', 'Deep Learning Lab', 'CSE-DS-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '61cdebee-2a5d-46ae-af3f-7c809c5d73d2', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-3-DEE'), 
        'Monday', 
        6, 
        '14:00', 
        '14:50';


    -- Monday Period 7: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-3-DAT', 'Data Visualization Lab', 'CSE-DS-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '3a539444-9c6a-477f-a45e-87b7fc362a9c', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-3-DAT'), 
        'Monday', 
        7, 
        '15:00', 
        '15:40';


    -- Monday Period 8: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-3-COU', 'Counseling', 'CSE-DS-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f544301c-c574-4edf-8ebd-20db6da445cb', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-3-COU'), 
        'Monday', 
        8, 
        '15:40', 
        '16:20';


    -- Tuesday Period 1: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-3-DEE', 'Deep Learning', 'CSE-DS-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4b006460-430b-4ffe-b988-dfc5ba5ed69d', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-3-DEE'), 
        'Tuesday', 
        1, 
        '09:00', 
        '09:50';


    -- Tuesday Period 2: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-3-DAT', 'Data Visualization', 'CSE-DS-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '5df3c21c-3914-4325-83f5-65363b0febe0', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-3-DAT'), 
        'Tuesday', 
        2, 
        '09:50', 
        '10:40';


    -- Tuesday Period 3: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-3-OPE', 'Operating Systems', 'CSE-DS-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f5501be3-3f54-4824-ab65-38e5c0596d08', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-3-OPE'), 
        'Tuesday', 
        3, 
        '10:50', 
        '11:40';


    -- Tuesday Period 4: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-3-SOF', 'Software Project Management', 'CSE-DS-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f697a7da-b4b3-4c3a-9319-c11183a3e2c6', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-3-SOF'), 
        'Tuesday', 
        4, 
        '11:40', 
        '12:30';


    -- Tuesday Period 5: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-3-DEE', 'Deep Learning Lab', 'CSE-DS-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '61cdebee-2a5d-46ae-af3f-7c809c5d73d2', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-3-DEE'), 
        'Tuesday', 
        5, 
        '13:10', 
        '14:00';


    -- Tuesday Period 6: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-3-DAT', 'Data Visualization Lab', 'CSE-DS-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '3a539444-9c6a-477f-a45e-87b7fc362a9c', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-3-DAT'), 
        'Tuesday', 
        6, 
        '14:00', 
        '14:50';


    -- Tuesday Period 7: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-3-COU', 'Counseling', 'CSE-DS-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f544301c-c574-4edf-8ebd-20db6da445cb', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-3-COU'), 
        'Tuesday', 
        7, 
        '15:00', 
        '15:40';


    -- Tuesday Period 8: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-3-CLO', 'Cloud Computing', 'CSE-DS-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ba46b8c1-4e2c-4023-a724-bab3d5d3a1f1', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-3-CLO'), 
        'Tuesday', 
        8, 
        '15:40', 
        '16:20';


    -- Wednesday Period 1: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-3-DAT', 'Data Visualization', 'CSE-DS-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '5df3c21c-3914-4325-83f5-65363b0febe0', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-3-DAT'), 
        'Wednesday', 
        1, 
        '09:00', 
        '09:50';


    -- Wednesday Period 2: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-3-OPE', 'Operating Systems', 'CSE-DS-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f5501be3-3f54-4824-ab65-38e5c0596d08', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-3-OPE'), 
        'Wednesday', 
        2, 
        '09:50', 
        '10:40';


    -- Wednesday Period 3: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-3-SOF', 'Software Project Management', 'CSE-DS-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f697a7da-b4b3-4c3a-9319-c11183a3e2c6', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-3-SOF'), 
        'Wednesday', 
        3, 
        '10:50', 
        '11:40';


    -- Wednesday Period 4: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-3-DEE', 'Deep Learning Lab', 'CSE-DS-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '61cdebee-2a5d-46ae-af3f-7c809c5d73d2', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-3-DEE'), 
        'Wednesday', 
        4, 
        '11:40', 
        '12:30';


    -- Wednesday Period 5: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-3-DAT', 'Data Visualization Lab', 'CSE-DS-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '3a539444-9c6a-477f-a45e-87b7fc362a9c', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-3-DAT'), 
        'Wednesday', 
        5, 
        '13:10', 
        '14:00';


    -- Wednesday Period 6: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-3-COU', 'Counseling', 'CSE-DS-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f544301c-c574-4edf-8ebd-20db6da445cb', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-3-COU'), 
        'Wednesday', 
        6, 
        '14:00', 
        '14:50';


    -- Wednesday Period 7: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-3-CLO', 'Cloud Computing', 'CSE-DS-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ba46b8c1-4e2c-4023-a724-bab3d5d3a1f1', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-3-CLO'), 
        'Wednesday', 
        7, 
        '15:00', 
        '15:40';


    -- Wednesday Period 8: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-3-DEE', 'Deep Learning', 'CSE-DS-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4b006460-430b-4ffe-b988-dfc5ba5ed69d', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-3-DEE'), 
        'Wednesday', 
        8, 
        '15:40', 
        '16:20';


    -- Thursday Period 1: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-3-OPE', 'Operating Systems', 'CSE-DS-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f5501be3-3f54-4824-ab65-38e5c0596d08', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-3-OPE'), 
        'Thursday', 
        1, 
        '09:00', 
        '09:50';


    -- Thursday Period 2: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-3-SOF', 'Software Project Management', 'CSE-DS-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f697a7da-b4b3-4c3a-9319-c11183a3e2c6', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-3-SOF'), 
        'Thursday', 
        2, 
        '09:50', 
        '10:40';


    -- Thursday Period 3: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-3-DEE', 'Deep Learning Lab', 'CSE-DS-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '61cdebee-2a5d-46ae-af3f-7c809c5d73d2', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-3-DEE'), 
        'Thursday', 
        3, 
        '10:50', 
        '11:40';


    -- Thursday Period 4: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-3-DAT', 'Data Visualization Lab', 'CSE-DS-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '3a539444-9c6a-477f-a45e-87b7fc362a9c', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-3-DAT'), 
        'Thursday', 
        4, 
        '11:40', 
        '12:30';


    -- Thursday Period 5: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-3-COU', 'Counseling', 'CSE-DS-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f544301c-c574-4edf-8ebd-20db6da445cb', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-3-COU'), 
        'Thursday', 
        5, 
        '13:10', 
        '14:00';


    -- Thursday Period 6: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-3-CLO', 'Cloud Computing', 'CSE-DS-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ba46b8c1-4e2c-4023-a724-bab3d5d3a1f1', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-3-CLO'), 
        'Thursday', 
        6, 
        '14:00', 
        '14:50';


    -- Thursday Period 7: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-3-DEE', 'Deep Learning', 'CSE-DS-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4b006460-430b-4ffe-b988-dfc5ba5ed69d', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-3-DEE'), 
        'Thursday', 
        7, 
        '15:00', 
        '15:40';


    -- Thursday Period 8: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-3-DAT', 'Data Visualization', 'CSE-DS-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '5df3c21c-3914-4325-83f5-65363b0febe0', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-3-DAT'), 
        'Thursday', 
        8, 
        '15:40', 
        '16:20';


    -- Friday Period 1: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-3-SOF', 'Software Project Management', 'CSE-DS-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f697a7da-b4b3-4c3a-9319-c11183a3e2c6', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-3-SOF'), 
        'Friday', 
        1, 
        '09:00', 
        '09:50';


    -- Friday Period 2: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-3-DEE', 'Deep Learning Lab', 'CSE-DS-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '61cdebee-2a5d-46ae-af3f-7c809c5d73d2', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-3-DEE'), 
        'Friday', 
        2, 
        '09:50', 
        '10:40';


    -- Friday Period 3: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-3-DAT', 'Data Visualization Lab', 'CSE-DS-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '3a539444-9c6a-477f-a45e-87b7fc362a9c', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-3-DAT'), 
        'Friday', 
        3, 
        '10:50', 
        '11:40';


    -- Friday Period 4: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-3-COU', 'Counseling', 'CSE-DS-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f544301c-c574-4edf-8ebd-20db6da445cb', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-3-COU'), 
        'Friday', 
        4, 
        '11:40', 
        '12:30';


    -- Friday Period 5: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-3-CLO', 'Cloud Computing', 'CSE-DS-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ba46b8c1-4e2c-4023-a724-bab3d5d3a1f1', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-3-CLO'), 
        'Friday', 
        5, 
        '13:10', 
        '14:00';


    -- Friday Period 6: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-3-DEE', 'Deep Learning', 'CSE-DS-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4b006460-430b-4ffe-b988-dfc5ba5ed69d', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-3-DEE'), 
        'Friday', 
        6, 
        '14:00', 
        '14:50';


    -- Friday Period 7: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-3-DAT', 'Data Visualization', 'CSE-DS-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '5df3c21c-3914-4325-83f5-65363b0febe0', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-3-DAT'), 
        'Friday', 
        7, 
        '15:00', 
        '15:40';


    -- Friday Period 8: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-3-OPE', 'Operating Systems', 'CSE-DS-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f5501be3-3f54-4824-ab65-38e5c0596d08', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-3-OPE'), 
        'Friday', 
        8, 
        '15:40', 
        '16:20';


    -- Saturday Period 1: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-3-DEE', 'Deep Learning Lab', 'CSE-DS-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '61cdebee-2a5d-46ae-af3f-7c809c5d73d2', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-3-DEE'), 
        'Saturday', 
        1, 
        '09:00', 
        '09:50';


    -- Saturday Period 2: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-3-DAT', 'Data Visualization Lab', 'CSE-DS-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '3a539444-9c6a-477f-a45e-87b7fc362a9c', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-3-DAT'), 
        'Saturday', 
        2, 
        '09:50', 
        '10:40';


    -- Saturday Period 3: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-3-COU', 'Counseling', 'CSE-DS-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f544301c-c574-4edf-8ebd-20db6da445cb', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-3-COU'), 
        'Saturday', 
        3, 
        '10:50', 
        '11:40';


    -- Saturday Period 4: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-3-CLO', 'Cloud Computing', 'CSE-DS-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ba46b8c1-4e2c-4023-a724-bab3d5d3a1f1', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-3-CLO'), 
        'Saturday', 
        4, 
        '11:40', 
        '12:30';


    -- Saturday Period 5: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-3-DEE', 'Deep Learning', 'CSE-DS-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4b006460-430b-4ffe-b988-dfc5ba5ed69d', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-3-DEE'), 
        'Saturday', 
        5, 
        '13:10', 
        '14:00';


    -- Saturday Period 6: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-3-DAT', 'Data Visualization', 'CSE-DS-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '5df3c21c-3914-4325-83f5-65363b0febe0', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-3-DAT'), 
        'Saturday', 
        6, 
        '14:00', 
        '14:50';


    -- Saturday Period 7: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-3-OPE', 'Operating Systems', 'CSE-DS-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f5501be3-3f54-4824-ab65-38e5c0596d08', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-3-OPE'), 
        'Saturday', 
        7, 
        '15:00', 
        '15:40';


    -- Saturday Period 8: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-3-SOF', 'Software Project Management', 'CSE-DS-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f697a7da-b4b3-4c3a-9319-c11183a3e2c6', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-3-SOF'), 
        'Saturday', 
        8, 
        '15:40', 
        '16:20';

END $$;

DO $$
DECLARE
    v_ay_id UUID := 'd860d5fb-d5f0-4497-a7ea-073004d80500';
    v_sec_id UUID;
    v_course_ids UUID[];
    v_fac_id UUID;
    v_dept text := 'CSE-DS';
BEGIN
    -- 1. Ensure Section Exists
    INSERT INTO class_sections (name, dept_code, academic_year_id, academic_year, year, semester, section)
    VALUES ('CSE-DS-4-A', v_dept::department_code, v_ay_id, '2025-2026', 4, 8, 'A')
    ON CONFLICT (dept_code, academic_year_id, year, section) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO v_sec_id;

    -- If we missed ID (due to no update), fetch it
    IF v_sec_id IS NULL THEN
        SELECT id INTO v_sec_id FROM class_sections 
        WHERE dept_code = v_dept AND academic_year_id = v_ay_id AND year = 4 AND section = 'A';
    END IF;

    -- 2. Clear existing timetable for this section to avoid clutter
    DELETE FROM timetable WHERE class_section_id = v_sec_id;

    -- 3. Loop and Insert Periods


    -- Monday Period 1: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-4-CLO', 'Cloud Computing', 'CSE-DS-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ba46b8c1-4e2c-4023-a724-bab3d5d3a1f1', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-4-CLO'), 
        'Monday', 
        1, 
        '09:00', 
        '09:50';


    -- Monday Period 2: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-4-DEE', 'Deep Learning', 'CSE-DS-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4b006460-430b-4ffe-b988-dfc5ba5ed69d', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-4-DEE'), 
        'Monday', 
        2, 
        '09:50', 
        '10:40';


    -- Monday Period 3: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-4-DAT', 'Data Visualization', 'CSE-DS-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '5df3c21c-3914-4325-83f5-65363b0febe0', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-4-DAT'), 
        'Monday', 
        3, 
        '10:50', 
        '11:40';


    -- Monday Period 4: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-4-OPE', 'Operating Systems', 'CSE-DS-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f5501be3-3f54-4824-ab65-38e5c0596d08', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-4-OPE'), 
        'Monday', 
        4, 
        '11:40', 
        '12:30';


    -- Monday Period 5: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-4-SOF', 'Software Project Management', 'CSE-DS-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f697a7da-b4b3-4c3a-9319-c11183a3e2c6', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-4-SOF'), 
        'Monday', 
        5, 
        '13:10', 
        '14:00';


    -- Monday Period 6: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-4-DEE', 'Deep Learning Lab', 'CSE-DS-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '61cdebee-2a5d-46ae-af3f-7c809c5d73d2', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-4-DEE'), 
        'Monday', 
        6, 
        '14:00', 
        '14:50';


    -- Monday Period 7: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-4-DAT', 'Data Visualization Lab', 'CSE-DS-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '3a539444-9c6a-477f-a45e-87b7fc362a9c', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-4-DAT'), 
        'Monday', 
        7, 
        '15:00', 
        '15:40';


    -- Monday Period 8: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-4-COU', 'Counseling', 'CSE-DS-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f544301c-c574-4edf-8ebd-20db6da445cb', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-4-COU'), 
        'Monday', 
        8, 
        '15:40', 
        '16:20';


    -- Tuesday Period 1: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-4-DEE', 'Deep Learning', 'CSE-DS-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4b006460-430b-4ffe-b988-dfc5ba5ed69d', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-4-DEE'), 
        'Tuesday', 
        1, 
        '09:00', 
        '09:50';


    -- Tuesday Period 2: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-4-DAT', 'Data Visualization', 'CSE-DS-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '5df3c21c-3914-4325-83f5-65363b0febe0', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-4-DAT'), 
        'Tuesday', 
        2, 
        '09:50', 
        '10:40';


    -- Tuesday Period 3: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-4-OPE', 'Operating Systems', 'CSE-DS-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f5501be3-3f54-4824-ab65-38e5c0596d08', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-4-OPE'), 
        'Tuesday', 
        3, 
        '10:50', 
        '11:40';


    -- Tuesday Period 4: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-4-SOF', 'Software Project Management', 'CSE-DS-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f697a7da-b4b3-4c3a-9319-c11183a3e2c6', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-4-SOF'), 
        'Tuesday', 
        4, 
        '11:40', 
        '12:30';


    -- Tuesday Period 5: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-4-DEE', 'Deep Learning Lab', 'CSE-DS-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '61cdebee-2a5d-46ae-af3f-7c809c5d73d2', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-4-DEE'), 
        'Tuesday', 
        5, 
        '13:10', 
        '14:00';


    -- Tuesday Period 6: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-4-DAT', 'Data Visualization Lab', 'CSE-DS-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '3a539444-9c6a-477f-a45e-87b7fc362a9c', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-4-DAT'), 
        'Tuesday', 
        6, 
        '14:00', 
        '14:50';


    -- Tuesday Period 7: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-4-COU', 'Counseling', 'CSE-DS-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f544301c-c574-4edf-8ebd-20db6da445cb', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-4-COU'), 
        'Tuesday', 
        7, 
        '15:00', 
        '15:40';


    -- Tuesday Period 8: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-4-CLO', 'Cloud Computing', 'CSE-DS-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ba46b8c1-4e2c-4023-a724-bab3d5d3a1f1', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-4-CLO'), 
        'Tuesday', 
        8, 
        '15:40', 
        '16:20';


    -- Wednesday Period 1: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-4-DAT', 'Data Visualization', 'CSE-DS-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '5df3c21c-3914-4325-83f5-65363b0febe0', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-4-DAT'), 
        'Wednesday', 
        1, 
        '09:00', 
        '09:50';


    -- Wednesday Period 2: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-4-OPE', 'Operating Systems', 'CSE-DS-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f5501be3-3f54-4824-ab65-38e5c0596d08', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-4-OPE'), 
        'Wednesday', 
        2, 
        '09:50', 
        '10:40';


    -- Wednesday Period 3: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-4-SOF', 'Software Project Management', 'CSE-DS-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f697a7da-b4b3-4c3a-9319-c11183a3e2c6', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-4-SOF'), 
        'Wednesday', 
        3, 
        '10:50', 
        '11:40';


    -- Wednesday Period 4: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-4-DEE', 'Deep Learning Lab', 'CSE-DS-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '61cdebee-2a5d-46ae-af3f-7c809c5d73d2', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-4-DEE'), 
        'Wednesday', 
        4, 
        '11:40', 
        '12:30';


    -- Wednesday Period 5: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-4-DAT', 'Data Visualization Lab', 'CSE-DS-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '3a539444-9c6a-477f-a45e-87b7fc362a9c', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-4-DAT'), 
        'Wednesday', 
        5, 
        '13:10', 
        '14:00';


    -- Wednesday Period 6: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-4-COU', 'Counseling', 'CSE-DS-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f544301c-c574-4edf-8ebd-20db6da445cb', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-4-COU'), 
        'Wednesday', 
        6, 
        '14:00', 
        '14:50';


    -- Wednesday Period 7: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-4-CLO', 'Cloud Computing', 'CSE-DS-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ba46b8c1-4e2c-4023-a724-bab3d5d3a1f1', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-4-CLO'), 
        'Wednesday', 
        7, 
        '15:00', 
        '15:40';


    -- Wednesday Period 8: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-4-DEE', 'Deep Learning', 'CSE-DS-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4b006460-430b-4ffe-b988-dfc5ba5ed69d', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-4-DEE'), 
        'Wednesday', 
        8, 
        '15:40', 
        '16:20';


    -- Thursday Period 1: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-4-OPE', 'Operating Systems', 'CSE-DS-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f5501be3-3f54-4824-ab65-38e5c0596d08', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-4-OPE'), 
        'Thursday', 
        1, 
        '09:00', 
        '09:50';


    -- Thursday Period 2: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-4-SOF', 'Software Project Management', 'CSE-DS-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f697a7da-b4b3-4c3a-9319-c11183a3e2c6', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-4-SOF'), 
        'Thursday', 
        2, 
        '09:50', 
        '10:40';


    -- Thursday Period 3: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-4-DEE', 'Deep Learning Lab', 'CSE-DS-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '61cdebee-2a5d-46ae-af3f-7c809c5d73d2', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-4-DEE'), 
        'Thursday', 
        3, 
        '10:50', 
        '11:40';


    -- Thursday Period 4: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-4-DAT', 'Data Visualization Lab', 'CSE-DS-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '3a539444-9c6a-477f-a45e-87b7fc362a9c', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-4-DAT'), 
        'Thursday', 
        4, 
        '11:40', 
        '12:30';


    -- Thursday Period 5: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-4-COU', 'Counseling', 'CSE-DS-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f544301c-c574-4edf-8ebd-20db6da445cb', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-4-COU'), 
        'Thursday', 
        5, 
        '13:10', 
        '14:00';


    -- Thursday Period 6: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-4-CLO', 'Cloud Computing', 'CSE-DS-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ba46b8c1-4e2c-4023-a724-bab3d5d3a1f1', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-4-CLO'), 
        'Thursday', 
        6, 
        '14:00', 
        '14:50';


    -- Thursday Period 7: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-4-DEE', 'Deep Learning', 'CSE-DS-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4b006460-430b-4ffe-b988-dfc5ba5ed69d', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-4-DEE'), 
        'Thursday', 
        7, 
        '15:00', 
        '15:40';


    -- Thursday Period 8: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-4-DAT', 'Data Visualization', 'CSE-DS-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '5df3c21c-3914-4325-83f5-65363b0febe0', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-4-DAT'), 
        'Thursday', 
        8, 
        '15:40', 
        '16:20';


    -- Friday Period 1: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-4-SOF', 'Software Project Management', 'CSE-DS-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f697a7da-b4b3-4c3a-9319-c11183a3e2c6', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-4-SOF'), 
        'Friday', 
        1, 
        '09:00', 
        '09:50';


    -- Friday Period 2: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-4-DEE', 'Deep Learning Lab', 'CSE-DS-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '61cdebee-2a5d-46ae-af3f-7c809c5d73d2', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-4-DEE'), 
        'Friday', 
        2, 
        '09:50', 
        '10:40';


    -- Friday Period 3: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-4-DAT', 'Data Visualization Lab', 'CSE-DS-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '3a539444-9c6a-477f-a45e-87b7fc362a9c', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-4-DAT'), 
        'Friday', 
        3, 
        '10:50', 
        '11:40';


    -- Friday Period 4: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-4-COU', 'Counseling', 'CSE-DS-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f544301c-c574-4edf-8ebd-20db6da445cb', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-4-COU'), 
        'Friday', 
        4, 
        '11:40', 
        '12:30';


    -- Friday Period 5: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-4-CLO', 'Cloud Computing', 'CSE-DS-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ba46b8c1-4e2c-4023-a724-bab3d5d3a1f1', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-4-CLO'), 
        'Friday', 
        5, 
        '13:10', 
        '14:00';


    -- Friday Period 6: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-4-DEE', 'Deep Learning', 'CSE-DS-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4b006460-430b-4ffe-b988-dfc5ba5ed69d', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-4-DEE'), 
        'Friday', 
        6, 
        '14:00', 
        '14:50';


    -- Friday Period 7: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-4-DAT', 'Data Visualization', 'CSE-DS-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '5df3c21c-3914-4325-83f5-65363b0febe0', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-4-DAT'), 
        'Friday', 
        7, 
        '15:00', 
        '15:40';


    -- Friday Period 8: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-4-OPE', 'Operating Systems', 'CSE-DS-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f5501be3-3f54-4824-ab65-38e5c0596d08', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-4-OPE'), 
        'Friday', 
        8, 
        '15:40', 
        '16:20';


    -- Saturday Period 1: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-4-DEE', 'Deep Learning Lab', 'CSE-DS-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '61cdebee-2a5d-46ae-af3f-7c809c5d73d2', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-4-DEE'), 
        'Saturday', 
        1, 
        '09:00', 
        '09:50';


    -- Saturday Period 2: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-4-DAT', 'Data Visualization Lab', 'CSE-DS-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '3a539444-9c6a-477f-a45e-87b7fc362a9c', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-4-DAT'), 
        'Saturday', 
        2, 
        '09:50', 
        '10:40';


    -- Saturday Period 3: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-4-COU', 'Counseling', 'CSE-DS-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f544301c-c574-4edf-8ebd-20db6da445cb', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-4-COU'), 
        'Saturday', 
        3, 
        '10:50', 
        '11:40';


    -- Saturday Period 4: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-4-CLO', 'Cloud Computing', 'CSE-DS-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ba46b8c1-4e2c-4023-a724-bab3d5d3a1f1', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-4-CLO'), 
        'Saturday', 
        4, 
        '11:40', 
        '12:30';


    -- Saturday Period 5: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-4-DEE', 'Deep Learning', 'CSE-DS-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4b006460-430b-4ffe-b988-dfc5ba5ed69d', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-4-DEE'), 
        'Saturday', 
        5, 
        '13:10', 
        '14:00';


    -- Saturday Period 6: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-4-DAT', 'Data Visualization', 'CSE-DS-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '5df3c21c-3914-4325-83f5-65363b0febe0', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-4-DAT'), 
        'Saturday', 
        6, 
        '14:00', 
        '14:50';


    -- Saturday Period 7: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-4-OPE', 'Operating Systems', 'CSE-DS-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f5501be3-3f54-4824-ab65-38e5c0596d08', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-4-OPE'), 
        'Saturday', 
        7, 
        '15:00', 
        '15:40';


    -- Saturday Period 8: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-DS-4-SOF', 'Software Project Management', 'CSE-DS-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f697a7da-b4b3-4c3a-9319-c11183a3e2c6', 
        (SELECT id FROM courses WHERE code = 'CSE-DS-4-SOF'), 
        'Saturday', 
        8, 
        '15:40', 
        '16:20';

END $$;

DO $$
DECLARE
    v_ay_id UUID := 'd860d5fb-d5f0-4497-a7ea-073004d80500';
    v_sec_id UUID;
    v_course_ids UUID[];
    v_fac_id UUID;
    v_dept text := 'CSE-AI';
BEGIN
    -- 1. Ensure Section Exists
    INSERT INTO class_sections (name, dept_code, academic_year_id, academic_year, year, semester, section)
    VALUES ('CSE-AI-2-A', v_dept::department_code, v_ay_id, '2025-2026', 2, 4, 'A')
    ON CONFLICT (dept_code, academic_year_id, year, section) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO v_sec_id;

    -- If we missed ID (due to no update), fetch it
    IF v_sec_id IS NULL THEN
        SELECT id INTO v_sec_id FROM class_sections 
        WHERE dept_code = v_dept AND academic_year_id = v_ay_id AND year = 2 AND section = 'A';
    END IF;

    -- 2. Clear existing timetable for this section to avoid clutter
    DELETE FROM timetable WHERE class_section_id = v_sec_id;

    -- 3. Loop and Insert Periods


    -- Monday Period 1: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-2-CLO', 'Cloud Computing', 'CSE-AI-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c903b121-a6dd-4111-8944-1d4e3540ab5d', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-2-CLO'), 
        'Monday', 
        1, 
        '09:00', 
        '09:50';


    -- Monday Period 2: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-2-DEE', 'Deep Learning', 'CSE-AI-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'e4160498-afba-4496-8ecf-7f098f78784d', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-2-DEE'), 
        'Monday', 
        2, 
        '09:50', 
        '10:40';


    -- Monday Period 3: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-2-DAT', 'Data Visualization', 'CSE-AI-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '227c5d06-7575-4f49-be94-02ca22721398', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-2-DAT'), 
        'Monday', 
        3, 
        '10:50', 
        '11:40';


    -- Monday Period 4: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-2-OPE', 'Operating Systems', 'CSE-AI-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'd6d71bd1-9211-4110-953c-29eb694868e5', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-2-OPE'), 
        'Monday', 
        4, 
        '11:40', 
        '12:30';


    -- Monday Period 5: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-2-SOF', 'Software Project Management', 'CSE-AI-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '801ee8f6-c36d-4cf5-acb2-0f70548dfb5e', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-2-SOF'), 
        'Monday', 
        5, 
        '13:10', 
        '14:00';


    -- Monday Period 6: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-2-DEE', 'Deep Learning Lab', 'CSE-AI-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '37c1ce5b-8d01-46fd-a486-9b57ee9d29d6', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-2-DEE'), 
        'Monday', 
        6, 
        '14:00', 
        '14:50';


    -- Monday Period 7: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-2-DAT', 'Data Visualization Lab', 'CSE-AI-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a4cdbb21-26f0-4bcd-873f-b4bd483914b1', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-2-DAT'), 
        'Monday', 
        7, 
        '15:00', 
        '15:40';


    -- Monday Period 8: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-2-COU', 'Counseling', 'CSE-AI-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '5b6cf810-ec62-48f0-b829-ac84aababfdb', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-2-COU'), 
        'Monday', 
        8, 
        '15:40', 
        '16:20';


    -- Tuesday Period 1: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-2-DEE', 'Deep Learning', 'CSE-AI-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'e4160498-afba-4496-8ecf-7f098f78784d', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-2-DEE'), 
        'Tuesday', 
        1, 
        '09:00', 
        '09:50';


    -- Tuesday Period 2: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-2-DAT', 'Data Visualization', 'CSE-AI-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '227c5d06-7575-4f49-be94-02ca22721398', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-2-DAT'), 
        'Tuesday', 
        2, 
        '09:50', 
        '10:40';


    -- Tuesday Period 3: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-2-OPE', 'Operating Systems', 'CSE-AI-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'd6d71bd1-9211-4110-953c-29eb694868e5', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-2-OPE'), 
        'Tuesday', 
        3, 
        '10:50', 
        '11:40';


    -- Tuesday Period 4: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-2-SOF', 'Software Project Management', 'CSE-AI-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '801ee8f6-c36d-4cf5-acb2-0f70548dfb5e', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-2-SOF'), 
        'Tuesday', 
        4, 
        '11:40', 
        '12:30';


    -- Tuesday Period 5: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-2-DEE', 'Deep Learning Lab', 'CSE-AI-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '37c1ce5b-8d01-46fd-a486-9b57ee9d29d6', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-2-DEE'), 
        'Tuesday', 
        5, 
        '13:10', 
        '14:00';


    -- Tuesday Period 6: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-2-DAT', 'Data Visualization Lab', 'CSE-AI-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a4cdbb21-26f0-4bcd-873f-b4bd483914b1', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-2-DAT'), 
        'Tuesday', 
        6, 
        '14:00', 
        '14:50';


    -- Tuesday Period 7: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-2-COU', 'Counseling', 'CSE-AI-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '5b6cf810-ec62-48f0-b829-ac84aababfdb', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-2-COU'), 
        'Tuesday', 
        7, 
        '15:00', 
        '15:40';


    -- Tuesday Period 8: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-2-CLO', 'Cloud Computing', 'CSE-AI-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c903b121-a6dd-4111-8944-1d4e3540ab5d', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-2-CLO'), 
        'Tuesday', 
        8, 
        '15:40', 
        '16:20';


    -- Wednesday Period 1: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-2-DAT', 'Data Visualization', 'CSE-AI-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '227c5d06-7575-4f49-be94-02ca22721398', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-2-DAT'), 
        'Wednesday', 
        1, 
        '09:00', 
        '09:50';


    -- Wednesday Period 2: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-2-OPE', 'Operating Systems', 'CSE-AI-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'd6d71bd1-9211-4110-953c-29eb694868e5', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-2-OPE'), 
        'Wednesday', 
        2, 
        '09:50', 
        '10:40';


    -- Wednesday Period 3: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-2-SOF', 'Software Project Management', 'CSE-AI-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '801ee8f6-c36d-4cf5-acb2-0f70548dfb5e', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-2-SOF'), 
        'Wednesday', 
        3, 
        '10:50', 
        '11:40';


    -- Wednesday Period 4: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-2-DEE', 'Deep Learning Lab', 'CSE-AI-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '37c1ce5b-8d01-46fd-a486-9b57ee9d29d6', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-2-DEE'), 
        'Wednesday', 
        4, 
        '11:40', 
        '12:30';


    -- Wednesday Period 5: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-2-DAT', 'Data Visualization Lab', 'CSE-AI-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a4cdbb21-26f0-4bcd-873f-b4bd483914b1', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-2-DAT'), 
        'Wednesday', 
        5, 
        '13:10', 
        '14:00';


    -- Wednesday Period 6: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-2-COU', 'Counseling', 'CSE-AI-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '5b6cf810-ec62-48f0-b829-ac84aababfdb', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-2-COU'), 
        'Wednesday', 
        6, 
        '14:00', 
        '14:50';


    -- Wednesday Period 7: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-2-CLO', 'Cloud Computing', 'CSE-AI-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c903b121-a6dd-4111-8944-1d4e3540ab5d', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-2-CLO'), 
        'Wednesday', 
        7, 
        '15:00', 
        '15:40';


    -- Wednesday Period 8: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-2-DEE', 'Deep Learning', 'CSE-AI-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'e4160498-afba-4496-8ecf-7f098f78784d', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-2-DEE'), 
        'Wednesday', 
        8, 
        '15:40', 
        '16:20';


    -- Thursday Period 1: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-2-OPE', 'Operating Systems', 'CSE-AI-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'd6d71bd1-9211-4110-953c-29eb694868e5', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-2-OPE'), 
        'Thursday', 
        1, 
        '09:00', 
        '09:50';


    -- Thursday Period 2: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-2-SOF', 'Software Project Management', 'CSE-AI-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '801ee8f6-c36d-4cf5-acb2-0f70548dfb5e', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-2-SOF'), 
        'Thursday', 
        2, 
        '09:50', 
        '10:40';


    -- Thursday Period 3: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-2-DEE', 'Deep Learning Lab', 'CSE-AI-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '37c1ce5b-8d01-46fd-a486-9b57ee9d29d6', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-2-DEE'), 
        'Thursday', 
        3, 
        '10:50', 
        '11:40';


    -- Thursday Period 4: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-2-DAT', 'Data Visualization Lab', 'CSE-AI-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a4cdbb21-26f0-4bcd-873f-b4bd483914b1', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-2-DAT'), 
        'Thursday', 
        4, 
        '11:40', 
        '12:30';


    -- Thursday Period 5: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-2-COU', 'Counseling', 'CSE-AI-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '5b6cf810-ec62-48f0-b829-ac84aababfdb', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-2-COU'), 
        'Thursday', 
        5, 
        '13:10', 
        '14:00';


    -- Thursday Period 6: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-2-CLO', 'Cloud Computing', 'CSE-AI-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c903b121-a6dd-4111-8944-1d4e3540ab5d', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-2-CLO'), 
        'Thursday', 
        6, 
        '14:00', 
        '14:50';


    -- Thursday Period 7: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-2-DEE', 'Deep Learning', 'CSE-AI-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'e4160498-afba-4496-8ecf-7f098f78784d', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-2-DEE'), 
        'Thursday', 
        7, 
        '15:00', 
        '15:40';


    -- Thursday Period 8: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-2-DAT', 'Data Visualization', 'CSE-AI-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '227c5d06-7575-4f49-be94-02ca22721398', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-2-DAT'), 
        'Thursday', 
        8, 
        '15:40', 
        '16:20';


    -- Friday Period 1: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-2-SOF', 'Software Project Management', 'CSE-AI-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '801ee8f6-c36d-4cf5-acb2-0f70548dfb5e', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-2-SOF'), 
        'Friday', 
        1, 
        '09:00', 
        '09:50';


    -- Friday Period 2: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-2-DEE', 'Deep Learning Lab', 'CSE-AI-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '37c1ce5b-8d01-46fd-a486-9b57ee9d29d6', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-2-DEE'), 
        'Friday', 
        2, 
        '09:50', 
        '10:40';


    -- Friday Period 3: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-2-DAT', 'Data Visualization Lab', 'CSE-AI-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a4cdbb21-26f0-4bcd-873f-b4bd483914b1', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-2-DAT'), 
        'Friday', 
        3, 
        '10:50', 
        '11:40';


    -- Friday Period 4: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-2-COU', 'Counseling', 'CSE-AI-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '5b6cf810-ec62-48f0-b829-ac84aababfdb', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-2-COU'), 
        'Friday', 
        4, 
        '11:40', 
        '12:30';


    -- Friday Period 5: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-2-CLO', 'Cloud Computing', 'CSE-AI-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c903b121-a6dd-4111-8944-1d4e3540ab5d', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-2-CLO'), 
        'Friday', 
        5, 
        '13:10', 
        '14:00';


    -- Friday Period 6: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-2-DEE', 'Deep Learning', 'CSE-AI-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'e4160498-afba-4496-8ecf-7f098f78784d', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-2-DEE'), 
        'Friday', 
        6, 
        '14:00', 
        '14:50';


    -- Friday Period 7: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-2-DAT', 'Data Visualization', 'CSE-AI-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '227c5d06-7575-4f49-be94-02ca22721398', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-2-DAT'), 
        'Friday', 
        7, 
        '15:00', 
        '15:40';


    -- Friday Period 8: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-2-OPE', 'Operating Systems', 'CSE-AI-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'd6d71bd1-9211-4110-953c-29eb694868e5', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-2-OPE'), 
        'Friday', 
        8, 
        '15:40', 
        '16:20';


    -- Saturday Period 1: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-2-DEE', 'Deep Learning Lab', 'CSE-AI-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '37c1ce5b-8d01-46fd-a486-9b57ee9d29d6', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-2-DEE'), 
        'Saturday', 
        1, 
        '09:00', 
        '09:50';


    -- Saturday Period 2: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-2-DAT', 'Data Visualization Lab', 'CSE-AI-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a4cdbb21-26f0-4bcd-873f-b4bd483914b1', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-2-DAT'), 
        'Saturday', 
        2, 
        '09:50', 
        '10:40';


    -- Saturday Period 3: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-2-COU', 'Counseling', 'CSE-AI-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '5b6cf810-ec62-48f0-b829-ac84aababfdb', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-2-COU'), 
        'Saturday', 
        3, 
        '10:50', 
        '11:40';


    -- Saturday Period 4: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-2-CLO', 'Cloud Computing', 'CSE-AI-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c903b121-a6dd-4111-8944-1d4e3540ab5d', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-2-CLO'), 
        'Saturday', 
        4, 
        '11:40', 
        '12:30';


    -- Saturday Period 5: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-2-DEE', 'Deep Learning', 'CSE-AI-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'e4160498-afba-4496-8ecf-7f098f78784d', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-2-DEE'), 
        'Saturday', 
        5, 
        '13:10', 
        '14:00';


    -- Saturday Period 6: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-2-DAT', 'Data Visualization', 'CSE-AI-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '227c5d06-7575-4f49-be94-02ca22721398', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-2-DAT'), 
        'Saturday', 
        6, 
        '14:00', 
        '14:50';


    -- Saturday Period 7: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-2-OPE', 'Operating Systems', 'CSE-AI-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'd6d71bd1-9211-4110-953c-29eb694868e5', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-2-OPE'), 
        'Saturday', 
        7, 
        '15:00', 
        '15:40';


    -- Saturday Period 8: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-2-SOF', 'Software Project Management', 'CSE-AI-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '801ee8f6-c36d-4cf5-acb2-0f70548dfb5e', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-2-SOF'), 
        'Saturday', 
        8, 
        '15:40', 
        '16:20';

END $$;

DO $$
DECLARE
    v_ay_id UUID := 'd860d5fb-d5f0-4497-a7ea-073004d80500';
    v_sec_id UUID;
    v_course_ids UUID[];
    v_fac_id UUID;
    v_dept text := 'CSE-AI';
BEGIN
    -- 1. Ensure Section Exists
    INSERT INTO class_sections (name, dept_code, academic_year_id, academic_year, year, semester, section)
    VALUES ('CSE-AI-3-A', v_dept::department_code, v_ay_id, '2025-2026', 3, 6, 'A')
    ON CONFLICT (dept_code, academic_year_id, year, section) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO v_sec_id;

    -- If we missed ID (due to no update), fetch it
    IF v_sec_id IS NULL THEN
        SELECT id INTO v_sec_id FROM class_sections 
        WHERE dept_code = v_dept AND academic_year_id = v_ay_id AND year = 3 AND section = 'A';
    END IF;

    -- 2. Clear existing timetable for this section to avoid clutter
    DELETE FROM timetable WHERE class_section_id = v_sec_id;

    -- 3. Loop and Insert Periods


    -- Monday Period 1: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-3-CLO', 'Cloud Computing', 'CSE-AI-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c903b121-a6dd-4111-8944-1d4e3540ab5d', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-3-CLO'), 
        'Monday', 
        1, 
        '09:00', 
        '09:50';


    -- Monday Period 2: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-3-DEE', 'Deep Learning', 'CSE-AI-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'e4160498-afba-4496-8ecf-7f098f78784d', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-3-DEE'), 
        'Monday', 
        2, 
        '09:50', 
        '10:40';


    -- Monday Period 3: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-3-DAT', 'Data Visualization', 'CSE-AI-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '227c5d06-7575-4f49-be94-02ca22721398', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-3-DAT'), 
        'Monday', 
        3, 
        '10:50', 
        '11:40';


    -- Monday Period 4: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-3-OPE', 'Operating Systems', 'CSE-AI-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'd6d71bd1-9211-4110-953c-29eb694868e5', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-3-OPE'), 
        'Monday', 
        4, 
        '11:40', 
        '12:30';


    -- Monday Period 5: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-3-SOF', 'Software Project Management', 'CSE-AI-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '801ee8f6-c36d-4cf5-acb2-0f70548dfb5e', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-3-SOF'), 
        'Monday', 
        5, 
        '13:10', 
        '14:00';


    -- Monday Period 6: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-3-DEE', 'Deep Learning Lab', 'CSE-AI-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '37c1ce5b-8d01-46fd-a486-9b57ee9d29d6', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-3-DEE'), 
        'Monday', 
        6, 
        '14:00', 
        '14:50';


    -- Monday Period 7: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-3-DAT', 'Data Visualization Lab', 'CSE-AI-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a4cdbb21-26f0-4bcd-873f-b4bd483914b1', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-3-DAT'), 
        'Monday', 
        7, 
        '15:00', 
        '15:40';


    -- Monday Period 8: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-3-COU', 'Counseling', 'CSE-AI-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '5b6cf810-ec62-48f0-b829-ac84aababfdb', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-3-COU'), 
        'Monday', 
        8, 
        '15:40', 
        '16:20';


    -- Tuesday Period 1: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-3-DEE', 'Deep Learning', 'CSE-AI-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'e4160498-afba-4496-8ecf-7f098f78784d', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-3-DEE'), 
        'Tuesday', 
        1, 
        '09:00', 
        '09:50';


    -- Tuesday Period 2: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-3-DAT', 'Data Visualization', 'CSE-AI-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '227c5d06-7575-4f49-be94-02ca22721398', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-3-DAT'), 
        'Tuesday', 
        2, 
        '09:50', 
        '10:40';


    -- Tuesday Period 3: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-3-OPE', 'Operating Systems', 'CSE-AI-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'd6d71bd1-9211-4110-953c-29eb694868e5', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-3-OPE'), 
        'Tuesday', 
        3, 
        '10:50', 
        '11:40';


    -- Tuesday Period 4: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-3-SOF', 'Software Project Management', 'CSE-AI-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '801ee8f6-c36d-4cf5-acb2-0f70548dfb5e', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-3-SOF'), 
        'Tuesday', 
        4, 
        '11:40', 
        '12:30';


    -- Tuesday Period 5: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-3-DEE', 'Deep Learning Lab', 'CSE-AI-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '37c1ce5b-8d01-46fd-a486-9b57ee9d29d6', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-3-DEE'), 
        'Tuesday', 
        5, 
        '13:10', 
        '14:00';


    -- Tuesday Period 6: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-3-DAT', 'Data Visualization Lab', 'CSE-AI-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a4cdbb21-26f0-4bcd-873f-b4bd483914b1', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-3-DAT'), 
        'Tuesday', 
        6, 
        '14:00', 
        '14:50';


    -- Tuesday Period 7: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-3-COU', 'Counseling', 'CSE-AI-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '5b6cf810-ec62-48f0-b829-ac84aababfdb', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-3-COU'), 
        'Tuesday', 
        7, 
        '15:00', 
        '15:40';


    -- Tuesday Period 8: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-3-CLO', 'Cloud Computing', 'CSE-AI-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c903b121-a6dd-4111-8944-1d4e3540ab5d', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-3-CLO'), 
        'Tuesday', 
        8, 
        '15:40', 
        '16:20';


    -- Wednesday Period 1: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-3-DAT', 'Data Visualization', 'CSE-AI-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '227c5d06-7575-4f49-be94-02ca22721398', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-3-DAT'), 
        'Wednesday', 
        1, 
        '09:00', 
        '09:50';


    -- Wednesday Period 2: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-3-OPE', 'Operating Systems', 'CSE-AI-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'd6d71bd1-9211-4110-953c-29eb694868e5', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-3-OPE'), 
        'Wednesday', 
        2, 
        '09:50', 
        '10:40';


    -- Wednesday Period 3: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-3-SOF', 'Software Project Management', 'CSE-AI-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '801ee8f6-c36d-4cf5-acb2-0f70548dfb5e', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-3-SOF'), 
        'Wednesday', 
        3, 
        '10:50', 
        '11:40';


    -- Wednesday Period 4: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-3-DEE', 'Deep Learning Lab', 'CSE-AI-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '37c1ce5b-8d01-46fd-a486-9b57ee9d29d6', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-3-DEE'), 
        'Wednesday', 
        4, 
        '11:40', 
        '12:30';


    -- Wednesday Period 5: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-3-DAT', 'Data Visualization Lab', 'CSE-AI-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a4cdbb21-26f0-4bcd-873f-b4bd483914b1', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-3-DAT'), 
        'Wednesday', 
        5, 
        '13:10', 
        '14:00';


    -- Wednesday Period 6: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-3-COU', 'Counseling', 'CSE-AI-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '5b6cf810-ec62-48f0-b829-ac84aababfdb', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-3-COU'), 
        'Wednesday', 
        6, 
        '14:00', 
        '14:50';


    -- Wednesday Period 7: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-3-CLO', 'Cloud Computing', 'CSE-AI-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c903b121-a6dd-4111-8944-1d4e3540ab5d', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-3-CLO'), 
        'Wednesday', 
        7, 
        '15:00', 
        '15:40';


    -- Wednesday Period 8: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-3-DEE', 'Deep Learning', 'CSE-AI-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'e4160498-afba-4496-8ecf-7f098f78784d', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-3-DEE'), 
        'Wednesday', 
        8, 
        '15:40', 
        '16:20';


    -- Thursday Period 1: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-3-OPE', 'Operating Systems', 'CSE-AI-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'd6d71bd1-9211-4110-953c-29eb694868e5', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-3-OPE'), 
        'Thursday', 
        1, 
        '09:00', 
        '09:50';


    -- Thursday Period 2: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-3-SOF', 'Software Project Management', 'CSE-AI-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '801ee8f6-c36d-4cf5-acb2-0f70548dfb5e', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-3-SOF'), 
        'Thursday', 
        2, 
        '09:50', 
        '10:40';


    -- Thursday Period 3: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-3-DEE', 'Deep Learning Lab', 'CSE-AI-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '37c1ce5b-8d01-46fd-a486-9b57ee9d29d6', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-3-DEE'), 
        'Thursday', 
        3, 
        '10:50', 
        '11:40';


    -- Thursday Period 4: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-3-DAT', 'Data Visualization Lab', 'CSE-AI-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a4cdbb21-26f0-4bcd-873f-b4bd483914b1', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-3-DAT'), 
        'Thursday', 
        4, 
        '11:40', 
        '12:30';


    -- Thursday Period 5: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-3-COU', 'Counseling', 'CSE-AI-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '5b6cf810-ec62-48f0-b829-ac84aababfdb', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-3-COU'), 
        'Thursday', 
        5, 
        '13:10', 
        '14:00';


    -- Thursday Period 6: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-3-CLO', 'Cloud Computing', 'CSE-AI-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c903b121-a6dd-4111-8944-1d4e3540ab5d', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-3-CLO'), 
        'Thursday', 
        6, 
        '14:00', 
        '14:50';


    -- Thursday Period 7: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-3-DEE', 'Deep Learning', 'CSE-AI-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'e4160498-afba-4496-8ecf-7f098f78784d', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-3-DEE'), 
        'Thursday', 
        7, 
        '15:00', 
        '15:40';


    -- Thursday Period 8: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-3-DAT', 'Data Visualization', 'CSE-AI-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '227c5d06-7575-4f49-be94-02ca22721398', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-3-DAT'), 
        'Thursday', 
        8, 
        '15:40', 
        '16:20';


    -- Friday Period 1: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-3-SOF', 'Software Project Management', 'CSE-AI-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '801ee8f6-c36d-4cf5-acb2-0f70548dfb5e', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-3-SOF'), 
        'Friday', 
        1, 
        '09:00', 
        '09:50';


    -- Friday Period 2: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-3-DEE', 'Deep Learning Lab', 'CSE-AI-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '37c1ce5b-8d01-46fd-a486-9b57ee9d29d6', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-3-DEE'), 
        'Friday', 
        2, 
        '09:50', 
        '10:40';


    -- Friday Period 3: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-3-DAT', 'Data Visualization Lab', 'CSE-AI-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a4cdbb21-26f0-4bcd-873f-b4bd483914b1', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-3-DAT'), 
        'Friday', 
        3, 
        '10:50', 
        '11:40';


    -- Friday Period 4: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-3-COU', 'Counseling', 'CSE-AI-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '5b6cf810-ec62-48f0-b829-ac84aababfdb', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-3-COU'), 
        'Friday', 
        4, 
        '11:40', 
        '12:30';


    -- Friday Period 5: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-3-CLO', 'Cloud Computing', 'CSE-AI-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c903b121-a6dd-4111-8944-1d4e3540ab5d', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-3-CLO'), 
        'Friday', 
        5, 
        '13:10', 
        '14:00';


    -- Friday Period 6: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-3-DEE', 'Deep Learning', 'CSE-AI-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'e4160498-afba-4496-8ecf-7f098f78784d', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-3-DEE'), 
        'Friday', 
        6, 
        '14:00', 
        '14:50';


    -- Friday Period 7: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-3-DAT', 'Data Visualization', 'CSE-AI-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '227c5d06-7575-4f49-be94-02ca22721398', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-3-DAT'), 
        'Friday', 
        7, 
        '15:00', 
        '15:40';


    -- Friday Period 8: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-3-OPE', 'Operating Systems', 'CSE-AI-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'd6d71bd1-9211-4110-953c-29eb694868e5', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-3-OPE'), 
        'Friday', 
        8, 
        '15:40', 
        '16:20';


    -- Saturday Period 1: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-3-DEE', 'Deep Learning Lab', 'CSE-AI-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '37c1ce5b-8d01-46fd-a486-9b57ee9d29d6', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-3-DEE'), 
        'Saturday', 
        1, 
        '09:00', 
        '09:50';


    -- Saturday Period 2: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-3-DAT', 'Data Visualization Lab', 'CSE-AI-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a4cdbb21-26f0-4bcd-873f-b4bd483914b1', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-3-DAT'), 
        'Saturday', 
        2, 
        '09:50', 
        '10:40';


    -- Saturday Period 3: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-3-COU', 'Counseling', 'CSE-AI-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '5b6cf810-ec62-48f0-b829-ac84aababfdb', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-3-COU'), 
        'Saturday', 
        3, 
        '10:50', 
        '11:40';


    -- Saturday Period 4: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-3-CLO', 'Cloud Computing', 'CSE-AI-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c903b121-a6dd-4111-8944-1d4e3540ab5d', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-3-CLO'), 
        'Saturday', 
        4, 
        '11:40', 
        '12:30';


    -- Saturday Period 5: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-3-DEE', 'Deep Learning', 'CSE-AI-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'e4160498-afba-4496-8ecf-7f098f78784d', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-3-DEE'), 
        'Saturday', 
        5, 
        '13:10', 
        '14:00';


    -- Saturday Period 6: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-3-DAT', 'Data Visualization', 'CSE-AI-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '227c5d06-7575-4f49-be94-02ca22721398', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-3-DAT'), 
        'Saturday', 
        6, 
        '14:00', 
        '14:50';


    -- Saturday Period 7: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-3-OPE', 'Operating Systems', 'CSE-AI-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'd6d71bd1-9211-4110-953c-29eb694868e5', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-3-OPE'), 
        'Saturday', 
        7, 
        '15:00', 
        '15:40';


    -- Saturday Period 8: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-3-SOF', 'Software Project Management', 'CSE-AI-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '801ee8f6-c36d-4cf5-acb2-0f70548dfb5e', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-3-SOF'), 
        'Saturday', 
        8, 
        '15:40', 
        '16:20';

END $$;

DO $$
DECLARE
    v_ay_id UUID := 'd860d5fb-d5f0-4497-a7ea-073004d80500';
    v_sec_id UUID;
    v_course_ids UUID[];
    v_fac_id UUID;
    v_dept text := 'CSE-AI';
BEGIN
    -- 1. Ensure Section Exists
    INSERT INTO class_sections (name, dept_code, academic_year_id, academic_year, year, semester, section)
    VALUES ('CSE-AI-4-A', v_dept::department_code, v_ay_id, '2025-2026', 4, 8, 'A')
    ON CONFLICT (dept_code, academic_year_id, year, section) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO v_sec_id;

    -- If we missed ID (due to no update), fetch it
    IF v_sec_id IS NULL THEN
        SELECT id INTO v_sec_id FROM class_sections 
        WHERE dept_code = v_dept AND academic_year_id = v_ay_id AND year = 4 AND section = 'A';
    END IF;

    -- 2. Clear existing timetable for this section to avoid clutter
    DELETE FROM timetable WHERE class_section_id = v_sec_id;

    -- 3. Loop and Insert Periods


    -- Monday Period 1: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-4-CLO', 'Cloud Computing', 'CSE-AI-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c903b121-a6dd-4111-8944-1d4e3540ab5d', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-4-CLO'), 
        'Monday', 
        1, 
        '09:00', 
        '09:50';


    -- Monday Period 2: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-4-DEE', 'Deep Learning', 'CSE-AI-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'e4160498-afba-4496-8ecf-7f098f78784d', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-4-DEE'), 
        'Monday', 
        2, 
        '09:50', 
        '10:40';


    -- Monday Period 3: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-4-DAT', 'Data Visualization', 'CSE-AI-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '227c5d06-7575-4f49-be94-02ca22721398', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-4-DAT'), 
        'Monday', 
        3, 
        '10:50', 
        '11:40';


    -- Monday Period 4: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-4-OPE', 'Operating Systems', 'CSE-AI-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'd6d71bd1-9211-4110-953c-29eb694868e5', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-4-OPE'), 
        'Monday', 
        4, 
        '11:40', 
        '12:30';


    -- Monday Period 5: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-4-SOF', 'Software Project Management', 'CSE-AI-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '801ee8f6-c36d-4cf5-acb2-0f70548dfb5e', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-4-SOF'), 
        'Monday', 
        5, 
        '13:10', 
        '14:00';


    -- Monday Period 6: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-4-DEE', 'Deep Learning Lab', 'CSE-AI-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '37c1ce5b-8d01-46fd-a486-9b57ee9d29d6', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-4-DEE'), 
        'Monday', 
        6, 
        '14:00', 
        '14:50';


    -- Monday Period 7: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-4-DAT', 'Data Visualization Lab', 'CSE-AI-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a4cdbb21-26f0-4bcd-873f-b4bd483914b1', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-4-DAT'), 
        'Monday', 
        7, 
        '15:00', 
        '15:40';


    -- Monday Period 8: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-4-COU', 'Counseling', 'CSE-AI-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '5b6cf810-ec62-48f0-b829-ac84aababfdb', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-4-COU'), 
        'Monday', 
        8, 
        '15:40', 
        '16:20';


    -- Tuesday Period 1: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-4-DEE', 'Deep Learning', 'CSE-AI-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'e4160498-afba-4496-8ecf-7f098f78784d', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-4-DEE'), 
        'Tuesday', 
        1, 
        '09:00', 
        '09:50';


    -- Tuesday Period 2: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-4-DAT', 'Data Visualization', 'CSE-AI-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '227c5d06-7575-4f49-be94-02ca22721398', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-4-DAT'), 
        'Tuesday', 
        2, 
        '09:50', 
        '10:40';


    -- Tuesday Period 3: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-4-OPE', 'Operating Systems', 'CSE-AI-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'd6d71bd1-9211-4110-953c-29eb694868e5', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-4-OPE'), 
        'Tuesday', 
        3, 
        '10:50', 
        '11:40';


    -- Tuesday Period 4: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-4-SOF', 'Software Project Management', 'CSE-AI-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '801ee8f6-c36d-4cf5-acb2-0f70548dfb5e', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-4-SOF'), 
        'Tuesday', 
        4, 
        '11:40', 
        '12:30';


    -- Tuesday Period 5: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-4-DEE', 'Deep Learning Lab', 'CSE-AI-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '37c1ce5b-8d01-46fd-a486-9b57ee9d29d6', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-4-DEE'), 
        'Tuesday', 
        5, 
        '13:10', 
        '14:00';


    -- Tuesday Period 6: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-4-DAT', 'Data Visualization Lab', 'CSE-AI-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a4cdbb21-26f0-4bcd-873f-b4bd483914b1', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-4-DAT'), 
        'Tuesday', 
        6, 
        '14:00', 
        '14:50';


    -- Tuesday Period 7: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-4-COU', 'Counseling', 'CSE-AI-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '5b6cf810-ec62-48f0-b829-ac84aababfdb', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-4-COU'), 
        'Tuesday', 
        7, 
        '15:00', 
        '15:40';


    -- Tuesday Period 8: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-4-CLO', 'Cloud Computing', 'CSE-AI-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c903b121-a6dd-4111-8944-1d4e3540ab5d', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-4-CLO'), 
        'Tuesday', 
        8, 
        '15:40', 
        '16:20';


    -- Wednesday Period 1: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-4-DAT', 'Data Visualization', 'CSE-AI-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '227c5d06-7575-4f49-be94-02ca22721398', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-4-DAT'), 
        'Wednesday', 
        1, 
        '09:00', 
        '09:50';


    -- Wednesday Period 2: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-4-OPE', 'Operating Systems', 'CSE-AI-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'd6d71bd1-9211-4110-953c-29eb694868e5', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-4-OPE'), 
        'Wednesday', 
        2, 
        '09:50', 
        '10:40';


    -- Wednesday Period 3: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-4-SOF', 'Software Project Management', 'CSE-AI-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '801ee8f6-c36d-4cf5-acb2-0f70548dfb5e', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-4-SOF'), 
        'Wednesday', 
        3, 
        '10:50', 
        '11:40';


    -- Wednesday Period 4: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-4-DEE', 'Deep Learning Lab', 'CSE-AI-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '37c1ce5b-8d01-46fd-a486-9b57ee9d29d6', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-4-DEE'), 
        'Wednesday', 
        4, 
        '11:40', 
        '12:30';


    -- Wednesday Period 5: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-4-DAT', 'Data Visualization Lab', 'CSE-AI-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a4cdbb21-26f0-4bcd-873f-b4bd483914b1', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-4-DAT'), 
        'Wednesday', 
        5, 
        '13:10', 
        '14:00';


    -- Wednesday Period 6: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-4-COU', 'Counseling', 'CSE-AI-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '5b6cf810-ec62-48f0-b829-ac84aababfdb', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-4-COU'), 
        'Wednesday', 
        6, 
        '14:00', 
        '14:50';


    -- Wednesday Period 7: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-4-CLO', 'Cloud Computing', 'CSE-AI-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c903b121-a6dd-4111-8944-1d4e3540ab5d', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-4-CLO'), 
        'Wednesday', 
        7, 
        '15:00', 
        '15:40';


    -- Wednesday Period 8: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-4-DEE', 'Deep Learning', 'CSE-AI-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'e4160498-afba-4496-8ecf-7f098f78784d', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-4-DEE'), 
        'Wednesday', 
        8, 
        '15:40', 
        '16:20';


    -- Thursday Period 1: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-4-OPE', 'Operating Systems', 'CSE-AI-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'd6d71bd1-9211-4110-953c-29eb694868e5', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-4-OPE'), 
        'Thursday', 
        1, 
        '09:00', 
        '09:50';


    -- Thursday Period 2: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-4-SOF', 'Software Project Management', 'CSE-AI-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '801ee8f6-c36d-4cf5-acb2-0f70548dfb5e', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-4-SOF'), 
        'Thursday', 
        2, 
        '09:50', 
        '10:40';


    -- Thursday Period 3: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-4-DEE', 'Deep Learning Lab', 'CSE-AI-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '37c1ce5b-8d01-46fd-a486-9b57ee9d29d6', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-4-DEE'), 
        'Thursday', 
        3, 
        '10:50', 
        '11:40';


    -- Thursday Period 4: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-4-DAT', 'Data Visualization Lab', 'CSE-AI-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a4cdbb21-26f0-4bcd-873f-b4bd483914b1', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-4-DAT'), 
        'Thursday', 
        4, 
        '11:40', 
        '12:30';


    -- Thursday Period 5: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-4-COU', 'Counseling', 'CSE-AI-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '5b6cf810-ec62-48f0-b829-ac84aababfdb', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-4-COU'), 
        'Thursday', 
        5, 
        '13:10', 
        '14:00';


    -- Thursday Period 6: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-4-CLO', 'Cloud Computing', 'CSE-AI-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c903b121-a6dd-4111-8944-1d4e3540ab5d', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-4-CLO'), 
        'Thursday', 
        6, 
        '14:00', 
        '14:50';


    -- Thursday Period 7: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-4-DEE', 'Deep Learning', 'CSE-AI-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'e4160498-afba-4496-8ecf-7f098f78784d', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-4-DEE'), 
        'Thursday', 
        7, 
        '15:00', 
        '15:40';


    -- Thursday Period 8: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-4-DAT', 'Data Visualization', 'CSE-AI-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '227c5d06-7575-4f49-be94-02ca22721398', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-4-DAT'), 
        'Thursday', 
        8, 
        '15:40', 
        '16:20';


    -- Friday Period 1: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-4-SOF', 'Software Project Management', 'CSE-AI-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '801ee8f6-c36d-4cf5-acb2-0f70548dfb5e', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-4-SOF'), 
        'Friday', 
        1, 
        '09:00', 
        '09:50';


    -- Friday Period 2: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-4-DEE', 'Deep Learning Lab', 'CSE-AI-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '37c1ce5b-8d01-46fd-a486-9b57ee9d29d6', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-4-DEE'), 
        'Friday', 
        2, 
        '09:50', 
        '10:40';


    -- Friday Period 3: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-4-DAT', 'Data Visualization Lab', 'CSE-AI-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a4cdbb21-26f0-4bcd-873f-b4bd483914b1', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-4-DAT'), 
        'Friday', 
        3, 
        '10:50', 
        '11:40';


    -- Friday Period 4: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-4-COU', 'Counseling', 'CSE-AI-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '5b6cf810-ec62-48f0-b829-ac84aababfdb', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-4-COU'), 
        'Friday', 
        4, 
        '11:40', 
        '12:30';


    -- Friday Period 5: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-4-CLO', 'Cloud Computing', 'CSE-AI-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c903b121-a6dd-4111-8944-1d4e3540ab5d', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-4-CLO'), 
        'Friday', 
        5, 
        '13:10', 
        '14:00';


    -- Friday Period 6: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-4-DEE', 'Deep Learning', 'CSE-AI-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'e4160498-afba-4496-8ecf-7f098f78784d', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-4-DEE'), 
        'Friday', 
        6, 
        '14:00', 
        '14:50';


    -- Friday Period 7: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-4-DAT', 'Data Visualization', 'CSE-AI-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '227c5d06-7575-4f49-be94-02ca22721398', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-4-DAT'), 
        'Friday', 
        7, 
        '15:00', 
        '15:40';


    -- Friday Period 8: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-4-OPE', 'Operating Systems', 'CSE-AI-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'd6d71bd1-9211-4110-953c-29eb694868e5', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-4-OPE'), 
        'Friday', 
        8, 
        '15:40', 
        '16:20';


    -- Saturday Period 1: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-4-DEE', 'Deep Learning Lab', 'CSE-AI-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '37c1ce5b-8d01-46fd-a486-9b57ee9d29d6', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-4-DEE'), 
        'Saturday', 
        1, 
        '09:00', 
        '09:50';


    -- Saturday Period 2: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-4-DAT', 'Data Visualization Lab', 'CSE-AI-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a4cdbb21-26f0-4bcd-873f-b4bd483914b1', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-4-DAT'), 
        'Saturday', 
        2, 
        '09:50', 
        '10:40';


    -- Saturday Period 3: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-4-COU', 'Counseling', 'CSE-AI-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '5b6cf810-ec62-48f0-b829-ac84aababfdb', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-4-COU'), 
        'Saturday', 
        3, 
        '10:50', 
        '11:40';


    -- Saturday Period 4: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-4-CLO', 'Cloud Computing', 'CSE-AI-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c903b121-a6dd-4111-8944-1d4e3540ab5d', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-4-CLO'), 
        'Saturday', 
        4, 
        '11:40', 
        '12:30';


    -- Saturday Period 5: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-4-DEE', 'Deep Learning', 'CSE-AI-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'e4160498-afba-4496-8ecf-7f098f78784d', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-4-DEE'), 
        'Saturday', 
        5, 
        '13:10', 
        '14:00';


    -- Saturday Period 6: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-4-DAT', 'Data Visualization', 'CSE-AI-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '227c5d06-7575-4f49-be94-02ca22721398', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-4-DAT'), 
        'Saturday', 
        6, 
        '14:00', 
        '14:50';


    -- Saturday Period 7: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-4-OPE', 'Operating Systems', 'CSE-AI-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'd6d71bd1-9211-4110-953c-29eb694868e5', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-4-OPE'), 
        'Saturday', 
        7, 
        '15:00', 
        '15:40';


    -- Saturday Period 8: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CSE-AI-4-SOF', 'Software Project Management', 'CSE-AI-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '801ee8f6-c36d-4cf5-acb2-0f70548dfb5e', 
        (SELECT id FROM courses WHERE code = 'CSE-AI-4-SOF'), 
        'Saturday', 
        8, 
        '15:40', 
        '16:20';

END $$;

DO $$
DECLARE
    v_ay_id UUID := 'd860d5fb-d5f0-4497-a7ea-073004d80500';
    v_sec_id UUID;
    v_course_ids UUID[];
    v_fac_id UUID;
    v_dept text := 'IT';
BEGIN
    -- 1. Ensure Section Exists
    INSERT INTO class_sections (name, dept_code, academic_year_id, academic_year, year, semester, section)
    VALUES ('IT-2-A', v_dept::department_code, v_ay_id, '2025-2026', 2, 4, 'A')
    ON CONFLICT (dept_code, academic_year_id, year, section) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO v_sec_id;

    -- If we missed ID (due to no update), fetch it
    IF v_sec_id IS NULL THEN
        SELECT id INTO v_sec_id FROM class_sections 
        WHERE dept_code = v_dept AND academic_year_id = v_ay_id AND year = 2 AND section = 'A';
    END IF;

    -- 2. Clear existing timetable for this section to avoid clutter
    DELETE FROM timetable WHERE class_section_id = v_sec_id;

    -- 3. Loop and Insert Periods


    -- Monday Period 1: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-2-CLO', 'Cloud Computing', 'IT-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f5351fd3-2d8c-4465-945d-5735089b4cee', 
        (SELECT id FROM courses WHERE code = 'IT-2-CLO'), 
        'Monday', 
        1, 
        '09:00', 
        '09:50';


    -- Monday Period 2: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-2-DEE', 'Deep Learning', 'IT-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ee30a7af-a6b5-4040-a869-2ae3ebab96f4', 
        (SELECT id FROM courses WHERE code = 'IT-2-DEE'), 
        'Monday', 
        2, 
        '09:50', 
        '10:40';


    -- Monday Period 3: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-2-DAT', 'Data Visualization', 'IT-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '6fdc6737-4853-4c46-99ee-4d0c3970ecd3', 
        (SELECT id FROM courses WHERE code = 'IT-2-DAT'), 
        'Monday', 
        3, 
        '10:50', 
        '11:40';


    -- Monday Period 4: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-2-OPE', 'Operating Systems', 'IT-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c47e81bd-9c03-4192-8ac3-b0970d14b88b', 
        (SELECT id FROM courses WHERE code = 'IT-2-OPE'), 
        'Monday', 
        4, 
        '11:40', 
        '12:30';


    -- Monday Period 5: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-2-SOF', 'Software Project Management', 'IT-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '9f7df3fe-4a70-4d9f-9975-bf5a2a64a3c2', 
        (SELECT id FROM courses WHERE code = 'IT-2-SOF'), 
        'Monday', 
        5, 
        '13:10', 
        '14:00';


    -- Monday Period 6: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-2-DEE', 'Deep Learning Lab', 'IT-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '05290caf-03eb-4b6b-b8aa-f8156653100c', 
        (SELECT id FROM courses WHERE code = 'IT-2-DEE'), 
        'Monday', 
        6, 
        '14:00', 
        '14:50';


    -- Monday Period 7: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-2-DAT', 'Data Visualization Lab', 'IT-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '646d73c9-1730-4bf2-b052-998da66df8f6', 
        (SELECT id FROM courses WHERE code = 'IT-2-DAT'), 
        'Monday', 
        7, 
        '15:00', 
        '15:40';


    -- Monday Period 8: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-2-COU', 'Counseling', 'IT-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '2d4f4325-aeb8-42ce-ae7b-e2e434fb78b8', 
        (SELECT id FROM courses WHERE code = 'IT-2-COU'), 
        'Monday', 
        8, 
        '15:40', 
        '16:20';


    -- Tuesday Period 1: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-2-DEE', 'Deep Learning', 'IT-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ee30a7af-a6b5-4040-a869-2ae3ebab96f4', 
        (SELECT id FROM courses WHERE code = 'IT-2-DEE'), 
        'Tuesday', 
        1, 
        '09:00', 
        '09:50';


    -- Tuesday Period 2: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-2-DAT', 'Data Visualization', 'IT-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '6fdc6737-4853-4c46-99ee-4d0c3970ecd3', 
        (SELECT id FROM courses WHERE code = 'IT-2-DAT'), 
        'Tuesday', 
        2, 
        '09:50', 
        '10:40';


    -- Tuesday Period 3: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-2-OPE', 'Operating Systems', 'IT-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c47e81bd-9c03-4192-8ac3-b0970d14b88b', 
        (SELECT id FROM courses WHERE code = 'IT-2-OPE'), 
        'Tuesday', 
        3, 
        '10:50', 
        '11:40';


    -- Tuesday Period 4: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-2-SOF', 'Software Project Management', 'IT-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '9f7df3fe-4a70-4d9f-9975-bf5a2a64a3c2', 
        (SELECT id FROM courses WHERE code = 'IT-2-SOF'), 
        'Tuesday', 
        4, 
        '11:40', 
        '12:30';


    -- Tuesday Period 5: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-2-DEE', 'Deep Learning Lab', 'IT-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '05290caf-03eb-4b6b-b8aa-f8156653100c', 
        (SELECT id FROM courses WHERE code = 'IT-2-DEE'), 
        'Tuesday', 
        5, 
        '13:10', 
        '14:00';


    -- Tuesday Period 6: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-2-DAT', 'Data Visualization Lab', 'IT-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '646d73c9-1730-4bf2-b052-998da66df8f6', 
        (SELECT id FROM courses WHERE code = 'IT-2-DAT'), 
        'Tuesday', 
        6, 
        '14:00', 
        '14:50';


    -- Tuesday Period 7: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-2-COU', 'Counseling', 'IT-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '2d4f4325-aeb8-42ce-ae7b-e2e434fb78b8', 
        (SELECT id FROM courses WHERE code = 'IT-2-COU'), 
        'Tuesday', 
        7, 
        '15:00', 
        '15:40';


    -- Tuesday Period 8: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-2-CLO', 'Cloud Computing', 'IT-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f5351fd3-2d8c-4465-945d-5735089b4cee', 
        (SELECT id FROM courses WHERE code = 'IT-2-CLO'), 
        'Tuesday', 
        8, 
        '15:40', 
        '16:20';


    -- Wednesday Period 1: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-2-DAT', 'Data Visualization', 'IT-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '6fdc6737-4853-4c46-99ee-4d0c3970ecd3', 
        (SELECT id FROM courses WHERE code = 'IT-2-DAT'), 
        'Wednesday', 
        1, 
        '09:00', 
        '09:50';


    -- Wednesday Period 2: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-2-OPE', 'Operating Systems', 'IT-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c47e81bd-9c03-4192-8ac3-b0970d14b88b', 
        (SELECT id FROM courses WHERE code = 'IT-2-OPE'), 
        'Wednesday', 
        2, 
        '09:50', 
        '10:40';


    -- Wednesday Period 3: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-2-SOF', 'Software Project Management', 'IT-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '9f7df3fe-4a70-4d9f-9975-bf5a2a64a3c2', 
        (SELECT id FROM courses WHERE code = 'IT-2-SOF'), 
        'Wednesday', 
        3, 
        '10:50', 
        '11:40';


    -- Wednesday Period 4: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-2-DEE', 'Deep Learning Lab', 'IT-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '05290caf-03eb-4b6b-b8aa-f8156653100c', 
        (SELECT id FROM courses WHERE code = 'IT-2-DEE'), 
        'Wednesday', 
        4, 
        '11:40', 
        '12:30';


    -- Wednesday Period 5: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-2-DAT', 'Data Visualization Lab', 'IT-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '646d73c9-1730-4bf2-b052-998da66df8f6', 
        (SELECT id FROM courses WHERE code = 'IT-2-DAT'), 
        'Wednesday', 
        5, 
        '13:10', 
        '14:00';


    -- Wednesday Period 6: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-2-COU', 'Counseling', 'IT-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '2d4f4325-aeb8-42ce-ae7b-e2e434fb78b8', 
        (SELECT id FROM courses WHERE code = 'IT-2-COU'), 
        'Wednesday', 
        6, 
        '14:00', 
        '14:50';


    -- Wednesday Period 7: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-2-CLO', 'Cloud Computing', 'IT-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f5351fd3-2d8c-4465-945d-5735089b4cee', 
        (SELECT id FROM courses WHERE code = 'IT-2-CLO'), 
        'Wednesday', 
        7, 
        '15:00', 
        '15:40';


    -- Wednesday Period 8: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-2-DEE', 'Deep Learning', 'IT-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ee30a7af-a6b5-4040-a869-2ae3ebab96f4', 
        (SELECT id FROM courses WHERE code = 'IT-2-DEE'), 
        'Wednesday', 
        8, 
        '15:40', 
        '16:20';


    -- Thursday Period 1: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-2-OPE', 'Operating Systems', 'IT-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c47e81bd-9c03-4192-8ac3-b0970d14b88b', 
        (SELECT id FROM courses WHERE code = 'IT-2-OPE'), 
        'Thursday', 
        1, 
        '09:00', 
        '09:50';


    -- Thursday Period 2: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-2-SOF', 'Software Project Management', 'IT-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '9f7df3fe-4a70-4d9f-9975-bf5a2a64a3c2', 
        (SELECT id FROM courses WHERE code = 'IT-2-SOF'), 
        'Thursday', 
        2, 
        '09:50', 
        '10:40';


    -- Thursday Period 3: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-2-DEE', 'Deep Learning Lab', 'IT-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '05290caf-03eb-4b6b-b8aa-f8156653100c', 
        (SELECT id FROM courses WHERE code = 'IT-2-DEE'), 
        'Thursday', 
        3, 
        '10:50', 
        '11:40';


    -- Thursday Period 4: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-2-DAT', 'Data Visualization Lab', 'IT-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '646d73c9-1730-4bf2-b052-998da66df8f6', 
        (SELECT id FROM courses WHERE code = 'IT-2-DAT'), 
        'Thursday', 
        4, 
        '11:40', 
        '12:30';


    -- Thursday Period 5: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-2-COU', 'Counseling', 'IT-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '2d4f4325-aeb8-42ce-ae7b-e2e434fb78b8', 
        (SELECT id FROM courses WHERE code = 'IT-2-COU'), 
        'Thursday', 
        5, 
        '13:10', 
        '14:00';


    -- Thursday Period 6: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-2-CLO', 'Cloud Computing', 'IT-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f5351fd3-2d8c-4465-945d-5735089b4cee', 
        (SELECT id FROM courses WHERE code = 'IT-2-CLO'), 
        'Thursday', 
        6, 
        '14:00', 
        '14:50';


    -- Thursday Period 7: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-2-DEE', 'Deep Learning', 'IT-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ee30a7af-a6b5-4040-a869-2ae3ebab96f4', 
        (SELECT id FROM courses WHERE code = 'IT-2-DEE'), 
        'Thursday', 
        7, 
        '15:00', 
        '15:40';


    -- Thursday Period 8: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-2-DAT', 'Data Visualization', 'IT-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '6fdc6737-4853-4c46-99ee-4d0c3970ecd3', 
        (SELECT id FROM courses WHERE code = 'IT-2-DAT'), 
        'Thursday', 
        8, 
        '15:40', 
        '16:20';


    -- Friday Period 1: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-2-SOF', 'Software Project Management', 'IT-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '9f7df3fe-4a70-4d9f-9975-bf5a2a64a3c2', 
        (SELECT id FROM courses WHERE code = 'IT-2-SOF'), 
        'Friday', 
        1, 
        '09:00', 
        '09:50';


    -- Friday Period 2: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-2-DEE', 'Deep Learning Lab', 'IT-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '05290caf-03eb-4b6b-b8aa-f8156653100c', 
        (SELECT id FROM courses WHERE code = 'IT-2-DEE'), 
        'Friday', 
        2, 
        '09:50', 
        '10:40';


    -- Friday Period 3: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-2-DAT', 'Data Visualization Lab', 'IT-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '646d73c9-1730-4bf2-b052-998da66df8f6', 
        (SELECT id FROM courses WHERE code = 'IT-2-DAT'), 
        'Friday', 
        3, 
        '10:50', 
        '11:40';


    -- Friday Period 4: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-2-COU', 'Counseling', 'IT-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '2d4f4325-aeb8-42ce-ae7b-e2e434fb78b8', 
        (SELECT id FROM courses WHERE code = 'IT-2-COU'), 
        'Friday', 
        4, 
        '11:40', 
        '12:30';


    -- Friday Period 5: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-2-CLO', 'Cloud Computing', 'IT-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f5351fd3-2d8c-4465-945d-5735089b4cee', 
        (SELECT id FROM courses WHERE code = 'IT-2-CLO'), 
        'Friday', 
        5, 
        '13:10', 
        '14:00';


    -- Friday Period 6: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-2-DEE', 'Deep Learning', 'IT-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ee30a7af-a6b5-4040-a869-2ae3ebab96f4', 
        (SELECT id FROM courses WHERE code = 'IT-2-DEE'), 
        'Friday', 
        6, 
        '14:00', 
        '14:50';


    -- Friday Period 7: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-2-DAT', 'Data Visualization', 'IT-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '6fdc6737-4853-4c46-99ee-4d0c3970ecd3', 
        (SELECT id FROM courses WHERE code = 'IT-2-DAT'), 
        'Friday', 
        7, 
        '15:00', 
        '15:40';


    -- Friday Period 8: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-2-OPE', 'Operating Systems', 'IT-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c47e81bd-9c03-4192-8ac3-b0970d14b88b', 
        (SELECT id FROM courses WHERE code = 'IT-2-OPE'), 
        'Friday', 
        8, 
        '15:40', 
        '16:20';


    -- Saturday Period 1: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-2-DEE', 'Deep Learning Lab', 'IT-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '05290caf-03eb-4b6b-b8aa-f8156653100c', 
        (SELECT id FROM courses WHERE code = 'IT-2-DEE'), 
        'Saturday', 
        1, 
        '09:00', 
        '09:50';


    -- Saturday Period 2: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-2-DAT', 'Data Visualization Lab', 'IT-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '646d73c9-1730-4bf2-b052-998da66df8f6', 
        (SELECT id FROM courses WHERE code = 'IT-2-DAT'), 
        'Saturday', 
        2, 
        '09:50', 
        '10:40';


    -- Saturday Period 3: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-2-COU', 'Counseling', 'IT-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '2d4f4325-aeb8-42ce-ae7b-e2e434fb78b8', 
        (SELECT id FROM courses WHERE code = 'IT-2-COU'), 
        'Saturday', 
        3, 
        '10:50', 
        '11:40';


    -- Saturday Period 4: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-2-CLO', 'Cloud Computing', 'IT-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f5351fd3-2d8c-4465-945d-5735089b4cee', 
        (SELECT id FROM courses WHERE code = 'IT-2-CLO'), 
        'Saturday', 
        4, 
        '11:40', 
        '12:30';


    -- Saturday Period 5: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-2-DEE', 'Deep Learning', 'IT-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ee30a7af-a6b5-4040-a869-2ae3ebab96f4', 
        (SELECT id FROM courses WHERE code = 'IT-2-DEE'), 
        'Saturday', 
        5, 
        '13:10', 
        '14:00';


    -- Saturday Period 6: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-2-DAT', 'Data Visualization', 'IT-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '6fdc6737-4853-4c46-99ee-4d0c3970ecd3', 
        (SELECT id FROM courses WHERE code = 'IT-2-DAT'), 
        'Saturday', 
        6, 
        '14:00', 
        '14:50';


    -- Saturday Period 7: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-2-OPE', 'Operating Systems', 'IT-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c47e81bd-9c03-4192-8ac3-b0970d14b88b', 
        (SELECT id FROM courses WHERE code = 'IT-2-OPE'), 
        'Saturday', 
        7, 
        '15:00', 
        '15:40';


    -- Saturday Period 8: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-2-SOF', 'Software Project Management', 'IT-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '9f7df3fe-4a70-4d9f-9975-bf5a2a64a3c2', 
        (SELECT id FROM courses WHERE code = 'IT-2-SOF'), 
        'Saturday', 
        8, 
        '15:40', 
        '16:20';

END $$;

DO $$
DECLARE
    v_ay_id UUID := 'd860d5fb-d5f0-4497-a7ea-073004d80500';
    v_sec_id UUID;
    v_course_ids UUID[];
    v_fac_id UUID;
    v_dept text := 'IT';
BEGIN
    -- 1. Ensure Section Exists
    INSERT INTO class_sections (name, dept_code, academic_year_id, academic_year, year, semester, section)
    VALUES ('IT-3-A', v_dept::department_code, v_ay_id, '2025-2026', 3, 6, 'A')
    ON CONFLICT (dept_code, academic_year_id, year, section) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO v_sec_id;

    -- If we missed ID (due to no update), fetch it
    IF v_sec_id IS NULL THEN
        SELECT id INTO v_sec_id FROM class_sections 
        WHERE dept_code = v_dept AND academic_year_id = v_ay_id AND year = 3 AND section = 'A';
    END IF;

    -- 2. Clear existing timetable for this section to avoid clutter
    DELETE FROM timetable WHERE class_section_id = v_sec_id;

    -- 3. Loop and Insert Periods


    -- Monday Period 1: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-3-CLO', 'Cloud Computing', 'IT-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f5351fd3-2d8c-4465-945d-5735089b4cee', 
        (SELECT id FROM courses WHERE code = 'IT-3-CLO'), 
        'Monday', 
        1, 
        '09:00', 
        '09:50';


    -- Monday Period 2: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-3-DEE', 'Deep Learning', 'IT-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ee30a7af-a6b5-4040-a869-2ae3ebab96f4', 
        (SELECT id FROM courses WHERE code = 'IT-3-DEE'), 
        'Monday', 
        2, 
        '09:50', 
        '10:40';


    -- Monday Period 3: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-3-DAT', 'Data Visualization', 'IT-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '6fdc6737-4853-4c46-99ee-4d0c3970ecd3', 
        (SELECT id FROM courses WHERE code = 'IT-3-DAT'), 
        'Monday', 
        3, 
        '10:50', 
        '11:40';


    -- Monday Period 4: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-3-OPE', 'Operating Systems', 'IT-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c47e81bd-9c03-4192-8ac3-b0970d14b88b', 
        (SELECT id FROM courses WHERE code = 'IT-3-OPE'), 
        'Monday', 
        4, 
        '11:40', 
        '12:30';


    -- Monday Period 5: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-3-SOF', 'Software Project Management', 'IT-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '9f7df3fe-4a70-4d9f-9975-bf5a2a64a3c2', 
        (SELECT id FROM courses WHERE code = 'IT-3-SOF'), 
        'Monday', 
        5, 
        '13:10', 
        '14:00';


    -- Monday Period 6: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-3-DEE', 'Deep Learning Lab', 'IT-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '05290caf-03eb-4b6b-b8aa-f8156653100c', 
        (SELECT id FROM courses WHERE code = 'IT-3-DEE'), 
        'Monday', 
        6, 
        '14:00', 
        '14:50';


    -- Monday Period 7: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-3-DAT', 'Data Visualization Lab', 'IT-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '646d73c9-1730-4bf2-b052-998da66df8f6', 
        (SELECT id FROM courses WHERE code = 'IT-3-DAT'), 
        'Monday', 
        7, 
        '15:00', 
        '15:40';


    -- Monday Period 8: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-3-COU', 'Counseling', 'IT-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '2d4f4325-aeb8-42ce-ae7b-e2e434fb78b8', 
        (SELECT id FROM courses WHERE code = 'IT-3-COU'), 
        'Monday', 
        8, 
        '15:40', 
        '16:20';


    -- Tuesday Period 1: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-3-DEE', 'Deep Learning', 'IT-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ee30a7af-a6b5-4040-a869-2ae3ebab96f4', 
        (SELECT id FROM courses WHERE code = 'IT-3-DEE'), 
        'Tuesday', 
        1, 
        '09:00', 
        '09:50';


    -- Tuesday Period 2: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-3-DAT', 'Data Visualization', 'IT-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '6fdc6737-4853-4c46-99ee-4d0c3970ecd3', 
        (SELECT id FROM courses WHERE code = 'IT-3-DAT'), 
        'Tuesday', 
        2, 
        '09:50', 
        '10:40';


    -- Tuesday Period 3: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-3-OPE', 'Operating Systems', 'IT-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c47e81bd-9c03-4192-8ac3-b0970d14b88b', 
        (SELECT id FROM courses WHERE code = 'IT-3-OPE'), 
        'Tuesday', 
        3, 
        '10:50', 
        '11:40';


    -- Tuesday Period 4: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-3-SOF', 'Software Project Management', 'IT-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '9f7df3fe-4a70-4d9f-9975-bf5a2a64a3c2', 
        (SELECT id FROM courses WHERE code = 'IT-3-SOF'), 
        'Tuesday', 
        4, 
        '11:40', 
        '12:30';


    -- Tuesday Period 5: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-3-DEE', 'Deep Learning Lab', 'IT-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '05290caf-03eb-4b6b-b8aa-f8156653100c', 
        (SELECT id FROM courses WHERE code = 'IT-3-DEE'), 
        'Tuesday', 
        5, 
        '13:10', 
        '14:00';


    -- Tuesday Period 6: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-3-DAT', 'Data Visualization Lab', 'IT-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '646d73c9-1730-4bf2-b052-998da66df8f6', 
        (SELECT id FROM courses WHERE code = 'IT-3-DAT'), 
        'Tuesday', 
        6, 
        '14:00', 
        '14:50';


    -- Tuesday Period 7: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-3-COU', 'Counseling', 'IT-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '2d4f4325-aeb8-42ce-ae7b-e2e434fb78b8', 
        (SELECT id FROM courses WHERE code = 'IT-3-COU'), 
        'Tuesday', 
        7, 
        '15:00', 
        '15:40';


    -- Tuesday Period 8: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-3-CLO', 'Cloud Computing', 'IT-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f5351fd3-2d8c-4465-945d-5735089b4cee', 
        (SELECT id FROM courses WHERE code = 'IT-3-CLO'), 
        'Tuesday', 
        8, 
        '15:40', 
        '16:20';


    -- Wednesday Period 1: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-3-DAT', 'Data Visualization', 'IT-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '6fdc6737-4853-4c46-99ee-4d0c3970ecd3', 
        (SELECT id FROM courses WHERE code = 'IT-3-DAT'), 
        'Wednesday', 
        1, 
        '09:00', 
        '09:50';


    -- Wednesday Period 2: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-3-OPE', 'Operating Systems', 'IT-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c47e81bd-9c03-4192-8ac3-b0970d14b88b', 
        (SELECT id FROM courses WHERE code = 'IT-3-OPE'), 
        'Wednesday', 
        2, 
        '09:50', 
        '10:40';


    -- Wednesday Period 3: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-3-SOF', 'Software Project Management', 'IT-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '9f7df3fe-4a70-4d9f-9975-bf5a2a64a3c2', 
        (SELECT id FROM courses WHERE code = 'IT-3-SOF'), 
        'Wednesday', 
        3, 
        '10:50', 
        '11:40';


    -- Wednesday Period 4: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-3-DEE', 'Deep Learning Lab', 'IT-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '05290caf-03eb-4b6b-b8aa-f8156653100c', 
        (SELECT id FROM courses WHERE code = 'IT-3-DEE'), 
        'Wednesday', 
        4, 
        '11:40', 
        '12:30';


    -- Wednesday Period 5: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-3-DAT', 'Data Visualization Lab', 'IT-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '646d73c9-1730-4bf2-b052-998da66df8f6', 
        (SELECT id FROM courses WHERE code = 'IT-3-DAT'), 
        'Wednesday', 
        5, 
        '13:10', 
        '14:00';


    -- Wednesday Period 6: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-3-COU', 'Counseling', 'IT-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '2d4f4325-aeb8-42ce-ae7b-e2e434fb78b8', 
        (SELECT id FROM courses WHERE code = 'IT-3-COU'), 
        'Wednesday', 
        6, 
        '14:00', 
        '14:50';


    -- Wednesday Period 7: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-3-CLO', 'Cloud Computing', 'IT-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f5351fd3-2d8c-4465-945d-5735089b4cee', 
        (SELECT id FROM courses WHERE code = 'IT-3-CLO'), 
        'Wednesday', 
        7, 
        '15:00', 
        '15:40';


    -- Wednesday Period 8: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-3-DEE', 'Deep Learning', 'IT-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ee30a7af-a6b5-4040-a869-2ae3ebab96f4', 
        (SELECT id FROM courses WHERE code = 'IT-3-DEE'), 
        'Wednesday', 
        8, 
        '15:40', 
        '16:20';


    -- Thursday Period 1: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-3-OPE', 'Operating Systems', 'IT-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c47e81bd-9c03-4192-8ac3-b0970d14b88b', 
        (SELECT id FROM courses WHERE code = 'IT-3-OPE'), 
        'Thursday', 
        1, 
        '09:00', 
        '09:50';


    -- Thursday Period 2: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-3-SOF', 'Software Project Management', 'IT-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '9f7df3fe-4a70-4d9f-9975-bf5a2a64a3c2', 
        (SELECT id FROM courses WHERE code = 'IT-3-SOF'), 
        'Thursday', 
        2, 
        '09:50', 
        '10:40';


    -- Thursday Period 3: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-3-DEE', 'Deep Learning Lab', 'IT-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '05290caf-03eb-4b6b-b8aa-f8156653100c', 
        (SELECT id FROM courses WHERE code = 'IT-3-DEE'), 
        'Thursday', 
        3, 
        '10:50', 
        '11:40';


    -- Thursday Period 4: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-3-DAT', 'Data Visualization Lab', 'IT-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '646d73c9-1730-4bf2-b052-998da66df8f6', 
        (SELECT id FROM courses WHERE code = 'IT-3-DAT'), 
        'Thursday', 
        4, 
        '11:40', 
        '12:30';


    -- Thursday Period 5: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-3-COU', 'Counseling', 'IT-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '2d4f4325-aeb8-42ce-ae7b-e2e434fb78b8', 
        (SELECT id FROM courses WHERE code = 'IT-3-COU'), 
        'Thursday', 
        5, 
        '13:10', 
        '14:00';


    -- Thursday Period 6: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-3-CLO', 'Cloud Computing', 'IT-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f5351fd3-2d8c-4465-945d-5735089b4cee', 
        (SELECT id FROM courses WHERE code = 'IT-3-CLO'), 
        'Thursday', 
        6, 
        '14:00', 
        '14:50';


    -- Thursday Period 7: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-3-DEE', 'Deep Learning', 'IT-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ee30a7af-a6b5-4040-a869-2ae3ebab96f4', 
        (SELECT id FROM courses WHERE code = 'IT-3-DEE'), 
        'Thursday', 
        7, 
        '15:00', 
        '15:40';


    -- Thursday Period 8: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-3-DAT', 'Data Visualization', 'IT-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '6fdc6737-4853-4c46-99ee-4d0c3970ecd3', 
        (SELECT id FROM courses WHERE code = 'IT-3-DAT'), 
        'Thursday', 
        8, 
        '15:40', 
        '16:20';


    -- Friday Period 1: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-3-SOF', 'Software Project Management', 'IT-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '9f7df3fe-4a70-4d9f-9975-bf5a2a64a3c2', 
        (SELECT id FROM courses WHERE code = 'IT-3-SOF'), 
        'Friday', 
        1, 
        '09:00', 
        '09:50';


    -- Friday Period 2: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-3-DEE', 'Deep Learning Lab', 'IT-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '05290caf-03eb-4b6b-b8aa-f8156653100c', 
        (SELECT id FROM courses WHERE code = 'IT-3-DEE'), 
        'Friday', 
        2, 
        '09:50', 
        '10:40';


    -- Friday Period 3: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-3-DAT', 'Data Visualization Lab', 'IT-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '646d73c9-1730-4bf2-b052-998da66df8f6', 
        (SELECT id FROM courses WHERE code = 'IT-3-DAT'), 
        'Friday', 
        3, 
        '10:50', 
        '11:40';


    -- Friday Period 4: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-3-COU', 'Counseling', 'IT-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '2d4f4325-aeb8-42ce-ae7b-e2e434fb78b8', 
        (SELECT id FROM courses WHERE code = 'IT-3-COU'), 
        'Friday', 
        4, 
        '11:40', 
        '12:30';


    -- Friday Period 5: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-3-CLO', 'Cloud Computing', 'IT-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f5351fd3-2d8c-4465-945d-5735089b4cee', 
        (SELECT id FROM courses WHERE code = 'IT-3-CLO'), 
        'Friday', 
        5, 
        '13:10', 
        '14:00';


    -- Friday Period 6: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-3-DEE', 'Deep Learning', 'IT-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ee30a7af-a6b5-4040-a869-2ae3ebab96f4', 
        (SELECT id FROM courses WHERE code = 'IT-3-DEE'), 
        'Friday', 
        6, 
        '14:00', 
        '14:50';


    -- Friday Period 7: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-3-DAT', 'Data Visualization', 'IT-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '6fdc6737-4853-4c46-99ee-4d0c3970ecd3', 
        (SELECT id FROM courses WHERE code = 'IT-3-DAT'), 
        'Friday', 
        7, 
        '15:00', 
        '15:40';


    -- Friday Period 8: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-3-OPE', 'Operating Systems', 'IT-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c47e81bd-9c03-4192-8ac3-b0970d14b88b', 
        (SELECT id FROM courses WHERE code = 'IT-3-OPE'), 
        'Friday', 
        8, 
        '15:40', 
        '16:20';


    -- Saturday Period 1: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-3-DEE', 'Deep Learning Lab', 'IT-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '05290caf-03eb-4b6b-b8aa-f8156653100c', 
        (SELECT id FROM courses WHERE code = 'IT-3-DEE'), 
        'Saturday', 
        1, 
        '09:00', 
        '09:50';


    -- Saturday Period 2: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-3-DAT', 'Data Visualization Lab', 'IT-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '646d73c9-1730-4bf2-b052-998da66df8f6', 
        (SELECT id FROM courses WHERE code = 'IT-3-DAT'), 
        'Saturday', 
        2, 
        '09:50', 
        '10:40';


    -- Saturday Period 3: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-3-COU', 'Counseling', 'IT-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '2d4f4325-aeb8-42ce-ae7b-e2e434fb78b8', 
        (SELECT id FROM courses WHERE code = 'IT-3-COU'), 
        'Saturday', 
        3, 
        '10:50', 
        '11:40';


    -- Saturday Period 4: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-3-CLO', 'Cloud Computing', 'IT-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f5351fd3-2d8c-4465-945d-5735089b4cee', 
        (SELECT id FROM courses WHERE code = 'IT-3-CLO'), 
        'Saturday', 
        4, 
        '11:40', 
        '12:30';


    -- Saturday Period 5: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-3-DEE', 'Deep Learning', 'IT-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ee30a7af-a6b5-4040-a869-2ae3ebab96f4', 
        (SELECT id FROM courses WHERE code = 'IT-3-DEE'), 
        'Saturday', 
        5, 
        '13:10', 
        '14:00';


    -- Saturday Period 6: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-3-DAT', 'Data Visualization', 'IT-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '6fdc6737-4853-4c46-99ee-4d0c3970ecd3', 
        (SELECT id FROM courses WHERE code = 'IT-3-DAT'), 
        'Saturday', 
        6, 
        '14:00', 
        '14:50';


    -- Saturday Period 7: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-3-OPE', 'Operating Systems', 'IT-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c47e81bd-9c03-4192-8ac3-b0970d14b88b', 
        (SELECT id FROM courses WHERE code = 'IT-3-OPE'), 
        'Saturday', 
        7, 
        '15:00', 
        '15:40';


    -- Saturday Period 8: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-3-SOF', 'Software Project Management', 'IT-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '9f7df3fe-4a70-4d9f-9975-bf5a2a64a3c2', 
        (SELECT id FROM courses WHERE code = 'IT-3-SOF'), 
        'Saturday', 
        8, 
        '15:40', 
        '16:20';

END $$;

DO $$
DECLARE
    v_ay_id UUID := 'd860d5fb-d5f0-4497-a7ea-073004d80500';
    v_sec_id UUID;
    v_course_ids UUID[];
    v_fac_id UUID;
    v_dept text := 'IT';
BEGIN
    -- 1. Ensure Section Exists
    INSERT INTO class_sections (name, dept_code, academic_year_id, academic_year, year, semester, section)
    VALUES ('IT-4-A', v_dept::department_code, v_ay_id, '2025-2026', 4, 8, 'A')
    ON CONFLICT (dept_code, academic_year_id, year, section) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO v_sec_id;

    -- If we missed ID (due to no update), fetch it
    IF v_sec_id IS NULL THEN
        SELECT id INTO v_sec_id FROM class_sections 
        WHERE dept_code = v_dept AND academic_year_id = v_ay_id AND year = 4 AND section = 'A';
    END IF;

    -- 2. Clear existing timetable for this section to avoid clutter
    DELETE FROM timetable WHERE class_section_id = v_sec_id;

    -- 3. Loop and Insert Periods


    -- Monday Period 1: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-4-CLO', 'Cloud Computing', 'IT-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f5351fd3-2d8c-4465-945d-5735089b4cee', 
        (SELECT id FROM courses WHERE code = 'IT-4-CLO'), 
        'Monday', 
        1, 
        '09:00', 
        '09:50';


    -- Monday Period 2: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-4-DEE', 'Deep Learning', 'IT-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ee30a7af-a6b5-4040-a869-2ae3ebab96f4', 
        (SELECT id FROM courses WHERE code = 'IT-4-DEE'), 
        'Monday', 
        2, 
        '09:50', 
        '10:40';


    -- Monday Period 3: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-4-DAT', 'Data Visualization', 'IT-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '6fdc6737-4853-4c46-99ee-4d0c3970ecd3', 
        (SELECT id FROM courses WHERE code = 'IT-4-DAT'), 
        'Monday', 
        3, 
        '10:50', 
        '11:40';


    -- Monday Period 4: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-4-OPE', 'Operating Systems', 'IT-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c47e81bd-9c03-4192-8ac3-b0970d14b88b', 
        (SELECT id FROM courses WHERE code = 'IT-4-OPE'), 
        'Monday', 
        4, 
        '11:40', 
        '12:30';


    -- Monday Period 5: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-4-SOF', 'Software Project Management', 'IT-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '9f7df3fe-4a70-4d9f-9975-bf5a2a64a3c2', 
        (SELECT id FROM courses WHERE code = 'IT-4-SOF'), 
        'Monday', 
        5, 
        '13:10', 
        '14:00';


    -- Monday Period 6: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-4-DEE', 'Deep Learning Lab', 'IT-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '05290caf-03eb-4b6b-b8aa-f8156653100c', 
        (SELECT id FROM courses WHERE code = 'IT-4-DEE'), 
        'Monday', 
        6, 
        '14:00', 
        '14:50';


    -- Monday Period 7: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-4-DAT', 'Data Visualization Lab', 'IT-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '646d73c9-1730-4bf2-b052-998da66df8f6', 
        (SELECT id FROM courses WHERE code = 'IT-4-DAT'), 
        'Monday', 
        7, 
        '15:00', 
        '15:40';


    -- Monday Period 8: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-4-COU', 'Counseling', 'IT-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '2d4f4325-aeb8-42ce-ae7b-e2e434fb78b8', 
        (SELECT id FROM courses WHERE code = 'IT-4-COU'), 
        'Monday', 
        8, 
        '15:40', 
        '16:20';


    -- Tuesday Period 1: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-4-DEE', 'Deep Learning', 'IT-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ee30a7af-a6b5-4040-a869-2ae3ebab96f4', 
        (SELECT id FROM courses WHERE code = 'IT-4-DEE'), 
        'Tuesday', 
        1, 
        '09:00', 
        '09:50';


    -- Tuesday Period 2: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-4-DAT', 'Data Visualization', 'IT-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '6fdc6737-4853-4c46-99ee-4d0c3970ecd3', 
        (SELECT id FROM courses WHERE code = 'IT-4-DAT'), 
        'Tuesday', 
        2, 
        '09:50', 
        '10:40';


    -- Tuesday Period 3: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-4-OPE', 'Operating Systems', 'IT-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c47e81bd-9c03-4192-8ac3-b0970d14b88b', 
        (SELECT id FROM courses WHERE code = 'IT-4-OPE'), 
        'Tuesday', 
        3, 
        '10:50', 
        '11:40';


    -- Tuesday Period 4: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-4-SOF', 'Software Project Management', 'IT-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '9f7df3fe-4a70-4d9f-9975-bf5a2a64a3c2', 
        (SELECT id FROM courses WHERE code = 'IT-4-SOF'), 
        'Tuesday', 
        4, 
        '11:40', 
        '12:30';


    -- Tuesday Period 5: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-4-DEE', 'Deep Learning Lab', 'IT-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '05290caf-03eb-4b6b-b8aa-f8156653100c', 
        (SELECT id FROM courses WHERE code = 'IT-4-DEE'), 
        'Tuesday', 
        5, 
        '13:10', 
        '14:00';


    -- Tuesday Period 6: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-4-DAT', 'Data Visualization Lab', 'IT-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '646d73c9-1730-4bf2-b052-998da66df8f6', 
        (SELECT id FROM courses WHERE code = 'IT-4-DAT'), 
        'Tuesday', 
        6, 
        '14:00', 
        '14:50';


    -- Tuesday Period 7: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-4-COU', 'Counseling', 'IT-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '2d4f4325-aeb8-42ce-ae7b-e2e434fb78b8', 
        (SELECT id FROM courses WHERE code = 'IT-4-COU'), 
        'Tuesday', 
        7, 
        '15:00', 
        '15:40';


    -- Tuesday Period 8: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-4-CLO', 'Cloud Computing', 'IT-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f5351fd3-2d8c-4465-945d-5735089b4cee', 
        (SELECT id FROM courses WHERE code = 'IT-4-CLO'), 
        'Tuesday', 
        8, 
        '15:40', 
        '16:20';


    -- Wednesday Period 1: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-4-DAT', 'Data Visualization', 'IT-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '6fdc6737-4853-4c46-99ee-4d0c3970ecd3', 
        (SELECT id FROM courses WHERE code = 'IT-4-DAT'), 
        'Wednesday', 
        1, 
        '09:00', 
        '09:50';


    -- Wednesday Period 2: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-4-OPE', 'Operating Systems', 'IT-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c47e81bd-9c03-4192-8ac3-b0970d14b88b', 
        (SELECT id FROM courses WHERE code = 'IT-4-OPE'), 
        'Wednesday', 
        2, 
        '09:50', 
        '10:40';


    -- Wednesday Period 3: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-4-SOF', 'Software Project Management', 'IT-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '9f7df3fe-4a70-4d9f-9975-bf5a2a64a3c2', 
        (SELECT id FROM courses WHERE code = 'IT-4-SOF'), 
        'Wednesday', 
        3, 
        '10:50', 
        '11:40';


    -- Wednesday Period 4: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-4-DEE', 'Deep Learning Lab', 'IT-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '05290caf-03eb-4b6b-b8aa-f8156653100c', 
        (SELECT id FROM courses WHERE code = 'IT-4-DEE'), 
        'Wednesday', 
        4, 
        '11:40', 
        '12:30';


    -- Wednesday Period 5: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-4-DAT', 'Data Visualization Lab', 'IT-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '646d73c9-1730-4bf2-b052-998da66df8f6', 
        (SELECT id FROM courses WHERE code = 'IT-4-DAT'), 
        'Wednesday', 
        5, 
        '13:10', 
        '14:00';


    -- Wednesday Period 6: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-4-COU', 'Counseling', 'IT-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '2d4f4325-aeb8-42ce-ae7b-e2e434fb78b8', 
        (SELECT id FROM courses WHERE code = 'IT-4-COU'), 
        'Wednesday', 
        6, 
        '14:00', 
        '14:50';


    -- Wednesday Period 7: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-4-CLO', 'Cloud Computing', 'IT-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f5351fd3-2d8c-4465-945d-5735089b4cee', 
        (SELECT id FROM courses WHERE code = 'IT-4-CLO'), 
        'Wednesday', 
        7, 
        '15:00', 
        '15:40';


    -- Wednesday Period 8: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-4-DEE', 'Deep Learning', 'IT-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ee30a7af-a6b5-4040-a869-2ae3ebab96f4', 
        (SELECT id FROM courses WHERE code = 'IT-4-DEE'), 
        'Wednesday', 
        8, 
        '15:40', 
        '16:20';


    -- Thursday Period 1: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-4-OPE', 'Operating Systems', 'IT-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c47e81bd-9c03-4192-8ac3-b0970d14b88b', 
        (SELECT id FROM courses WHERE code = 'IT-4-OPE'), 
        'Thursday', 
        1, 
        '09:00', 
        '09:50';


    -- Thursday Period 2: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-4-SOF', 'Software Project Management', 'IT-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '9f7df3fe-4a70-4d9f-9975-bf5a2a64a3c2', 
        (SELECT id FROM courses WHERE code = 'IT-4-SOF'), 
        'Thursday', 
        2, 
        '09:50', 
        '10:40';


    -- Thursday Period 3: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-4-DEE', 'Deep Learning Lab', 'IT-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '05290caf-03eb-4b6b-b8aa-f8156653100c', 
        (SELECT id FROM courses WHERE code = 'IT-4-DEE'), 
        'Thursday', 
        3, 
        '10:50', 
        '11:40';


    -- Thursday Period 4: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-4-DAT', 'Data Visualization Lab', 'IT-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '646d73c9-1730-4bf2-b052-998da66df8f6', 
        (SELECT id FROM courses WHERE code = 'IT-4-DAT'), 
        'Thursday', 
        4, 
        '11:40', 
        '12:30';


    -- Thursday Period 5: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-4-COU', 'Counseling', 'IT-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '2d4f4325-aeb8-42ce-ae7b-e2e434fb78b8', 
        (SELECT id FROM courses WHERE code = 'IT-4-COU'), 
        'Thursday', 
        5, 
        '13:10', 
        '14:00';


    -- Thursday Period 6: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-4-CLO', 'Cloud Computing', 'IT-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f5351fd3-2d8c-4465-945d-5735089b4cee', 
        (SELECT id FROM courses WHERE code = 'IT-4-CLO'), 
        'Thursday', 
        6, 
        '14:00', 
        '14:50';


    -- Thursday Period 7: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-4-DEE', 'Deep Learning', 'IT-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ee30a7af-a6b5-4040-a869-2ae3ebab96f4', 
        (SELECT id FROM courses WHERE code = 'IT-4-DEE'), 
        'Thursday', 
        7, 
        '15:00', 
        '15:40';


    -- Thursday Period 8: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-4-DAT', 'Data Visualization', 'IT-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '6fdc6737-4853-4c46-99ee-4d0c3970ecd3', 
        (SELECT id FROM courses WHERE code = 'IT-4-DAT'), 
        'Thursday', 
        8, 
        '15:40', 
        '16:20';


    -- Friday Period 1: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-4-SOF', 'Software Project Management', 'IT-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '9f7df3fe-4a70-4d9f-9975-bf5a2a64a3c2', 
        (SELECT id FROM courses WHERE code = 'IT-4-SOF'), 
        'Friday', 
        1, 
        '09:00', 
        '09:50';


    -- Friday Period 2: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-4-DEE', 'Deep Learning Lab', 'IT-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '05290caf-03eb-4b6b-b8aa-f8156653100c', 
        (SELECT id FROM courses WHERE code = 'IT-4-DEE'), 
        'Friday', 
        2, 
        '09:50', 
        '10:40';


    -- Friday Period 3: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-4-DAT', 'Data Visualization Lab', 'IT-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '646d73c9-1730-4bf2-b052-998da66df8f6', 
        (SELECT id FROM courses WHERE code = 'IT-4-DAT'), 
        'Friday', 
        3, 
        '10:50', 
        '11:40';


    -- Friday Period 4: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-4-COU', 'Counseling', 'IT-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '2d4f4325-aeb8-42ce-ae7b-e2e434fb78b8', 
        (SELECT id FROM courses WHERE code = 'IT-4-COU'), 
        'Friday', 
        4, 
        '11:40', 
        '12:30';


    -- Friday Period 5: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-4-CLO', 'Cloud Computing', 'IT-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f5351fd3-2d8c-4465-945d-5735089b4cee', 
        (SELECT id FROM courses WHERE code = 'IT-4-CLO'), 
        'Friday', 
        5, 
        '13:10', 
        '14:00';


    -- Friday Period 6: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-4-DEE', 'Deep Learning', 'IT-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ee30a7af-a6b5-4040-a869-2ae3ebab96f4', 
        (SELECT id FROM courses WHERE code = 'IT-4-DEE'), 
        'Friday', 
        6, 
        '14:00', 
        '14:50';


    -- Friday Period 7: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-4-DAT', 'Data Visualization', 'IT-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '6fdc6737-4853-4c46-99ee-4d0c3970ecd3', 
        (SELECT id FROM courses WHERE code = 'IT-4-DAT'), 
        'Friday', 
        7, 
        '15:00', 
        '15:40';


    -- Friday Period 8: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-4-OPE', 'Operating Systems', 'IT-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c47e81bd-9c03-4192-8ac3-b0970d14b88b', 
        (SELECT id FROM courses WHERE code = 'IT-4-OPE'), 
        'Friday', 
        8, 
        '15:40', 
        '16:20';


    -- Saturday Period 1: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-4-DEE', 'Deep Learning Lab', 'IT-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '05290caf-03eb-4b6b-b8aa-f8156653100c', 
        (SELECT id FROM courses WHERE code = 'IT-4-DEE'), 
        'Saturday', 
        1, 
        '09:00', 
        '09:50';


    -- Saturday Period 2: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-4-DAT', 'Data Visualization Lab', 'IT-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '646d73c9-1730-4bf2-b052-998da66df8f6', 
        (SELECT id FROM courses WHERE code = 'IT-4-DAT'), 
        'Saturday', 
        2, 
        '09:50', 
        '10:40';


    -- Saturday Period 3: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-4-COU', 'Counseling', 'IT-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '2d4f4325-aeb8-42ce-ae7b-e2e434fb78b8', 
        (SELECT id FROM courses WHERE code = 'IT-4-COU'), 
        'Saturday', 
        3, 
        '10:50', 
        '11:40';


    -- Saturday Period 4: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-4-CLO', 'Cloud Computing', 'IT-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'f5351fd3-2d8c-4465-945d-5735089b4cee', 
        (SELECT id FROM courses WHERE code = 'IT-4-CLO'), 
        'Saturday', 
        4, 
        '11:40', 
        '12:30';


    -- Saturday Period 5: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-4-DEE', 'Deep Learning', 'IT-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ee30a7af-a6b5-4040-a869-2ae3ebab96f4', 
        (SELECT id FROM courses WHERE code = 'IT-4-DEE'), 
        'Saturday', 
        5, 
        '13:10', 
        '14:00';


    -- Saturday Period 6: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-4-DAT', 'Data Visualization', 'IT-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '6fdc6737-4853-4c46-99ee-4d0c3970ecd3', 
        (SELECT id FROM courses WHERE code = 'IT-4-DAT'), 
        'Saturday', 
        6, 
        '14:00', 
        '14:50';


    -- Saturday Period 7: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-4-OPE', 'Operating Systems', 'IT-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c47e81bd-9c03-4192-8ac3-b0970d14b88b', 
        (SELECT id FROM courses WHERE code = 'IT-4-OPE'), 
        'Saturday', 
        7, 
        '15:00', 
        '15:40';


    -- Saturday Period 8: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('IT-4-SOF', 'Software Project Management', 'IT-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '9f7df3fe-4a70-4d9f-9975-bf5a2a64a3c2', 
        (SELECT id FROM courses WHERE code = 'IT-4-SOF'), 
        'Saturday', 
        8, 
        '15:40', 
        '16:20';

END $$;

DO $$
DECLARE
    v_ay_id UUID := 'd860d5fb-d5f0-4497-a7ea-073004d80500';
    v_sec_id UUID;
    v_course_ids UUID[];
    v_fac_id UUID;
    v_dept text := 'ECE';
BEGIN
    -- 1. Ensure Section Exists
    INSERT INTO class_sections (name, dept_code, academic_year_id, academic_year, year, semester, section)
    VALUES ('ECE-2-A', v_dept::department_code, v_ay_id, '2025-2026', 2, 4, 'A')
    ON CONFLICT (dept_code, academic_year_id, year, section) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO v_sec_id;

    -- If we missed ID (due to no update), fetch it
    IF v_sec_id IS NULL THEN
        SELECT id INTO v_sec_id FROM class_sections 
        WHERE dept_code = v_dept AND academic_year_id = v_ay_id AND year = 2 AND section = 'A';
    END IF;

    -- 2. Clear existing timetable for this section to avoid clutter
    DELETE FROM timetable WHERE class_section_id = v_sec_id;

    -- 3. Loop and Insert Periods


    -- Monday Period 1: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-2-CLO', 'Cloud Computing', 'ECE-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'ECE-2-CLO'), 
        'Monday', 
        1, 
        '09:00', 
        '09:50';


    -- Monday Period 2: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-2-DEE', 'Deep Learning', 'ECE-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '21965571-e7f8-487e-aeaa-f1918137ebf4', 
        (SELECT id FROM courses WHERE code = 'ECE-2-DEE'), 
        'Monday', 
        2, 
        '09:50', 
        '10:40';


    -- Monday Period 3: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-2-DAT', 'Data Visualization', 'ECE-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '3dcd1380-3f4e-4e5b-8335-75bb7ef91f7c', 
        (SELECT id FROM courses WHERE code = 'ECE-2-DAT'), 
        'Monday', 
        3, 
        '10:50', 
        '11:40';


    -- Monday Period 4: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-2-OPE', 'Operating Systems', 'ECE-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '7dc119f8-2cd0-4cb4-aa1a-a0ab52230040', 
        (SELECT id FROM courses WHERE code = 'ECE-2-OPE'), 
        'Monday', 
        4, 
        '11:40', 
        '12:30';


    -- Monday Period 5: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-2-SOF', 'Software Project Management', 'ECE-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '35b9a927-7af3-4114-b90e-01a28a74e0c8', 
        (SELECT id FROM courses WHERE code = 'ECE-2-SOF'), 
        'Monday', 
        5, 
        '13:10', 
        '14:00';


    -- Monday Period 6: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-2-DEE', 'Deep Learning Lab', 'ECE-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c8cc756c-004b-421d-83f3-30061733c4df', 
        (SELECT id FROM courses WHERE code = 'ECE-2-DEE'), 
        'Monday', 
        6, 
        '14:00', 
        '14:50';


    -- Monday Period 7: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-2-DAT', 'Data Visualization Lab', 'ECE-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'cda781a6-f704-4a7a-bf07-cacaf7b9502a', 
        (SELECT id FROM courses WHERE code = 'ECE-2-DAT'), 
        'Monday', 
        7, 
        '15:00', 
        '15:40';


    -- Monday Period 8: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-2-COU', 'Counseling', 'ECE-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'e920d90d-caa6-4435-8861-180ca1ba3b63', 
        (SELECT id FROM courses WHERE code = 'ECE-2-COU'), 
        'Monday', 
        8, 
        '15:40', 
        '16:20';


    -- Tuesday Period 1: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-2-DEE', 'Deep Learning', 'ECE-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '21965571-e7f8-487e-aeaa-f1918137ebf4', 
        (SELECT id FROM courses WHERE code = 'ECE-2-DEE'), 
        'Tuesday', 
        1, 
        '09:00', 
        '09:50';


    -- Tuesday Period 2: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-2-DAT', 'Data Visualization', 'ECE-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '3dcd1380-3f4e-4e5b-8335-75bb7ef91f7c', 
        (SELECT id FROM courses WHERE code = 'ECE-2-DAT'), 
        'Tuesday', 
        2, 
        '09:50', 
        '10:40';


    -- Tuesday Period 3: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-2-OPE', 'Operating Systems', 'ECE-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '7dc119f8-2cd0-4cb4-aa1a-a0ab52230040', 
        (SELECT id FROM courses WHERE code = 'ECE-2-OPE'), 
        'Tuesday', 
        3, 
        '10:50', 
        '11:40';


    -- Tuesday Period 4: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-2-SOF', 'Software Project Management', 'ECE-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '35b9a927-7af3-4114-b90e-01a28a74e0c8', 
        (SELECT id FROM courses WHERE code = 'ECE-2-SOF'), 
        'Tuesday', 
        4, 
        '11:40', 
        '12:30';


    -- Tuesday Period 5: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-2-DEE', 'Deep Learning Lab', 'ECE-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c8cc756c-004b-421d-83f3-30061733c4df', 
        (SELECT id FROM courses WHERE code = 'ECE-2-DEE'), 
        'Tuesday', 
        5, 
        '13:10', 
        '14:00';


    -- Tuesday Period 6: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-2-DAT', 'Data Visualization Lab', 'ECE-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'cda781a6-f704-4a7a-bf07-cacaf7b9502a', 
        (SELECT id FROM courses WHERE code = 'ECE-2-DAT'), 
        'Tuesday', 
        6, 
        '14:00', 
        '14:50';


    -- Tuesday Period 7: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-2-COU', 'Counseling', 'ECE-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'e920d90d-caa6-4435-8861-180ca1ba3b63', 
        (SELECT id FROM courses WHERE code = 'ECE-2-COU'), 
        'Tuesday', 
        7, 
        '15:00', 
        '15:40';


    -- Tuesday Period 8: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-2-CLO', 'Cloud Computing', 'ECE-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'ECE-2-CLO'), 
        'Tuesday', 
        8, 
        '15:40', 
        '16:20';


    -- Wednesday Period 1: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-2-DAT', 'Data Visualization', 'ECE-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '3dcd1380-3f4e-4e5b-8335-75bb7ef91f7c', 
        (SELECT id FROM courses WHERE code = 'ECE-2-DAT'), 
        'Wednesday', 
        1, 
        '09:00', 
        '09:50';


    -- Wednesday Period 2: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-2-OPE', 'Operating Systems', 'ECE-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '7dc119f8-2cd0-4cb4-aa1a-a0ab52230040', 
        (SELECT id FROM courses WHERE code = 'ECE-2-OPE'), 
        'Wednesday', 
        2, 
        '09:50', 
        '10:40';


    -- Wednesday Period 3: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-2-SOF', 'Software Project Management', 'ECE-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '35b9a927-7af3-4114-b90e-01a28a74e0c8', 
        (SELECT id FROM courses WHERE code = 'ECE-2-SOF'), 
        'Wednesday', 
        3, 
        '10:50', 
        '11:40';


    -- Wednesday Period 4: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-2-DEE', 'Deep Learning Lab', 'ECE-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c8cc756c-004b-421d-83f3-30061733c4df', 
        (SELECT id FROM courses WHERE code = 'ECE-2-DEE'), 
        'Wednesday', 
        4, 
        '11:40', 
        '12:30';


    -- Wednesday Period 5: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-2-DAT', 'Data Visualization Lab', 'ECE-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'cda781a6-f704-4a7a-bf07-cacaf7b9502a', 
        (SELECT id FROM courses WHERE code = 'ECE-2-DAT'), 
        'Wednesday', 
        5, 
        '13:10', 
        '14:00';


    -- Wednesday Period 6: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-2-COU', 'Counseling', 'ECE-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'e920d90d-caa6-4435-8861-180ca1ba3b63', 
        (SELECT id FROM courses WHERE code = 'ECE-2-COU'), 
        'Wednesday', 
        6, 
        '14:00', 
        '14:50';


    -- Wednesday Period 7: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-2-CLO', 'Cloud Computing', 'ECE-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'ECE-2-CLO'), 
        'Wednesday', 
        7, 
        '15:00', 
        '15:40';


    -- Wednesday Period 8: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-2-DEE', 'Deep Learning', 'ECE-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '21965571-e7f8-487e-aeaa-f1918137ebf4', 
        (SELECT id FROM courses WHERE code = 'ECE-2-DEE'), 
        'Wednesday', 
        8, 
        '15:40', 
        '16:20';


    -- Thursday Period 1: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-2-OPE', 'Operating Systems', 'ECE-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '7dc119f8-2cd0-4cb4-aa1a-a0ab52230040', 
        (SELECT id FROM courses WHERE code = 'ECE-2-OPE'), 
        'Thursday', 
        1, 
        '09:00', 
        '09:50';


    -- Thursday Period 2: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-2-SOF', 'Software Project Management', 'ECE-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '35b9a927-7af3-4114-b90e-01a28a74e0c8', 
        (SELECT id FROM courses WHERE code = 'ECE-2-SOF'), 
        'Thursday', 
        2, 
        '09:50', 
        '10:40';


    -- Thursday Period 3: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-2-DEE', 'Deep Learning Lab', 'ECE-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c8cc756c-004b-421d-83f3-30061733c4df', 
        (SELECT id FROM courses WHERE code = 'ECE-2-DEE'), 
        'Thursday', 
        3, 
        '10:50', 
        '11:40';


    -- Thursday Period 4: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-2-DAT', 'Data Visualization Lab', 'ECE-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'cda781a6-f704-4a7a-bf07-cacaf7b9502a', 
        (SELECT id FROM courses WHERE code = 'ECE-2-DAT'), 
        'Thursday', 
        4, 
        '11:40', 
        '12:30';


    -- Thursday Period 5: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-2-COU', 'Counseling', 'ECE-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'e920d90d-caa6-4435-8861-180ca1ba3b63', 
        (SELECT id FROM courses WHERE code = 'ECE-2-COU'), 
        'Thursday', 
        5, 
        '13:10', 
        '14:00';


    -- Thursday Period 6: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-2-CLO', 'Cloud Computing', 'ECE-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'ECE-2-CLO'), 
        'Thursday', 
        6, 
        '14:00', 
        '14:50';


    -- Thursday Period 7: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-2-DEE', 'Deep Learning', 'ECE-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '21965571-e7f8-487e-aeaa-f1918137ebf4', 
        (SELECT id FROM courses WHERE code = 'ECE-2-DEE'), 
        'Thursday', 
        7, 
        '15:00', 
        '15:40';


    -- Thursday Period 8: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-2-DAT', 'Data Visualization', 'ECE-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '3dcd1380-3f4e-4e5b-8335-75bb7ef91f7c', 
        (SELECT id FROM courses WHERE code = 'ECE-2-DAT'), 
        'Thursday', 
        8, 
        '15:40', 
        '16:20';


    -- Friday Period 1: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-2-SOF', 'Software Project Management', 'ECE-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '35b9a927-7af3-4114-b90e-01a28a74e0c8', 
        (SELECT id FROM courses WHERE code = 'ECE-2-SOF'), 
        'Friday', 
        1, 
        '09:00', 
        '09:50';


    -- Friday Period 2: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-2-DEE', 'Deep Learning Lab', 'ECE-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c8cc756c-004b-421d-83f3-30061733c4df', 
        (SELECT id FROM courses WHERE code = 'ECE-2-DEE'), 
        'Friday', 
        2, 
        '09:50', 
        '10:40';


    -- Friday Period 3: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-2-DAT', 'Data Visualization Lab', 'ECE-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'cda781a6-f704-4a7a-bf07-cacaf7b9502a', 
        (SELECT id FROM courses WHERE code = 'ECE-2-DAT'), 
        'Friday', 
        3, 
        '10:50', 
        '11:40';


    -- Friday Period 4: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-2-COU', 'Counseling', 'ECE-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'e920d90d-caa6-4435-8861-180ca1ba3b63', 
        (SELECT id FROM courses WHERE code = 'ECE-2-COU'), 
        'Friday', 
        4, 
        '11:40', 
        '12:30';


    -- Friday Period 5: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-2-CLO', 'Cloud Computing', 'ECE-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'ECE-2-CLO'), 
        'Friday', 
        5, 
        '13:10', 
        '14:00';


    -- Friday Period 6: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-2-DEE', 'Deep Learning', 'ECE-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '21965571-e7f8-487e-aeaa-f1918137ebf4', 
        (SELECT id FROM courses WHERE code = 'ECE-2-DEE'), 
        'Friday', 
        6, 
        '14:00', 
        '14:50';


    -- Friday Period 7: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-2-DAT', 'Data Visualization', 'ECE-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '3dcd1380-3f4e-4e5b-8335-75bb7ef91f7c', 
        (SELECT id FROM courses WHERE code = 'ECE-2-DAT'), 
        'Friday', 
        7, 
        '15:00', 
        '15:40';


    -- Friday Period 8: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-2-OPE', 'Operating Systems', 'ECE-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '7dc119f8-2cd0-4cb4-aa1a-a0ab52230040', 
        (SELECT id FROM courses WHERE code = 'ECE-2-OPE'), 
        'Friday', 
        8, 
        '15:40', 
        '16:20';


    -- Saturday Period 1: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-2-DEE', 'Deep Learning Lab', 'ECE-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c8cc756c-004b-421d-83f3-30061733c4df', 
        (SELECT id FROM courses WHERE code = 'ECE-2-DEE'), 
        'Saturday', 
        1, 
        '09:00', 
        '09:50';


    -- Saturday Period 2: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-2-DAT', 'Data Visualization Lab', 'ECE-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'cda781a6-f704-4a7a-bf07-cacaf7b9502a', 
        (SELECT id FROM courses WHERE code = 'ECE-2-DAT'), 
        'Saturday', 
        2, 
        '09:50', 
        '10:40';


    -- Saturday Period 3: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-2-COU', 'Counseling', 'ECE-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'e920d90d-caa6-4435-8861-180ca1ba3b63', 
        (SELECT id FROM courses WHERE code = 'ECE-2-COU'), 
        'Saturday', 
        3, 
        '10:50', 
        '11:40';


    -- Saturday Period 4: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-2-CLO', 'Cloud Computing', 'ECE-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'ECE-2-CLO'), 
        'Saturday', 
        4, 
        '11:40', 
        '12:30';


    -- Saturday Period 5: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-2-DEE', 'Deep Learning', 'ECE-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '21965571-e7f8-487e-aeaa-f1918137ebf4', 
        (SELECT id FROM courses WHERE code = 'ECE-2-DEE'), 
        'Saturday', 
        5, 
        '13:10', 
        '14:00';


    -- Saturday Period 6: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-2-DAT', 'Data Visualization', 'ECE-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '3dcd1380-3f4e-4e5b-8335-75bb7ef91f7c', 
        (SELECT id FROM courses WHERE code = 'ECE-2-DAT'), 
        'Saturday', 
        6, 
        '14:00', 
        '14:50';


    -- Saturday Period 7: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-2-OPE', 'Operating Systems', 'ECE-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '7dc119f8-2cd0-4cb4-aa1a-a0ab52230040', 
        (SELECT id FROM courses WHERE code = 'ECE-2-OPE'), 
        'Saturday', 
        7, 
        '15:00', 
        '15:40';


    -- Saturday Period 8: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-2-SOF', 'Software Project Management', 'ECE-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '35b9a927-7af3-4114-b90e-01a28a74e0c8', 
        (SELECT id FROM courses WHERE code = 'ECE-2-SOF'), 
        'Saturday', 
        8, 
        '15:40', 
        '16:20';

END $$;

DO $$
DECLARE
    v_ay_id UUID := 'd860d5fb-d5f0-4497-a7ea-073004d80500';
    v_sec_id UUID;
    v_course_ids UUID[];
    v_fac_id UUID;
    v_dept text := 'ECE';
BEGIN
    -- 1. Ensure Section Exists
    INSERT INTO class_sections (name, dept_code, academic_year_id, academic_year, year, semester, section)
    VALUES ('ECE-3-A', v_dept::department_code, v_ay_id, '2025-2026', 3, 6, 'A')
    ON CONFLICT (dept_code, academic_year_id, year, section) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO v_sec_id;

    -- If we missed ID (due to no update), fetch it
    IF v_sec_id IS NULL THEN
        SELECT id INTO v_sec_id FROM class_sections 
        WHERE dept_code = v_dept AND academic_year_id = v_ay_id AND year = 3 AND section = 'A';
    END IF;

    -- 2. Clear existing timetable for this section to avoid clutter
    DELETE FROM timetable WHERE class_section_id = v_sec_id;

    -- 3. Loop and Insert Periods


    -- Monday Period 1: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-3-CLO', 'Cloud Computing', 'ECE-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'ECE-3-CLO'), 
        'Monday', 
        1, 
        '09:00', 
        '09:50';


    -- Monday Period 2: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-3-DEE', 'Deep Learning', 'ECE-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '21965571-e7f8-487e-aeaa-f1918137ebf4', 
        (SELECT id FROM courses WHERE code = 'ECE-3-DEE'), 
        'Monday', 
        2, 
        '09:50', 
        '10:40';


    -- Monday Period 3: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-3-DAT', 'Data Visualization', 'ECE-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '3dcd1380-3f4e-4e5b-8335-75bb7ef91f7c', 
        (SELECT id FROM courses WHERE code = 'ECE-3-DAT'), 
        'Monday', 
        3, 
        '10:50', 
        '11:40';


    -- Monday Period 4: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-3-OPE', 'Operating Systems', 'ECE-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '7dc119f8-2cd0-4cb4-aa1a-a0ab52230040', 
        (SELECT id FROM courses WHERE code = 'ECE-3-OPE'), 
        'Monday', 
        4, 
        '11:40', 
        '12:30';


    -- Monday Period 5: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-3-SOF', 'Software Project Management', 'ECE-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '35b9a927-7af3-4114-b90e-01a28a74e0c8', 
        (SELECT id FROM courses WHERE code = 'ECE-3-SOF'), 
        'Monday', 
        5, 
        '13:10', 
        '14:00';


    -- Monday Period 6: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-3-DEE', 'Deep Learning Lab', 'ECE-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c8cc756c-004b-421d-83f3-30061733c4df', 
        (SELECT id FROM courses WHERE code = 'ECE-3-DEE'), 
        'Monday', 
        6, 
        '14:00', 
        '14:50';


    -- Monday Period 7: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-3-DAT', 'Data Visualization Lab', 'ECE-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'cda781a6-f704-4a7a-bf07-cacaf7b9502a', 
        (SELECT id FROM courses WHERE code = 'ECE-3-DAT'), 
        'Monday', 
        7, 
        '15:00', 
        '15:40';


    -- Monday Period 8: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-3-COU', 'Counseling', 'ECE-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'e920d90d-caa6-4435-8861-180ca1ba3b63', 
        (SELECT id FROM courses WHERE code = 'ECE-3-COU'), 
        'Monday', 
        8, 
        '15:40', 
        '16:20';


    -- Tuesday Period 1: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-3-DEE', 'Deep Learning', 'ECE-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '21965571-e7f8-487e-aeaa-f1918137ebf4', 
        (SELECT id FROM courses WHERE code = 'ECE-3-DEE'), 
        'Tuesday', 
        1, 
        '09:00', 
        '09:50';


    -- Tuesday Period 2: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-3-DAT', 'Data Visualization', 'ECE-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '3dcd1380-3f4e-4e5b-8335-75bb7ef91f7c', 
        (SELECT id FROM courses WHERE code = 'ECE-3-DAT'), 
        'Tuesday', 
        2, 
        '09:50', 
        '10:40';


    -- Tuesday Period 3: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-3-OPE', 'Operating Systems', 'ECE-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '7dc119f8-2cd0-4cb4-aa1a-a0ab52230040', 
        (SELECT id FROM courses WHERE code = 'ECE-3-OPE'), 
        'Tuesday', 
        3, 
        '10:50', 
        '11:40';


    -- Tuesday Period 4: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-3-SOF', 'Software Project Management', 'ECE-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '35b9a927-7af3-4114-b90e-01a28a74e0c8', 
        (SELECT id FROM courses WHERE code = 'ECE-3-SOF'), 
        'Tuesday', 
        4, 
        '11:40', 
        '12:30';


    -- Tuesday Period 5: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-3-DEE', 'Deep Learning Lab', 'ECE-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c8cc756c-004b-421d-83f3-30061733c4df', 
        (SELECT id FROM courses WHERE code = 'ECE-3-DEE'), 
        'Tuesday', 
        5, 
        '13:10', 
        '14:00';


    -- Tuesday Period 6: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-3-DAT', 'Data Visualization Lab', 'ECE-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'cda781a6-f704-4a7a-bf07-cacaf7b9502a', 
        (SELECT id FROM courses WHERE code = 'ECE-3-DAT'), 
        'Tuesday', 
        6, 
        '14:00', 
        '14:50';


    -- Tuesday Period 7: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-3-COU', 'Counseling', 'ECE-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'e920d90d-caa6-4435-8861-180ca1ba3b63', 
        (SELECT id FROM courses WHERE code = 'ECE-3-COU'), 
        'Tuesday', 
        7, 
        '15:00', 
        '15:40';


    -- Tuesday Period 8: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-3-CLO', 'Cloud Computing', 'ECE-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'ECE-3-CLO'), 
        'Tuesday', 
        8, 
        '15:40', 
        '16:20';


    -- Wednesday Period 1: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-3-DAT', 'Data Visualization', 'ECE-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '3dcd1380-3f4e-4e5b-8335-75bb7ef91f7c', 
        (SELECT id FROM courses WHERE code = 'ECE-3-DAT'), 
        'Wednesday', 
        1, 
        '09:00', 
        '09:50';


    -- Wednesday Period 2: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-3-OPE', 'Operating Systems', 'ECE-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '7dc119f8-2cd0-4cb4-aa1a-a0ab52230040', 
        (SELECT id FROM courses WHERE code = 'ECE-3-OPE'), 
        'Wednesday', 
        2, 
        '09:50', 
        '10:40';


    -- Wednesday Period 3: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-3-SOF', 'Software Project Management', 'ECE-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '35b9a927-7af3-4114-b90e-01a28a74e0c8', 
        (SELECT id FROM courses WHERE code = 'ECE-3-SOF'), 
        'Wednesday', 
        3, 
        '10:50', 
        '11:40';


    -- Wednesday Period 4: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-3-DEE', 'Deep Learning Lab', 'ECE-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c8cc756c-004b-421d-83f3-30061733c4df', 
        (SELECT id FROM courses WHERE code = 'ECE-3-DEE'), 
        'Wednesday', 
        4, 
        '11:40', 
        '12:30';


    -- Wednesday Period 5: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-3-DAT', 'Data Visualization Lab', 'ECE-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'cda781a6-f704-4a7a-bf07-cacaf7b9502a', 
        (SELECT id FROM courses WHERE code = 'ECE-3-DAT'), 
        'Wednesday', 
        5, 
        '13:10', 
        '14:00';


    -- Wednesday Period 6: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-3-COU', 'Counseling', 'ECE-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'e920d90d-caa6-4435-8861-180ca1ba3b63', 
        (SELECT id FROM courses WHERE code = 'ECE-3-COU'), 
        'Wednesday', 
        6, 
        '14:00', 
        '14:50';


    -- Wednesday Period 7: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-3-CLO', 'Cloud Computing', 'ECE-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'ECE-3-CLO'), 
        'Wednesday', 
        7, 
        '15:00', 
        '15:40';


    -- Wednesday Period 8: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-3-DEE', 'Deep Learning', 'ECE-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '21965571-e7f8-487e-aeaa-f1918137ebf4', 
        (SELECT id FROM courses WHERE code = 'ECE-3-DEE'), 
        'Wednesday', 
        8, 
        '15:40', 
        '16:20';


    -- Thursday Period 1: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-3-OPE', 'Operating Systems', 'ECE-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '7dc119f8-2cd0-4cb4-aa1a-a0ab52230040', 
        (SELECT id FROM courses WHERE code = 'ECE-3-OPE'), 
        'Thursday', 
        1, 
        '09:00', 
        '09:50';


    -- Thursday Period 2: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-3-SOF', 'Software Project Management', 'ECE-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '35b9a927-7af3-4114-b90e-01a28a74e0c8', 
        (SELECT id FROM courses WHERE code = 'ECE-3-SOF'), 
        'Thursday', 
        2, 
        '09:50', 
        '10:40';


    -- Thursday Period 3: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-3-DEE', 'Deep Learning Lab', 'ECE-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c8cc756c-004b-421d-83f3-30061733c4df', 
        (SELECT id FROM courses WHERE code = 'ECE-3-DEE'), 
        'Thursday', 
        3, 
        '10:50', 
        '11:40';


    -- Thursday Period 4: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-3-DAT', 'Data Visualization Lab', 'ECE-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'cda781a6-f704-4a7a-bf07-cacaf7b9502a', 
        (SELECT id FROM courses WHERE code = 'ECE-3-DAT'), 
        'Thursday', 
        4, 
        '11:40', 
        '12:30';


    -- Thursday Period 5: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-3-COU', 'Counseling', 'ECE-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'e920d90d-caa6-4435-8861-180ca1ba3b63', 
        (SELECT id FROM courses WHERE code = 'ECE-3-COU'), 
        'Thursday', 
        5, 
        '13:10', 
        '14:00';


    -- Thursday Period 6: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-3-CLO', 'Cloud Computing', 'ECE-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'ECE-3-CLO'), 
        'Thursday', 
        6, 
        '14:00', 
        '14:50';


    -- Thursday Period 7: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-3-DEE', 'Deep Learning', 'ECE-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '21965571-e7f8-487e-aeaa-f1918137ebf4', 
        (SELECT id FROM courses WHERE code = 'ECE-3-DEE'), 
        'Thursday', 
        7, 
        '15:00', 
        '15:40';


    -- Thursday Period 8: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-3-DAT', 'Data Visualization', 'ECE-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '3dcd1380-3f4e-4e5b-8335-75bb7ef91f7c', 
        (SELECT id FROM courses WHERE code = 'ECE-3-DAT'), 
        'Thursday', 
        8, 
        '15:40', 
        '16:20';


    -- Friday Period 1: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-3-SOF', 'Software Project Management', 'ECE-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '35b9a927-7af3-4114-b90e-01a28a74e0c8', 
        (SELECT id FROM courses WHERE code = 'ECE-3-SOF'), 
        'Friday', 
        1, 
        '09:00', 
        '09:50';


    -- Friday Period 2: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-3-DEE', 'Deep Learning Lab', 'ECE-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c8cc756c-004b-421d-83f3-30061733c4df', 
        (SELECT id FROM courses WHERE code = 'ECE-3-DEE'), 
        'Friday', 
        2, 
        '09:50', 
        '10:40';


    -- Friday Period 3: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-3-DAT', 'Data Visualization Lab', 'ECE-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'cda781a6-f704-4a7a-bf07-cacaf7b9502a', 
        (SELECT id FROM courses WHERE code = 'ECE-3-DAT'), 
        'Friday', 
        3, 
        '10:50', 
        '11:40';


    -- Friday Period 4: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-3-COU', 'Counseling', 'ECE-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'e920d90d-caa6-4435-8861-180ca1ba3b63', 
        (SELECT id FROM courses WHERE code = 'ECE-3-COU'), 
        'Friday', 
        4, 
        '11:40', 
        '12:30';


    -- Friday Period 5: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-3-CLO', 'Cloud Computing', 'ECE-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'ECE-3-CLO'), 
        'Friday', 
        5, 
        '13:10', 
        '14:00';


    -- Friday Period 6: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-3-DEE', 'Deep Learning', 'ECE-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '21965571-e7f8-487e-aeaa-f1918137ebf4', 
        (SELECT id FROM courses WHERE code = 'ECE-3-DEE'), 
        'Friday', 
        6, 
        '14:00', 
        '14:50';


    -- Friday Period 7: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-3-DAT', 'Data Visualization', 'ECE-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '3dcd1380-3f4e-4e5b-8335-75bb7ef91f7c', 
        (SELECT id FROM courses WHERE code = 'ECE-3-DAT'), 
        'Friday', 
        7, 
        '15:00', 
        '15:40';


    -- Friday Period 8: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-3-OPE', 'Operating Systems', 'ECE-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '7dc119f8-2cd0-4cb4-aa1a-a0ab52230040', 
        (SELECT id FROM courses WHERE code = 'ECE-3-OPE'), 
        'Friday', 
        8, 
        '15:40', 
        '16:20';


    -- Saturday Period 1: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-3-DEE', 'Deep Learning Lab', 'ECE-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c8cc756c-004b-421d-83f3-30061733c4df', 
        (SELECT id FROM courses WHERE code = 'ECE-3-DEE'), 
        'Saturday', 
        1, 
        '09:00', 
        '09:50';


    -- Saturday Period 2: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-3-DAT', 'Data Visualization Lab', 'ECE-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'cda781a6-f704-4a7a-bf07-cacaf7b9502a', 
        (SELECT id FROM courses WHERE code = 'ECE-3-DAT'), 
        'Saturday', 
        2, 
        '09:50', 
        '10:40';


    -- Saturday Period 3: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-3-COU', 'Counseling', 'ECE-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'e920d90d-caa6-4435-8861-180ca1ba3b63', 
        (SELECT id FROM courses WHERE code = 'ECE-3-COU'), 
        'Saturday', 
        3, 
        '10:50', 
        '11:40';


    -- Saturday Period 4: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-3-CLO', 'Cloud Computing', 'ECE-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'ECE-3-CLO'), 
        'Saturday', 
        4, 
        '11:40', 
        '12:30';


    -- Saturday Period 5: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-3-DEE', 'Deep Learning', 'ECE-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '21965571-e7f8-487e-aeaa-f1918137ebf4', 
        (SELECT id FROM courses WHERE code = 'ECE-3-DEE'), 
        'Saturday', 
        5, 
        '13:10', 
        '14:00';


    -- Saturday Period 6: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-3-DAT', 'Data Visualization', 'ECE-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '3dcd1380-3f4e-4e5b-8335-75bb7ef91f7c', 
        (SELECT id FROM courses WHERE code = 'ECE-3-DAT'), 
        'Saturday', 
        6, 
        '14:00', 
        '14:50';


    -- Saturday Period 7: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-3-OPE', 'Operating Systems', 'ECE-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '7dc119f8-2cd0-4cb4-aa1a-a0ab52230040', 
        (SELECT id FROM courses WHERE code = 'ECE-3-OPE'), 
        'Saturday', 
        7, 
        '15:00', 
        '15:40';


    -- Saturday Period 8: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-3-SOF', 'Software Project Management', 'ECE-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '35b9a927-7af3-4114-b90e-01a28a74e0c8', 
        (SELECT id FROM courses WHERE code = 'ECE-3-SOF'), 
        'Saturday', 
        8, 
        '15:40', 
        '16:20';

END $$;

DO $$
DECLARE
    v_ay_id UUID := 'd860d5fb-d5f0-4497-a7ea-073004d80500';
    v_sec_id UUID;
    v_course_ids UUID[];
    v_fac_id UUID;
    v_dept text := 'ECE';
BEGIN
    -- 1. Ensure Section Exists
    INSERT INTO class_sections (name, dept_code, academic_year_id, academic_year, year, semester, section)
    VALUES ('ECE-4-A', v_dept::department_code, v_ay_id, '2025-2026', 4, 8, 'A')
    ON CONFLICT (dept_code, academic_year_id, year, section) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO v_sec_id;

    -- If we missed ID (due to no update), fetch it
    IF v_sec_id IS NULL THEN
        SELECT id INTO v_sec_id FROM class_sections 
        WHERE dept_code = v_dept AND academic_year_id = v_ay_id AND year = 4 AND section = 'A';
    END IF;

    -- 2. Clear existing timetable for this section to avoid clutter
    DELETE FROM timetable WHERE class_section_id = v_sec_id;

    -- 3. Loop and Insert Periods


    -- Monday Period 1: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-4-CLO', 'Cloud Computing', 'ECE-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'ECE-4-CLO'), 
        'Monday', 
        1, 
        '09:00', 
        '09:50';


    -- Monday Period 2: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-4-DEE', 'Deep Learning', 'ECE-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '21965571-e7f8-487e-aeaa-f1918137ebf4', 
        (SELECT id FROM courses WHERE code = 'ECE-4-DEE'), 
        'Monday', 
        2, 
        '09:50', 
        '10:40';


    -- Monday Period 3: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-4-DAT', 'Data Visualization', 'ECE-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '3dcd1380-3f4e-4e5b-8335-75bb7ef91f7c', 
        (SELECT id FROM courses WHERE code = 'ECE-4-DAT'), 
        'Monday', 
        3, 
        '10:50', 
        '11:40';


    -- Monday Period 4: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-4-OPE', 'Operating Systems', 'ECE-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '7dc119f8-2cd0-4cb4-aa1a-a0ab52230040', 
        (SELECT id FROM courses WHERE code = 'ECE-4-OPE'), 
        'Monday', 
        4, 
        '11:40', 
        '12:30';


    -- Monday Period 5: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-4-SOF', 'Software Project Management', 'ECE-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '35b9a927-7af3-4114-b90e-01a28a74e0c8', 
        (SELECT id FROM courses WHERE code = 'ECE-4-SOF'), 
        'Monday', 
        5, 
        '13:10', 
        '14:00';


    -- Monday Period 6: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-4-DEE', 'Deep Learning Lab', 'ECE-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c8cc756c-004b-421d-83f3-30061733c4df', 
        (SELECT id FROM courses WHERE code = 'ECE-4-DEE'), 
        'Monday', 
        6, 
        '14:00', 
        '14:50';


    -- Monday Period 7: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-4-DAT', 'Data Visualization Lab', 'ECE-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'cda781a6-f704-4a7a-bf07-cacaf7b9502a', 
        (SELECT id FROM courses WHERE code = 'ECE-4-DAT'), 
        'Monday', 
        7, 
        '15:00', 
        '15:40';


    -- Monday Period 8: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-4-COU', 'Counseling', 'ECE-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'e920d90d-caa6-4435-8861-180ca1ba3b63', 
        (SELECT id FROM courses WHERE code = 'ECE-4-COU'), 
        'Monday', 
        8, 
        '15:40', 
        '16:20';


    -- Tuesday Period 1: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-4-DEE', 'Deep Learning', 'ECE-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '21965571-e7f8-487e-aeaa-f1918137ebf4', 
        (SELECT id FROM courses WHERE code = 'ECE-4-DEE'), 
        'Tuesday', 
        1, 
        '09:00', 
        '09:50';


    -- Tuesday Period 2: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-4-DAT', 'Data Visualization', 'ECE-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '3dcd1380-3f4e-4e5b-8335-75bb7ef91f7c', 
        (SELECT id FROM courses WHERE code = 'ECE-4-DAT'), 
        'Tuesday', 
        2, 
        '09:50', 
        '10:40';


    -- Tuesday Period 3: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-4-OPE', 'Operating Systems', 'ECE-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '7dc119f8-2cd0-4cb4-aa1a-a0ab52230040', 
        (SELECT id FROM courses WHERE code = 'ECE-4-OPE'), 
        'Tuesday', 
        3, 
        '10:50', 
        '11:40';


    -- Tuesday Period 4: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-4-SOF', 'Software Project Management', 'ECE-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '35b9a927-7af3-4114-b90e-01a28a74e0c8', 
        (SELECT id FROM courses WHERE code = 'ECE-4-SOF'), 
        'Tuesday', 
        4, 
        '11:40', 
        '12:30';


    -- Tuesday Period 5: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-4-DEE', 'Deep Learning Lab', 'ECE-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c8cc756c-004b-421d-83f3-30061733c4df', 
        (SELECT id FROM courses WHERE code = 'ECE-4-DEE'), 
        'Tuesday', 
        5, 
        '13:10', 
        '14:00';


    -- Tuesday Period 6: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-4-DAT', 'Data Visualization Lab', 'ECE-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'cda781a6-f704-4a7a-bf07-cacaf7b9502a', 
        (SELECT id FROM courses WHERE code = 'ECE-4-DAT'), 
        'Tuesday', 
        6, 
        '14:00', 
        '14:50';


    -- Tuesday Period 7: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-4-COU', 'Counseling', 'ECE-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'e920d90d-caa6-4435-8861-180ca1ba3b63', 
        (SELECT id FROM courses WHERE code = 'ECE-4-COU'), 
        'Tuesday', 
        7, 
        '15:00', 
        '15:40';


    -- Tuesday Period 8: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-4-CLO', 'Cloud Computing', 'ECE-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'ECE-4-CLO'), 
        'Tuesday', 
        8, 
        '15:40', 
        '16:20';


    -- Wednesday Period 1: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-4-DAT', 'Data Visualization', 'ECE-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '3dcd1380-3f4e-4e5b-8335-75bb7ef91f7c', 
        (SELECT id FROM courses WHERE code = 'ECE-4-DAT'), 
        'Wednesday', 
        1, 
        '09:00', 
        '09:50';


    -- Wednesday Period 2: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-4-OPE', 'Operating Systems', 'ECE-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '7dc119f8-2cd0-4cb4-aa1a-a0ab52230040', 
        (SELECT id FROM courses WHERE code = 'ECE-4-OPE'), 
        'Wednesday', 
        2, 
        '09:50', 
        '10:40';


    -- Wednesday Period 3: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-4-SOF', 'Software Project Management', 'ECE-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '35b9a927-7af3-4114-b90e-01a28a74e0c8', 
        (SELECT id FROM courses WHERE code = 'ECE-4-SOF'), 
        'Wednesday', 
        3, 
        '10:50', 
        '11:40';


    -- Wednesday Period 4: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-4-DEE', 'Deep Learning Lab', 'ECE-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c8cc756c-004b-421d-83f3-30061733c4df', 
        (SELECT id FROM courses WHERE code = 'ECE-4-DEE'), 
        'Wednesday', 
        4, 
        '11:40', 
        '12:30';


    -- Wednesday Period 5: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-4-DAT', 'Data Visualization Lab', 'ECE-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'cda781a6-f704-4a7a-bf07-cacaf7b9502a', 
        (SELECT id FROM courses WHERE code = 'ECE-4-DAT'), 
        'Wednesday', 
        5, 
        '13:10', 
        '14:00';


    -- Wednesday Period 6: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-4-COU', 'Counseling', 'ECE-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'e920d90d-caa6-4435-8861-180ca1ba3b63', 
        (SELECT id FROM courses WHERE code = 'ECE-4-COU'), 
        'Wednesday', 
        6, 
        '14:00', 
        '14:50';


    -- Wednesday Period 7: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-4-CLO', 'Cloud Computing', 'ECE-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'ECE-4-CLO'), 
        'Wednesday', 
        7, 
        '15:00', 
        '15:40';


    -- Wednesday Period 8: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-4-DEE', 'Deep Learning', 'ECE-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '21965571-e7f8-487e-aeaa-f1918137ebf4', 
        (SELECT id FROM courses WHERE code = 'ECE-4-DEE'), 
        'Wednesday', 
        8, 
        '15:40', 
        '16:20';


    -- Thursday Period 1: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-4-OPE', 'Operating Systems', 'ECE-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '7dc119f8-2cd0-4cb4-aa1a-a0ab52230040', 
        (SELECT id FROM courses WHERE code = 'ECE-4-OPE'), 
        'Thursday', 
        1, 
        '09:00', 
        '09:50';


    -- Thursday Period 2: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-4-SOF', 'Software Project Management', 'ECE-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '35b9a927-7af3-4114-b90e-01a28a74e0c8', 
        (SELECT id FROM courses WHERE code = 'ECE-4-SOF'), 
        'Thursday', 
        2, 
        '09:50', 
        '10:40';


    -- Thursday Period 3: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-4-DEE', 'Deep Learning Lab', 'ECE-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c8cc756c-004b-421d-83f3-30061733c4df', 
        (SELECT id FROM courses WHERE code = 'ECE-4-DEE'), 
        'Thursday', 
        3, 
        '10:50', 
        '11:40';


    -- Thursday Period 4: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-4-DAT', 'Data Visualization Lab', 'ECE-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'cda781a6-f704-4a7a-bf07-cacaf7b9502a', 
        (SELECT id FROM courses WHERE code = 'ECE-4-DAT'), 
        'Thursday', 
        4, 
        '11:40', 
        '12:30';


    -- Thursday Period 5: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-4-COU', 'Counseling', 'ECE-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'e920d90d-caa6-4435-8861-180ca1ba3b63', 
        (SELECT id FROM courses WHERE code = 'ECE-4-COU'), 
        'Thursday', 
        5, 
        '13:10', 
        '14:00';


    -- Thursday Period 6: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-4-CLO', 'Cloud Computing', 'ECE-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'ECE-4-CLO'), 
        'Thursday', 
        6, 
        '14:00', 
        '14:50';


    -- Thursday Period 7: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-4-DEE', 'Deep Learning', 'ECE-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '21965571-e7f8-487e-aeaa-f1918137ebf4', 
        (SELECT id FROM courses WHERE code = 'ECE-4-DEE'), 
        'Thursday', 
        7, 
        '15:00', 
        '15:40';


    -- Thursday Period 8: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-4-DAT', 'Data Visualization', 'ECE-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '3dcd1380-3f4e-4e5b-8335-75bb7ef91f7c', 
        (SELECT id FROM courses WHERE code = 'ECE-4-DAT'), 
        'Thursday', 
        8, 
        '15:40', 
        '16:20';


    -- Friday Period 1: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-4-SOF', 'Software Project Management', 'ECE-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '35b9a927-7af3-4114-b90e-01a28a74e0c8', 
        (SELECT id FROM courses WHERE code = 'ECE-4-SOF'), 
        'Friday', 
        1, 
        '09:00', 
        '09:50';


    -- Friday Period 2: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-4-DEE', 'Deep Learning Lab', 'ECE-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c8cc756c-004b-421d-83f3-30061733c4df', 
        (SELECT id FROM courses WHERE code = 'ECE-4-DEE'), 
        'Friday', 
        2, 
        '09:50', 
        '10:40';


    -- Friday Period 3: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-4-DAT', 'Data Visualization Lab', 'ECE-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'cda781a6-f704-4a7a-bf07-cacaf7b9502a', 
        (SELECT id FROM courses WHERE code = 'ECE-4-DAT'), 
        'Friday', 
        3, 
        '10:50', 
        '11:40';


    -- Friday Period 4: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-4-COU', 'Counseling', 'ECE-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'e920d90d-caa6-4435-8861-180ca1ba3b63', 
        (SELECT id FROM courses WHERE code = 'ECE-4-COU'), 
        'Friday', 
        4, 
        '11:40', 
        '12:30';


    -- Friday Period 5: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-4-CLO', 'Cloud Computing', 'ECE-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'ECE-4-CLO'), 
        'Friday', 
        5, 
        '13:10', 
        '14:00';


    -- Friday Period 6: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-4-DEE', 'Deep Learning', 'ECE-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '21965571-e7f8-487e-aeaa-f1918137ebf4', 
        (SELECT id FROM courses WHERE code = 'ECE-4-DEE'), 
        'Friday', 
        6, 
        '14:00', 
        '14:50';


    -- Friday Period 7: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-4-DAT', 'Data Visualization', 'ECE-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '3dcd1380-3f4e-4e5b-8335-75bb7ef91f7c', 
        (SELECT id FROM courses WHERE code = 'ECE-4-DAT'), 
        'Friday', 
        7, 
        '15:00', 
        '15:40';


    -- Friday Period 8: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-4-OPE', 'Operating Systems', 'ECE-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '7dc119f8-2cd0-4cb4-aa1a-a0ab52230040', 
        (SELECT id FROM courses WHERE code = 'ECE-4-OPE'), 
        'Friday', 
        8, 
        '15:40', 
        '16:20';


    -- Saturday Period 1: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-4-DEE', 'Deep Learning Lab', 'ECE-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c8cc756c-004b-421d-83f3-30061733c4df', 
        (SELECT id FROM courses WHERE code = 'ECE-4-DEE'), 
        'Saturday', 
        1, 
        '09:00', 
        '09:50';


    -- Saturday Period 2: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-4-DAT', 'Data Visualization Lab', 'ECE-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'cda781a6-f704-4a7a-bf07-cacaf7b9502a', 
        (SELECT id FROM courses WHERE code = 'ECE-4-DAT'), 
        'Saturday', 
        2, 
        '09:50', 
        '10:40';


    -- Saturday Period 3: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-4-COU', 'Counseling', 'ECE-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'e920d90d-caa6-4435-8861-180ca1ba3b63', 
        (SELECT id FROM courses WHERE code = 'ECE-4-COU'), 
        'Saturday', 
        3, 
        '10:50', 
        '11:40';


    -- Saturday Period 4: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-4-CLO', 'Cloud Computing', 'ECE-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'ECE-4-CLO'), 
        'Saturday', 
        4, 
        '11:40', 
        '12:30';


    -- Saturday Period 5: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-4-DEE', 'Deep Learning', 'ECE-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '21965571-e7f8-487e-aeaa-f1918137ebf4', 
        (SELECT id FROM courses WHERE code = 'ECE-4-DEE'), 
        'Saturday', 
        5, 
        '13:10', 
        '14:00';


    -- Saturday Period 6: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-4-DAT', 'Data Visualization', 'ECE-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '3dcd1380-3f4e-4e5b-8335-75bb7ef91f7c', 
        (SELECT id FROM courses WHERE code = 'ECE-4-DAT'), 
        'Saturday', 
        6, 
        '14:00', 
        '14:50';


    -- Saturday Period 7: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-4-OPE', 'Operating Systems', 'ECE-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '7dc119f8-2cd0-4cb4-aa1a-a0ab52230040', 
        (SELECT id FROM courses WHERE code = 'ECE-4-OPE'), 
        'Saturday', 
        7, 
        '15:00', 
        '15:40';


    -- Saturday Period 8: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('ECE-4-SOF', 'Software Project Management', 'ECE-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '35b9a927-7af3-4114-b90e-01a28a74e0c8', 
        (SELECT id FROM courses WHERE code = 'ECE-4-SOF'), 
        'Saturday', 
        8, 
        '15:40', 
        '16:20';

END $$;

DO $$
DECLARE
    v_ay_id UUID := 'd860d5fb-d5f0-4497-a7ea-073004d80500';
    v_sec_id UUID;
    v_course_ids UUID[];
    v_fac_id UUID;
    v_dept text := 'MBA';
BEGIN
    -- 1. Ensure Section Exists
    INSERT INTO class_sections (name, dept_code, academic_year_id, academic_year, year, semester, section)
    VALUES ('MBA-2-A', v_dept::department_code, v_ay_id, '2025-2026', 2, 4, 'A')
    ON CONFLICT (dept_code, academic_year_id, year, section) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO v_sec_id;

    -- If we missed ID (due to no update), fetch it
    IF v_sec_id IS NULL THEN
        SELECT id INTO v_sec_id FROM class_sections 
        WHERE dept_code = v_dept AND academic_year_id = v_ay_id AND year = 2 AND section = 'A';
    END IF;

    -- 2. Clear existing timetable for this section to avoid clutter
    DELETE FROM timetable WHERE class_section_id = v_sec_id;

    -- 3. Loop and Insert Periods


    -- Monday Period 1: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-2-CLO', 'Cloud Computing', 'MBA-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4aa1a5ba-3e10-4ee2-8377-55e3bb040c64', 
        (SELECT id FROM courses WHERE code = 'MBA-2-CLO'), 
        'Monday', 
        1, 
        '09:00', 
        '09:50';


    -- Monday Period 2: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-2-DEE', 'Deep Learning', 'MBA-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '810ebe04-de94-4978-a066-68ed76625814', 
        (SELECT id FROM courses WHERE code = 'MBA-2-DEE'), 
        'Monday', 
        2, 
        '09:50', 
        '10:40';


    -- Monday Period 3: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-2-DAT', 'Data Visualization', 'MBA-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '89d884e5-6892-4075-841b-f385c9d0ed32', 
        (SELECT id FROM courses WHERE code = 'MBA-2-DAT'), 
        'Monday', 
        3, 
        '10:50', 
        '11:40';


    -- Monday Period 4: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-2-OPE', 'Operating Systems', 'MBA-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'af65cb11-4b0f-46cc-ab5d-1666bc7e258e', 
        (SELECT id FROM courses WHERE code = 'MBA-2-OPE'), 
        'Monday', 
        4, 
        '11:40', 
        '12:30';


    -- Monday Period 5: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-2-SOF', 'Software Project Management', 'MBA-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ea6234a0-5db4-4e45-b942-26a3c15d9be8', 
        (SELECT id FROM courses WHERE code = 'MBA-2-SOF'), 
        'Monday', 
        5, 
        '13:10', 
        '14:00';


    -- Monday Period 6: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-2-DEE', 'Deep Learning Lab', 'MBA-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '974871e4-7df1-47b5-98c2-aca045507a54', 
        (SELECT id FROM courses WHERE code = 'MBA-2-DEE'), 
        'Monday', 
        6, 
        '14:00', 
        '14:50';


    -- Monday Period 7: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-2-DAT', 'Data Visualization Lab', 'MBA-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '03e58fc6-5fd7-4630-9e56-ef0f6fc80690', 
        (SELECT id FROM courses WHERE code = 'MBA-2-DAT'), 
        'Monday', 
        7, 
        '15:00', 
        '15:40';


    -- Monday Period 8: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-2-COU', 'Counseling', 'MBA-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '61916747-7271-497d-8180-54f907dcc33a', 
        (SELECT id FROM courses WHERE code = 'MBA-2-COU'), 
        'Monday', 
        8, 
        '15:40', 
        '16:20';


    -- Tuesday Period 1: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-2-DEE', 'Deep Learning', 'MBA-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '810ebe04-de94-4978-a066-68ed76625814', 
        (SELECT id FROM courses WHERE code = 'MBA-2-DEE'), 
        'Tuesday', 
        1, 
        '09:00', 
        '09:50';


    -- Tuesday Period 2: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-2-DAT', 'Data Visualization', 'MBA-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '89d884e5-6892-4075-841b-f385c9d0ed32', 
        (SELECT id FROM courses WHERE code = 'MBA-2-DAT'), 
        'Tuesday', 
        2, 
        '09:50', 
        '10:40';


    -- Tuesday Period 3: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-2-OPE', 'Operating Systems', 'MBA-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'af65cb11-4b0f-46cc-ab5d-1666bc7e258e', 
        (SELECT id FROM courses WHERE code = 'MBA-2-OPE'), 
        'Tuesday', 
        3, 
        '10:50', 
        '11:40';


    -- Tuesday Period 4: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-2-SOF', 'Software Project Management', 'MBA-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ea6234a0-5db4-4e45-b942-26a3c15d9be8', 
        (SELECT id FROM courses WHERE code = 'MBA-2-SOF'), 
        'Tuesday', 
        4, 
        '11:40', 
        '12:30';


    -- Tuesday Period 5: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-2-DEE', 'Deep Learning Lab', 'MBA-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '974871e4-7df1-47b5-98c2-aca045507a54', 
        (SELECT id FROM courses WHERE code = 'MBA-2-DEE'), 
        'Tuesday', 
        5, 
        '13:10', 
        '14:00';


    -- Tuesday Period 6: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-2-DAT', 'Data Visualization Lab', 'MBA-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '03e58fc6-5fd7-4630-9e56-ef0f6fc80690', 
        (SELECT id FROM courses WHERE code = 'MBA-2-DAT'), 
        'Tuesday', 
        6, 
        '14:00', 
        '14:50';


    -- Tuesday Period 7: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-2-COU', 'Counseling', 'MBA-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '61916747-7271-497d-8180-54f907dcc33a', 
        (SELECT id FROM courses WHERE code = 'MBA-2-COU'), 
        'Tuesday', 
        7, 
        '15:00', 
        '15:40';


    -- Tuesday Period 8: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-2-CLO', 'Cloud Computing', 'MBA-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4aa1a5ba-3e10-4ee2-8377-55e3bb040c64', 
        (SELECT id FROM courses WHERE code = 'MBA-2-CLO'), 
        'Tuesday', 
        8, 
        '15:40', 
        '16:20';


    -- Wednesday Period 1: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-2-DAT', 'Data Visualization', 'MBA-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '89d884e5-6892-4075-841b-f385c9d0ed32', 
        (SELECT id FROM courses WHERE code = 'MBA-2-DAT'), 
        'Wednesday', 
        1, 
        '09:00', 
        '09:50';


    -- Wednesday Period 2: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-2-OPE', 'Operating Systems', 'MBA-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'af65cb11-4b0f-46cc-ab5d-1666bc7e258e', 
        (SELECT id FROM courses WHERE code = 'MBA-2-OPE'), 
        'Wednesday', 
        2, 
        '09:50', 
        '10:40';


    -- Wednesday Period 3: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-2-SOF', 'Software Project Management', 'MBA-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ea6234a0-5db4-4e45-b942-26a3c15d9be8', 
        (SELECT id FROM courses WHERE code = 'MBA-2-SOF'), 
        'Wednesday', 
        3, 
        '10:50', 
        '11:40';


    -- Wednesday Period 4: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-2-DEE', 'Deep Learning Lab', 'MBA-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '974871e4-7df1-47b5-98c2-aca045507a54', 
        (SELECT id FROM courses WHERE code = 'MBA-2-DEE'), 
        'Wednesday', 
        4, 
        '11:40', 
        '12:30';


    -- Wednesday Period 5: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-2-DAT', 'Data Visualization Lab', 'MBA-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '03e58fc6-5fd7-4630-9e56-ef0f6fc80690', 
        (SELECT id FROM courses WHERE code = 'MBA-2-DAT'), 
        'Wednesday', 
        5, 
        '13:10', 
        '14:00';


    -- Wednesday Period 6: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-2-COU', 'Counseling', 'MBA-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '61916747-7271-497d-8180-54f907dcc33a', 
        (SELECT id FROM courses WHERE code = 'MBA-2-COU'), 
        'Wednesday', 
        6, 
        '14:00', 
        '14:50';


    -- Wednesday Period 7: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-2-CLO', 'Cloud Computing', 'MBA-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4aa1a5ba-3e10-4ee2-8377-55e3bb040c64', 
        (SELECT id FROM courses WHERE code = 'MBA-2-CLO'), 
        'Wednesday', 
        7, 
        '15:00', 
        '15:40';


    -- Wednesday Period 8: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-2-DEE', 'Deep Learning', 'MBA-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '810ebe04-de94-4978-a066-68ed76625814', 
        (SELECT id FROM courses WHERE code = 'MBA-2-DEE'), 
        'Wednesday', 
        8, 
        '15:40', 
        '16:20';


    -- Thursday Period 1: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-2-OPE', 'Operating Systems', 'MBA-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'af65cb11-4b0f-46cc-ab5d-1666bc7e258e', 
        (SELECT id FROM courses WHERE code = 'MBA-2-OPE'), 
        'Thursday', 
        1, 
        '09:00', 
        '09:50';


    -- Thursday Period 2: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-2-SOF', 'Software Project Management', 'MBA-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ea6234a0-5db4-4e45-b942-26a3c15d9be8', 
        (SELECT id FROM courses WHERE code = 'MBA-2-SOF'), 
        'Thursday', 
        2, 
        '09:50', 
        '10:40';


    -- Thursday Period 3: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-2-DEE', 'Deep Learning Lab', 'MBA-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '974871e4-7df1-47b5-98c2-aca045507a54', 
        (SELECT id FROM courses WHERE code = 'MBA-2-DEE'), 
        'Thursday', 
        3, 
        '10:50', 
        '11:40';


    -- Thursday Period 4: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-2-DAT', 'Data Visualization Lab', 'MBA-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '03e58fc6-5fd7-4630-9e56-ef0f6fc80690', 
        (SELECT id FROM courses WHERE code = 'MBA-2-DAT'), 
        'Thursday', 
        4, 
        '11:40', 
        '12:30';


    -- Thursday Period 5: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-2-COU', 'Counseling', 'MBA-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '61916747-7271-497d-8180-54f907dcc33a', 
        (SELECT id FROM courses WHERE code = 'MBA-2-COU'), 
        'Thursday', 
        5, 
        '13:10', 
        '14:00';


    -- Thursday Period 6: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-2-CLO', 'Cloud Computing', 'MBA-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4aa1a5ba-3e10-4ee2-8377-55e3bb040c64', 
        (SELECT id FROM courses WHERE code = 'MBA-2-CLO'), 
        'Thursday', 
        6, 
        '14:00', 
        '14:50';


    -- Thursday Period 7: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-2-DEE', 'Deep Learning', 'MBA-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '810ebe04-de94-4978-a066-68ed76625814', 
        (SELECT id FROM courses WHERE code = 'MBA-2-DEE'), 
        'Thursday', 
        7, 
        '15:00', 
        '15:40';


    -- Thursday Period 8: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-2-DAT', 'Data Visualization', 'MBA-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '89d884e5-6892-4075-841b-f385c9d0ed32', 
        (SELECT id FROM courses WHERE code = 'MBA-2-DAT'), 
        'Thursday', 
        8, 
        '15:40', 
        '16:20';


    -- Friday Period 1: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-2-SOF', 'Software Project Management', 'MBA-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ea6234a0-5db4-4e45-b942-26a3c15d9be8', 
        (SELECT id FROM courses WHERE code = 'MBA-2-SOF'), 
        'Friday', 
        1, 
        '09:00', 
        '09:50';


    -- Friday Period 2: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-2-DEE', 'Deep Learning Lab', 'MBA-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '974871e4-7df1-47b5-98c2-aca045507a54', 
        (SELECT id FROM courses WHERE code = 'MBA-2-DEE'), 
        'Friday', 
        2, 
        '09:50', 
        '10:40';


    -- Friday Period 3: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-2-DAT', 'Data Visualization Lab', 'MBA-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '03e58fc6-5fd7-4630-9e56-ef0f6fc80690', 
        (SELECT id FROM courses WHERE code = 'MBA-2-DAT'), 
        'Friday', 
        3, 
        '10:50', 
        '11:40';


    -- Friday Period 4: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-2-COU', 'Counseling', 'MBA-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '61916747-7271-497d-8180-54f907dcc33a', 
        (SELECT id FROM courses WHERE code = 'MBA-2-COU'), 
        'Friday', 
        4, 
        '11:40', 
        '12:30';


    -- Friday Period 5: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-2-CLO', 'Cloud Computing', 'MBA-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4aa1a5ba-3e10-4ee2-8377-55e3bb040c64', 
        (SELECT id FROM courses WHERE code = 'MBA-2-CLO'), 
        'Friday', 
        5, 
        '13:10', 
        '14:00';


    -- Friday Period 6: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-2-DEE', 'Deep Learning', 'MBA-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '810ebe04-de94-4978-a066-68ed76625814', 
        (SELECT id FROM courses WHERE code = 'MBA-2-DEE'), 
        'Friday', 
        6, 
        '14:00', 
        '14:50';


    -- Friday Period 7: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-2-DAT', 'Data Visualization', 'MBA-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '89d884e5-6892-4075-841b-f385c9d0ed32', 
        (SELECT id FROM courses WHERE code = 'MBA-2-DAT'), 
        'Friday', 
        7, 
        '15:00', 
        '15:40';


    -- Friday Period 8: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-2-OPE', 'Operating Systems', 'MBA-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'af65cb11-4b0f-46cc-ab5d-1666bc7e258e', 
        (SELECT id FROM courses WHERE code = 'MBA-2-OPE'), 
        'Friday', 
        8, 
        '15:40', 
        '16:20';


    -- Saturday Period 1: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-2-DEE', 'Deep Learning Lab', 'MBA-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '974871e4-7df1-47b5-98c2-aca045507a54', 
        (SELECT id FROM courses WHERE code = 'MBA-2-DEE'), 
        'Saturday', 
        1, 
        '09:00', 
        '09:50';


    -- Saturday Period 2: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-2-DAT', 'Data Visualization Lab', 'MBA-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '03e58fc6-5fd7-4630-9e56-ef0f6fc80690', 
        (SELECT id FROM courses WHERE code = 'MBA-2-DAT'), 
        'Saturday', 
        2, 
        '09:50', 
        '10:40';


    -- Saturday Period 3: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-2-COU', 'Counseling', 'MBA-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '61916747-7271-497d-8180-54f907dcc33a', 
        (SELECT id FROM courses WHERE code = 'MBA-2-COU'), 
        'Saturday', 
        3, 
        '10:50', 
        '11:40';


    -- Saturday Period 4: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-2-CLO', 'Cloud Computing', 'MBA-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4aa1a5ba-3e10-4ee2-8377-55e3bb040c64', 
        (SELECT id FROM courses WHERE code = 'MBA-2-CLO'), 
        'Saturday', 
        4, 
        '11:40', 
        '12:30';


    -- Saturday Period 5: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-2-DEE', 'Deep Learning', 'MBA-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '810ebe04-de94-4978-a066-68ed76625814', 
        (SELECT id FROM courses WHERE code = 'MBA-2-DEE'), 
        'Saturday', 
        5, 
        '13:10', 
        '14:00';


    -- Saturday Period 6: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-2-DAT', 'Data Visualization', 'MBA-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '89d884e5-6892-4075-841b-f385c9d0ed32', 
        (SELECT id FROM courses WHERE code = 'MBA-2-DAT'), 
        'Saturday', 
        6, 
        '14:00', 
        '14:50';


    -- Saturday Period 7: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-2-OPE', 'Operating Systems', 'MBA-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'af65cb11-4b0f-46cc-ab5d-1666bc7e258e', 
        (SELECT id FROM courses WHERE code = 'MBA-2-OPE'), 
        'Saturday', 
        7, 
        '15:00', 
        '15:40';


    -- Saturday Period 8: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-2-SOF', 'Software Project Management', 'MBA-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ea6234a0-5db4-4e45-b942-26a3c15d9be8', 
        (SELECT id FROM courses WHERE code = 'MBA-2-SOF'), 
        'Saturday', 
        8, 
        '15:40', 
        '16:20';

END $$;

DO $$
DECLARE
    v_ay_id UUID := 'd860d5fb-d5f0-4497-a7ea-073004d80500';
    v_sec_id UUID;
    v_course_ids UUID[];
    v_fac_id UUID;
    v_dept text := 'MBA';
BEGIN
    -- 1. Ensure Section Exists
    INSERT INTO class_sections (name, dept_code, academic_year_id, academic_year, year, semester, section)
    VALUES ('MBA-3-A', v_dept::department_code, v_ay_id, '2025-2026', 3, 6, 'A')
    ON CONFLICT (dept_code, academic_year_id, year, section) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO v_sec_id;

    -- If we missed ID (due to no update), fetch it
    IF v_sec_id IS NULL THEN
        SELECT id INTO v_sec_id FROM class_sections 
        WHERE dept_code = v_dept AND academic_year_id = v_ay_id AND year = 3 AND section = 'A';
    END IF;

    -- 2. Clear existing timetable for this section to avoid clutter
    DELETE FROM timetable WHERE class_section_id = v_sec_id;

    -- 3. Loop and Insert Periods


    -- Monday Period 1: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-3-CLO', 'Cloud Computing', 'MBA-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4aa1a5ba-3e10-4ee2-8377-55e3bb040c64', 
        (SELECT id FROM courses WHERE code = 'MBA-3-CLO'), 
        'Monday', 
        1, 
        '09:00', 
        '09:50';


    -- Monday Period 2: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-3-DEE', 'Deep Learning', 'MBA-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '810ebe04-de94-4978-a066-68ed76625814', 
        (SELECT id FROM courses WHERE code = 'MBA-3-DEE'), 
        'Monday', 
        2, 
        '09:50', 
        '10:40';


    -- Monday Period 3: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-3-DAT', 'Data Visualization', 'MBA-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '89d884e5-6892-4075-841b-f385c9d0ed32', 
        (SELECT id FROM courses WHERE code = 'MBA-3-DAT'), 
        'Monday', 
        3, 
        '10:50', 
        '11:40';


    -- Monday Period 4: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-3-OPE', 'Operating Systems', 'MBA-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'af65cb11-4b0f-46cc-ab5d-1666bc7e258e', 
        (SELECT id FROM courses WHERE code = 'MBA-3-OPE'), 
        'Monday', 
        4, 
        '11:40', 
        '12:30';


    -- Monday Period 5: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-3-SOF', 'Software Project Management', 'MBA-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ea6234a0-5db4-4e45-b942-26a3c15d9be8', 
        (SELECT id FROM courses WHERE code = 'MBA-3-SOF'), 
        'Monday', 
        5, 
        '13:10', 
        '14:00';


    -- Monday Period 6: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-3-DEE', 'Deep Learning Lab', 'MBA-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '974871e4-7df1-47b5-98c2-aca045507a54', 
        (SELECT id FROM courses WHERE code = 'MBA-3-DEE'), 
        'Monday', 
        6, 
        '14:00', 
        '14:50';


    -- Monday Period 7: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-3-DAT', 'Data Visualization Lab', 'MBA-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '03e58fc6-5fd7-4630-9e56-ef0f6fc80690', 
        (SELECT id FROM courses WHERE code = 'MBA-3-DAT'), 
        'Monday', 
        7, 
        '15:00', 
        '15:40';


    -- Monday Period 8: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-3-COU', 'Counseling', 'MBA-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '61916747-7271-497d-8180-54f907dcc33a', 
        (SELECT id FROM courses WHERE code = 'MBA-3-COU'), 
        'Monday', 
        8, 
        '15:40', 
        '16:20';


    -- Tuesday Period 1: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-3-DEE', 'Deep Learning', 'MBA-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '810ebe04-de94-4978-a066-68ed76625814', 
        (SELECT id FROM courses WHERE code = 'MBA-3-DEE'), 
        'Tuesday', 
        1, 
        '09:00', 
        '09:50';


    -- Tuesday Period 2: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-3-DAT', 'Data Visualization', 'MBA-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '89d884e5-6892-4075-841b-f385c9d0ed32', 
        (SELECT id FROM courses WHERE code = 'MBA-3-DAT'), 
        'Tuesday', 
        2, 
        '09:50', 
        '10:40';


    -- Tuesday Period 3: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-3-OPE', 'Operating Systems', 'MBA-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'af65cb11-4b0f-46cc-ab5d-1666bc7e258e', 
        (SELECT id FROM courses WHERE code = 'MBA-3-OPE'), 
        'Tuesday', 
        3, 
        '10:50', 
        '11:40';


    -- Tuesday Period 4: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-3-SOF', 'Software Project Management', 'MBA-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ea6234a0-5db4-4e45-b942-26a3c15d9be8', 
        (SELECT id FROM courses WHERE code = 'MBA-3-SOF'), 
        'Tuesday', 
        4, 
        '11:40', 
        '12:30';


    -- Tuesday Period 5: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-3-DEE', 'Deep Learning Lab', 'MBA-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '974871e4-7df1-47b5-98c2-aca045507a54', 
        (SELECT id FROM courses WHERE code = 'MBA-3-DEE'), 
        'Tuesday', 
        5, 
        '13:10', 
        '14:00';


    -- Tuesday Period 6: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-3-DAT', 'Data Visualization Lab', 'MBA-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '03e58fc6-5fd7-4630-9e56-ef0f6fc80690', 
        (SELECT id FROM courses WHERE code = 'MBA-3-DAT'), 
        'Tuesday', 
        6, 
        '14:00', 
        '14:50';


    -- Tuesday Period 7: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-3-COU', 'Counseling', 'MBA-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '61916747-7271-497d-8180-54f907dcc33a', 
        (SELECT id FROM courses WHERE code = 'MBA-3-COU'), 
        'Tuesday', 
        7, 
        '15:00', 
        '15:40';


    -- Tuesday Period 8: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-3-CLO', 'Cloud Computing', 'MBA-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4aa1a5ba-3e10-4ee2-8377-55e3bb040c64', 
        (SELECT id FROM courses WHERE code = 'MBA-3-CLO'), 
        'Tuesday', 
        8, 
        '15:40', 
        '16:20';


    -- Wednesday Period 1: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-3-DAT', 'Data Visualization', 'MBA-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '89d884e5-6892-4075-841b-f385c9d0ed32', 
        (SELECT id FROM courses WHERE code = 'MBA-3-DAT'), 
        'Wednesday', 
        1, 
        '09:00', 
        '09:50';


    -- Wednesday Period 2: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-3-OPE', 'Operating Systems', 'MBA-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'af65cb11-4b0f-46cc-ab5d-1666bc7e258e', 
        (SELECT id FROM courses WHERE code = 'MBA-3-OPE'), 
        'Wednesday', 
        2, 
        '09:50', 
        '10:40';


    -- Wednesday Period 3: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-3-SOF', 'Software Project Management', 'MBA-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ea6234a0-5db4-4e45-b942-26a3c15d9be8', 
        (SELECT id FROM courses WHERE code = 'MBA-3-SOF'), 
        'Wednesday', 
        3, 
        '10:50', 
        '11:40';


    -- Wednesday Period 4: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-3-DEE', 'Deep Learning Lab', 'MBA-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '974871e4-7df1-47b5-98c2-aca045507a54', 
        (SELECT id FROM courses WHERE code = 'MBA-3-DEE'), 
        'Wednesday', 
        4, 
        '11:40', 
        '12:30';


    -- Wednesday Period 5: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-3-DAT', 'Data Visualization Lab', 'MBA-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '03e58fc6-5fd7-4630-9e56-ef0f6fc80690', 
        (SELECT id FROM courses WHERE code = 'MBA-3-DAT'), 
        'Wednesday', 
        5, 
        '13:10', 
        '14:00';


    -- Wednesday Period 6: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-3-COU', 'Counseling', 'MBA-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '61916747-7271-497d-8180-54f907dcc33a', 
        (SELECT id FROM courses WHERE code = 'MBA-3-COU'), 
        'Wednesday', 
        6, 
        '14:00', 
        '14:50';


    -- Wednesday Period 7: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-3-CLO', 'Cloud Computing', 'MBA-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4aa1a5ba-3e10-4ee2-8377-55e3bb040c64', 
        (SELECT id FROM courses WHERE code = 'MBA-3-CLO'), 
        'Wednesday', 
        7, 
        '15:00', 
        '15:40';


    -- Wednesday Period 8: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-3-DEE', 'Deep Learning', 'MBA-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '810ebe04-de94-4978-a066-68ed76625814', 
        (SELECT id FROM courses WHERE code = 'MBA-3-DEE'), 
        'Wednesday', 
        8, 
        '15:40', 
        '16:20';


    -- Thursday Period 1: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-3-OPE', 'Operating Systems', 'MBA-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'af65cb11-4b0f-46cc-ab5d-1666bc7e258e', 
        (SELECT id FROM courses WHERE code = 'MBA-3-OPE'), 
        'Thursday', 
        1, 
        '09:00', 
        '09:50';


    -- Thursday Period 2: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-3-SOF', 'Software Project Management', 'MBA-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ea6234a0-5db4-4e45-b942-26a3c15d9be8', 
        (SELECT id FROM courses WHERE code = 'MBA-3-SOF'), 
        'Thursday', 
        2, 
        '09:50', 
        '10:40';


    -- Thursday Period 3: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-3-DEE', 'Deep Learning Lab', 'MBA-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '974871e4-7df1-47b5-98c2-aca045507a54', 
        (SELECT id FROM courses WHERE code = 'MBA-3-DEE'), 
        'Thursday', 
        3, 
        '10:50', 
        '11:40';


    -- Thursday Period 4: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-3-DAT', 'Data Visualization Lab', 'MBA-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '03e58fc6-5fd7-4630-9e56-ef0f6fc80690', 
        (SELECT id FROM courses WHERE code = 'MBA-3-DAT'), 
        'Thursday', 
        4, 
        '11:40', 
        '12:30';


    -- Thursday Period 5: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-3-COU', 'Counseling', 'MBA-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '61916747-7271-497d-8180-54f907dcc33a', 
        (SELECT id FROM courses WHERE code = 'MBA-3-COU'), 
        'Thursday', 
        5, 
        '13:10', 
        '14:00';


    -- Thursday Period 6: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-3-CLO', 'Cloud Computing', 'MBA-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4aa1a5ba-3e10-4ee2-8377-55e3bb040c64', 
        (SELECT id FROM courses WHERE code = 'MBA-3-CLO'), 
        'Thursday', 
        6, 
        '14:00', 
        '14:50';


    -- Thursday Period 7: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-3-DEE', 'Deep Learning', 'MBA-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '810ebe04-de94-4978-a066-68ed76625814', 
        (SELECT id FROM courses WHERE code = 'MBA-3-DEE'), 
        'Thursday', 
        7, 
        '15:00', 
        '15:40';


    -- Thursday Period 8: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-3-DAT', 'Data Visualization', 'MBA-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '89d884e5-6892-4075-841b-f385c9d0ed32', 
        (SELECT id FROM courses WHERE code = 'MBA-3-DAT'), 
        'Thursday', 
        8, 
        '15:40', 
        '16:20';


    -- Friday Period 1: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-3-SOF', 'Software Project Management', 'MBA-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ea6234a0-5db4-4e45-b942-26a3c15d9be8', 
        (SELECT id FROM courses WHERE code = 'MBA-3-SOF'), 
        'Friday', 
        1, 
        '09:00', 
        '09:50';


    -- Friday Period 2: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-3-DEE', 'Deep Learning Lab', 'MBA-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '974871e4-7df1-47b5-98c2-aca045507a54', 
        (SELECT id FROM courses WHERE code = 'MBA-3-DEE'), 
        'Friday', 
        2, 
        '09:50', 
        '10:40';


    -- Friday Period 3: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-3-DAT', 'Data Visualization Lab', 'MBA-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '03e58fc6-5fd7-4630-9e56-ef0f6fc80690', 
        (SELECT id FROM courses WHERE code = 'MBA-3-DAT'), 
        'Friday', 
        3, 
        '10:50', 
        '11:40';


    -- Friday Period 4: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-3-COU', 'Counseling', 'MBA-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '61916747-7271-497d-8180-54f907dcc33a', 
        (SELECT id FROM courses WHERE code = 'MBA-3-COU'), 
        'Friday', 
        4, 
        '11:40', 
        '12:30';


    -- Friday Period 5: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-3-CLO', 'Cloud Computing', 'MBA-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4aa1a5ba-3e10-4ee2-8377-55e3bb040c64', 
        (SELECT id FROM courses WHERE code = 'MBA-3-CLO'), 
        'Friday', 
        5, 
        '13:10', 
        '14:00';


    -- Friday Period 6: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-3-DEE', 'Deep Learning', 'MBA-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '810ebe04-de94-4978-a066-68ed76625814', 
        (SELECT id FROM courses WHERE code = 'MBA-3-DEE'), 
        'Friday', 
        6, 
        '14:00', 
        '14:50';


    -- Friday Period 7: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-3-DAT', 'Data Visualization', 'MBA-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '89d884e5-6892-4075-841b-f385c9d0ed32', 
        (SELECT id FROM courses WHERE code = 'MBA-3-DAT'), 
        'Friday', 
        7, 
        '15:00', 
        '15:40';


    -- Friday Period 8: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-3-OPE', 'Operating Systems', 'MBA-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'af65cb11-4b0f-46cc-ab5d-1666bc7e258e', 
        (SELECT id FROM courses WHERE code = 'MBA-3-OPE'), 
        'Friday', 
        8, 
        '15:40', 
        '16:20';


    -- Saturday Period 1: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-3-DEE', 'Deep Learning Lab', 'MBA-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '974871e4-7df1-47b5-98c2-aca045507a54', 
        (SELECT id FROM courses WHERE code = 'MBA-3-DEE'), 
        'Saturday', 
        1, 
        '09:00', 
        '09:50';


    -- Saturday Period 2: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-3-DAT', 'Data Visualization Lab', 'MBA-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '03e58fc6-5fd7-4630-9e56-ef0f6fc80690', 
        (SELECT id FROM courses WHERE code = 'MBA-3-DAT'), 
        'Saturday', 
        2, 
        '09:50', 
        '10:40';


    -- Saturday Period 3: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-3-COU', 'Counseling', 'MBA-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '61916747-7271-497d-8180-54f907dcc33a', 
        (SELECT id FROM courses WHERE code = 'MBA-3-COU'), 
        'Saturday', 
        3, 
        '10:50', 
        '11:40';


    -- Saturday Period 4: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-3-CLO', 'Cloud Computing', 'MBA-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4aa1a5ba-3e10-4ee2-8377-55e3bb040c64', 
        (SELECT id FROM courses WHERE code = 'MBA-3-CLO'), 
        'Saturday', 
        4, 
        '11:40', 
        '12:30';


    -- Saturday Period 5: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-3-DEE', 'Deep Learning', 'MBA-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '810ebe04-de94-4978-a066-68ed76625814', 
        (SELECT id FROM courses WHERE code = 'MBA-3-DEE'), 
        'Saturday', 
        5, 
        '13:10', 
        '14:00';


    -- Saturday Period 6: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-3-DAT', 'Data Visualization', 'MBA-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '89d884e5-6892-4075-841b-f385c9d0ed32', 
        (SELECT id FROM courses WHERE code = 'MBA-3-DAT'), 
        'Saturday', 
        6, 
        '14:00', 
        '14:50';


    -- Saturday Period 7: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-3-OPE', 'Operating Systems', 'MBA-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'af65cb11-4b0f-46cc-ab5d-1666bc7e258e', 
        (SELECT id FROM courses WHERE code = 'MBA-3-OPE'), 
        'Saturday', 
        7, 
        '15:00', 
        '15:40';


    -- Saturday Period 8: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-3-SOF', 'Software Project Management', 'MBA-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ea6234a0-5db4-4e45-b942-26a3c15d9be8', 
        (SELECT id FROM courses WHERE code = 'MBA-3-SOF'), 
        'Saturday', 
        8, 
        '15:40', 
        '16:20';

END $$;

DO $$
DECLARE
    v_ay_id UUID := 'd860d5fb-d5f0-4497-a7ea-073004d80500';
    v_sec_id UUID;
    v_course_ids UUID[];
    v_fac_id UUID;
    v_dept text := 'MBA';
BEGIN
    -- 1. Ensure Section Exists
    INSERT INTO class_sections (name, dept_code, academic_year_id, academic_year, year, semester, section)
    VALUES ('MBA-4-A', v_dept::department_code, v_ay_id, '2025-2026', 4, 8, 'A')
    ON CONFLICT (dept_code, academic_year_id, year, section) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO v_sec_id;

    -- If we missed ID (due to no update), fetch it
    IF v_sec_id IS NULL THEN
        SELECT id INTO v_sec_id FROM class_sections 
        WHERE dept_code = v_dept AND academic_year_id = v_ay_id AND year = 4 AND section = 'A';
    END IF;

    -- 2. Clear existing timetable for this section to avoid clutter
    DELETE FROM timetable WHERE class_section_id = v_sec_id;

    -- 3. Loop and Insert Periods


    -- Monday Period 1: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-4-CLO', 'Cloud Computing', 'MBA-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4aa1a5ba-3e10-4ee2-8377-55e3bb040c64', 
        (SELECT id FROM courses WHERE code = 'MBA-4-CLO'), 
        'Monday', 
        1, 
        '09:00', 
        '09:50';


    -- Monday Period 2: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-4-DEE', 'Deep Learning', 'MBA-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '810ebe04-de94-4978-a066-68ed76625814', 
        (SELECT id FROM courses WHERE code = 'MBA-4-DEE'), 
        'Monday', 
        2, 
        '09:50', 
        '10:40';


    -- Monday Period 3: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-4-DAT', 'Data Visualization', 'MBA-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '89d884e5-6892-4075-841b-f385c9d0ed32', 
        (SELECT id FROM courses WHERE code = 'MBA-4-DAT'), 
        'Monday', 
        3, 
        '10:50', 
        '11:40';


    -- Monday Period 4: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-4-OPE', 'Operating Systems', 'MBA-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'af65cb11-4b0f-46cc-ab5d-1666bc7e258e', 
        (SELECT id FROM courses WHERE code = 'MBA-4-OPE'), 
        'Monday', 
        4, 
        '11:40', 
        '12:30';


    -- Monday Period 5: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-4-SOF', 'Software Project Management', 'MBA-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ea6234a0-5db4-4e45-b942-26a3c15d9be8', 
        (SELECT id FROM courses WHERE code = 'MBA-4-SOF'), 
        'Monday', 
        5, 
        '13:10', 
        '14:00';


    -- Monday Period 6: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-4-DEE', 'Deep Learning Lab', 'MBA-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '974871e4-7df1-47b5-98c2-aca045507a54', 
        (SELECT id FROM courses WHERE code = 'MBA-4-DEE'), 
        'Monday', 
        6, 
        '14:00', 
        '14:50';


    -- Monday Period 7: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-4-DAT', 'Data Visualization Lab', 'MBA-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '03e58fc6-5fd7-4630-9e56-ef0f6fc80690', 
        (SELECT id FROM courses WHERE code = 'MBA-4-DAT'), 
        'Monday', 
        7, 
        '15:00', 
        '15:40';


    -- Monday Period 8: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-4-COU', 'Counseling', 'MBA-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '61916747-7271-497d-8180-54f907dcc33a', 
        (SELECT id FROM courses WHERE code = 'MBA-4-COU'), 
        'Monday', 
        8, 
        '15:40', 
        '16:20';


    -- Tuesday Period 1: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-4-DEE', 'Deep Learning', 'MBA-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '810ebe04-de94-4978-a066-68ed76625814', 
        (SELECT id FROM courses WHERE code = 'MBA-4-DEE'), 
        'Tuesday', 
        1, 
        '09:00', 
        '09:50';


    -- Tuesday Period 2: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-4-DAT', 'Data Visualization', 'MBA-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '89d884e5-6892-4075-841b-f385c9d0ed32', 
        (SELECT id FROM courses WHERE code = 'MBA-4-DAT'), 
        'Tuesday', 
        2, 
        '09:50', 
        '10:40';


    -- Tuesday Period 3: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-4-OPE', 'Operating Systems', 'MBA-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'af65cb11-4b0f-46cc-ab5d-1666bc7e258e', 
        (SELECT id FROM courses WHERE code = 'MBA-4-OPE'), 
        'Tuesday', 
        3, 
        '10:50', 
        '11:40';


    -- Tuesday Period 4: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-4-SOF', 'Software Project Management', 'MBA-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ea6234a0-5db4-4e45-b942-26a3c15d9be8', 
        (SELECT id FROM courses WHERE code = 'MBA-4-SOF'), 
        'Tuesday', 
        4, 
        '11:40', 
        '12:30';


    -- Tuesday Period 5: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-4-DEE', 'Deep Learning Lab', 'MBA-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '974871e4-7df1-47b5-98c2-aca045507a54', 
        (SELECT id FROM courses WHERE code = 'MBA-4-DEE'), 
        'Tuesday', 
        5, 
        '13:10', 
        '14:00';


    -- Tuesday Period 6: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-4-DAT', 'Data Visualization Lab', 'MBA-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '03e58fc6-5fd7-4630-9e56-ef0f6fc80690', 
        (SELECT id FROM courses WHERE code = 'MBA-4-DAT'), 
        'Tuesday', 
        6, 
        '14:00', 
        '14:50';


    -- Tuesday Period 7: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-4-COU', 'Counseling', 'MBA-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '61916747-7271-497d-8180-54f907dcc33a', 
        (SELECT id FROM courses WHERE code = 'MBA-4-COU'), 
        'Tuesday', 
        7, 
        '15:00', 
        '15:40';


    -- Tuesday Period 8: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-4-CLO', 'Cloud Computing', 'MBA-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4aa1a5ba-3e10-4ee2-8377-55e3bb040c64', 
        (SELECT id FROM courses WHERE code = 'MBA-4-CLO'), 
        'Tuesday', 
        8, 
        '15:40', 
        '16:20';


    -- Wednesday Period 1: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-4-DAT', 'Data Visualization', 'MBA-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '89d884e5-6892-4075-841b-f385c9d0ed32', 
        (SELECT id FROM courses WHERE code = 'MBA-4-DAT'), 
        'Wednesday', 
        1, 
        '09:00', 
        '09:50';


    -- Wednesday Period 2: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-4-OPE', 'Operating Systems', 'MBA-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'af65cb11-4b0f-46cc-ab5d-1666bc7e258e', 
        (SELECT id FROM courses WHERE code = 'MBA-4-OPE'), 
        'Wednesday', 
        2, 
        '09:50', 
        '10:40';


    -- Wednesday Period 3: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-4-SOF', 'Software Project Management', 'MBA-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ea6234a0-5db4-4e45-b942-26a3c15d9be8', 
        (SELECT id FROM courses WHERE code = 'MBA-4-SOF'), 
        'Wednesday', 
        3, 
        '10:50', 
        '11:40';


    -- Wednesday Period 4: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-4-DEE', 'Deep Learning Lab', 'MBA-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '974871e4-7df1-47b5-98c2-aca045507a54', 
        (SELECT id FROM courses WHERE code = 'MBA-4-DEE'), 
        'Wednesday', 
        4, 
        '11:40', 
        '12:30';


    -- Wednesday Period 5: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-4-DAT', 'Data Visualization Lab', 'MBA-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '03e58fc6-5fd7-4630-9e56-ef0f6fc80690', 
        (SELECT id FROM courses WHERE code = 'MBA-4-DAT'), 
        'Wednesday', 
        5, 
        '13:10', 
        '14:00';


    -- Wednesday Period 6: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-4-COU', 'Counseling', 'MBA-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '61916747-7271-497d-8180-54f907dcc33a', 
        (SELECT id FROM courses WHERE code = 'MBA-4-COU'), 
        'Wednesday', 
        6, 
        '14:00', 
        '14:50';


    -- Wednesday Period 7: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-4-CLO', 'Cloud Computing', 'MBA-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4aa1a5ba-3e10-4ee2-8377-55e3bb040c64', 
        (SELECT id FROM courses WHERE code = 'MBA-4-CLO'), 
        'Wednesday', 
        7, 
        '15:00', 
        '15:40';


    -- Wednesday Period 8: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-4-DEE', 'Deep Learning', 'MBA-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '810ebe04-de94-4978-a066-68ed76625814', 
        (SELECT id FROM courses WHERE code = 'MBA-4-DEE'), 
        'Wednesday', 
        8, 
        '15:40', 
        '16:20';


    -- Thursday Period 1: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-4-OPE', 'Operating Systems', 'MBA-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'af65cb11-4b0f-46cc-ab5d-1666bc7e258e', 
        (SELECT id FROM courses WHERE code = 'MBA-4-OPE'), 
        'Thursday', 
        1, 
        '09:00', 
        '09:50';


    -- Thursday Period 2: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-4-SOF', 'Software Project Management', 'MBA-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ea6234a0-5db4-4e45-b942-26a3c15d9be8', 
        (SELECT id FROM courses WHERE code = 'MBA-4-SOF'), 
        'Thursday', 
        2, 
        '09:50', 
        '10:40';


    -- Thursday Period 3: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-4-DEE', 'Deep Learning Lab', 'MBA-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '974871e4-7df1-47b5-98c2-aca045507a54', 
        (SELECT id FROM courses WHERE code = 'MBA-4-DEE'), 
        'Thursday', 
        3, 
        '10:50', 
        '11:40';


    -- Thursday Period 4: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-4-DAT', 'Data Visualization Lab', 'MBA-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '03e58fc6-5fd7-4630-9e56-ef0f6fc80690', 
        (SELECT id FROM courses WHERE code = 'MBA-4-DAT'), 
        'Thursday', 
        4, 
        '11:40', 
        '12:30';


    -- Thursday Period 5: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-4-COU', 'Counseling', 'MBA-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '61916747-7271-497d-8180-54f907dcc33a', 
        (SELECT id FROM courses WHERE code = 'MBA-4-COU'), 
        'Thursday', 
        5, 
        '13:10', 
        '14:00';


    -- Thursday Period 6: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-4-CLO', 'Cloud Computing', 'MBA-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4aa1a5ba-3e10-4ee2-8377-55e3bb040c64', 
        (SELECT id FROM courses WHERE code = 'MBA-4-CLO'), 
        'Thursday', 
        6, 
        '14:00', 
        '14:50';


    -- Thursday Period 7: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-4-DEE', 'Deep Learning', 'MBA-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '810ebe04-de94-4978-a066-68ed76625814', 
        (SELECT id FROM courses WHERE code = 'MBA-4-DEE'), 
        'Thursday', 
        7, 
        '15:00', 
        '15:40';


    -- Thursday Period 8: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-4-DAT', 'Data Visualization', 'MBA-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '89d884e5-6892-4075-841b-f385c9d0ed32', 
        (SELECT id FROM courses WHERE code = 'MBA-4-DAT'), 
        'Thursday', 
        8, 
        '15:40', 
        '16:20';


    -- Friday Period 1: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-4-SOF', 'Software Project Management', 'MBA-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ea6234a0-5db4-4e45-b942-26a3c15d9be8', 
        (SELECT id FROM courses WHERE code = 'MBA-4-SOF'), 
        'Friday', 
        1, 
        '09:00', 
        '09:50';


    -- Friday Period 2: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-4-DEE', 'Deep Learning Lab', 'MBA-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '974871e4-7df1-47b5-98c2-aca045507a54', 
        (SELECT id FROM courses WHERE code = 'MBA-4-DEE'), 
        'Friday', 
        2, 
        '09:50', 
        '10:40';


    -- Friday Period 3: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-4-DAT', 'Data Visualization Lab', 'MBA-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '03e58fc6-5fd7-4630-9e56-ef0f6fc80690', 
        (SELECT id FROM courses WHERE code = 'MBA-4-DAT'), 
        'Friday', 
        3, 
        '10:50', 
        '11:40';


    -- Friday Period 4: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-4-COU', 'Counseling', 'MBA-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '61916747-7271-497d-8180-54f907dcc33a', 
        (SELECT id FROM courses WHERE code = 'MBA-4-COU'), 
        'Friday', 
        4, 
        '11:40', 
        '12:30';


    -- Friday Period 5: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-4-CLO', 'Cloud Computing', 'MBA-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4aa1a5ba-3e10-4ee2-8377-55e3bb040c64', 
        (SELECT id FROM courses WHERE code = 'MBA-4-CLO'), 
        'Friday', 
        5, 
        '13:10', 
        '14:00';


    -- Friday Period 6: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-4-DEE', 'Deep Learning', 'MBA-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '810ebe04-de94-4978-a066-68ed76625814', 
        (SELECT id FROM courses WHERE code = 'MBA-4-DEE'), 
        'Friday', 
        6, 
        '14:00', 
        '14:50';


    -- Friday Period 7: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-4-DAT', 'Data Visualization', 'MBA-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '89d884e5-6892-4075-841b-f385c9d0ed32', 
        (SELECT id FROM courses WHERE code = 'MBA-4-DAT'), 
        'Friday', 
        7, 
        '15:00', 
        '15:40';


    -- Friday Period 8: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-4-OPE', 'Operating Systems', 'MBA-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'af65cb11-4b0f-46cc-ab5d-1666bc7e258e', 
        (SELECT id FROM courses WHERE code = 'MBA-4-OPE'), 
        'Friday', 
        8, 
        '15:40', 
        '16:20';


    -- Saturday Period 1: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-4-DEE', 'Deep Learning Lab', 'MBA-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '974871e4-7df1-47b5-98c2-aca045507a54', 
        (SELECT id FROM courses WHERE code = 'MBA-4-DEE'), 
        'Saturday', 
        1, 
        '09:00', 
        '09:50';


    -- Saturday Period 2: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-4-DAT', 'Data Visualization Lab', 'MBA-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '03e58fc6-5fd7-4630-9e56-ef0f6fc80690', 
        (SELECT id FROM courses WHERE code = 'MBA-4-DAT'), 
        'Saturday', 
        2, 
        '09:50', 
        '10:40';


    -- Saturday Period 3: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-4-COU', 'Counseling', 'MBA-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '61916747-7271-497d-8180-54f907dcc33a', 
        (SELECT id FROM courses WHERE code = 'MBA-4-COU'), 
        'Saturday', 
        3, 
        '10:50', 
        '11:40';


    -- Saturday Period 4: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-4-CLO', 'Cloud Computing', 'MBA-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4aa1a5ba-3e10-4ee2-8377-55e3bb040c64', 
        (SELECT id FROM courses WHERE code = 'MBA-4-CLO'), 
        'Saturday', 
        4, 
        '11:40', 
        '12:30';


    -- Saturday Period 5: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-4-DEE', 'Deep Learning', 'MBA-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '810ebe04-de94-4978-a066-68ed76625814', 
        (SELECT id FROM courses WHERE code = 'MBA-4-DEE'), 
        'Saturday', 
        5, 
        '13:10', 
        '14:00';


    -- Saturday Period 6: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-4-DAT', 'Data Visualization', 'MBA-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '89d884e5-6892-4075-841b-f385c9d0ed32', 
        (SELECT id FROM courses WHERE code = 'MBA-4-DAT'), 
        'Saturday', 
        6, 
        '14:00', 
        '14:50';


    -- Saturday Period 7: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-4-OPE', 'Operating Systems', 'MBA-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'af65cb11-4b0f-46cc-ab5d-1666bc7e258e', 
        (SELECT id FROM courses WHERE code = 'MBA-4-OPE'), 
        'Saturday', 
        7, 
        '15:00', 
        '15:40';


    -- Saturday Period 8: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MBA-4-SOF', 'Software Project Management', 'MBA-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'ea6234a0-5db4-4e45-b942-26a3c15d9be8', 
        (SELECT id FROM courses WHERE code = 'MBA-4-SOF'), 
        'Saturday', 
        8, 
        '15:40', 
        '16:20';

END $$;

DO $$
DECLARE
    v_ay_id UUID := 'd860d5fb-d5f0-4497-a7ea-073004d80500';
    v_sec_id UUID;
    v_course_ids UUID[];
    v_fac_id UUID;
    v_dept text := 'CIVIL';
BEGIN
    -- 1. Ensure Section Exists
    INSERT INTO class_sections (name, dept_code, academic_year_id, academic_year, year, semester, section)
    VALUES ('CIVIL-2-A', v_dept::department_code, v_ay_id, '2025-2026', 2, 4, 'A')
    ON CONFLICT (dept_code, academic_year_id, year, section) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO v_sec_id;

    -- If we missed ID (due to no update), fetch it
    IF v_sec_id IS NULL THEN
        SELECT id INTO v_sec_id FROM class_sections 
        WHERE dept_code = v_dept AND academic_year_id = v_ay_id AND year = 2 AND section = 'A';
    END IF;

    -- 2. Clear existing timetable for this section to avoid clutter
    DELETE FROM timetable WHERE class_section_id = v_sec_id;

    -- 3. Loop and Insert Periods


    -- Monday Period 1: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-2-CLO', 'Cloud Computing', 'CIVIL-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4027618d-ab0b-4e3d-9c3c-0871017972ac', 
        (SELECT id FROM courses WHERE code = 'CIVIL-2-CLO'), 
        'Monday', 
        1, 
        '09:00', 
        '09:50';


    -- Monday Period 2: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-2-DEE', 'Deep Learning', 'CIVIL-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '87a332ee-7aae-4cf6-90dc-ed410af955e7', 
        (SELECT id FROM courses WHERE code = 'CIVIL-2-DEE'), 
        'Monday', 
        2, 
        '09:50', 
        '10:40';


    -- Monday Period 3: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-2-DAT', 'Data Visualization', 'CIVIL-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'cc62b0e8-6963-42f5-be31-dccc33729582', 
        (SELECT id FROM courses WHERE code = 'CIVIL-2-DAT'), 
        'Monday', 
        3, 
        '10:50', 
        '11:40';


    -- Monday Period 4: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-2-OPE', 'Operating Systems', 'CIVIL-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a60bf50a-b98e-4903-857e-1d6238142a9a', 
        (SELECT id FROM courses WHERE code = 'CIVIL-2-OPE'), 
        'Monday', 
        4, 
        '11:40', 
        '12:30';


    -- Monday Period 5: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-2-SOF', 'Software Project Management', 'CIVIL-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'b5a91205-5134-41ad-aa49-7b14452a3032', 
        (SELECT id FROM courses WHERE code = 'CIVIL-2-SOF'), 
        'Monday', 
        5, 
        '13:10', 
        '14:00';


    -- Monday Period 6: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-2-DEE', 'Deep Learning Lab', 'CIVIL-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c5450a11-54f4-4be2-99f4-897c881890d3', 
        (SELECT id FROM courses WHERE code = 'CIVIL-2-DEE'), 
        'Monday', 
        6, 
        '14:00', 
        '14:50';


    -- Monday Period 7: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-2-DAT', 'Data Visualization Lab', 'CIVIL-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bc277d2e-b5fb-41f9-b71e-02139e5a8d31', 
        (SELECT id FROM courses WHERE code = 'CIVIL-2-DAT'), 
        'Monday', 
        7, 
        '15:00', 
        '15:40';


    -- Monday Period 8: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-2-COU', 'Counseling', 'CIVIL-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '1c438f48-981e-4ddf-b339-95cb7811e878', 
        (SELECT id FROM courses WHERE code = 'CIVIL-2-COU'), 
        'Monday', 
        8, 
        '15:40', 
        '16:20';


    -- Tuesday Period 1: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-2-DEE', 'Deep Learning', 'CIVIL-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '87a332ee-7aae-4cf6-90dc-ed410af955e7', 
        (SELECT id FROM courses WHERE code = 'CIVIL-2-DEE'), 
        'Tuesday', 
        1, 
        '09:00', 
        '09:50';


    -- Tuesday Period 2: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-2-DAT', 'Data Visualization', 'CIVIL-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'cc62b0e8-6963-42f5-be31-dccc33729582', 
        (SELECT id FROM courses WHERE code = 'CIVIL-2-DAT'), 
        'Tuesday', 
        2, 
        '09:50', 
        '10:40';


    -- Tuesday Period 3: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-2-OPE', 'Operating Systems', 'CIVIL-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a60bf50a-b98e-4903-857e-1d6238142a9a', 
        (SELECT id FROM courses WHERE code = 'CIVIL-2-OPE'), 
        'Tuesday', 
        3, 
        '10:50', 
        '11:40';


    -- Tuesday Period 4: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-2-SOF', 'Software Project Management', 'CIVIL-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'b5a91205-5134-41ad-aa49-7b14452a3032', 
        (SELECT id FROM courses WHERE code = 'CIVIL-2-SOF'), 
        'Tuesday', 
        4, 
        '11:40', 
        '12:30';


    -- Tuesday Period 5: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-2-DEE', 'Deep Learning Lab', 'CIVIL-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c5450a11-54f4-4be2-99f4-897c881890d3', 
        (SELECT id FROM courses WHERE code = 'CIVIL-2-DEE'), 
        'Tuesday', 
        5, 
        '13:10', 
        '14:00';


    -- Tuesday Period 6: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-2-DAT', 'Data Visualization Lab', 'CIVIL-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bc277d2e-b5fb-41f9-b71e-02139e5a8d31', 
        (SELECT id FROM courses WHERE code = 'CIVIL-2-DAT'), 
        'Tuesday', 
        6, 
        '14:00', 
        '14:50';


    -- Tuesday Period 7: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-2-COU', 'Counseling', 'CIVIL-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '1c438f48-981e-4ddf-b339-95cb7811e878', 
        (SELECT id FROM courses WHERE code = 'CIVIL-2-COU'), 
        'Tuesday', 
        7, 
        '15:00', 
        '15:40';


    -- Tuesday Period 8: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-2-CLO', 'Cloud Computing', 'CIVIL-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4027618d-ab0b-4e3d-9c3c-0871017972ac', 
        (SELECT id FROM courses WHERE code = 'CIVIL-2-CLO'), 
        'Tuesday', 
        8, 
        '15:40', 
        '16:20';


    -- Wednesday Period 1: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-2-DAT', 'Data Visualization', 'CIVIL-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'cc62b0e8-6963-42f5-be31-dccc33729582', 
        (SELECT id FROM courses WHERE code = 'CIVIL-2-DAT'), 
        'Wednesday', 
        1, 
        '09:00', 
        '09:50';


    -- Wednesday Period 2: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-2-OPE', 'Operating Systems', 'CIVIL-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a60bf50a-b98e-4903-857e-1d6238142a9a', 
        (SELECT id FROM courses WHERE code = 'CIVIL-2-OPE'), 
        'Wednesday', 
        2, 
        '09:50', 
        '10:40';


    -- Wednesday Period 3: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-2-SOF', 'Software Project Management', 'CIVIL-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'b5a91205-5134-41ad-aa49-7b14452a3032', 
        (SELECT id FROM courses WHERE code = 'CIVIL-2-SOF'), 
        'Wednesday', 
        3, 
        '10:50', 
        '11:40';


    -- Wednesday Period 4: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-2-DEE', 'Deep Learning Lab', 'CIVIL-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c5450a11-54f4-4be2-99f4-897c881890d3', 
        (SELECT id FROM courses WHERE code = 'CIVIL-2-DEE'), 
        'Wednesday', 
        4, 
        '11:40', 
        '12:30';


    -- Wednesday Period 5: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-2-DAT', 'Data Visualization Lab', 'CIVIL-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bc277d2e-b5fb-41f9-b71e-02139e5a8d31', 
        (SELECT id FROM courses WHERE code = 'CIVIL-2-DAT'), 
        'Wednesday', 
        5, 
        '13:10', 
        '14:00';


    -- Wednesday Period 6: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-2-COU', 'Counseling', 'CIVIL-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '1c438f48-981e-4ddf-b339-95cb7811e878', 
        (SELECT id FROM courses WHERE code = 'CIVIL-2-COU'), 
        'Wednesday', 
        6, 
        '14:00', 
        '14:50';


    -- Wednesday Period 7: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-2-CLO', 'Cloud Computing', 'CIVIL-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4027618d-ab0b-4e3d-9c3c-0871017972ac', 
        (SELECT id FROM courses WHERE code = 'CIVIL-2-CLO'), 
        'Wednesday', 
        7, 
        '15:00', 
        '15:40';


    -- Wednesday Period 8: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-2-DEE', 'Deep Learning', 'CIVIL-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '87a332ee-7aae-4cf6-90dc-ed410af955e7', 
        (SELECT id FROM courses WHERE code = 'CIVIL-2-DEE'), 
        'Wednesday', 
        8, 
        '15:40', 
        '16:20';


    -- Thursday Period 1: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-2-OPE', 'Operating Systems', 'CIVIL-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a60bf50a-b98e-4903-857e-1d6238142a9a', 
        (SELECT id FROM courses WHERE code = 'CIVIL-2-OPE'), 
        'Thursday', 
        1, 
        '09:00', 
        '09:50';


    -- Thursday Period 2: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-2-SOF', 'Software Project Management', 'CIVIL-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'b5a91205-5134-41ad-aa49-7b14452a3032', 
        (SELECT id FROM courses WHERE code = 'CIVIL-2-SOF'), 
        'Thursday', 
        2, 
        '09:50', 
        '10:40';


    -- Thursday Period 3: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-2-DEE', 'Deep Learning Lab', 'CIVIL-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c5450a11-54f4-4be2-99f4-897c881890d3', 
        (SELECT id FROM courses WHERE code = 'CIVIL-2-DEE'), 
        'Thursday', 
        3, 
        '10:50', 
        '11:40';


    -- Thursday Period 4: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-2-DAT', 'Data Visualization Lab', 'CIVIL-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bc277d2e-b5fb-41f9-b71e-02139e5a8d31', 
        (SELECT id FROM courses WHERE code = 'CIVIL-2-DAT'), 
        'Thursday', 
        4, 
        '11:40', 
        '12:30';


    -- Thursday Period 5: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-2-COU', 'Counseling', 'CIVIL-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '1c438f48-981e-4ddf-b339-95cb7811e878', 
        (SELECT id FROM courses WHERE code = 'CIVIL-2-COU'), 
        'Thursday', 
        5, 
        '13:10', 
        '14:00';


    -- Thursday Period 6: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-2-CLO', 'Cloud Computing', 'CIVIL-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4027618d-ab0b-4e3d-9c3c-0871017972ac', 
        (SELECT id FROM courses WHERE code = 'CIVIL-2-CLO'), 
        'Thursday', 
        6, 
        '14:00', 
        '14:50';


    -- Thursday Period 7: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-2-DEE', 'Deep Learning', 'CIVIL-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '87a332ee-7aae-4cf6-90dc-ed410af955e7', 
        (SELECT id FROM courses WHERE code = 'CIVIL-2-DEE'), 
        'Thursday', 
        7, 
        '15:00', 
        '15:40';


    -- Thursday Period 8: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-2-DAT', 'Data Visualization', 'CIVIL-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'cc62b0e8-6963-42f5-be31-dccc33729582', 
        (SELECT id FROM courses WHERE code = 'CIVIL-2-DAT'), 
        'Thursday', 
        8, 
        '15:40', 
        '16:20';


    -- Friday Period 1: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-2-SOF', 'Software Project Management', 'CIVIL-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'b5a91205-5134-41ad-aa49-7b14452a3032', 
        (SELECT id FROM courses WHERE code = 'CIVIL-2-SOF'), 
        'Friday', 
        1, 
        '09:00', 
        '09:50';


    -- Friday Period 2: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-2-DEE', 'Deep Learning Lab', 'CIVIL-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c5450a11-54f4-4be2-99f4-897c881890d3', 
        (SELECT id FROM courses WHERE code = 'CIVIL-2-DEE'), 
        'Friday', 
        2, 
        '09:50', 
        '10:40';


    -- Friday Period 3: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-2-DAT', 'Data Visualization Lab', 'CIVIL-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bc277d2e-b5fb-41f9-b71e-02139e5a8d31', 
        (SELECT id FROM courses WHERE code = 'CIVIL-2-DAT'), 
        'Friday', 
        3, 
        '10:50', 
        '11:40';


    -- Friday Period 4: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-2-COU', 'Counseling', 'CIVIL-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '1c438f48-981e-4ddf-b339-95cb7811e878', 
        (SELECT id FROM courses WHERE code = 'CIVIL-2-COU'), 
        'Friday', 
        4, 
        '11:40', 
        '12:30';


    -- Friday Period 5: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-2-CLO', 'Cloud Computing', 'CIVIL-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4027618d-ab0b-4e3d-9c3c-0871017972ac', 
        (SELECT id FROM courses WHERE code = 'CIVIL-2-CLO'), 
        'Friday', 
        5, 
        '13:10', 
        '14:00';


    -- Friday Period 6: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-2-DEE', 'Deep Learning', 'CIVIL-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '87a332ee-7aae-4cf6-90dc-ed410af955e7', 
        (SELECT id FROM courses WHERE code = 'CIVIL-2-DEE'), 
        'Friday', 
        6, 
        '14:00', 
        '14:50';


    -- Friday Period 7: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-2-DAT', 'Data Visualization', 'CIVIL-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'cc62b0e8-6963-42f5-be31-dccc33729582', 
        (SELECT id FROM courses WHERE code = 'CIVIL-2-DAT'), 
        'Friday', 
        7, 
        '15:00', 
        '15:40';


    -- Friday Period 8: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-2-OPE', 'Operating Systems', 'CIVIL-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a60bf50a-b98e-4903-857e-1d6238142a9a', 
        (SELECT id FROM courses WHERE code = 'CIVIL-2-OPE'), 
        'Friday', 
        8, 
        '15:40', 
        '16:20';


    -- Saturday Period 1: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-2-DEE', 'Deep Learning Lab', 'CIVIL-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c5450a11-54f4-4be2-99f4-897c881890d3', 
        (SELECT id FROM courses WHERE code = 'CIVIL-2-DEE'), 
        'Saturday', 
        1, 
        '09:00', 
        '09:50';


    -- Saturday Period 2: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-2-DAT', 'Data Visualization Lab', 'CIVIL-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bc277d2e-b5fb-41f9-b71e-02139e5a8d31', 
        (SELECT id FROM courses WHERE code = 'CIVIL-2-DAT'), 
        'Saturday', 
        2, 
        '09:50', 
        '10:40';


    -- Saturday Period 3: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-2-COU', 'Counseling', 'CIVIL-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '1c438f48-981e-4ddf-b339-95cb7811e878', 
        (SELECT id FROM courses WHERE code = 'CIVIL-2-COU'), 
        'Saturday', 
        3, 
        '10:50', 
        '11:40';


    -- Saturday Period 4: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-2-CLO', 'Cloud Computing', 'CIVIL-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4027618d-ab0b-4e3d-9c3c-0871017972ac', 
        (SELECT id FROM courses WHERE code = 'CIVIL-2-CLO'), 
        'Saturday', 
        4, 
        '11:40', 
        '12:30';


    -- Saturday Period 5: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-2-DEE', 'Deep Learning', 'CIVIL-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '87a332ee-7aae-4cf6-90dc-ed410af955e7', 
        (SELECT id FROM courses WHERE code = 'CIVIL-2-DEE'), 
        'Saturday', 
        5, 
        '13:10', 
        '14:00';


    -- Saturday Period 6: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-2-DAT', 'Data Visualization', 'CIVIL-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'cc62b0e8-6963-42f5-be31-dccc33729582', 
        (SELECT id FROM courses WHERE code = 'CIVIL-2-DAT'), 
        'Saturday', 
        6, 
        '14:00', 
        '14:50';


    -- Saturday Period 7: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-2-OPE', 'Operating Systems', 'CIVIL-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a60bf50a-b98e-4903-857e-1d6238142a9a', 
        (SELECT id FROM courses WHERE code = 'CIVIL-2-OPE'), 
        'Saturday', 
        7, 
        '15:00', 
        '15:40';


    -- Saturday Period 8: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-2-SOF', 'Software Project Management', 'CIVIL-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'b5a91205-5134-41ad-aa49-7b14452a3032', 
        (SELECT id FROM courses WHERE code = 'CIVIL-2-SOF'), 
        'Saturday', 
        8, 
        '15:40', 
        '16:20';

END $$;

DO $$
DECLARE
    v_ay_id UUID := 'd860d5fb-d5f0-4497-a7ea-073004d80500';
    v_sec_id UUID;
    v_course_ids UUID[];
    v_fac_id UUID;
    v_dept text := 'CIVIL';
BEGIN
    -- 1. Ensure Section Exists
    INSERT INTO class_sections (name, dept_code, academic_year_id, academic_year, year, semester, section)
    VALUES ('CIVIL-3-A', v_dept::department_code, v_ay_id, '2025-2026', 3, 6, 'A')
    ON CONFLICT (dept_code, academic_year_id, year, section) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO v_sec_id;

    -- If we missed ID (due to no update), fetch it
    IF v_sec_id IS NULL THEN
        SELECT id INTO v_sec_id FROM class_sections 
        WHERE dept_code = v_dept AND academic_year_id = v_ay_id AND year = 3 AND section = 'A';
    END IF;

    -- 2. Clear existing timetable for this section to avoid clutter
    DELETE FROM timetable WHERE class_section_id = v_sec_id;

    -- 3. Loop and Insert Periods


    -- Monday Period 1: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-3-CLO', 'Cloud Computing', 'CIVIL-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4027618d-ab0b-4e3d-9c3c-0871017972ac', 
        (SELECT id FROM courses WHERE code = 'CIVIL-3-CLO'), 
        'Monday', 
        1, 
        '09:00', 
        '09:50';


    -- Monday Period 2: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-3-DEE', 'Deep Learning', 'CIVIL-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '87a332ee-7aae-4cf6-90dc-ed410af955e7', 
        (SELECT id FROM courses WHERE code = 'CIVIL-3-DEE'), 
        'Monday', 
        2, 
        '09:50', 
        '10:40';


    -- Monday Period 3: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-3-DAT', 'Data Visualization', 'CIVIL-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'cc62b0e8-6963-42f5-be31-dccc33729582', 
        (SELECT id FROM courses WHERE code = 'CIVIL-3-DAT'), 
        'Monday', 
        3, 
        '10:50', 
        '11:40';


    -- Monday Period 4: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-3-OPE', 'Operating Systems', 'CIVIL-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a60bf50a-b98e-4903-857e-1d6238142a9a', 
        (SELECT id FROM courses WHERE code = 'CIVIL-3-OPE'), 
        'Monday', 
        4, 
        '11:40', 
        '12:30';


    -- Monday Period 5: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-3-SOF', 'Software Project Management', 'CIVIL-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'b5a91205-5134-41ad-aa49-7b14452a3032', 
        (SELECT id FROM courses WHERE code = 'CIVIL-3-SOF'), 
        'Monday', 
        5, 
        '13:10', 
        '14:00';


    -- Monday Period 6: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-3-DEE', 'Deep Learning Lab', 'CIVIL-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c5450a11-54f4-4be2-99f4-897c881890d3', 
        (SELECT id FROM courses WHERE code = 'CIVIL-3-DEE'), 
        'Monday', 
        6, 
        '14:00', 
        '14:50';


    -- Monday Period 7: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-3-DAT', 'Data Visualization Lab', 'CIVIL-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bc277d2e-b5fb-41f9-b71e-02139e5a8d31', 
        (SELECT id FROM courses WHERE code = 'CIVIL-3-DAT'), 
        'Monday', 
        7, 
        '15:00', 
        '15:40';


    -- Monday Period 8: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-3-COU', 'Counseling', 'CIVIL-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '1c438f48-981e-4ddf-b339-95cb7811e878', 
        (SELECT id FROM courses WHERE code = 'CIVIL-3-COU'), 
        'Monday', 
        8, 
        '15:40', 
        '16:20';


    -- Tuesday Period 1: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-3-DEE', 'Deep Learning', 'CIVIL-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '87a332ee-7aae-4cf6-90dc-ed410af955e7', 
        (SELECT id FROM courses WHERE code = 'CIVIL-3-DEE'), 
        'Tuesday', 
        1, 
        '09:00', 
        '09:50';


    -- Tuesday Period 2: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-3-DAT', 'Data Visualization', 'CIVIL-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'cc62b0e8-6963-42f5-be31-dccc33729582', 
        (SELECT id FROM courses WHERE code = 'CIVIL-3-DAT'), 
        'Tuesday', 
        2, 
        '09:50', 
        '10:40';


    -- Tuesday Period 3: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-3-OPE', 'Operating Systems', 'CIVIL-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a60bf50a-b98e-4903-857e-1d6238142a9a', 
        (SELECT id FROM courses WHERE code = 'CIVIL-3-OPE'), 
        'Tuesday', 
        3, 
        '10:50', 
        '11:40';


    -- Tuesday Period 4: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-3-SOF', 'Software Project Management', 'CIVIL-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'b5a91205-5134-41ad-aa49-7b14452a3032', 
        (SELECT id FROM courses WHERE code = 'CIVIL-3-SOF'), 
        'Tuesday', 
        4, 
        '11:40', 
        '12:30';


    -- Tuesday Period 5: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-3-DEE', 'Deep Learning Lab', 'CIVIL-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c5450a11-54f4-4be2-99f4-897c881890d3', 
        (SELECT id FROM courses WHERE code = 'CIVIL-3-DEE'), 
        'Tuesday', 
        5, 
        '13:10', 
        '14:00';


    -- Tuesday Period 6: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-3-DAT', 'Data Visualization Lab', 'CIVIL-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bc277d2e-b5fb-41f9-b71e-02139e5a8d31', 
        (SELECT id FROM courses WHERE code = 'CIVIL-3-DAT'), 
        'Tuesday', 
        6, 
        '14:00', 
        '14:50';


    -- Tuesday Period 7: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-3-COU', 'Counseling', 'CIVIL-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '1c438f48-981e-4ddf-b339-95cb7811e878', 
        (SELECT id FROM courses WHERE code = 'CIVIL-3-COU'), 
        'Tuesday', 
        7, 
        '15:00', 
        '15:40';


    -- Tuesday Period 8: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-3-CLO', 'Cloud Computing', 'CIVIL-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4027618d-ab0b-4e3d-9c3c-0871017972ac', 
        (SELECT id FROM courses WHERE code = 'CIVIL-3-CLO'), 
        'Tuesday', 
        8, 
        '15:40', 
        '16:20';


    -- Wednesday Period 1: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-3-DAT', 'Data Visualization', 'CIVIL-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'cc62b0e8-6963-42f5-be31-dccc33729582', 
        (SELECT id FROM courses WHERE code = 'CIVIL-3-DAT'), 
        'Wednesday', 
        1, 
        '09:00', 
        '09:50';


    -- Wednesday Period 2: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-3-OPE', 'Operating Systems', 'CIVIL-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a60bf50a-b98e-4903-857e-1d6238142a9a', 
        (SELECT id FROM courses WHERE code = 'CIVIL-3-OPE'), 
        'Wednesday', 
        2, 
        '09:50', 
        '10:40';


    -- Wednesday Period 3: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-3-SOF', 'Software Project Management', 'CIVIL-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'b5a91205-5134-41ad-aa49-7b14452a3032', 
        (SELECT id FROM courses WHERE code = 'CIVIL-3-SOF'), 
        'Wednesday', 
        3, 
        '10:50', 
        '11:40';


    -- Wednesday Period 4: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-3-DEE', 'Deep Learning Lab', 'CIVIL-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c5450a11-54f4-4be2-99f4-897c881890d3', 
        (SELECT id FROM courses WHERE code = 'CIVIL-3-DEE'), 
        'Wednesday', 
        4, 
        '11:40', 
        '12:30';


    -- Wednesday Period 5: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-3-DAT', 'Data Visualization Lab', 'CIVIL-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bc277d2e-b5fb-41f9-b71e-02139e5a8d31', 
        (SELECT id FROM courses WHERE code = 'CIVIL-3-DAT'), 
        'Wednesday', 
        5, 
        '13:10', 
        '14:00';


    -- Wednesday Period 6: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-3-COU', 'Counseling', 'CIVIL-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '1c438f48-981e-4ddf-b339-95cb7811e878', 
        (SELECT id FROM courses WHERE code = 'CIVIL-3-COU'), 
        'Wednesday', 
        6, 
        '14:00', 
        '14:50';


    -- Wednesday Period 7: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-3-CLO', 'Cloud Computing', 'CIVIL-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4027618d-ab0b-4e3d-9c3c-0871017972ac', 
        (SELECT id FROM courses WHERE code = 'CIVIL-3-CLO'), 
        'Wednesday', 
        7, 
        '15:00', 
        '15:40';


    -- Wednesday Period 8: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-3-DEE', 'Deep Learning', 'CIVIL-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '87a332ee-7aae-4cf6-90dc-ed410af955e7', 
        (SELECT id FROM courses WHERE code = 'CIVIL-3-DEE'), 
        'Wednesday', 
        8, 
        '15:40', 
        '16:20';


    -- Thursday Period 1: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-3-OPE', 'Operating Systems', 'CIVIL-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a60bf50a-b98e-4903-857e-1d6238142a9a', 
        (SELECT id FROM courses WHERE code = 'CIVIL-3-OPE'), 
        'Thursday', 
        1, 
        '09:00', 
        '09:50';


    -- Thursday Period 2: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-3-SOF', 'Software Project Management', 'CIVIL-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'b5a91205-5134-41ad-aa49-7b14452a3032', 
        (SELECT id FROM courses WHERE code = 'CIVIL-3-SOF'), 
        'Thursday', 
        2, 
        '09:50', 
        '10:40';


    -- Thursday Period 3: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-3-DEE', 'Deep Learning Lab', 'CIVIL-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c5450a11-54f4-4be2-99f4-897c881890d3', 
        (SELECT id FROM courses WHERE code = 'CIVIL-3-DEE'), 
        'Thursday', 
        3, 
        '10:50', 
        '11:40';


    -- Thursday Period 4: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-3-DAT', 'Data Visualization Lab', 'CIVIL-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bc277d2e-b5fb-41f9-b71e-02139e5a8d31', 
        (SELECT id FROM courses WHERE code = 'CIVIL-3-DAT'), 
        'Thursday', 
        4, 
        '11:40', 
        '12:30';


    -- Thursday Period 5: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-3-COU', 'Counseling', 'CIVIL-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '1c438f48-981e-4ddf-b339-95cb7811e878', 
        (SELECT id FROM courses WHERE code = 'CIVIL-3-COU'), 
        'Thursday', 
        5, 
        '13:10', 
        '14:00';


    -- Thursday Period 6: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-3-CLO', 'Cloud Computing', 'CIVIL-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4027618d-ab0b-4e3d-9c3c-0871017972ac', 
        (SELECT id FROM courses WHERE code = 'CIVIL-3-CLO'), 
        'Thursday', 
        6, 
        '14:00', 
        '14:50';


    -- Thursday Period 7: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-3-DEE', 'Deep Learning', 'CIVIL-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '87a332ee-7aae-4cf6-90dc-ed410af955e7', 
        (SELECT id FROM courses WHERE code = 'CIVIL-3-DEE'), 
        'Thursday', 
        7, 
        '15:00', 
        '15:40';


    -- Thursday Period 8: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-3-DAT', 'Data Visualization', 'CIVIL-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'cc62b0e8-6963-42f5-be31-dccc33729582', 
        (SELECT id FROM courses WHERE code = 'CIVIL-3-DAT'), 
        'Thursday', 
        8, 
        '15:40', 
        '16:20';


    -- Friday Period 1: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-3-SOF', 'Software Project Management', 'CIVIL-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'b5a91205-5134-41ad-aa49-7b14452a3032', 
        (SELECT id FROM courses WHERE code = 'CIVIL-3-SOF'), 
        'Friday', 
        1, 
        '09:00', 
        '09:50';


    -- Friday Period 2: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-3-DEE', 'Deep Learning Lab', 'CIVIL-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c5450a11-54f4-4be2-99f4-897c881890d3', 
        (SELECT id FROM courses WHERE code = 'CIVIL-3-DEE'), 
        'Friday', 
        2, 
        '09:50', 
        '10:40';


    -- Friday Period 3: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-3-DAT', 'Data Visualization Lab', 'CIVIL-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bc277d2e-b5fb-41f9-b71e-02139e5a8d31', 
        (SELECT id FROM courses WHERE code = 'CIVIL-3-DAT'), 
        'Friday', 
        3, 
        '10:50', 
        '11:40';


    -- Friday Period 4: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-3-COU', 'Counseling', 'CIVIL-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '1c438f48-981e-4ddf-b339-95cb7811e878', 
        (SELECT id FROM courses WHERE code = 'CIVIL-3-COU'), 
        'Friday', 
        4, 
        '11:40', 
        '12:30';


    -- Friday Period 5: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-3-CLO', 'Cloud Computing', 'CIVIL-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4027618d-ab0b-4e3d-9c3c-0871017972ac', 
        (SELECT id FROM courses WHERE code = 'CIVIL-3-CLO'), 
        'Friday', 
        5, 
        '13:10', 
        '14:00';


    -- Friday Period 6: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-3-DEE', 'Deep Learning', 'CIVIL-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '87a332ee-7aae-4cf6-90dc-ed410af955e7', 
        (SELECT id FROM courses WHERE code = 'CIVIL-3-DEE'), 
        'Friday', 
        6, 
        '14:00', 
        '14:50';


    -- Friday Period 7: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-3-DAT', 'Data Visualization', 'CIVIL-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'cc62b0e8-6963-42f5-be31-dccc33729582', 
        (SELECT id FROM courses WHERE code = 'CIVIL-3-DAT'), 
        'Friday', 
        7, 
        '15:00', 
        '15:40';


    -- Friday Period 8: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-3-OPE', 'Operating Systems', 'CIVIL-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a60bf50a-b98e-4903-857e-1d6238142a9a', 
        (SELECT id FROM courses WHERE code = 'CIVIL-3-OPE'), 
        'Friday', 
        8, 
        '15:40', 
        '16:20';


    -- Saturday Period 1: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-3-DEE', 'Deep Learning Lab', 'CIVIL-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c5450a11-54f4-4be2-99f4-897c881890d3', 
        (SELECT id FROM courses WHERE code = 'CIVIL-3-DEE'), 
        'Saturday', 
        1, 
        '09:00', 
        '09:50';


    -- Saturday Period 2: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-3-DAT', 'Data Visualization Lab', 'CIVIL-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bc277d2e-b5fb-41f9-b71e-02139e5a8d31', 
        (SELECT id FROM courses WHERE code = 'CIVIL-3-DAT'), 
        'Saturday', 
        2, 
        '09:50', 
        '10:40';


    -- Saturday Period 3: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-3-COU', 'Counseling', 'CIVIL-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '1c438f48-981e-4ddf-b339-95cb7811e878', 
        (SELECT id FROM courses WHERE code = 'CIVIL-3-COU'), 
        'Saturday', 
        3, 
        '10:50', 
        '11:40';


    -- Saturday Period 4: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-3-CLO', 'Cloud Computing', 'CIVIL-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4027618d-ab0b-4e3d-9c3c-0871017972ac', 
        (SELECT id FROM courses WHERE code = 'CIVIL-3-CLO'), 
        'Saturday', 
        4, 
        '11:40', 
        '12:30';


    -- Saturday Period 5: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-3-DEE', 'Deep Learning', 'CIVIL-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '87a332ee-7aae-4cf6-90dc-ed410af955e7', 
        (SELECT id FROM courses WHERE code = 'CIVIL-3-DEE'), 
        'Saturday', 
        5, 
        '13:10', 
        '14:00';


    -- Saturday Period 6: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-3-DAT', 'Data Visualization', 'CIVIL-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'cc62b0e8-6963-42f5-be31-dccc33729582', 
        (SELECT id FROM courses WHERE code = 'CIVIL-3-DAT'), 
        'Saturday', 
        6, 
        '14:00', 
        '14:50';


    -- Saturday Period 7: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-3-OPE', 'Operating Systems', 'CIVIL-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a60bf50a-b98e-4903-857e-1d6238142a9a', 
        (SELECT id FROM courses WHERE code = 'CIVIL-3-OPE'), 
        'Saturday', 
        7, 
        '15:00', 
        '15:40';


    -- Saturday Period 8: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-3-SOF', 'Software Project Management', 'CIVIL-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'b5a91205-5134-41ad-aa49-7b14452a3032', 
        (SELECT id FROM courses WHERE code = 'CIVIL-3-SOF'), 
        'Saturday', 
        8, 
        '15:40', 
        '16:20';

END $$;

DO $$
DECLARE
    v_ay_id UUID := 'd860d5fb-d5f0-4497-a7ea-073004d80500';
    v_sec_id UUID;
    v_course_ids UUID[];
    v_fac_id UUID;
    v_dept text := 'CIVIL';
BEGIN
    -- 1. Ensure Section Exists
    INSERT INTO class_sections (name, dept_code, academic_year_id, academic_year, year, semester, section)
    VALUES ('CIVIL-4-A', v_dept::department_code, v_ay_id, '2025-2026', 4, 8, 'A')
    ON CONFLICT (dept_code, academic_year_id, year, section) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO v_sec_id;

    -- If we missed ID (due to no update), fetch it
    IF v_sec_id IS NULL THEN
        SELECT id INTO v_sec_id FROM class_sections 
        WHERE dept_code = v_dept AND academic_year_id = v_ay_id AND year = 4 AND section = 'A';
    END IF;

    -- 2. Clear existing timetable for this section to avoid clutter
    DELETE FROM timetable WHERE class_section_id = v_sec_id;

    -- 3. Loop and Insert Periods


    -- Monday Period 1: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-4-CLO', 'Cloud Computing', 'CIVIL-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4027618d-ab0b-4e3d-9c3c-0871017972ac', 
        (SELECT id FROM courses WHERE code = 'CIVIL-4-CLO'), 
        'Monday', 
        1, 
        '09:00', 
        '09:50';


    -- Monday Period 2: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-4-DEE', 'Deep Learning', 'CIVIL-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '87a332ee-7aae-4cf6-90dc-ed410af955e7', 
        (SELECT id FROM courses WHERE code = 'CIVIL-4-DEE'), 
        'Monday', 
        2, 
        '09:50', 
        '10:40';


    -- Monday Period 3: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-4-DAT', 'Data Visualization', 'CIVIL-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'cc62b0e8-6963-42f5-be31-dccc33729582', 
        (SELECT id FROM courses WHERE code = 'CIVIL-4-DAT'), 
        'Monday', 
        3, 
        '10:50', 
        '11:40';


    -- Monday Period 4: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-4-OPE', 'Operating Systems', 'CIVIL-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a60bf50a-b98e-4903-857e-1d6238142a9a', 
        (SELECT id FROM courses WHERE code = 'CIVIL-4-OPE'), 
        'Monday', 
        4, 
        '11:40', 
        '12:30';


    -- Monday Period 5: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-4-SOF', 'Software Project Management', 'CIVIL-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'b5a91205-5134-41ad-aa49-7b14452a3032', 
        (SELECT id FROM courses WHERE code = 'CIVIL-4-SOF'), 
        'Monday', 
        5, 
        '13:10', 
        '14:00';


    -- Monday Period 6: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-4-DEE', 'Deep Learning Lab', 'CIVIL-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c5450a11-54f4-4be2-99f4-897c881890d3', 
        (SELECT id FROM courses WHERE code = 'CIVIL-4-DEE'), 
        'Monday', 
        6, 
        '14:00', 
        '14:50';


    -- Monday Period 7: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-4-DAT', 'Data Visualization Lab', 'CIVIL-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bc277d2e-b5fb-41f9-b71e-02139e5a8d31', 
        (SELECT id FROM courses WHERE code = 'CIVIL-4-DAT'), 
        'Monday', 
        7, 
        '15:00', 
        '15:40';


    -- Monday Period 8: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-4-COU', 'Counseling', 'CIVIL-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '1c438f48-981e-4ddf-b339-95cb7811e878', 
        (SELECT id FROM courses WHERE code = 'CIVIL-4-COU'), 
        'Monday', 
        8, 
        '15:40', 
        '16:20';


    -- Tuesday Period 1: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-4-DEE', 'Deep Learning', 'CIVIL-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '87a332ee-7aae-4cf6-90dc-ed410af955e7', 
        (SELECT id FROM courses WHERE code = 'CIVIL-4-DEE'), 
        'Tuesday', 
        1, 
        '09:00', 
        '09:50';


    -- Tuesday Period 2: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-4-DAT', 'Data Visualization', 'CIVIL-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'cc62b0e8-6963-42f5-be31-dccc33729582', 
        (SELECT id FROM courses WHERE code = 'CIVIL-4-DAT'), 
        'Tuesday', 
        2, 
        '09:50', 
        '10:40';


    -- Tuesday Period 3: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-4-OPE', 'Operating Systems', 'CIVIL-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a60bf50a-b98e-4903-857e-1d6238142a9a', 
        (SELECT id FROM courses WHERE code = 'CIVIL-4-OPE'), 
        'Tuesday', 
        3, 
        '10:50', 
        '11:40';


    -- Tuesday Period 4: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-4-SOF', 'Software Project Management', 'CIVIL-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'b5a91205-5134-41ad-aa49-7b14452a3032', 
        (SELECT id FROM courses WHERE code = 'CIVIL-4-SOF'), 
        'Tuesday', 
        4, 
        '11:40', 
        '12:30';


    -- Tuesday Period 5: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-4-DEE', 'Deep Learning Lab', 'CIVIL-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c5450a11-54f4-4be2-99f4-897c881890d3', 
        (SELECT id FROM courses WHERE code = 'CIVIL-4-DEE'), 
        'Tuesday', 
        5, 
        '13:10', 
        '14:00';


    -- Tuesday Period 6: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-4-DAT', 'Data Visualization Lab', 'CIVIL-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bc277d2e-b5fb-41f9-b71e-02139e5a8d31', 
        (SELECT id FROM courses WHERE code = 'CIVIL-4-DAT'), 
        'Tuesday', 
        6, 
        '14:00', 
        '14:50';


    -- Tuesday Period 7: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-4-COU', 'Counseling', 'CIVIL-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '1c438f48-981e-4ddf-b339-95cb7811e878', 
        (SELECT id FROM courses WHERE code = 'CIVIL-4-COU'), 
        'Tuesday', 
        7, 
        '15:00', 
        '15:40';


    -- Tuesday Period 8: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-4-CLO', 'Cloud Computing', 'CIVIL-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4027618d-ab0b-4e3d-9c3c-0871017972ac', 
        (SELECT id FROM courses WHERE code = 'CIVIL-4-CLO'), 
        'Tuesday', 
        8, 
        '15:40', 
        '16:20';


    -- Wednesday Period 1: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-4-DAT', 'Data Visualization', 'CIVIL-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'cc62b0e8-6963-42f5-be31-dccc33729582', 
        (SELECT id FROM courses WHERE code = 'CIVIL-4-DAT'), 
        'Wednesday', 
        1, 
        '09:00', 
        '09:50';


    -- Wednesday Period 2: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-4-OPE', 'Operating Systems', 'CIVIL-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a60bf50a-b98e-4903-857e-1d6238142a9a', 
        (SELECT id FROM courses WHERE code = 'CIVIL-4-OPE'), 
        'Wednesday', 
        2, 
        '09:50', 
        '10:40';


    -- Wednesday Period 3: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-4-SOF', 'Software Project Management', 'CIVIL-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'b5a91205-5134-41ad-aa49-7b14452a3032', 
        (SELECT id FROM courses WHERE code = 'CIVIL-4-SOF'), 
        'Wednesday', 
        3, 
        '10:50', 
        '11:40';


    -- Wednesday Period 4: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-4-DEE', 'Deep Learning Lab', 'CIVIL-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c5450a11-54f4-4be2-99f4-897c881890d3', 
        (SELECT id FROM courses WHERE code = 'CIVIL-4-DEE'), 
        'Wednesday', 
        4, 
        '11:40', 
        '12:30';


    -- Wednesday Period 5: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-4-DAT', 'Data Visualization Lab', 'CIVIL-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bc277d2e-b5fb-41f9-b71e-02139e5a8d31', 
        (SELECT id FROM courses WHERE code = 'CIVIL-4-DAT'), 
        'Wednesday', 
        5, 
        '13:10', 
        '14:00';


    -- Wednesday Period 6: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-4-COU', 'Counseling', 'CIVIL-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '1c438f48-981e-4ddf-b339-95cb7811e878', 
        (SELECT id FROM courses WHERE code = 'CIVIL-4-COU'), 
        'Wednesday', 
        6, 
        '14:00', 
        '14:50';


    -- Wednesday Period 7: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-4-CLO', 'Cloud Computing', 'CIVIL-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4027618d-ab0b-4e3d-9c3c-0871017972ac', 
        (SELECT id FROM courses WHERE code = 'CIVIL-4-CLO'), 
        'Wednesday', 
        7, 
        '15:00', 
        '15:40';


    -- Wednesday Period 8: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-4-DEE', 'Deep Learning', 'CIVIL-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '87a332ee-7aae-4cf6-90dc-ed410af955e7', 
        (SELECT id FROM courses WHERE code = 'CIVIL-4-DEE'), 
        'Wednesday', 
        8, 
        '15:40', 
        '16:20';


    -- Thursday Period 1: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-4-OPE', 'Operating Systems', 'CIVIL-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a60bf50a-b98e-4903-857e-1d6238142a9a', 
        (SELECT id FROM courses WHERE code = 'CIVIL-4-OPE'), 
        'Thursday', 
        1, 
        '09:00', 
        '09:50';


    -- Thursday Period 2: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-4-SOF', 'Software Project Management', 'CIVIL-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'b5a91205-5134-41ad-aa49-7b14452a3032', 
        (SELECT id FROM courses WHERE code = 'CIVIL-4-SOF'), 
        'Thursday', 
        2, 
        '09:50', 
        '10:40';


    -- Thursday Period 3: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-4-DEE', 'Deep Learning Lab', 'CIVIL-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c5450a11-54f4-4be2-99f4-897c881890d3', 
        (SELECT id FROM courses WHERE code = 'CIVIL-4-DEE'), 
        'Thursday', 
        3, 
        '10:50', 
        '11:40';


    -- Thursday Period 4: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-4-DAT', 'Data Visualization Lab', 'CIVIL-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bc277d2e-b5fb-41f9-b71e-02139e5a8d31', 
        (SELECT id FROM courses WHERE code = 'CIVIL-4-DAT'), 
        'Thursday', 
        4, 
        '11:40', 
        '12:30';


    -- Thursday Period 5: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-4-COU', 'Counseling', 'CIVIL-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '1c438f48-981e-4ddf-b339-95cb7811e878', 
        (SELECT id FROM courses WHERE code = 'CIVIL-4-COU'), 
        'Thursday', 
        5, 
        '13:10', 
        '14:00';


    -- Thursday Period 6: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-4-CLO', 'Cloud Computing', 'CIVIL-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4027618d-ab0b-4e3d-9c3c-0871017972ac', 
        (SELECT id FROM courses WHERE code = 'CIVIL-4-CLO'), 
        'Thursday', 
        6, 
        '14:00', 
        '14:50';


    -- Thursday Period 7: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-4-DEE', 'Deep Learning', 'CIVIL-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '87a332ee-7aae-4cf6-90dc-ed410af955e7', 
        (SELECT id FROM courses WHERE code = 'CIVIL-4-DEE'), 
        'Thursday', 
        7, 
        '15:00', 
        '15:40';


    -- Thursday Period 8: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-4-DAT', 'Data Visualization', 'CIVIL-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'cc62b0e8-6963-42f5-be31-dccc33729582', 
        (SELECT id FROM courses WHERE code = 'CIVIL-4-DAT'), 
        'Thursday', 
        8, 
        '15:40', 
        '16:20';


    -- Friday Period 1: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-4-SOF', 'Software Project Management', 'CIVIL-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'b5a91205-5134-41ad-aa49-7b14452a3032', 
        (SELECT id FROM courses WHERE code = 'CIVIL-4-SOF'), 
        'Friday', 
        1, 
        '09:00', 
        '09:50';


    -- Friday Period 2: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-4-DEE', 'Deep Learning Lab', 'CIVIL-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c5450a11-54f4-4be2-99f4-897c881890d3', 
        (SELECT id FROM courses WHERE code = 'CIVIL-4-DEE'), 
        'Friday', 
        2, 
        '09:50', 
        '10:40';


    -- Friday Period 3: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-4-DAT', 'Data Visualization Lab', 'CIVIL-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bc277d2e-b5fb-41f9-b71e-02139e5a8d31', 
        (SELECT id FROM courses WHERE code = 'CIVIL-4-DAT'), 
        'Friday', 
        3, 
        '10:50', 
        '11:40';


    -- Friday Period 4: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-4-COU', 'Counseling', 'CIVIL-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '1c438f48-981e-4ddf-b339-95cb7811e878', 
        (SELECT id FROM courses WHERE code = 'CIVIL-4-COU'), 
        'Friday', 
        4, 
        '11:40', 
        '12:30';


    -- Friday Period 5: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-4-CLO', 'Cloud Computing', 'CIVIL-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4027618d-ab0b-4e3d-9c3c-0871017972ac', 
        (SELECT id FROM courses WHERE code = 'CIVIL-4-CLO'), 
        'Friday', 
        5, 
        '13:10', 
        '14:00';


    -- Friday Period 6: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-4-DEE', 'Deep Learning', 'CIVIL-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '87a332ee-7aae-4cf6-90dc-ed410af955e7', 
        (SELECT id FROM courses WHERE code = 'CIVIL-4-DEE'), 
        'Friday', 
        6, 
        '14:00', 
        '14:50';


    -- Friday Period 7: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-4-DAT', 'Data Visualization', 'CIVIL-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'cc62b0e8-6963-42f5-be31-dccc33729582', 
        (SELECT id FROM courses WHERE code = 'CIVIL-4-DAT'), 
        'Friday', 
        7, 
        '15:00', 
        '15:40';


    -- Friday Period 8: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-4-OPE', 'Operating Systems', 'CIVIL-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a60bf50a-b98e-4903-857e-1d6238142a9a', 
        (SELECT id FROM courses WHERE code = 'CIVIL-4-OPE'), 
        'Friday', 
        8, 
        '15:40', 
        '16:20';


    -- Saturday Period 1: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-4-DEE', 'Deep Learning Lab', 'CIVIL-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c5450a11-54f4-4be2-99f4-897c881890d3', 
        (SELECT id FROM courses WHERE code = 'CIVIL-4-DEE'), 
        'Saturday', 
        1, 
        '09:00', 
        '09:50';


    -- Saturday Period 2: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-4-DAT', 'Data Visualization Lab', 'CIVIL-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bc277d2e-b5fb-41f9-b71e-02139e5a8d31', 
        (SELECT id FROM courses WHERE code = 'CIVIL-4-DAT'), 
        'Saturday', 
        2, 
        '09:50', 
        '10:40';


    -- Saturday Period 3: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-4-COU', 'Counseling', 'CIVIL-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '1c438f48-981e-4ddf-b339-95cb7811e878', 
        (SELECT id FROM courses WHERE code = 'CIVIL-4-COU'), 
        'Saturday', 
        3, 
        '10:50', 
        '11:40';


    -- Saturday Period 4: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-4-CLO', 'Cloud Computing', 'CIVIL-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4027618d-ab0b-4e3d-9c3c-0871017972ac', 
        (SELECT id FROM courses WHERE code = 'CIVIL-4-CLO'), 
        'Saturday', 
        4, 
        '11:40', 
        '12:30';


    -- Saturday Period 5: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-4-DEE', 'Deep Learning', 'CIVIL-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '87a332ee-7aae-4cf6-90dc-ed410af955e7', 
        (SELECT id FROM courses WHERE code = 'CIVIL-4-DEE'), 
        'Saturday', 
        5, 
        '13:10', 
        '14:00';


    -- Saturday Period 6: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-4-DAT', 'Data Visualization', 'CIVIL-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'cc62b0e8-6963-42f5-be31-dccc33729582', 
        (SELECT id FROM courses WHERE code = 'CIVIL-4-DAT'), 
        'Saturday', 
        6, 
        '14:00', 
        '14:50';


    -- Saturday Period 7: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-4-OPE', 'Operating Systems', 'CIVIL-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'a60bf50a-b98e-4903-857e-1d6238142a9a', 
        (SELECT id FROM courses WHERE code = 'CIVIL-4-OPE'), 
        'Saturday', 
        7, 
        '15:00', 
        '15:40';


    -- Saturday Period 8: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('CIVIL-4-SOF', 'Software Project Management', 'CIVIL-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'b5a91205-5134-41ad-aa49-7b14452a3032', 
        (SELECT id FROM courses WHERE code = 'CIVIL-4-SOF'), 
        'Saturday', 
        8, 
        '15:40', 
        '16:20';

END $$;

DO $$
DECLARE
    v_ay_id UUID := 'd860d5fb-d5f0-4497-a7ea-073004d80500';
    v_sec_id UUID;
    v_course_ids UUID[];
    v_fac_id UUID;
    v_dept text := 'MCA';
BEGIN
    -- 1. Ensure Section Exists
    INSERT INTO class_sections (name, dept_code, academic_year_id, academic_year, year, semester, section)
    VALUES ('MCA-2-A', v_dept::department_code, v_ay_id, '2025-2026', 2, 4, 'A')
    ON CONFLICT (dept_code, academic_year_id, year, section) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO v_sec_id;

    -- If we missed ID (due to no update), fetch it
    IF v_sec_id IS NULL THEN
        SELECT id INTO v_sec_id FROM class_sections 
        WHERE dept_code = v_dept AND academic_year_id = v_ay_id AND year = 2 AND section = 'A';
    END IF;

    -- 2. Clear existing timetable for this section to avoid clutter
    DELETE FROM timetable WHERE class_section_id = v_sec_id;

    -- 3. Loop and Insert Periods


    -- Monday Period 1: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-2-CLO', 'Cloud Computing', 'MCA-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '581d8b7e-c8a4-407c-86f6-76a7ff199046', 
        (SELECT id FROM courses WHERE code = 'MCA-2-CLO'), 
        'Monday', 
        1, 
        '09:00', 
        '09:50';


    -- Monday Period 2: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-2-DEE', 'Deep Learning', 'MCA-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '67bc2b6f-7072-4188-b540-26850f13c842', 
        (SELECT id FROM courses WHERE code = 'MCA-2-DEE'), 
        'Monday', 
        2, 
        '09:50', 
        '10:40';


    -- Monday Period 3: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-2-DAT', 'Data Visualization', 'MCA-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '62d73dc9-d0f3-4515-8594-585c5784052c', 
        (SELECT id FROM courses WHERE code = 'MCA-2-DAT'), 
        'Monday', 
        3, 
        '10:50', 
        '11:40';


    -- Monday Period 4: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-2-OPE', 'Operating Systems', 'MCA-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '6864966e-2dae-484a-9b5c-6a7e70549baa', 
        (SELECT id FROM courses WHERE code = 'MCA-2-OPE'), 
        'Monday', 
        4, 
        '11:40', 
        '12:30';


    -- Monday Period 5: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-2-SOF', 'Software Project Management', 'MCA-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '7fed4e58-a055-4039-8a25-9ab74ef2395c', 
        (SELECT id FROM courses WHERE code = 'MCA-2-SOF'), 
        'Monday', 
        5, 
        '13:10', 
        '14:00';


    -- Monday Period 6: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-2-DEE', 'Deep Learning Lab', 'MCA-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '8d7708ac-dbe6-4f51-bb3c-c5fac99d2152', 
        (SELECT id FROM courses WHERE code = 'MCA-2-DEE'), 
        'Monday', 
        6, 
        '14:00', 
        '14:50';


    -- Monday Period 7: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-2-DAT', 'Data Visualization Lab', 'MCA-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '06ffc515-0829-4100-8d97-4f4572b189a5', 
        (SELECT id FROM courses WHERE code = 'MCA-2-DAT'), 
        'Monday', 
        7, 
        '15:00', 
        '15:40';


    -- Monday Period 8: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-2-COU', 'Counseling', 'MCA-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '0b3d9b81-dfde-44f5-8f9d-03c0e6c38714', 
        (SELECT id FROM courses WHERE code = 'MCA-2-COU'), 
        'Monday', 
        8, 
        '15:40', 
        '16:20';


    -- Tuesday Period 1: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-2-DEE', 'Deep Learning', 'MCA-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '67bc2b6f-7072-4188-b540-26850f13c842', 
        (SELECT id FROM courses WHERE code = 'MCA-2-DEE'), 
        'Tuesday', 
        1, 
        '09:00', 
        '09:50';


    -- Tuesday Period 2: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-2-DAT', 'Data Visualization', 'MCA-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '62d73dc9-d0f3-4515-8594-585c5784052c', 
        (SELECT id FROM courses WHERE code = 'MCA-2-DAT'), 
        'Tuesday', 
        2, 
        '09:50', 
        '10:40';


    -- Tuesday Period 3: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-2-OPE', 'Operating Systems', 'MCA-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '6864966e-2dae-484a-9b5c-6a7e70549baa', 
        (SELECT id FROM courses WHERE code = 'MCA-2-OPE'), 
        'Tuesday', 
        3, 
        '10:50', 
        '11:40';


    -- Tuesday Period 4: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-2-SOF', 'Software Project Management', 'MCA-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '7fed4e58-a055-4039-8a25-9ab74ef2395c', 
        (SELECT id FROM courses WHERE code = 'MCA-2-SOF'), 
        'Tuesday', 
        4, 
        '11:40', 
        '12:30';


    -- Tuesday Period 5: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-2-DEE', 'Deep Learning Lab', 'MCA-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '8d7708ac-dbe6-4f51-bb3c-c5fac99d2152', 
        (SELECT id FROM courses WHERE code = 'MCA-2-DEE'), 
        'Tuesday', 
        5, 
        '13:10', 
        '14:00';


    -- Tuesday Period 6: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-2-DAT', 'Data Visualization Lab', 'MCA-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '06ffc515-0829-4100-8d97-4f4572b189a5', 
        (SELECT id FROM courses WHERE code = 'MCA-2-DAT'), 
        'Tuesday', 
        6, 
        '14:00', 
        '14:50';


    -- Tuesday Period 7: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-2-COU', 'Counseling', 'MCA-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '0b3d9b81-dfde-44f5-8f9d-03c0e6c38714', 
        (SELECT id FROM courses WHERE code = 'MCA-2-COU'), 
        'Tuesday', 
        7, 
        '15:00', 
        '15:40';


    -- Tuesday Period 8: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-2-CLO', 'Cloud Computing', 'MCA-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '581d8b7e-c8a4-407c-86f6-76a7ff199046', 
        (SELECT id FROM courses WHERE code = 'MCA-2-CLO'), 
        'Tuesday', 
        8, 
        '15:40', 
        '16:20';


    -- Wednesday Period 1: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-2-DAT', 'Data Visualization', 'MCA-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '62d73dc9-d0f3-4515-8594-585c5784052c', 
        (SELECT id FROM courses WHERE code = 'MCA-2-DAT'), 
        'Wednesday', 
        1, 
        '09:00', 
        '09:50';


    -- Wednesday Period 2: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-2-OPE', 'Operating Systems', 'MCA-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '6864966e-2dae-484a-9b5c-6a7e70549baa', 
        (SELECT id FROM courses WHERE code = 'MCA-2-OPE'), 
        'Wednesday', 
        2, 
        '09:50', 
        '10:40';


    -- Wednesday Period 3: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-2-SOF', 'Software Project Management', 'MCA-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '7fed4e58-a055-4039-8a25-9ab74ef2395c', 
        (SELECT id FROM courses WHERE code = 'MCA-2-SOF'), 
        'Wednesday', 
        3, 
        '10:50', 
        '11:40';


    -- Wednesday Period 4: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-2-DEE', 'Deep Learning Lab', 'MCA-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '8d7708ac-dbe6-4f51-bb3c-c5fac99d2152', 
        (SELECT id FROM courses WHERE code = 'MCA-2-DEE'), 
        'Wednesday', 
        4, 
        '11:40', 
        '12:30';


    -- Wednesday Period 5: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-2-DAT', 'Data Visualization Lab', 'MCA-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '06ffc515-0829-4100-8d97-4f4572b189a5', 
        (SELECT id FROM courses WHERE code = 'MCA-2-DAT'), 
        'Wednesday', 
        5, 
        '13:10', 
        '14:00';


    -- Wednesday Period 6: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-2-COU', 'Counseling', 'MCA-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '0b3d9b81-dfde-44f5-8f9d-03c0e6c38714', 
        (SELECT id FROM courses WHERE code = 'MCA-2-COU'), 
        'Wednesday', 
        6, 
        '14:00', 
        '14:50';


    -- Wednesday Period 7: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-2-CLO', 'Cloud Computing', 'MCA-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '581d8b7e-c8a4-407c-86f6-76a7ff199046', 
        (SELECT id FROM courses WHERE code = 'MCA-2-CLO'), 
        'Wednesday', 
        7, 
        '15:00', 
        '15:40';


    -- Wednesday Period 8: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-2-DEE', 'Deep Learning', 'MCA-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '67bc2b6f-7072-4188-b540-26850f13c842', 
        (SELECT id FROM courses WHERE code = 'MCA-2-DEE'), 
        'Wednesday', 
        8, 
        '15:40', 
        '16:20';


    -- Thursday Period 1: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-2-OPE', 'Operating Systems', 'MCA-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '6864966e-2dae-484a-9b5c-6a7e70549baa', 
        (SELECT id FROM courses WHERE code = 'MCA-2-OPE'), 
        'Thursday', 
        1, 
        '09:00', 
        '09:50';


    -- Thursday Period 2: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-2-SOF', 'Software Project Management', 'MCA-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '7fed4e58-a055-4039-8a25-9ab74ef2395c', 
        (SELECT id FROM courses WHERE code = 'MCA-2-SOF'), 
        'Thursday', 
        2, 
        '09:50', 
        '10:40';


    -- Thursday Period 3: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-2-DEE', 'Deep Learning Lab', 'MCA-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '8d7708ac-dbe6-4f51-bb3c-c5fac99d2152', 
        (SELECT id FROM courses WHERE code = 'MCA-2-DEE'), 
        'Thursday', 
        3, 
        '10:50', 
        '11:40';


    -- Thursday Period 4: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-2-DAT', 'Data Visualization Lab', 'MCA-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '06ffc515-0829-4100-8d97-4f4572b189a5', 
        (SELECT id FROM courses WHERE code = 'MCA-2-DAT'), 
        'Thursday', 
        4, 
        '11:40', 
        '12:30';


    -- Thursday Period 5: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-2-COU', 'Counseling', 'MCA-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '0b3d9b81-dfde-44f5-8f9d-03c0e6c38714', 
        (SELECT id FROM courses WHERE code = 'MCA-2-COU'), 
        'Thursday', 
        5, 
        '13:10', 
        '14:00';


    -- Thursday Period 6: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-2-CLO', 'Cloud Computing', 'MCA-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '581d8b7e-c8a4-407c-86f6-76a7ff199046', 
        (SELECT id FROM courses WHERE code = 'MCA-2-CLO'), 
        'Thursday', 
        6, 
        '14:00', 
        '14:50';


    -- Thursday Period 7: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-2-DEE', 'Deep Learning', 'MCA-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '67bc2b6f-7072-4188-b540-26850f13c842', 
        (SELECT id FROM courses WHERE code = 'MCA-2-DEE'), 
        'Thursday', 
        7, 
        '15:00', 
        '15:40';


    -- Thursday Period 8: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-2-DAT', 'Data Visualization', 'MCA-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '62d73dc9-d0f3-4515-8594-585c5784052c', 
        (SELECT id FROM courses WHERE code = 'MCA-2-DAT'), 
        'Thursday', 
        8, 
        '15:40', 
        '16:20';


    -- Friday Period 1: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-2-SOF', 'Software Project Management', 'MCA-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '7fed4e58-a055-4039-8a25-9ab74ef2395c', 
        (SELECT id FROM courses WHERE code = 'MCA-2-SOF'), 
        'Friday', 
        1, 
        '09:00', 
        '09:50';


    -- Friday Period 2: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-2-DEE', 'Deep Learning Lab', 'MCA-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '8d7708ac-dbe6-4f51-bb3c-c5fac99d2152', 
        (SELECT id FROM courses WHERE code = 'MCA-2-DEE'), 
        'Friday', 
        2, 
        '09:50', 
        '10:40';


    -- Friday Period 3: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-2-DAT', 'Data Visualization Lab', 'MCA-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '06ffc515-0829-4100-8d97-4f4572b189a5', 
        (SELECT id FROM courses WHERE code = 'MCA-2-DAT'), 
        'Friday', 
        3, 
        '10:50', 
        '11:40';


    -- Friday Period 4: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-2-COU', 'Counseling', 'MCA-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '0b3d9b81-dfde-44f5-8f9d-03c0e6c38714', 
        (SELECT id FROM courses WHERE code = 'MCA-2-COU'), 
        'Friday', 
        4, 
        '11:40', 
        '12:30';


    -- Friday Period 5: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-2-CLO', 'Cloud Computing', 'MCA-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '581d8b7e-c8a4-407c-86f6-76a7ff199046', 
        (SELECT id FROM courses WHERE code = 'MCA-2-CLO'), 
        'Friday', 
        5, 
        '13:10', 
        '14:00';


    -- Friday Period 6: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-2-DEE', 'Deep Learning', 'MCA-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '67bc2b6f-7072-4188-b540-26850f13c842', 
        (SELECT id FROM courses WHERE code = 'MCA-2-DEE'), 
        'Friday', 
        6, 
        '14:00', 
        '14:50';


    -- Friday Period 7: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-2-DAT', 'Data Visualization', 'MCA-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '62d73dc9-d0f3-4515-8594-585c5784052c', 
        (SELECT id FROM courses WHERE code = 'MCA-2-DAT'), 
        'Friday', 
        7, 
        '15:00', 
        '15:40';


    -- Friday Period 8: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-2-OPE', 'Operating Systems', 'MCA-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '6864966e-2dae-484a-9b5c-6a7e70549baa', 
        (SELECT id FROM courses WHERE code = 'MCA-2-OPE'), 
        'Friday', 
        8, 
        '15:40', 
        '16:20';


    -- Saturday Period 1: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-2-DEE', 'Deep Learning Lab', 'MCA-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '8d7708ac-dbe6-4f51-bb3c-c5fac99d2152', 
        (SELECT id FROM courses WHERE code = 'MCA-2-DEE'), 
        'Saturday', 
        1, 
        '09:00', 
        '09:50';


    -- Saturday Period 2: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-2-DAT', 'Data Visualization Lab', 'MCA-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '06ffc515-0829-4100-8d97-4f4572b189a5', 
        (SELECT id FROM courses WHERE code = 'MCA-2-DAT'), 
        'Saturday', 
        2, 
        '09:50', 
        '10:40';


    -- Saturday Period 3: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-2-COU', 'Counseling', 'MCA-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '0b3d9b81-dfde-44f5-8f9d-03c0e6c38714', 
        (SELECT id FROM courses WHERE code = 'MCA-2-COU'), 
        'Saturday', 
        3, 
        '10:50', 
        '11:40';


    -- Saturday Period 4: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-2-CLO', 'Cloud Computing', 'MCA-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '581d8b7e-c8a4-407c-86f6-76a7ff199046', 
        (SELECT id FROM courses WHERE code = 'MCA-2-CLO'), 
        'Saturday', 
        4, 
        '11:40', 
        '12:30';


    -- Saturday Period 5: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-2-DEE', 'Deep Learning', 'MCA-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '67bc2b6f-7072-4188-b540-26850f13c842', 
        (SELECT id FROM courses WHERE code = 'MCA-2-DEE'), 
        'Saturday', 
        5, 
        '13:10', 
        '14:00';


    -- Saturday Period 6: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-2-DAT', 'Data Visualization', 'MCA-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '62d73dc9-d0f3-4515-8594-585c5784052c', 
        (SELECT id FROM courses WHERE code = 'MCA-2-DAT'), 
        'Saturday', 
        6, 
        '14:00', 
        '14:50';


    -- Saturday Period 7: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-2-OPE', 'Operating Systems', 'MCA-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '6864966e-2dae-484a-9b5c-6a7e70549baa', 
        (SELECT id FROM courses WHERE code = 'MCA-2-OPE'), 
        'Saturday', 
        7, 
        '15:00', 
        '15:40';


    -- Saturday Period 8: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-2-SOF', 'Software Project Management', 'MCA-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '7fed4e58-a055-4039-8a25-9ab74ef2395c', 
        (SELECT id FROM courses WHERE code = 'MCA-2-SOF'), 
        'Saturday', 
        8, 
        '15:40', 
        '16:20';

END $$;

DO $$
DECLARE
    v_ay_id UUID := 'd860d5fb-d5f0-4497-a7ea-073004d80500';
    v_sec_id UUID;
    v_course_ids UUID[];
    v_fac_id UUID;
    v_dept text := 'MCA';
BEGIN
    -- 1. Ensure Section Exists
    INSERT INTO class_sections (name, dept_code, academic_year_id, academic_year, year, semester, section)
    VALUES ('MCA-3-A', v_dept::department_code, v_ay_id, '2025-2026', 3, 6, 'A')
    ON CONFLICT (dept_code, academic_year_id, year, section) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO v_sec_id;

    -- If we missed ID (due to no update), fetch it
    IF v_sec_id IS NULL THEN
        SELECT id INTO v_sec_id FROM class_sections 
        WHERE dept_code = v_dept AND academic_year_id = v_ay_id AND year = 3 AND section = 'A';
    END IF;

    -- 2. Clear existing timetable for this section to avoid clutter
    DELETE FROM timetable WHERE class_section_id = v_sec_id;

    -- 3. Loop and Insert Periods


    -- Monday Period 1: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-3-CLO', 'Cloud Computing', 'MCA-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '581d8b7e-c8a4-407c-86f6-76a7ff199046', 
        (SELECT id FROM courses WHERE code = 'MCA-3-CLO'), 
        'Monday', 
        1, 
        '09:00', 
        '09:50';


    -- Monday Period 2: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-3-DEE', 'Deep Learning', 'MCA-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '67bc2b6f-7072-4188-b540-26850f13c842', 
        (SELECT id FROM courses WHERE code = 'MCA-3-DEE'), 
        'Monday', 
        2, 
        '09:50', 
        '10:40';


    -- Monday Period 3: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-3-DAT', 'Data Visualization', 'MCA-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '62d73dc9-d0f3-4515-8594-585c5784052c', 
        (SELECT id FROM courses WHERE code = 'MCA-3-DAT'), 
        'Monday', 
        3, 
        '10:50', 
        '11:40';


    -- Monday Period 4: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-3-OPE', 'Operating Systems', 'MCA-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '6864966e-2dae-484a-9b5c-6a7e70549baa', 
        (SELECT id FROM courses WHERE code = 'MCA-3-OPE'), 
        'Monday', 
        4, 
        '11:40', 
        '12:30';


    -- Monday Period 5: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-3-SOF', 'Software Project Management', 'MCA-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '7fed4e58-a055-4039-8a25-9ab74ef2395c', 
        (SELECT id FROM courses WHERE code = 'MCA-3-SOF'), 
        'Monday', 
        5, 
        '13:10', 
        '14:00';


    -- Monday Period 6: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-3-DEE', 'Deep Learning Lab', 'MCA-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '8d7708ac-dbe6-4f51-bb3c-c5fac99d2152', 
        (SELECT id FROM courses WHERE code = 'MCA-3-DEE'), 
        'Monday', 
        6, 
        '14:00', 
        '14:50';


    -- Monday Period 7: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-3-DAT', 'Data Visualization Lab', 'MCA-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '06ffc515-0829-4100-8d97-4f4572b189a5', 
        (SELECT id FROM courses WHERE code = 'MCA-3-DAT'), 
        'Monday', 
        7, 
        '15:00', 
        '15:40';


    -- Monday Period 8: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-3-COU', 'Counseling', 'MCA-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '0b3d9b81-dfde-44f5-8f9d-03c0e6c38714', 
        (SELECT id FROM courses WHERE code = 'MCA-3-COU'), 
        'Monday', 
        8, 
        '15:40', 
        '16:20';


    -- Tuesday Period 1: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-3-DEE', 'Deep Learning', 'MCA-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '67bc2b6f-7072-4188-b540-26850f13c842', 
        (SELECT id FROM courses WHERE code = 'MCA-3-DEE'), 
        'Tuesday', 
        1, 
        '09:00', 
        '09:50';


    -- Tuesday Period 2: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-3-DAT', 'Data Visualization', 'MCA-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '62d73dc9-d0f3-4515-8594-585c5784052c', 
        (SELECT id FROM courses WHERE code = 'MCA-3-DAT'), 
        'Tuesday', 
        2, 
        '09:50', 
        '10:40';


    -- Tuesday Period 3: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-3-OPE', 'Operating Systems', 'MCA-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '6864966e-2dae-484a-9b5c-6a7e70549baa', 
        (SELECT id FROM courses WHERE code = 'MCA-3-OPE'), 
        'Tuesday', 
        3, 
        '10:50', 
        '11:40';


    -- Tuesday Period 4: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-3-SOF', 'Software Project Management', 'MCA-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '7fed4e58-a055-4039-8a25-9ab74ef2395c', 
        (SELECT id FROM courses WHERE code = 'MCA-3-SOF'), 
        'Tuesday', 
        4, 
        '11:40', 
        '12:30';


    -- Tuesday Period 5: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-3-DEE', 'Deep Learning Lab', 'MCA-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '8d7708ac-dbe6-4f51-bb3c-c5fac99d2152', 
        (SELECT id FROM courses WHERE code = 'MCA-3-DEE'), 
        'Tuesday', 
        5, 
        '13:10', 
        '14:00';


    -- Tuesday Period 6: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-3-DAT', 'Data Visualization Lab', 'MCA-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '06ffc515-0829-4100-8d97-4f4572b189a5', 
        (SELECT id FROM courses WHERE code = 'MCA-3-DAT'), 
        'Tuesday', 
        6, 
        '14:00', 
        '14:50';


    -- Tuesday Period 7: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-3-COU', 'Counseling', 'MCA-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '0b3d9b81-dfde-44f5-8f9d-03c0e6c38714', 
        (SELECT id FROM courses WHERE code = 'MCA-3-COU'), 
        'Tuesday', 
        7, 
        '15:00', 
        '15:40';


    -- Tuesday Period 8: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-3-CLO', 'Cloud Computing', 'MCA-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '581d8b7e-c8a4-407c-86f6-76a7ff199046', 
        (SELECT id FROM courses WHERE code = 'MCA-3-CLO'), 
        'Tuesday', 
        8, 
        '15:40', 
        '16:20';


    -- Wednesday Period 1: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-3-DAT', 'Data Visualization', 'MCA-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '62d73dc9-d0f3-4515-8594-585c5784052c', 
        (SELECT id FROM courses WHERE code = 'MCA-3-DAT'), 
        'Wednesday', 
        1, 
        '09:00', 
        '09:50';


    -- Wednesday Period 2: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-3-OPE', 'Operating Systems', 'MCA-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '6864966e-2dae-484a-9b5c-6a7e70549baa', 
        (SELECT id FROM courses WHERE code = 'MCA-3-OPE'), 
        'Wednesday', 
        2, 
        '09:50', 
        '10:40';


    -- Wednesday Period 3: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-3-SOF', 'Software Project Management', 'MCA-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '7fed4e58-a055-4039-8a25-9ab74ef2395c', 
        (SELECT id FROM courses WHERE code = 'MCA-3-SOF'), 
        'Wednesday', 
        3, 
        '10:50', 
        '11:40';


    -- Wednesday Period 4: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-3-DEE', 'Deep Learning Lab', 'MCA-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '8d7708ac-dbe6-4f51-bb3c-c5fac99d2152', 
        (SELECT id FROM courses WHERE code = 'MCA-3-DEE'), 
        'Wednesday', 
        4, 
        '11:40', 
        '12:30';


    -- Wednesday Period 5: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-3-DAT', 'Data Visualization Lab', 'MCA-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '06ffc515-0829-4100-8d97-4f4572b189a5', 
        (SELECT id FROM courses WHERE code = 'MCA-3-DAT'), 
        'Wednesday', 
        5, 
        '13:10', 
        '14:00';


    -- Wednesday Period 6: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-3-COU', 'Counseling', 'MCA-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '0b3d9b81-dfde-44f5-8f9d-03c0e6c38714', 
        (SELECT id FROM courses WHERE code = 'MCA-3-COU'), 
        'Wednesday', 
        6, 
        '14:00', 
        '14:50';


    -- Wednesday Period 7: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-3-CLO', 'Cloud Computing', 'MCA-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '581d8b7e-c8a4-407c-86f6-76a7ff199046', 
        (SELECT id FROM courses WHERE code = 'MCA-3-CLO'), 
        'Wednesday', 
        7, 
        '15:00', 
        '15:40';


    -- Wednesday Period 8: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-3-DEE', 'Deep Learning', 'MCA-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '67bc2b6f-7072-4188-b540-26850f13c842', 
        (SELECT id FROM courses WHERE code = 'MCA-3-DEE'), 
        'Wednesday', 
        8, 
        '15:40', 
        '16:20';


    -- Thursday Period 1: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-3-OPE', 'Operating Systems', 'MCA-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '6864966e-2dae-484a-9b5c-6a7e70549baa', 
        (SELECT id FROM courses WHERE code = 'MCA-3-OPE'), 
        'Thursday', 
        1, 
        '09:00', 
        '09:50';


    -- Thursday Period 2: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-3-SOF', 'Software Project Management', 'MCA-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '7fed4e58-a055-4039-8a25-9ab74ef2395c', 
        (SELECT id FROM courses WHERE code = 'MCA-3-SOF'), 
        'Thursday', 
        2, 
        '09:50', 
        '10:40';


    -- Thursday Period 3: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-3-DEE', 'Deep Learning Lab', 'MCA-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '8d7708ac-dbe6-4f51-bb3c-c5fac99d2152', 
        (SELECT id FROM courses WHERE code = 'MCA-3-DEE'), 
        'Thursday', 
        3, 
        '10:50', 
        '11:40';


    -- Thursday Period 4: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-3-DAT', 'Data Visualization Lab', 'MCA-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '06ffc515-0829-4100-8d97-4f4572b189a5', 
        (SELECT id FROM courses WHERE code = 'MCA-3-DAT'), 
        'Thursday', 
        4, 
        '11:40', 
        '12:30';


    -- Thursday Period 5: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-3-COU', 'Counseling', 'MCA-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '0b3d9b81-dfde-44f5-8f9d-03c0e6c38714', 
        (SELECT id FROM courses WHERE code = 'MCA-3-COU'), 
        'Thursday', 
        5, 
        '13:10', 
        '14:00';


    -- Thursday Period 6: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-3-CLO', 'Cloud Computing', 'MCA-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '581d8b7e-c8a4-407c-86f6-76a7ff199046', 
        (SELECT id FROM courses WHERE code = 'MCA-3-CLO'), 
        'Thursday', 
        6, 
        '14:00', 
        '14:50';


    -- Thursday Period 7: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-3-DEE', 'Deep Learning', 'MCA-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '67bc2b6f-7072-4188-b540-26850f13c842', 
        (SELECT id FROM courses WHERE code = 'MCA-3-DEE'), 
        'Thursday', 
        7, 
        '15:00', 
        '15:40';


    -- Thursday Period 8: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-3-DAT', 'Data Visualization', 'MCA-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '62d73dc9-d0f3-4515-8594-585c5784052c', 
        (SELECT id FROM courses WHERE code = 'MCA-3-DAT'), 
        'Thursday', 
        8, 
        '15:40', 
        '16:20';


    -- Friday Period 1: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-3-SOF', 'Software Project Management', 'MCA-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '7fed4e58-a055-4039-8a25-9ab74ef2395c', 
        (SELECT id FROM courses WHERE code = 'MCA-3-SOF'), 
        'Friday', 
        1, 
        '09:00', 
        '09:50';


    -- Friday Period 2: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-3-DEE', 'Deep Learning Lab', 'MCA-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '8d7708ac-dbe6-4f51-bb3c-c5fac99d2152', 
        (SELECT id FROM courses WHERE code = 'MCA-3-DEE'), 
        'Friday', 
        2, 
        '09:50', 
        '10:40';


    -- Friday Period 3: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-3-DAT', 'Data Visualization Lab', 'MCA-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '06ffc515-0829-4100-8d97-4f4572b189a5', 
        (SELECT id FROM courses WHERE code = 'MCA-3-DAT'), 
        'Friday', 
        3, 
        '10:50', 
        '11:40';


    -- Friday Period 4: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-3-COU', 'Counseling', 'MCA-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '0b3d9b81-dfde-44f5-8f9d-03c0e6c38714', 
        (SELECT id FROM courses WHERE code = 'MCA-3-COU'), 
        'Friday', 
        4, 
        '11:40', 
        '12:30';


    -- Friday Period 5: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-3-CLO', 'Cloud Computing', 'MCA-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '581d8b7e-c8a4-407c-86f6-76a7ff199046', 
        (SELECT id FROM courses WHERE code = 'MCA-3-CLO'), 
        'Friday', 
        5, 
        '13:10', 
        '14:00';


    -- Friday Period 6: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-3-DEE', 'Deep Learning', 'MCA-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '67bc2b6f-7072-4188-b540-26850f13c842', 
        (SELECT id FROM courses WHERE code = 'MCA-3-DEE'), 
        'Friday', 
        6, 
        '14:00', 
        '14:50';


    -- Friday Period 7: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-3-DAT', 'Data Visualization', 'MCA-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '62d73dc9-d0f3-4515-8594-585c5784052c', 
        (SELECT id FROM courses WHERE code = 'MCA-3-DAT'), 
        'Friday', 
        7, 
        '15:00', 
        '15:40';


    -- Friday Period 8: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-3-OPE', 'Operating Systems', 'MCA-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '6864966e-2dae-484a-9b5c-6a7e70549baa', 
        (SELECT id FROM courses WHERE code = 'MCA-3-OPE'), 
        'Friday', 
        8, 
        '15:40', 
        '16:20';


    -- Saturday Period 1: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-3-DEE', 'Deep Learning Lab', 'MCA-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '8d7708ac-dbe6-4f51-bb3c-c5fac99d2152', 
        (SELECT id FROM courses WHERE code = 'MCA-3-DEE'), 
        'Saturday', 
        1, 
        '09:00', 
        '09:50';


    -- Saturday Period 2: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-3-DAT', 'Data Visualization Lab', 'MCA-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '06ffc515-0829-4100-8d97-4f4572b189a5', 
        (SELECT id FROM courses WHERE code = 'MCA-3-DAT'), 
        'Saturday', 
        2, 
        '09:50', 
        '10:40';


    -- Saturday Period 3: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-3-COU', 'Counseling', 'MCA-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '0b3d9b81-dfde-44f5-8f9d-03c0e6c38714', 
        (SELECT id FROM courses WHERE code = 'MCA-3-COU'), 
        'Saturday', 
        3, 
        '10:50', 
        '11:40';


    -- Saturday Period 4: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-3-CLO', 'Cloud Computing', 'MCA-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '581d8b7e-c8a4-407c-86f6-76a7ff199046', 
        (SELECT id FROM courses WHERE code = 'MCA-3-CLO'), 
        'Saturday', 
        4, 
        '11:40', 
        '12:30';


    -- Saturday Period 5: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-3-DEE', 'Deep Learning', 'MCA-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '67bc2b6f-7072-4188-b540-26850f13c842', 
        (SELECT id FROM courses WHERE code = 'MCA-3-DEE'), 
        'Saturday', 
        5, 
        '13:10', 
        '14:00';


    -- Saturday Period 6: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-3-DAT', 'Data Visualization', 'MCA-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '62d73dc9-d0f3-4515-8594-585c5784052c', 
        (SELECT id FROM courses WHERE code = 'MCA-3-DAT'), 
        'Saturday', 
        6, 
        '14:00', 
        '14:50';


    -- Saturday Period 7: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-3-OPE', 'Operating Systems', 'MCA-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '6864966e-2dae-484a-9b5c-6a7e70549baa', 
        (SELECT id FROM courses WHERE code = 'MCA-3-OPE'), 
        'Saturday', 
        7, 
        '15:00', 
        '15:40';


    -- Saturday Period 8: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-3-SOF', 'Software Project Management', 'MCA-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '7fed4e58-a055-4039-8a25-9ab74ef2395c', 
        (SELECT id FROM courses WHERE code = 'MCA-3-SOF'), 
        'Saturday', 
        8, 
        '15:40', 
        '16:20';

END $$;

DO $$
DECLARE
    v_ay_id UUID := 'd860d5fb-d5f0-4497-a7ea-073004d80500';
    v_sec_id UUID;
    v_course_ids UUID[];
    v_fac_id UUID;
    v_dept text := 'MCA';
BEGIN
    -- 1. Ensure Section Exists
    INSERT INTO class_sections (name, dept_code, academic_year_id, academic_year, year, semester, section)
    VALUES ('MCA-4-A', v_dept::department_code, v_ay_id, '2025-2026', 4, 8, 'A')
    ON CONFLICT (dept_code, academic_year_id, year, section) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO v_sec_id;

    -- If we missed ID (due to no update), fetch it
    IF v_sec_id IS NULL THEN
        SELECT id INTO v_sec_id FROM class_sections 
        WHERE dept_code = v_dept AND academic_year_id = v_ay_id AND year = 4 AND section = 'A';
    END IF;

    -- 2. Clear existing timetable for this section to avoid clutter
    DELETE FROM timetable WHERE class_section_id = v_sec_id;

    -- 3. Loop and Insert Periods


    -- Monday Period 1: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-4-CLO', 'Cloud Computing', 'MCA-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '581d8b7e-c8a4-407c-86f6-76a7ff199046', 
        (SELECT id FROM courses WHERE code = 'MCA-4-CLO'), 
        'Monday', 
        1, 
        '09:00', 
        '09:50';


    -- Monday Period 2: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-4-DEE', 'Deep Learning', 'MCA-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '67bc2b6f-7072-4188-b540-26850f13c842', 
        (SELECT id FROM courses WHERE code = 'MCA-4-DEE'), 
        'Monday', 
        2, 
        '09:50', 
        '10:40';


    -- Monday Period 3: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-4-DAT', 'Data Visualization', 'MCA-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '62d73dc9-d0f3-4515-8594-585c5784052c', 
        (SELECT id FROM courses WHERE code = 'MCA-4-DAT'), 
        'Monday', 
        3, 
        '10:50', 
        '11:40';


    -- Monday Period 4: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-4-OPE', 'Operating Systems', 'MCA-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '6864966e-2dae-484a-9b5c-6a7e70549baa', 
        (SELECT id FROM courses WHERE code = 'MCA-4-OPE'), 
        'Monday', 
        4, 
        '11:40', 
        '12:30';


    -- Monday Period 5: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-4-SOF', 'Software Project Management', 'MCA-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '7fed4e58-a055-4039-8a25-9ab74ef2395c', 
        (SELECT id FROM courses WHERE code = 'MCA-4-SOF'), 
        'Monday', 
        5, 
        '13:10', 
        '14:00';


    -- Monday Period 6: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-4-DEE', 'Deep Learning Lab', 'MCA-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '8d7708ac-dbe6-4f51-bb3c-c5fac99d2152', 
        (SELECT id FROM courses WHERE code = 'MCA-4-DEE'), 
        'Monday', 
        6, 
        '14:00', 
        '14:50';


    -- Monday Period 7: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-4-DAT', 'Data Visualization Lab', 'MCA-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '06ffc515-0829-4100-8d97-4f4572b189a5', 
        (SELECT id FROM courses WHERE code = 'MCA-4-DAT'), 
        'Monday', 
        7, 
        '15:00', 
        '15:40';


    -- Monday Period 8: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-4-COU', 'Counseling', 'MCA-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '0b3d9b81-dfde-44f5-8f9d-03c0e6c38714', 
        (SELECT id FROM courses WHERE code = 'MCA-4-COU'), 
        'Monday', 
        8, 
        '15:40', 
        '16:20';


    -- Tuesday Period 1: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-4-DEE', 'Deep Learning', 'MCA-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '67bc2b6f-7072-4188-b540-26850f13c842', 
        (SELECT id FROM courses WHERE code = 'MCA-4-DEE'), 
        'Tuesday', 
        1, 
        '09:00', 
        '09:50';


    -- Tuesday Period 2: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-4-DAT', 'Data Visualization', 'MCA-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '62d73dc9-d0f3-4515-8594-585c5784052c', 
        (SELECT id FROM courses WHERE code = 'MCA-4-DAT'), 
        'Tuesday', 
        2, 
        '09:50', 
        '10:40';


    -- Tuesday Period 3: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-4-OPE', 'Operating Systems', 'MCA-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '6864966e-2dae-484a-9b5c-6a7e70549baa', 
        (SELECT id FROM courses WHERE code = 'MCA-4-OPE'), 
        'Tuesday', 
        3, 
        '10:50', 
        '11:40';


    -- Tuesday Period 4: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-4-SOF', 'Software Project Management', 'MCA-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '7fed4e58-a055-4039-8a25-9ab74ef2395c', 
        (SELECT id FROM courses WHERE code = 'MCA-4-SOF'), 
        'Tuesday', 
        4, 
        '11:40', 
        '12:30';


    -- Tuesday Period 5: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-4-DEE', 'Deep Learning Lab', 'MCA-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '8d7708ac-dbe6-4f51-bb3c-c5fac99d2152', 
        (SELECT id FROM courses WHERE code = 'MCA-4-DEE'), 
        'Tuesday', 
        5, 
        '13:10', 
        '14:00';


    -- Tuesday Period 6: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-4-DAT', 'Data Visualization Lab', 'MCA-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '06ffc515-0829-4100-8d97-4f4572b189a5', 
        (SELECT id FROM courses WHERE code = 'MCA-4-DAT'), 
        'Tuesday', 
        6, 
        '14:00', 
        '14:50';


    -- Tuesday Period 7: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-4-COU', 'Counseling', 'MCA-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '0b3d9b81-dfde-44f5-8f9d-03c0e6c38714', 
        (SELECT id FROM courses WHERE code = 'MCA-4-COU'), 
        'Tuesday', 
        7, 
        '15:00', 
        '15:40';


    -- Tuesday Period 8: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-4-CLO', 'Cloud Computing', 'MCA-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '581d8b7e-c8a4-407c-86f6-76a7ff199046', 
        (SELECT id FROM courses WHERE code = 'MCA-4-CLO'), 
        'Tuesday', 
        8, 
        '15:40', 
        '16:20';


    -- Wednesday Period 1: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-4-DAT', 'Data Visualization', 'MCA-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '62d73dc9-d0f3-4515-8594-585c5784052c', 
        (SELECT id FROM courses WHERE code = 'MCA-4-DAT'), 
        'Wednesday', 
        1, 
        '09:00', 
        '09:50';


    -- Wednesday Period 2: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-4-OPE', 'Operating Systems', 'MCA-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '6864966e-2dae-484a-9b5c-6a7e70549baa', 
        (SELECT id FROM courses WHERE code = 'MCA-4-OPE'), 
        'Wednesday', 
        2, 
        '09:50', 
        '10:40';


    -- Wednesday Period 3: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-4-SOF', 'Software Project Management', 'MCA-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '7fed4e58-a055-4039-8a25-9ab74ef2395c', 
        (SELECT id FROM courses WHERE code = 'MCA-4-SOF'), 
        'Wednesday', 
        3, 
        '10:50', 
        '11:40';


    -- Wednesday Period 4: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-4-DEE', 'Deep Learning Lab', 'MCA-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '8d7708ac-dbe6-4f51-bb3c-c5fac99d2152', 
        (SELECT id FROM courses WHERE code = 'MCA-4-DEE'), 
        'Wednesday', 
        4, 
        '11:40', 
        '12:30';


    -- Wednesday Period 5: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-4-DAT', 'Data Visualization Lab', 'MCA-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '06ffc515-0829-4100-8d97-4f4572b189a5', 
        (SELECT id FROM courses WHERE code = 'MCA-4-DAT'), 
        'Wednesday', 
        5, 
        '13:10', 
        '14:00';


    -- Wednesday Period 6: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-4-COU', 'Counseling', 'MCA-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '0b3d9b81-dfde-44f5-8f9d-03c0e6c38714', 
        (SELECT id FROM courses WHERE code = 'MCA-4-COU'), 
        'Wednesday', 
        6, 
        '14:00', 
        '14:50';


    -- Wednesday Period 7: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-4-CLO', 'Cloud Computing', 'MCA-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '581d8b7e-c8a4-407c-86f6-76a7ff199046', 
        (SELECT id FROM courses WHERE code = 'MCA-4-CLO'), 
        'Wednesday', 
        7, 
        '15:00', 
        '15:40';


    -- Wednesday Period 8: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-4-DEE', 'Deep Learning', 'MCA-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '67bc2b6f-7072-4188-b540-26850f13c842', 
        (SELECT id FROM courses WHERE code = 'MCA-4-DEE'), 
        'Wednesday', 
        8, 
        '15:40', 
        '16:20';


    -- Thursday Period 1: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-4-OPE', 'Operating Systems', 'MCA-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '6864966e-2dae-484a-9b5c-6a7e70549baa', 
        (SELECT id FROM courses WHERE code = 'MCA-4-OPE'), 
        'Thursday', 
        1, 
        '09:00', 
        '09:50';


    -- Thursday Period 2: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-4-SOF', 'Software Project Management', 'MCA-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '7fed4e58-a055-4039-8a25-9ab74ef2395c', 
        (SELECT id FROM courses WHERE code = 'MCA-4-SOF'), 
        'Thursday', 
        2, 
        '09:50', 
        '10:40';


    -- Thursday Period 3: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-4-DEE', 'Deep Learning Lab', 'MCA-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '8d7708ac-dbe6-4f51-bb3c-c5fac99d2152', 
        (SELECT id FROM courses WHERE code = 'MCA-4-DEE'), 
        'Thursday', 
        3, 
        '10:50', 
        '11:40';


    -- Thursday Period 4: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-4-DAT', 'Data Visualization Lab', 'MCA-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '06ffc515-0829-4100-8d97-4f4572b189a5', 
        (SELECT id FROM courses WHERE code = 'MCA-4-DAT'), 
        'Thursday', 
        4, 
        '11:40', 
        '12:30';


    -- Thursday Period 5: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-4-COU', 'Counseling', 'MCA-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '0b3d9b81-dfde-44f5-8f9d-03c0e6c38714', 
        (SELECT id FROM courses WHERE code = 'MCA-4-COU'), 
        'Thursday', 
        5, 
        '13:10', 
        '14:00';


    -- Thursday Period 6: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-4-CLO', 'Cloud Computing', 'MCA-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '581d8b7e-c8a4-407c-86f6-76a7ff199046', 
        (SELECT id FROM courses WHERE code = 'MCA-4-CLO'), 
        'Thursday', 
        6, 
        '14:00', 
        '14:50';


    -- Thursday Period 7: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-4-DEE', 'Deep Learning', 'MCA-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '67bc2b6f-7072-4188-b540-26850f13c842', 
        (SELECT id FROM courses WHERE code = 'MCA-4-DEE'), 
        'Thursday', 
        7, 
        '15:00', 
        '15:40';


    -- Thursday Period 8: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-4-DAT', 'Data Visualization', 'MCA-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '62d73dc9-d0f3-4515-8594-585c5784052c', 
        (SELECT id FROM courses WHERE code = 'MCA-4-DAT'), 
        'Thursday', 
        8, 
        '15:40', 
        '16:20';


    -- Friday Period 1: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-4-SOF', 'Software Project Management', 'MCA-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '7fed4e58-a055-4039-8a25-9ab74ef2395c', 
        (SELECT id FROM courses WHERE code = 'MCA-4-SOF'), 
        'Friday', 
        1, 
        '09:00', 
        '09:50';


    -- Friday Period 2: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-4-DEE', 'Deep Learning Lab', 'MCA-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '8d7708ac-dbe6-4f51-bb3c-c5fac99d2152', 
        (SELECT id FROM courses WHERE code = 'MCA-4-DEE'), 
        'Friday', 
        2, 
        '09:50', 
        '10:40';


    -- Friday Period 3: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-4-DAT', 'Data Visualization Lab', 'MCA-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '06ffc515-0829-4100-8d97-4f4572b189a5', 
        (SELECT id FROM courses WHERE code = 'MCA-4-DAT'), 
        'Friday', 
        3, 
        '10:50', 
        '11:40';


    -- Friday Period 4: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-4-COU', 'Counseling', 'MCA-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '0b3d9b81-dfde-44f5-8f9d-03c0e6c38714', 
        (SELECT id FROM courses WHERE code = 'MCA-4-COU'), 
        'Friday', 
        4, 
        '11:40', 
        '12:30';


    -- Friday Period 5: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-4-CLO', 'Cloud Computing', 'MCA-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '581d8b7e-c8a4-407c-86f6-76a7ff199046', 
        (SELECT id FROM courses WHERE code = 'MCA-4-CLO'), 
        'Friday', 
        5, 
        '13:10', 
        '14:00';


    -- Friday Period 6: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-4-DEE', 'Deep Learning', 'MCA-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '67bc2b6f-7072-4188-b540-26850f13c842', 
        (SELECT id FROM courses WHERE code = 'MCA-4-DEE'), 
        'Friday', 
        6, 
        '14:00', 
        '14:50';


    -- Friday Period 7: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-4-DAT', 'Data Visualization', 'MCA-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '62d73dc9-d0f3-4515-8594-585c5784052c', 
        (SELECT id FROM courses WHERE code = 'MCA-4-DAT'), 
        'Friday', 
        7, 
        '15:00', 
        '15:40';


    -- Friday Period 8: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-4-OPE', 'Operating Systems', 'MCA-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '6864966e-2dae-484a-9b5c-6a7e70549baa', 
        (SELECT id FROM courses WHERE code = 'MCA-4-OPE'), 
        'Friday', 
        8, 
        '15:40', 
        '16:20';


    -- Saturday Period 1: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-4-DEE', 'Deep Learning Lab', 'MCA-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '8d7708ac-dbe6-4f51-bb3c-c5fac99d2152', 
        (SELECT id FROM courses WHERE code = 'MCA-4-DEE'), 
        'Saturday', 
        1, 
        '09:00', 
        '09:50';


    -- Saturday Period 2: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-4-DAT', 'Data Visualization Lab', 'MCA-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '06ffc515-0829-4100-8d97-4f4572b189a5', 
        (SELECT id FROM courses WHERE code = 'MCA-4-DAT'), 
        'Saturday', 
        2, 
        '09:50', 
        '10:40';


    -- Saturday Period 3: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-4-COU', 'Counseling', 'MCA-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '0b3d9b81-dfde-44f5-8f9d-03c0e6c38714', 
        (SELECT id FROM courses WHERE code = 'MCA-4-COU'), 
        'Saturday', 
        3, 
        '10:50', 
        '11:40';


    -- Saturday Period 4: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-4-CLO', 'Cloud Computing', 'MCA-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '581d8b7e-c8a4-407c-86f6-76a7ff199046', 
        (SELECT id FROM courses WHERE code = 'MCA-4-CLO'), 
        'Saturday', 
        4, 
        '11:40', 
        '12:30';


    -- Saturday Period 5: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-4-DEE', 'Deep Learning', 'MCA-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '67bc2b6f-7072-4188-b540-26850f13c842', 
        (SELECT id FROM courses WHERE code = 'MCA-4-DEE'), 
        'Saturday', 
        5, 
        '13:10', 
        '14:00';


    -- Saturday Period 6: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-4-DAT', 'Data Visualization', 'MCA-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '62d73dc9-d0f3-4515-8594-585c5784052c', 
        (SELECT id FROM courses WHERE code = 'MCA-4-DAT'), 
        'Saturday', 
        6, 
        '14:00', 
        '14:50';


    -- Saturday Period 7: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-4-OPE', 'Operating Systems', 'MCA-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '6864966e-2dae-484a-9b5c-6a7e70549baa', 
        (SELECT id FROM courses WHERE code = 'MCA-4-OPE'), 
        'Saturday', 
        7, 
        '15:00', 
        '15:40';


    -- Saturday Period 8: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('MCA-4-SOF', 'Software Project Management', 'MCA-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '7fed4e58-a055-4039-8a25-9ab74ef2395c', 
        (SELECT id FROM courses WHERE code = 'MCA-4-SOF'), 
        'Saturday', 
        8, 
        '15:40', 
        '16:20';

END $$;

DO $$
DECLARE
    v_ay_id UUID := 'd860d5fb-d5f0-4497-a7ea-073004d80500';
    v_sec_id UUID;
    v_course_ids UUID[];
    v_fac_id UUID;
    v_dept text := 'BSH';
BEGIN
    -- 1. Ensure Section Exists
    INSERT INTO class_sections (name, dept_code, academic_year_id, academic_year, year, semester, section)
    VALUES ('BSH-2-A', v_dept::department_code, v_ay_id, '2025-2026', 2, 4, 'A')
    ON CONFLICT (dept_code, academic_year_id, year, section) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO v_sec_id;

    -- If we missed ID (due to no update), fetch it
    IF v_sec_id IS NULL THEN
        SELECT id INTO v_sec_id FROM class_sections 
        WHERE dept_code = v_dept AND academic_year_id = v_ay_id AND year = 2 AND section = 'A';
    END IF;

    -- 2. Clear existing timetable for this section to avoid clutter
    DELETE FROM timetable WHERE class_section_id = v_sec_id;

    -- 3. Loop and Insert Periods


    -- Monday Period 1: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-2-CLO', 'Cloud Computing', 'BSH-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4df1e62b-1692-491a-b317-d624d11258df', 
        (SELECT id FROM courses WHERE code = 'BSH-2-CLO'), 
        'Monday', 
        1, 
        '09:00', 
        '09:50';


    -- Monday Period 2: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-2-DEE', 'Deep Learning', 'BSH-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '382c9c98-7e45-4041-8371-fbfdbb10bc28', 
        (SELECT id FROM courses WHERE code = 'BSH-2-DEE'), 
        'Monday', 
        2, 
        '09:50', 
        '10:40';


    -- Monday Period 3: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-2-DAT', 'Data Visualization', 'BSH-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '2cf44e1c-0b37-4606-bcf5-be2e7e37226a', 
        (SELECT id FROM courses WHERE code = 'BSH-2-DAT'), 
        'Monday', 
        3, 
        '10:50', 
        '11:40';


    -- Monday Period 4: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-2-OPE', 'Operating Systems', 'BSH-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '59129e64-442b-4821-bed3-5c1ed24d92c1', 
        (SELECT id FROM courses WHERE code = 'BSH-2-OPE'), 
        'Monday', 
        4, 
        '11:40', 
        '12:30';


    -- Monday Period 5: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-2-SOF', 'Software Project Management', 'BSH-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'b0f25938-0ba3-42aa-84a2-7ebec962fd56', 
        (SELECT id FROM courses WHERE code = 'BSH-2-SOF'), 
        'Monday', 
        5, 
        '13:10', 
        '14:00';


    -- Monday Period 6: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-2-DEE', 'Deep Learning Lab', 'BSH-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c51b488d-3bb6-4883-b65a-96711b44da91', 
        (SELECT id FROM courses WHERE code = 'BSH-2-DEE'), 
        'Monday', 
        6, 
        '14:00', 
        '14:50';


    -- Monday Period 7: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-2-DAT', 'Data Visualization Lab', 'BSH-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4a455773-c31b-4fab-8d47-f80aedbde2b2', 
        (SELECT id FROM courses WHERE code = 'BSH-2-DAT'), 
        'Monday', 
        7, 
        '15:00', 
        '15:40';


    -- Monday Period 8: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-2-COU', 'Counseling', 'BSH-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'be93b8cf-e8d0-4137-9277-a6d7a6d9dd63', 
        (SELECT id FROM courses WHERE code = 'BSH-2-COU'), 
        'Monday', 
        8, 
        '15:40', 
        '16:20';


    -- Tuesday Period 1: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-2-DEE', 'Deep Learning', 'BSH-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '382c9c98-7e45-4041-8371-fbfdbb10bc28', 
        (SELECT id FROM courses WHERE code = 'BSH-2-DEE'), 
        'Tuesday', 
        1, 
        '09:00', 
        '09:50';


    -- Tuesday Period 2: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-2-DAT', 'Data Visualization', 'BSH-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '2cf44e1c-0b37-4606-bcf5-be2e7e37226a', 
        (SELECT id FROM courses WHERE code = 'BSH-2-DAT'), 
        'Tuesday', 
        2, 
        '09:50', 
        '10:40';


    -- Tuesday Period 3: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-2-OPE', 'Operating Systems', 'BSH-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '59129e64-442b-4821-bed3-5c1ed24d92c1', 
        (SELECT id FROM courses WHERE code = 'BSH-2-OPE'), 
        'Tuesday', 
        3, 
        '10:50', 
        '11:40';


    -- Tuesday Period 4: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-2-SOF', 'Software Project Management', 'BSH-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'b0f25938-0ba3-42aa-84a2-7ebec962fd56', 
        (SELECT id FROM courses WHERE code = 'BSH-2-SOF'), 
        'Tuesday', 
        4, 
        '11:40', 
        '12:30';


    -- Tuesday Period 5: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-2-DEE', 'Deep Learning Lab', 'BSH-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c51b488d-3bb6-4883-b65a-96711b44da91', 
        (SELECT id FROM courses WHERE code = 'BSH-2-DEE'), 
        'Tuesday', 
        5, 
        '13:10', 
        '14:00';


    -- Tuesday Period 6: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-2-DAT', 'Data Visualization Lab', 'BSH-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4a455773-c31b-4fab-8d47-f80aedbde2b2', 
        (SELECT id FROM courses WHERE code = 'BSH-2-DAT'), 
        'Tuesday', 
        6, 
        '14:00', 
        '14:50';


    -- Tuesday Period 7: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-2-COU', 'Counseling', 'BSH-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'be93b8cf-e8d0-4137-9277-a6d7a6d9dd63', 
        (SELECT id FROM courses WHERE code = 'BSH-2-COU'), 
        'Tuesday', 
        7, 
        '15:00', 
        '15:40';


    -- Tuesday Period 8: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-2-CLO', 'Cloud Computing', 'BSH-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4df1e62b-1692-491a-b317-d624d11258df', 
        (SELECT id FROM courses WHERE code = 'BSH-2-CLO'), 
        'Tuesday', 
        8, 
        '15:40', 
        '16:20';


    -- Wednesday Period 1: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-2-DAT', 'Data Visualization', 'BSH-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '2cf44e1c-0b37-4606-bcf5-be2e7e37226a', 
        (SELECT id FROM courses WHERE code = 'BSH-2-DAT'), 
        'Wednesday', 
        1, 
        '09:00', 
        '09:50';


    -- Wednesday Period 2: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-2-OPE', 'Operating Systems', 'BSH-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '59129e64-442b-4821-bed3-5c1ed24d92c1', 
        (SELECT id FROM courses WHERE code = 'BSH-2-OPE'), 
        'Wednesday', 
        2, 
        '09:50', 
        '10:40';


    -- Wednesday Period 3: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-2-SOF', 'Software Project Management', 'BSH-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'b0f25938-0ba3-42aa-84a2-7ebec962fd56', 
        (SELECT id FROM courses WHERE code = 'BSH-2-SOF'), 
        'Wednesday', 
        3, 
        '10:50', 
        '11:40';


    -- Wednesday Period 4: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-2-DEE', 'Deep Learning Lab', 'BSH-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c51b488d-3bb6-4883-b65a-96711b44da91', 
        (SELECT id FROM courses WHERE code = 'BSH-2-DEE'), 
        'Wednesday', 
        4, 
        '11:40', 
        '12:30';


    -- Wednesday Period 5: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-2-DAT', 'Data Visualization Lab', 'BSH-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4a455773-c31b-4fab-8d47-f80aedbde2b2', 
        (SELECT id FROM courses WHERE code = 'BSH-2-DAT'), 
        'Wednesday', 
        5, 
        '13:10', 
        '14:00';


    -- Wednesday Period 6: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-2-COU', 'Counseling', 'BSH-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'be93b8cf-e8d0-4137-9277-a6d7a6d9dd63', 
        (SELECT id FROM courses WHERE code = 'BSH-2-COU'), 
        'Wednesday', 
        6, 
        '14:00', 
        '14:50';


    -- Wednesday Period 7: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-2-CLO', 'Cloud Computing', 'BSH-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4df1e62b-1692-491a-b317-d624d11258df', 
        (SELECT id FROM courses WHERE code = 'BSH-2-CLO'), 
        'Wednesday', 
        7, 
        '15:00', 
        '15:40';


    -- Wednesday Period 8: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-2-DEE', 'Deep Learning', 'BSH-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '382c9c98-7e45-4041-8371-fbfdbb10bc28', 
        (SELECT id FROM courses WHERE code = 'BSH-2-DEE'), 
        'Wednesday', 
        8, 
        '15:40', 
        '16:20';


    -- Thursday Period 1: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-2-OPE', 'Operating Systems', 'BSH-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '59129e64-442b-4821-bed3-5c1ed24d92c1', 
        (SELECT id FROM courses WHERE code = 'BSH-2-OPE'), 
        'Thursday', 
        1, 
        '09:00', 
        '09:50';


    -- Thursday Period 2: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-2-SOF', 'Software Project Management', 'BSH-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'b0f25938-0ba3-42aa-84a2-7ebec962fd56', 
        (SELECT id FROM courses WHERE code = 'BSH-2-SOF'), 
        'Thursday', 
        2, 
        '09:50', 
        '10:40';


    -- Thursday Period 3: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-2-DEE', 'Deep Learning Lab', 'BSH-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c51b488d-3bb6-4883-b65a-96711b44da91', 
        (SELECT id FROM courses WHERE code = 'BSH-2-DEE'), 
        'Thursday', 
        3, 
        '10:50', 
        '11:40';


    -- Thursday Period 4: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-2-DAT', 'Data Visualization Lab', 'BSH-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4a455773-c31b-4fab-8d47-f80aedbde2b2', 
        (SELECT id FROM courses WHERE code = 'BSH-2-DAT'), 
        'Thursday', 
        4, 
        '11:40', 
        '12:30';


    -- Thursday Period 5: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-2-COU', 'Counseling', 'BSH-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'be93b8cf-e8d0-4137-9277-a6d7a6d9dd63', 
        (SELECT id FROM courses WHERE code = 'BSH-2-COU'), 
        'Thursday', 
        5, 
        '13:10', 
        '14:00';


    -- Thursday Period 6: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-2-CLO', 'Cloud Computing', 'BSH-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4df1e62b-1692-491a-b317-d624d11258df', 
        (SELECT id FROM courses WHERE code = 'BSH-2-CLO'), 
        'Thursday', 
        6, 
        '14:00', 
        '14:50';


    -- Thursday Period 7: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-2-DEE', 'Deep Learning', 'BSH-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '382c9c98-7e45-4041-8371-fbfdbb10bc28', 
        (SELECT id FROM courses WHERE code = 'BSH-2-DEE'), 
        'Thursday', 
        7, 
        '15:00', 
        '15:40';


    -- Thursday Period 8: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-2-DAT', 'Data Visualization', 'BSH-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '2cf44e1c-0b37-4606-bcf5-be2e7e37226a', 
        (SELECT id FROM courses WHERE code = 'BSH-2-DAT'), 
        'Thursday', 
        8, 
        '15:40', 
        '16:20';


    -- Friday Period 1: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-2-SOF', 'Software Project Management', 'BSH-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'b0f25938-0ba3-42aa-84a2-7ebec962fd56', 
        (SELECT id FROM courses WHERE code = 'BSH-2-SOF'), 
        'Friday', 
        1, 
        '09:00', 
        '09:50';


    -- Friday Period 2: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-2-DEE', 'Deep Learning Lab', 'BSH-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c51b488d-3bb6-4883-b65a-96711b44da91', 
        (SELECT id FROM courses WHERE code = 'BSH-2-DEE'), 
        'Friday', 
        2, 
        '09:50', 
        '10:40';


    -- Friday Period 3: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-2-DAT', 'Data Visualization Lab', 'BSH-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4a455773-c31b-4fab-8d47-f80aedbde2b2', 
        (SELECT id FROM courses WHERE code = 'BSH-2-DAT'), 
        'Friday', 
        3, 
        '10:50', 
        '11:40';


    -- Friday Period 4: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-2-COU', 'Counseling', 'BSH-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'be93b8cf-e8d0-4137-9277-a6d7a6d9dd63', 
        (SELECT id FROM courses WHERE code = 'BSH-2-COU'), 
        'Friday', 
        4, 
        '11:40', 
        '12:30';


    -- Friday Period 5: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-2-CLO', 'Cloud Computing', 'BSH-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4df1e62b-1692-491a-b317-d624d11258df', 
        (SELECT id FROM courses WHERE code = 'BSH-2-CLO'), 
        'Friday', 
        5, 
        '13:10', 
        '14:00';


    -- Friday Period 6: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-2-DEE', 'Deep Learning', 'BSH-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '382c9c98-7e45-4041-8371-fbfdbb10bc28', 
        (SELECT id FROM courses WHERE code = 'BSH-2-DEE'), 
        'Friday', 
        6, 
        '14:00', 
        '14:50';


    -- Friday Period 7: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-2-DAT', 'Data Visualization', 'BSH-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '2cf44e1c-0b37-4606-bcf5-be2e7e37226a', 
        (SELECT id FROM courses WHERE code = 'BSH-2-DAT'), 
        'Friday', 
        7, 
        '15:00', 
        '15:40';


    -- Friday Period 8: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-2-OPE', 'Operating Systems', 'BSH-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '59129e64-442b-4821-bed3-5c1ed24d92c1', 
        (SELECT id FROM courses WHERE code = 'BSH-2-OPE'), 
        'Friday', 
        8, 
        '15:40', 
        '16:20';


    -- Saturday Period 1: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-2-DEE', 'Deep Learning Lab', 'BSH-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c51b488d-3bb6-4883-b65a-96711b44da91', 
        (SELECT id FROM courses WHERE code = 'BSH-2-DEE'), 
        'Saturday', 
        1, 
        '09:00', 
        '09:50';


    -- Saturday Period 2: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-2-DAT', 'Data Visualization Lab', 'BSH-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4a455773-c31b-4fab-8d47-f80aedbde2b2', 
        (SELECT id FROM courses WHERE code = 'BSH-2-DAT'), 
        'Saturday', 
        2, 
        '09:50', 
        '10:40';


    -- Saturday Period 3: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-2-COU', 'Counseling', 'BSH-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'be93b8cf-e8d0-4137-9277-a6d7a6d9dd63', 
        (SELECT id FROM courses WHERE code = 'BSH-2-COU'), 
        'Saturday', 
        3, 
        '10:50', 
        '11:40';


    -- Saturday Period 4: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-2-CLO', 'Cloud Computing', 'BSH-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4df1e62b-1692-491a-b317-d624d11258df', 
        (SELECT id FROM courses WHERE code = 'BSH-2-CLO'), 
        'Saturday', 
        4, 
        '11:40', 
        '12:30';


    -- Saturday Period 5: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-2-DEE', 'Deep Learning', 'BSH-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '382c9c98-7e45-4041-8371-fbfdbb10bc28', 
        (SELECT id FROM courses WHERE code = 'BSH-2-DEE'), 
        'Saturday', 
        5, 
        '13:10', 
        '14:00';


    -- Saturday Period 6: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-2-DAT', 'Data Visualization', 'BSH-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '2cf44e1c-0b37-4606-bcf5-be2e7e37226a', 
        (SELECT id FROM courses WHERE code = 'BSH-2-DAT'), 
        'Saturday', 
        6, 
        '14:00', 
        '14:50';


    -- Saturday Period 7: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-2-OPE', 'Operating Systems', 'BSH-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '59129e64-442b-4821-bed3-5c1ed24d92c1', 
        (SELECT id FROM courses WHERE code = 'BSH-2-OPE'), 
        'Saturday', 
        7, 
        '15:00', 
        '15:40';


    -- Saturday Period 8: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-2-SOF', 'Software Project Management', 'BSH-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'b0f25938-0ba3-42aa-84a2-7ebec962fd56', 
        (SELECT id FROM courses WHERE code = 'BSH-2-SOF'), 
        'Saturday', 
        8, 
        '15:40', 
        '16:20';

END $$;

DO $$
DECLARE
    v_ay_id UUID := 'd860d5fb-d5f0-4497-a7ea-073004d80500';
    v_sec_id UUID;
    v_course_ids UUID[];
    v_fac_id UUID;
    v_dept text := 'BSH';
BEGIN
    -- 1. Ensure Section Exists
    INSERT INTO class_sections (name, dept_code, academic_year_id, academic_year, year, semester, section)
    VALUES ('BSH-3-A', v_dept::department_code, v_ay_id, '2025-2026', 3, 6, 'A')
    ON CONFLICT (dept_code, academic_year_id, year, section) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO v_sec_id;

    -- If we missed ID (due to no update), fetch it
    IF v_sec_id IS NULL THEN
        SELECT id INTO v_sec_id FROM class_sections 
        WHERE dept_code = v_dept AND academic_year_id = v_ay_id AND year = 3 AND section = 'A';
    END IF;

    -- 2. Clear existing timetable for this section to avoid clutter
    DELETE FROM timetable WHERE class_section_id = v_sec_id;

    -- 3. Loop and Insert Periods


    -- Monday Period 1: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-3-CLO', 'Cloud Computing', 'BSH-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4df1e62b-1692-491a-b317-d624d11258df', 
        (SELECT id FROM courses WHERE code = 'BSH-3-CLO'), 
        'Monday', 
        1, 
        '09:00', 
        '09:50';


    -- Monday Period 2: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-3-DEE', 'Deep Learning', 'BSH-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '382c9c98-7e45-4041-8371-fbfdbb10bc28', 
        (SELECT id FROM courses WHERE code = 'BSH-3-DEE'), 
        'Monday', 
        2, 
        '09:50', 
        '10:40';


    -- Monday Period 3: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-3-DAT', 'Data Visualization', 'BSH-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '2cf44e1c-0b37-4606-bcf5-be2e7e37226a', 
        (SELECT id FROM courses WHERE code = 'BSH-3-DAT'), 
        'Monday', 
        3, 
        '10:50', 
        '11:40';


    -- Monday Period 4: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-3-OPE', 'Operating Systems', 'BSH-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '59129e64-442b-4821-bed3-5c1ed24d92c1', 
        (SELECT id FROM courses WHERE code = 'BSH-3-OPE'), 
        'Monday', 
        4, 
        '11:40', 
        '12:30';


    -- Monday Period 5: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-3-SOF', 'Software Project Management', 'BSH-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'b0f25938-0ba3-42aa-84a2-7ebec962fd56', 
        (SELECT id FROM courses WHERE code = 'BSH-3-SOF'), 
        'Monday', 
        5, 
        '13:10', 
        '14:00';


    -- Monday Period 6: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-3-DEE', 'Deep Learning Lab', 'BSH-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c51b488d-3bb6-4883-b65a-96711b44da91', 
        (SELECT id FROM courses WHERE code = 'BSH-3-DEE'), 
        'Monday', 
        6, 
        '14:00', 
        '14:50';


    -- Monday Period 7: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-3-DAT', 'Data Visualization Lab', 'BSH-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4a455773-c31b-4fab-8d47-f80aedbde2b2', 
        (SELECT id FROM courses WHERE code = 'BSH-3-DAT'), 
        'Monday', 
        7, 
        '15:00', 
        '15:40';


    -- Monday Period 8: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-3-COU', 'Counseling', 'BSH-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'be93b8cf-e8d0-4137-9277-a6d7a6d9dd63', 
        (SELECT id FROM courses WHERE code = 'BSH-3-COU'), 
        'Monday', 
        8, 
        '15:40', 
        '16:20';


    -- Tuesday Period 1: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-3-DEE', 'Deep Learning', 'BSH-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '382c9c98-7e45-4041-8371-fbfdbb10bc28', 
        (SELECT id FROM courses WHERE code = 'BSH-3-DEE'), 
        'Tuesday', 
        1, 
        '09:00', 
        '09:50';


    -- Tuesday Period 2: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-3-DAT', 'Data Visualization', 'BSH-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '2cf44e1c-0b37-4606-bcf5-be2e7e37226a', 
        (SELECT id FROM courses WHERE code = 'BSH-3-DAT'), 
        'Tuesday', 
        2, 
        '09:50', 
        '10:40';


    -- Tuesday Period 3: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-3-OPE', 'Operating Systems', 'BSH-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '59129e64-442b-4821-bed3-5c1ed24d92c1', 
        (SELECT id FROM courses WHERE code = 'BSH-3-OPE'), 
        'Tuesday', 
        3, 
        '10:50', 
        '11:40';


    -- Tuesday Period 4: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-3-SOF', 'Software Project Management', 'BSH-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'b0f25938-0ba3-42aa-84a2-7ebec962fd56', 
        (SELECT id FROM courses WHERE code = 'BSH-3-SOF'), 
        'Tuesday', 
        4, 
        '11:40', 
        '12:30';


    -- Tuesday Period 5: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-3-DEE', 'Deep Learning Lab', 'BSH-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c51b488d-3bb6-4883-b65a-96711b44da91', 
        (SELECT id FROM courses WHERE code = 'BSH-3-DEE'), 
        'Tuesday', 
        5, 
        '13:10', 
        '14:00';


    -- Tuesday Period 6: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-3-DAT', 'Data Visualization Lab', 'BSH-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4a455773-c31b-4fab-8d47-f80aedbde2b2', 
        (SELECT id FROM courses WHERE code = 'BSH-3-DAT'), 
        'Tuesday', 
        6, 
        '14:00', 
        '14:50';


    -- Tuesday Period 7: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-3-COU', 'Counseling', 'BSH-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'be93b8cf-e8d0-4137-9277-a6d7a6d9dd63', 
        (SELECT id FROM courses WHERE code = 'BSH-3-COU'), 
        'Tuesday', 
        7, 
        '15:00', 
        '15:40';


    -- Tuesday Period 8: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-3-CLO', 'Cloud Computing', 'BSH-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4df1e62b-1692-491a-b317-d624d11258df', 
        (SELECT id FROM courses WHERE code = 'BSH-3-CLO'), 
        'Tuesday', 
        8, 
        '15:40', 
        '16:20';


    -- Wednesday Period 1: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-3-DAT', 'Data Visualization', 'BSH-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '2cf44e1c-0b37-4606-bcf5-be2e7e37226a', 
        (SELECT id FROM courses WHERE code = 'BSH-3-DAT'), 
        'Wednesday', 
        1, 
        '09:00', 
        '09:50';


    -- Wednesday Period 2: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-3-OPE', 'Operating Systems', 'BSH-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '59129e64-442b-4821-bed3-5c1ed24d92c1', 
        (SELECT id FROM courses WHERE code = 'BSH-3-OPE'), 
        'Wednesday', 
        2, 
        '09:50', 
        '10:40';


    -- Wednesday Period 3: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-3-SOF', 'Software Project Management', 'BSH-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'b0f25938-0ba3-42aa-84a2-7ebec962fd56', 
        (SELECT id FROM courses WHERE code = 'BSH-3-SOF'), 
        'Wednesday', 
        3, 
        '10:50', 
        '11:40';


    -- Wednesday Period 4: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-3-DEE', 'Deep Learning Lab', 'BSH-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c51b488d-3bb6-4883-b65a-96711b44da91', 
        (SELECT id FROM courses WHERE code = 'BSH-3-DEE'), 
        'Wednesday', 
        4, 
        '11:40', 
        '12:30';


    -- Wednesday Period 5: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-3-DAT', 'Data Visualization Lab', 'BSH-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4a455773-c31b-4fab-8d47-f80aedbde2b2', 
        (SELECT id FROM courses WHERE code = 'BSH-3-DAT'), 
        'Wednesday', 
        5, 
        '13:10', 
        '14:00';


    -- Wednesday Period 6: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-3-COU', 'Counseling', 'BSH-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'be93b8cf-e8d0-4137-9277-a6d7a6d9dd63', 
        (SELECT id FROM courses WHERE code = 'BSH-3-COU'), 
        'Wednesday', 
        6, 
        '14:00', 
        '14:50';


    -- Wednesday Period 7: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-3-CLO', 'Cloud Computing', 'BSH-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4df1e62b-1692-491a-b317-d624d11258df', 
        (SELECT id FROM courses WHERE code = 'BSH-3-CLO'), 
        'Wednesday', 
        7, 
        '15:00', 
        '15:40';


    -- Wednesday Period 8: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-3-DEE', 'Deep Learning', 'BSH-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '382c9c98-7e45-4041-8371-fbfdbb10bc28', 
        (SELECT id FROM courses WHERE code = 'BSH-3-DEE'), 
        'Wednesday', 
        8, 
        '15:40', 
        '16:20';


    -- Thursday Period 1: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-3-OPE', 'Operating Systems', 'BSH-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '59129e64-442b-4821-bed3-5c1ed24d92c1', 
        (SELECT id FROM courses WHERE code = 'BSH-3-OPE'), 
        'Thursday', 
        1, 
        '09:00', 
        '09:50';


    -- Thursday Period 2: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-3-SOF', 'Software Project Management', 'BSH-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'b0f25938-0ba3-42aa-84a2-7ebec962fd56', 
        (SELECT id FROM courses WHERE code = 'BSH-3-SOF'), 
        'Thursday', 
        2, 
        '09:50', 
        '10:40';


    -- Thursday Period 3: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-3-DEE', 'Deep Learning Lab', 'BSH-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c51b488d-3bb6-4883-b65a-96711b44da91', 
        (SELECT id FROM courses WHERE code = 'BSH-3-DEE'), 
        'Thursday', 
        3, 
        '10:50', 
        '11:40';


    -- Thursday Period 4: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-3-DAT', 'Data Visualization Lab', 'BSH-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4a455773-c31b-4fab-8d47-f80aedbde2b2', 
        (SELECT id FROM courses WHERE code = 'BSH-3-DAT'), 
        'Thursday', 
        4, 
        '11:40', 
        '12:30';


    -- Thursday Period 5: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-3-COU', 'Counseling', 'BSH-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'be93b8cf-e8d0-4137-9277-a6d7a6d9dd63', 
        (SELECT id FROM courses WHERE code = 'BSH-3-COU'), 
        'Thursday', 
        5, 
        '13:10', 
        '14:00';


    -- Thursday Period 6: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-3-CLO', 'Cloud Computing', 'BSH-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4df1e62b-1692-491a-b317-d624d11258df', 
        (SELECT id FROM courses WHERE code = 'BSH-3-CLO'), 
        'Thursday', 
        6, 
        '14:00', 
        '14:50';


    -- Thursday Period 7: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-3-DEE', 'Deep Learning', 'BSH-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '382c9c98-7e45-4041-8371-fbfdbb10bc28', 
        (SELECT id FROM courses WHERE code = 'BSH-3-DEE'), 
        'Thursday', 
        7, 
        '15:00', 
        '15:40';


    -- Thursday Period 8: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-3-DAT', 'Data Visualization', 'BSH-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '2cf44e1c-0b37-4606-bcf5-be2e7e37226a', 
        (SELECT id FROM courses WHERE code = 'BSH-3-DAT'), 
        'Thursday', 
        8, 
        '15:40', 
        '16:20';


    -- Friday Period 1: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-3-SOF', 'Software Project Management', 'BSH-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'b0f25938-0ba3-42aa-84a2-7ebec962fd56', 
        (SELECT id FROM courses WHERE code = 'BSH-3-SOF'), 
        'Friday', 
        1, 
        '09:00', 
        '09:50';


    -- Friday Period 2: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-3-DEE', 'Deep Learning Lab', 'BSH-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c51b488d-3bb6-4883-b65a-96711b44da91', 
        (SELECT id FROM courses WHERE code = 'BSH-3-DEE'), 
        'Friday', 
        2, 
        '09:50', 
        '10:40';


    -- Friday Period 3: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-3-DAT', 'Data Visualization Lab', 'BSH-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4a455773-c31b-4fab-8d47-f80aedbde2b2', 
        (SELECT id FROM courses WHERE code = 'BSH-3-DAT'), 
        'Friday', 
        3, 
        '10:50', 
        '11:40';


    -- Friday Period 4: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-3-COU', 'Counseling', 'BSH-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'be93b8cf-e8d0-4137-9277-a6d7a6d9dd63', 
        (SELECT id FROM courses WHERE code = 'BSH-3-COU'), 
        'Friday', 
        4, 
        '11:40', 
        '12:30';


    -- Friday Period 5: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-3-CLO', 'Cloud Computing', 'BSH-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4df1e62b-1692-491a-b317-d624d11258df', 
        (SELECT id FROM courses WHERE code = 'BSH-3-CLO'), 
        'Friday', 
        5, 
        '13:10', 
        '14:00';


    -- Friday Period 6: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-3-DEE', 'Deep Learning', 'BSH-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '382c9c98-7e45-4041-8371-fbfdbb10bc28', 
        (SELECT id FROM courses WHERE code = 'BSH-3-DEE'), 
        'Friday', 
        6, 
        '14:00', 
        '14:50';


    -- Friday Period 7: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-3-DAT', 'Data Visualization', 'BSH-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '2cf44e1c-0b37-4606-bcf5-be2e7e37226a', 
        (SELECT id FROM courses WHERE code = 'BSH-3-DAT'), 
        'Friday', 
        7, 
        '15:00', 
        '15:40';


    -- Friday Period 8: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-3-OPE', 'Operating Systems', 'BSH-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '59129e64-442b-4821-bed3-5c1ed24d92c1', 
        (SELECT id FROM courses WHERE code = 'BSH-3-OPE'), 
        'Friday', 
        8, 
        '15:40', 
        '16:20';


    -- Saturday Period 1: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-3-DEE', 'Deep Learning Lab', 'BSH-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c51b488d-3bb6-4883-b65a-96711b44da91', 
        (SELECT id FROM courses WHERE code = 'BSH-3-DEE'), 
        'Saturday', 
        1, 
        '09:00', 
        '09:50';


    -- Saturday Period 2: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-3-DAT', 'Data Visualization Lab', 'BSH-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4a455773-c31b-4fab-8d47-f80aedbde2b2', 
        (SELECT id FROM courses WHERE code = 'BSH-3-DAT'), 
        'Saturday', 
        2, 
        '09:50', 
        '10:40';


    -- Saturday Period 3: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-3-COU', 'Counseling', 'BSH-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'be93b8cf-e8d0-4137-9277-a6d7a6d9dd63', 
        (SELECT id FROM courses WHERE code = 'BSH-3-COU'), 
        'Saturday', 
        3, 
        '10:50', 
        '11:40';


    -- Saturday Period 4: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-3-CLO', 'Cloud Computing', 'BSH-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4df1e62b-1692-491a-b317-d624d11258df', 
        (SELECT id FROM courses WHERE code = 'BSH-3-CLO'), 
        'Saturday', 
        4, 
        '11:40', 
        '12:30';


    -- Saturday Period 5: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-3-DEE', 'Deep Learning', 'BSH-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '382c9c98-7e45-4041-8371-fbfdbb10bc28', 
        (SELECT id FROM courses WHERE code = 'BSH-3-DEE'), 
        'Saturday', 
        5, 
        '13:10', 
        '14:00';


    -- Saturday Period 6: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-3-DAT', 'Data Visualization', 'BSH-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '2cf44e1c-0b37-4606-bcf5-be2e7e37226a', 
        (SELECT id FROM courses WHERE code = 'BSH-3-DAT'), 
        'Saturday', 
        6, 
        '14:00', 
        '14:50';


    -- Saturday Period 7: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-3-OPE', 'Operating Systems', 'BSH-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '59129e64-442b-4821-bed3-5c1ed24d92c1', 
        (SELECT id FROM courses WHERE code = 'BSH-3-OPE'), 
        'Saturday', 
        7, 
        '15:00', 
        '15:40';


    -- Saturday Period 8: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-3-SOF', 'Software Project Management', 'BSH-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'b0f25938-0ba3-42aa-84a2-7ebec962fd56', 
        (SELECT id FROM courses WHERE code = 'BSH-3-SOF'), 
        'Saturday', 
        8, 
        '15:40', 
        '16:20';

END $$;

DO $$
DECLARE
    v_ay_id UUID := 'd860d5fb-d5f0-4497-a7ea-073004d80500';
    v_sec_id UUID;
    v_course_ids UUID[];
    v_fac_id UUID;
    v_dept text := 'BSH';
BEGIN
    -- 1. Ensure Section Exists
    INSERT INTO class_sections (name, dept_code, academic_year_id, academic_year, year, semester, section)
    VALUES ('BSH-4-A', v_dept::department_code, v_ay_id, '2025-2026', 4, 8, 'A')
    ON CONFLICT (dept_code, academic_year_id, year, section) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO v_sec_id;

    -- If we missed ID (due to no update), fetch it
    IF v_sec_id IS NULL THEN
        SELECT id INTO v_sec_id FROM class_sections 
        WHERE dept_code = v_dept AND academic_year_id = v_ay_id AND year = 4 AND section = 'A';
    END IF;

    -- 2. Clear existing timetable for this section to avoid clutter
    DELETE FROM timetable WHERE class_section_id = v_sec_id;

    -- 3. Loop and Insert Periods


    -- Monday Period 1: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-4-CLO', 'Cloud Computing', 'BSH-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4df1e62b-1692-491a-b317-d624d11258df', 
        (SELECT id FROM courses WHERE code = 'BSH-4-CLO'), 
        'Monday', 
        1, 
        '09:00', 
        '09:50';


    -- Monday Period 2: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-4-DEE', 'Deep Learning', 'BSH-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '382c9c98-7e45-4041-8371-fbfdbb10bc28', 
        (SELECT id FROM courses WHERE code = 'BSH-4-DEE'), 
        'Monday', 
        2, 
        '09:50', 
        '10:40';


    -- Monday Period 3: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-4-DAT', 'Data Visualization', 'BSH-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '2cf44e1c-0b37-4606-bcf5-be2e7e37226a', 
        (SELECT id FROM courses WHERE code = 'BSH-4-DAT'), 
        'Monday', 
        3, 
        '10:50', 
        '11:40';


    -- Monday Period 4: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-4-OPE', 'Operating Systems', 'BSH-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '59129e64-442b-4821-bed3-5c1ed24d92c1', 
        (SELECT id FROM courses WHERE code = 'BSH-4-OPE'), 
        'Monday', 
        4, 
        '11:40', 
        '12:30';


    -- Monday Period 5: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-4-SOF', 'Software Project Management', 'BSH-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'b0f25938-0ba3-42aa-84a2-7ebec962fd56', 
        (SELECT id FROM courses WHERE code = 'BSH-4-SOF'), 
        'Monday', 
        5, 
        '13:10', 
        '14:00';


    -- Monday Period 6: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-4-DEE', 'Deep Learning Lab', 'BSH-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c51b488d-3bb6-4883-b65a-96711b44da91', 
        (SELECT id FROM courses WHERE code = 'BSH-4-DEE'), 
        'Monday', 
        6, 
        '14:00', 
        '14:50';


    -- Monday Period 7: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-4-DAT', 'Data Visualization Lab', 'BSH-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4a455773-c31b-4fab-8d47-f80aedbde2b2', 
        (SELECT id FROM courses WHERE code = 'BSH-4-DAT'), 
        'Monday', 
        7, 
        '15:00', 
        '15:40';


    -- Monday Period 8: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-4-COU', 'Counseling', 'BSH-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'be93b8cf-e8d0-4137-9277-a6d7a6d9dd63', 
        (SELECT id FROM courses WHERE code = 'BSH-4-COU'), 
        'Monday', 
        8, 
        '15:40', 
        '16:20';


    -- Tuesday Period 1: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-4-DEE', 'Deep Learning', 'BSH-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '382c9c98-7e45-4041-8371-fbfdbb10bc28', 
        (SELECT id FROM courses WHERE code = 'BSH-4-DEE'), 
        'Tuesday', 
        1, 
        '09:00', 
        '09:50';


    -- Tuesday Period 2: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-4-DAT', 'Data Visualization', 'BSH-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '2cf44e1c-0b37-4606-bcf5-be2e7e37226a', 
        (SELECT id FROM courses WHERE code = 'BSH-4-DAT'), 
        'Tuesday', 
        2, 
        '09:50', 
        '10:40';


    -- Tuesday Period 3: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-4-OPE', 'Operating Systems', 'BSH-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '59129e64-442b-4821-bed3-5c1ed24d92c1', 
        (SELECT id FROM courses WHERE code = 'BSH-4-OPE'), 
        'Tuesday', 
        3, 
        '10:50', 
        '11:40';


    -- Tuesday Period 4: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-4-SOF', 'Software Project Management', 'BSH-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'b0f25938-0ba3-42aa-84a2-7ebec962fd56', 
        (SELECT id FROM courses WHERE code = 'BSH-4-SOF'), 
        'Tuesday', 
        4, 
        '11:40', 
        '12:30';


    -- Tuesday Period 5: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-4-DEE', 'Deep Learning Lab', 'BSH-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c51b488d-3bb6-4883-b65a-96711b44da91', 
        (SELECT id FROM courses WHERE code = 'BSH-4-DEE'), 
        'Tuesday', 
        5, 
        '13:10', 
        '14:00';


    -- Tuesday Period 6: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-4-DAT', 'Data Visualization Lab', 'BSH-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4a455773-c31b-4fab-8d47-f80aedbde2b2', 
        (SELECT id FROM courses WHERE code = 'BSH-4-DAT'), 
        'Tuesday', 
        6, 
        '14:00', 
        '14:50';


    -- Tuesday Period 7: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-4-COU', 'Counseling', 'BSH-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'be93b8cf-e8d0-4137-9277-a6d7a6d9dd63', 
        (SELECT id FROM courses WHERE code = 'BSH-4-COU'), 
        'Tuesday', 
        7, 
        '15:00', 
        '15:40';


    -- Tuesday Period 8: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-4-CLO', 'Cloud Computing', 'BSH-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4df1e62b-1692-491a-b317-d624d11258df', 
        (SELECT id FROM courses WHERE code = 'BSH-4-CLO'), 
        'Tuesday', 
        8, 
        '15:40', 
        '16:20';


    -- Wednesday Period 1: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-4-DAT', 'Data Visualization', 'BSH-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '2cf44e1c-0b37-4606-bcf5-be2e7e37226a', 
        (SELECT id FROM courses WHERE code = 'BSH-4-DAT'), 
        'Wednesday', 
        1, 
        '09:00', 
        '09:50';


    -- Wednesday Period 2: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-4-OPE', 'Operating Systems', 'BSH-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '59129e64-442b-4821-bed3-5c1ed24d92c1', 
        (SELECT id FROM courses WHERE code = 'BSH-4-OPE'), 
        'Wednesday', 
        2, 
        '09:50', 
        '10:40';


    -- Wednesday Period 3: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-4-SOF', 'Software Project Management', 'BSH-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'b0f25938-0ba3-42aa-84a2-7ebec962fd56', 
        (SELECT id FROM courses WHERE code = 'BSH-4-SOF'), 
        'Wednesday', 
        3, 
        '10:50', 
        '11:40';


    -- Wednesday Period 4: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-4-DEE', 'Deep Learning Lab', 'BSH-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c51b488d-3bb6-4883-b65a-96711b44da91', 
        (SELECT id FROM courses WHERE code = 'BSH-4-DEE'), 
        'Wednesday', 
        4, 
        '11:40', 
        '12:30';


    -- Wednesday Period 5: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-4-DAT', 'Data Visualization Lab', 'BSH-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4a455773-c31b-4fab-8d47-f80aedbde2b2', 
        (SELECT id FROM courses WHERE code = 'BSH-4-DAT'), 
        'Wednesday', 
        5, 
        '13:10', 
        '14:00';


    -- Wednesday Period 6: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-4-COU', 'Counseling', 'BSH-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'be93b8cf-e8d0-4137-9277-a6d7a6d9dd63', 
        (SELECT id FROM courses WHERE code = 'BSH-4-COU'), 
        'Wednesday', 
        6, 
        '14:00', 
        '14:50';


    -- Wednesday Period 7: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-4-CLO', 'Cloud Computing', 'BSH-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4df1e62b-1692-491a-b317-d624d11258df', 
        (SELECT id FROM courses WHERE code = 'BSH-4-CLO'), 
        'Wednesday', 
        7, 
        '15:00', 
        '15:40';


    -- Wednesday Period 8: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-4-DEE', 'Deep Learning', 'BSH-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '382c9c98-7e45-4041-8371-fbfdbb10bc28', 
        (SELECT id FROM courses WHERE code = 'BSH-4-DEE'), 
        'Wednesday', 
        8, 
        '15:40', 
        '16:20';


    -- Thursday Period 1: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-4-OPE', 'Operating Systems', 'BSH-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '59129e64-442b-4821-bed3-5c1ed24d92c1', 
        (SELECT id FROM courses WHERE code = 'BSH-4-OPE'), 
        'Thursday', 
        1, 
        '09:00', 
        '09:50';


    -- Thursday Period 2: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-4-SOF', 'Software Project Management', 'BSH-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'b0f25938-0ba3-42aa-84a2-7ebec962fd56', 
        (SELECT id FROM courses WHERE code = 'BSH-4-SOF'), 
        'Thursday', 
        2, 
        '09:50', 
        '10:40';


    -- Thursday Period 3: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-4-DEE', 'Deep Learning Lab', 'BSH-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c51b488d-3bb6-4883-b65a-96711b44da91', 
        (SELECT id FROM courses WHERE code = 'BSH-4-DEE'), 
        'Thursday', 
        3, 
        '10:50', 
        '11:40';


    -- Thursday Period 4: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-4-DAT', 'Data Visualization Lab', 'BSH-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4a455773-c31b-4fab-8d47-f80aedbde2b2', 
        (SELECT id FROM courses WHERE code = 'BSH-4-DAT'), 
        'Thursday', 
        4, 
        '11:40', 
        '12:30';


    -- Thursday Period 5: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-4-COU', 'Counseling', 'BSH-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'be93b8cf-e8d0-4137-9277-a6d7a6d9dd63', 
        (SELECT id FROM courses WHERE code = 'BSH-4-COU'), 
        'Thursday', 
        5, 
        '13:10', 
        '14:00';


    -- Thursday Period 6: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-4-CLO', 'Cloud Computing', 'BSH-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4df1e62b-1692-491a-b317-d624d11258df', 
        (SELECT id FROM courses WHERE code = 'BSH-4-CLO'), 
        'Thursday', 
        6, 
        '14:00', 
        '14:50';


    -- Thursday Period 7: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-4-DEE', 'Deep Learning', 'BSH-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '382c9c98-7e45-4041-8371-fbfdbb10bc28', 
        (SELECT id FROM courses WHERE code = 'BSH-4-DEE'), 
        'Thursday', 
        7, 
        '15:00', 
        '15:40';


    -- Thursday Period 8: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-4-DAT', 'Data Visualization', 'BSH-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '2cf44e1c-0b37-4606-bcf5-be2e7e37226a', 
        (SELECT id FROM courses WHERE code = 'BSH-4-DAT'), 
        'Thursday', 
        8, 
        '15:40', 
        '16:20';


    -- Friday Period 1: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-4-SOF', 'Software Project Management', 'BSH-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'b0f25938-0ba3-42aa-84a2-7ebec962fd56', 
        (SELECT id FROM courses WHERE code = 'BSH-4-SOF'), 
        'Friday', 
        1, 
        '09:00', 
        '09:50';


    -- Friday Period 2: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-4-DEE', 'Deep Learning Lab', 'BSH-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c51b488d-3bb6-4883-b65a-96711b44da91', 
        (SELECT id FROM courses WHERE code = 'BSH-4-DEE'), 
        'Friday', 
        2, 
        '09:50', 
        '10:40';


    -- Friday Period 3: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-4-DAT', 'Data Visualization Lab', 'BSH-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4a455773-c31b-4fab-8d47-f80aedbde2b2', 
        (SELECT id FROM courses WHERE code = 'BSH-4-DAT'), 
        'Friday', 
        3, 
        '10:50', 
        '11:40';


    -- Friday Period 4: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-4-COU', 'Counseling', 'BSH-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'be93b8cf-e8d0-4137-9277-a6d7a6d9dd63', 
        (SELECT id FROM courses WHERE code = 'BSH-4-COU'), 
        'Friday', 
        4, 
        '11:40', 
        '12:30';


    -- Friday Period 5: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-4-CLO', 'Cloud Computing', 'BSH-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4df1e62b-1692-491a-b317-d624d11258df', 
        (SELECT id FROM courses WHERE code = 'BSH-4-CLO'), 
        'Friday', 
        5, 
        '13:10', 
        '14:00';


    -- Friday Period 6: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-4-DEE', 'Deep Learning', 'BSH-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '382c9c98-7e45-4041-8371-fbfdbb10bc28', 
        (SELECT id FROM courses WHERE code = 'BSH-4-DEE'), 
        'Friday', 
        6, 
        '14:00', 
        '14:50';


    -- Friday Period 7: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-4-DAT', 'Data Visualization', 'BSH-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '2cf44e1c-0b37-4606-bcf5-be2e7e37226a', 
        (SELECT id FROM courses WHERE code = 'BSH-4-DAT'), 
        'Friday', 
        7, 
        '15:00', 
        '15:40';


    -- Friday Period 8: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-4-OPE', 'Operating Systems', 'BSH-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '59129e64-442b-4821-bed3-5c1ed24d92c1', 
        (SELECT id FROM courses WHERE code = 'BSH-4-OPE'), 
        'Friday', 
        8, 
        '15:40', 
        '16:20';


    -- Saturday Period 1: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-4-DEE', 'Deep Learning Lab', 'BSH-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'c51b488d-3bb6-4883-b65a-96711b44da91', 
        (SELECT id FROM courses WHERE code = 'BSH-4-DEE'), 
        'Saturday', 
        1, 
        '09:00', 
        '09:50';


    -- Saturday Period 2: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-4-DAT', 'Data Visualization Lab', 'BSH-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4a455773-c31b-4fab-8d47-f80aedbde2b2', 
        (SELECT id FROM courses WHERE code = 'BSH-4-DAT'), 
        'Saturday', 
        2, 
        '09:50', 
        '10:40';


    -- Saturday Period 3: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-4-COU', 'Counseling', 'BSH-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'be93b8cf-e8d0-4137-9277-a6d7a6d9dd63', 
        (SELECT id FROM courses WHERE code = 'BSH-4-COU'), 
        'Saturday', 
        3, 
        '10:50', 
        '11:40';


    -- Saturday Period 4: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-4-CLO', 'Cloud Computing', 'BSH-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '4df1e62b-1692-491a-b317-d624d11258df', 
        (SELECT id FROM courses WHERE code = 'BSH-4-CLO'), 
        'Saturday', 
        4, 
        '11:40', 
        '12:30';


    -- Saturday Period 5: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-4-DEE', 'Deep Learning', 'BSH-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '382c9c98-7e45-4041-8371-fbfdbb10bc28', 
        (SELECT id FROM courses WHERE code = 'BSH-4-DEE'), 
        'Saturday', 
        5, 
        '13:10', 
        '14:00';


    -- Saturday Period 6: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-4-DAT', 'Data Visualization', 'BSH-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '2cf44e1c-0b37-4606-bcf5-be2e7e37226a', 
        (SELECT id FROM courses WHERE code = 'BSH-4-DAT'), 
        'Saturday', 
        6, 
        '14:00', 
        '14:50';


    -- Saturday Period 7: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-4-OPE', 'Operating Systems', 'BSH-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        '59129e64-442b-4821-bed3-5c1ed24d92c1', 
        (SELECT id FROM courses WHERE code = 'BSH-4-OPE'), 
        'Saturday', 
        7, 
        '15:00', 
        '15:40';


    -- Saturday Period 8: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('BSH-4-SOF', 'Software Project Management', 'BSH-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'b0f25938-0ba3-42aa-84a2-7ebec962fd56', 
        (SELECT id FROM courses WHERE code = 'BSH-4-SOF'), 
        'Saturday', 
        8, 
        '15:40', 
        '16:20';

END $$;

DO $$
DECLARE
    v_ay_id UUID := 'd860d5fb-d5f0-4497-a7ea-073004d80500';
    v_sec_id UUID;
    v_course_ids UUID[];
    v_fac_id UUID;
    v_dept text := 'EVT';
BEGIN
    -- 1. Ensure Section Exists
    INSERT INTO class_sections (name, dept_code, academic_year_id, academic_year, year, semester, section)
    VALUES ('EVT-2-A', v_dept::department_code, v_ay_id, '2025-2026', 2, 4, 'A')
    ON CONFLICT (dept_code, academic_year_id, year, section) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO v_sec_id;

    -- If we missed ID (due to no update), fetch it
    IF v_sec_id IS NULL THEN
        SELECT id INTO v_sec_id FROM class_sections 
        WHERE dept_code = v_dept AND academic_year_id = v_ay_id AND year = 2 AND section = 'A';
    END IF;

    -- 2. Clear existing timetable for this section to avoid clutter
    DELETE FROM timetable WHERE class_section_id = v_sec_id;

    -- 3. Loop and Insert Periods


    -- Monday Period 1: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-2-CLO', 'Cloud Computing', 'EVT-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-2-CLO'), 
        'Monday', 
        1, 
        '09:00', 
        '09:50';


    -- Monday Period 2: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-2-DEE', 'Deep Learning', 'EVT-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-2-DEE'), 
        'Monday', 
        2, 
        '09:50', 
        '10:40';


    -- Monday Period 3: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-2-DAT', 'Data Visualization', 'EVT-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-2-DAT'), 
        'Monday', 
        3, 
        '10:50', 
        '11:40';


    -- Monday Period 4: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-2-OPE', 'Operating Systems', 'EVT-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-2-OPE'), 
        'Monday', 
        4, 
        '11:40', 
        '12:30';


    -- Monday Period 5: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-2-SOF', 'Software Project Management', 'EVT-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-2-SOF'), 
        'Monday', 
        5, 
        '13:10', 
        '14:00';


    -- Monday Period 6: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-2-DEE', 'Deep Learning Lab', 'EVT-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-2-DEE'), 
        'Monday', 
        6, 
        '14:00', 
        '14:50';


    -- Monday Period 7: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-2-DAT', 'Data Visualization Lab', 'EVT-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-2-DAT'), 
        'Monday', 
        7, 
        '15:00', 
        '15:40';


    -- Monday Period 8: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-2-COU', 'Counseling', 'EVT-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-2-COU'), 
        'Monday', 
        8, 
        '15:40', 
        '16:20';


    -- Tuesday Period 1: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-2-DEE', 'Deep Learning', 'EVT-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-2-DEE'), 
        'Tuesday', 
        1, 
        '09:00', 
        '09:50';


    -- Tuesday Period 2: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-2-DAT', 'Data Visualization', 'EVT-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-2-DAT'), 
        'Tuesday', 
        2, 
        '09:50', 
        '10:40';


    -- Tuesday Period 3: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-2-OPE', 'Operating Systems', 'EVT-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-2-OPE'), 
        'Tuesday', 
        3, 
        '10:50', 
        '11:40';


    -- Tuesday Period 4: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-2-SOF', 'Software Project Management', 'EVT-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-2-SOF'), 
        'Tuesday', 
        4, 
        '11:40', 
        '12:30';


    -- Tuesday Period 5: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-2-DEE', 'Deep Learning Lab', 'EVT-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-2-DEE'), 
        'Tuesday', 
        5, 
        '13:10', 
        '14:00';


    -- Tuesday Period 6: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-2-DAT', 'Data Visualization Lab', 'EVT-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-2-DAT'), 
        'Tuesday', 
        6, 
        '14:00', 
        '14:50';


    -- Tuesday Period 7: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-2-COU', 'Counseling', 'EVT-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-2-COU'), 
        'Tuesday', 
        7, 
        '15:00', 
        '15:40';


    -- Tuesday Period 8: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-2-CLO', 'Cloud Computing', 'EVT-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-2-CLO'), 
        'Tuesday', 
        8, 
        '15:40', 
        '16:20';


    -- Wednesday Period 1: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-2-DAT', 'Data Visualization', 'EVT-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-2-DAT'), 
        'Wednesday', 
        1, 
        '09:00', 
        '09:50';


    -- Wednesday Period 2: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-2-OPE', 'Operating Systems', 'EVT-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-2-OPE'), 
        'Wednesday', 
        2, 
        '09:50', 
        '10:40';


    -- Wednesday Period 3: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-2-SOF', 'Software Project Management', 'EVT-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-2-SOF'), 
        'Wednesday', 
        3, 
        '10:50', 
        '11:40';


    -- Wednesday Period 4: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-2-DEE', 'Deep Learning Lab', 'EVT-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-2-DEE'), 
        'Wednesday', 
        4, 
        '11:40', 
        '12:30';


    -- Wednesday Period 5: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-2-DAT', 'Data Visualization Lab', 'EVT-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-2-DAT'), 
        'Wednesday', 
        5, 
        '13:10', 
        '14:00';


    -- Wednesday Period 6: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-2-COU', 'Counseling', 'EVT-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-2-COU'), 
        'Wednesday', 
        6, 
        '14:00', 
        '14:50';


    -- Wednesday Period 7: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-2-CLO', 'Cloud Computing', 'EVT-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-2-CLO'), 
        'Wednesday', 
        7, 
        '15:00', 
        '15:40';


    -- Wednesday Period 8: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-2-DEE', 'Deep Learning', 'EVT-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-2-DEE'), 
        'Wednesday', 
        8, 
        '15:40', 
        '16:20';


    -- Thursday Period 1: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-2-OPE', 'Operating Systems', 'EVT-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-2-OPE'), 
        'Thursday', 
        1, 
        '09:00', 
        '09:50';


    -- Thursday Period 2: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-2-SOF', 'Software Project Management', 'EVT-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-2-SOF'), 
        'Thursday', 
        2, 
        '09:50', 
        '10:40';


    -- Thursday Period 3: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-2-DEE', 'Deep Learning Lab', 'EVT-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-2-DEE'), 
        'Thursday', 
        3, 
        '10:50', 
        '11:40';


    -- Thursday Period 4: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-2-DAT', 'Data Visualization Lab', 'EVT-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-2-DAT'), 
        'Thursday', 
        4, 
        '11:40', 
        '12:30';


    -- Thursday Period 5: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-2-COU', 'Counseling', 'EVT-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-2-COU'), 
        'Thursday', 
        5, 
        '13:10', 
        '14:00';


    -- Thursday Period 6: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-2-CLO', 'Cloud Computing', 'EVT-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-2-CLO'), 
        'Thursday', 
        6, 
        '14:00', 
        '14:50';


    -- Thursday Period 7: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-2-DEE', 'Deep Learning', 'EVT-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-2-DEE'), 
        'Thursday', 
        7, 
        '15:00', 
        '15:40';


    -- Thursday Period 8: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-2-DAT', 'Data Visualization', 'EVT-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-2-DAT'), 
        'Thursday', 
        8, 
        '15:40', 
        '16:20';


    -- Friday Period 1: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-2-SOF', 'Software Project Management', 'EVT-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-2-SOF'), 
        'Friday', 
        1, 
        '09:00', 
        '09:50';


    -- Friday Period 2: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-2-DEE', 'Deep Learning Lab', 'EVT-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-2-DEE'), 
        'Friday', 
        2, 
        '09:50', 
        '10:40';


    -- Friday Period 3: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-2-DAT', 'Data Visualization Lab', 'EVT-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-2-DAT'), 
        'Friday', 
        3, 
        '10:50', 
        '11:40';


    -- Friday Period 4: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-2-COU', 'Counseling', 'EVT-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-2-COU'), 
        'Friday', 
        4, 
        '11:40', 
        '12:30';


    -- Friday Period 5: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-2-CLO', 'Cloud Computing', 'EVT-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-2-CLO'), 
        'Friday', 
        5, 
        '13:10', 
        '14:00';


    -- Friday Period 6: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-2-DEE', 'Deep Learning', 'EVT-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-2-DEE'), 
        'Friday', 
        6, 
        '14:00', 
        '14:50';


    -- Friday Period 7: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-2-DAT', 'Data Visualization', 'EVT-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-2-DAT'), 
        'Friday', 
        7, 
        '15:00', 
        '15:40';


    -- Friday Period 8: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-2-OPE', 'Operating Systems', 'EVT-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-2-OPE'), 
        'Friday', 
        8, 
        '15:40', 
        '16:20';


    -- Saturday Period 1: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-2-DEE', 'Deep Learning Lab', 'EVT-2-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-2-DEE'), 
        'Saturday', 
        1, 
        '09:00', 
        '09:50';


    -- Saturday Period 2: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-2-DAT', 'Data Visualization Lab', 'EVT-2-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 4, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-2-DAT'), 
        'Saturday', 
        2, 
        '09:50', 
        '10:40';


    -- Saturday Period 3: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-2-COU', 'Counseling', 'EVT-2-COU', 'Counseling', v_dept::department_code, 3, 4, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-2-COU'), 
        'Saturday', 
        3, 
        '10:50', 
        '11:40';


    -- Saturday Period 4: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-2-CLO', 'Cloud Computing', 'EVT-2-CLO', 'Cloud Computing', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-2-CLO'), 
        'Saturday', 
        4, 
        '11:40', 
        '12:30';


    -- Saturday Period 5: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-2-DEE', 'Deep Learning', 'EVT-2-DEE', 'Deep Learning', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-2-DEE'), 
        'Saturday', 
        5, 
        '13:10', 
        '14:00';


    -- Saturday Period 6: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-2-DAT', 'Data Visualization', 'EVT-2-DAT', 'Data Visualization', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-2-DAT'), 
        'Saturday', 
        6, 
        '14:00', 
        '14:50';


    -- Saturday Period 7: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-2-OPE', 'Operating Systems', 'EVT-2-OPE', 'Operating Systems', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-2-OPE'), 
        'Saturday', 
        7, 
        '15:00', 
        '15:40';


    -- Saturday Period 8: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-2-SOF', 'Software Project Management', 'EVT-2-SOF', 'Software Project Management', v_dept::department_code, 3, 4, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-2-SOF'), 
        'Saturday', 
        8, 
        '15:40', 
        '16:20';

END $$;

DO $$
DECLARE
    v_ay_id UUID := 'd860d5fb-d5f0-4497-a7ea-073004d80500';
    v_sec_id UUID;
    v_course_ids UUID[];
    v_fac_id UUID;
    v_dept text := 'EVT';
BEGIN
    -- 1. Ensure Section Exists
    INSERT INTO class_sections (name, dept_code, academic_year_id, academic_year, year, semester, section)
    VALUES ('EVT-3-A', v_dept::department_code, v_ay_id, '2025-2026', 3, 6, 'A')
    ON CONFLICT (dept_code, academic_year_id, year, section) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO v_sec_id;

    -- If we missed ID (due to no update), fetch it
    IF v_sec_id IS NULL THEN
        SELECT id INTO v_sec_id FROM class_sections 
        WHERE dept_code = v_dept AND academic_year_id = v_ay_id AND year = 3 AND section = 'A';
    END IF;

    -- 2. Clear existing timetable for this section to avoid clutter
    DELETE FROM timetable WHERE class_section_id = v_sec_id;

    -- 3. Loop and Insert Periods


    -- Monday Period 1: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-3-CLO', 'Cloud Computing', 'EVT-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-3-CLO'), 
        'Monday', 
        1, 
        '09:00', 
        '09:50';


    -- Monday Period 2: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-3-DEE', 'Deep Learning', 'EVT-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-3-DEE'), 
        'Monday', 
        2, 
        '09:50', 
        '10:40';


    -- Monday Period 3: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-3-DAT', 'Data Visualization', 'EVT-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-3-DAT'), 
        'Monday', 
        3, 
        '10:50', 
        '11:40';


    -- Monday Period 4: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-3-OPE', 'Operating Systems', 'EVT-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-3-OPE'), 
        'Monday', 
        4, 
        '11:40', 
        '12:30';


    -- Monday Period 5: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-3-SOF', 'Software Project Management', 'EVT-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-3-SOF'), 
        'Monday', 
        5, 
        '13:10', 
        '14:00';


    -- Monday Period 6: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-3-DEE', 'Deep Learning Lab', 'EVT-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-3-DEE'), 
        'Monday', 
        6, 
        '14:00', 
        '14:50';


    -- Monday Period 7: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-3-DAT', 'Data Visualization Lab', 'EVT-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-3-DAT'), 
        'Monday', 
        7, 
        '15:00', 
        '15:40';


    -- Monday Period 8: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-3-COU', 'Counseling', 'EVT-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-3-COU'), 
        'Monday', 
        8, 
        '15:40', 
        '16:20';


    -- Tuesday Period 1: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-3-DEE', 'Deep Learning', 'EVT-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-3-DEE'), 
        'Tuesday', 
        1, 
        '09:00', 
        '09:50';


    -- Tuesday Period 2: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-3-DAT', 'Data Visualization', 'EVT-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-3-DAT'), 
        'Tuesday', 
        2, 
        '09:50', 
        '10:40';


    -- Tuesday Period 3: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-3-OPE', 'Operating Systems', 'EVT-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-3-OPE'), 
        'Tuesday', 
        3, 
        '10:50', 
        '11:40';


    -- Tuesday Period 4: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-3-SOF', 'Software Project Management', 'EVT-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-3-SOF'), 
        'Tuesday', 
        4, 
        '11:40', 
        '12:30';


    -- Tuesday Period 5: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-3-DEE', 'Deep Learning Lab', 'EVT-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-3-DEE'), 
        'Tuesday', 
        5, 
        '13:10', 
        '14:00';


    -- Tuesday Period 6: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-3-DAT', 'Data Visualization Lab', 'EVT-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-3-DAT'), 
        'Tuesday', 
        6, 
        '14:00', 
        '14:50';


    -- Tuesday Period 7: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-3-COU', 'Counseling', 'EVT-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-3-COU'), 
        'Tuesday', 
        7, 
        '15:00', 
        '15:40';


    -- Tuesday Period 8: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-3-CLO', 'Cloud Computing', 'EVT-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-3-CLO'), 
        'Tuesday', 
        8, 
        '15:40', 
        '16:20';


    -- Wednesday Period 1: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-3-DAT', 'Data Visualization', 'EVT-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-3-DAT'), 
        'Wednesday', 
        1, 
        '09:00', 
        '09:50';


    -- Wednesday Period 2: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-3-OPE', 'Operating Systems', 'EVT-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-3-OPE'), 
        'Wednesday', 
        2, 
        '09:50', 
        '10:40';


    -- Wednesday Period 3: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-3-SOF', 'Software Project Management', 'EVT-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-3-SOF'), 
        'Wednesday', 
        3, 
        '10:50', 
        '11:40';


    -- Wednesday Period 4: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-3-DEE', 'Deep Learning Lab', 'EVT-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-3-DEE'), 
        'Wednesday', 
        4, 
        '11:40', 
        '12:30';


    -- Wednesday Period 5: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-3-DAT', 'Data Visualization Lab', 'EVT-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-3-DAT'), 
        'Wednesday', 
        5, 
        '13:10', 
        '14:00';


    -- Wednesday Period 6: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-3-COU', 'Counseling', 'EVT-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-3-COU'), 
        'Wednesday', 
        6, 
        '14:00', 
        '14:50';


    -- Wednesday Period 7: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-3-CLO', 'Cloud Computing', 'EVT-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-3-CLO'), 
        'Wednesday', 
        7, 
        '15:00', 
        '15:40';


    -- Wednesday Period 8: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-3-DEE', 'Deep Learning', 'EVT-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-3-DEE'), 
        'Wednesday', 
        8, 
        '15:40', 
        '16:20';


    -- Thursday Period 1: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-3-OPE', 'Operating Systems', 'EVT-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-3-OPE'), 
        'Thursday', 
        1, 
        '09:00', 
        '09:50';


    -- Thursday Period 2: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-3-SOF', 'Software Project Management', 'EVT-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-3-SOF'), 
        'Thursday', 
        2, 
        '09:50', 
        '10:40';


    -- Thursday Period 3: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-3-DEE', 'Deep Learning Lab', 'EVT-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-3-DEE'), 
        'Thursday', 
        3, 
        '10:50', 
        '11:40';


    -- Thursday Period 4: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-3-DAT', 'Data Visualization Lab', 'EVT-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-3-DAT'), 
        'Thursday', 
        4, 
        '11:40', 
        '12:30';


    -- Thursday Period 5: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-3-COU', 'Counseling', 'EVT-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-3-COU'), 
        'Thursday', 
        5, 
        '13:10', 
        '14:00';


    -- Thursday Period 6: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-3-CLO', 'Cloud Computing', 'EVT-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-3-CLO'), 
        'Thursday', 
        6, 
        '14:00', 
        '14:50';


    -- Thursday Period 7: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-3-DEE', 'Deep Learning', 'EVT-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-3-DEE'), 
        'Thursday', 
        7, 
        '15:00', 
        '15:40';


    -- Thursday Period 8: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-3-DAT', 'Data Visualization', 'EVT-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-3-DAT'), 
        'Thursday', 
        8, 
        '15:40', 
        '16:20';


    -- Friday Period 1: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-3-SOF', 'Software Project Management', 'EVT-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-3-SOF'), 
        'Friday', 
        1, 
        '09:00', 
        '09:50';


    -- Friday Period 2: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-3-DEE', 'Deep Learning Lab', 'EVT-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-3-DEE'), 
        'Friday', 
        2, 
        '09:50', 
        '10:40';


    -- Friday Period 3: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-3-DAT', 'Data Visualization Lab', 'EVT-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-3-DAT'), 
        'Friday', 
        3, 
        '10:50', 
        '11:40';


    -- Friday Period 4: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-3-COU', 'Counseling', 'EVT-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-3-COU'), 
        'Friday', 
        4, 
        '11:40', 
        '12:30';


    -- Friday Period 5: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-3-CLO', 'Cloud Computing', 'EVT-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-3-CLO'), 
        'Friday', 
        5, 
        '13:10', 
        '14:00';


    -- Friday Period 6: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-3-DEE', 'Deep Learning', 'EVT-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-3-DEE'), 
        'Friday', 
        6, 
        '14:00', 
        '14:50';


    -- Friday Period 7: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-3-DAT', 'Data Visualization', 'EVT-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-3-DAT'), 
        'Friday', 
        7, 
        '15:00', 
        '15:40';


    -- Friday Period 8: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-3-OPE', 'Operating Systems', 'EVT-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-3-OPE'), 
        'Friday', 
        8, 
        '15:40', 
        '16:20';


    -- Saturday Period 1: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-3-DEE', 'Deep Learning Lab', 'EVT-3-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-3-DEE'), 
        'Saturday', 
        1, 
        '09:00', 
        '09:50';


    -- Saturday Period 2: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-3-DAT', 'Data Visualization Lab', 'EVT-3-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 6, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-3-DAT'), 
        'Saturday', 
        2, 
        '09:50', 
        '10:40';


    -- Saturday Period 3: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-3-COU', 'Counseling', 'EVT-3-COU', 'Counseling', v_dept::department_code, 3, 6, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-3-COU'), 
        'Saturday', 
        3, 
        '10:50', 
        '11:40';


    -- Saturday Period 4: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-3-CLO', 'Cloud Computing', 'EVT-3-CLO', 'Cloud Computing', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-3-CLO'), 
        'Saturday', 
        4, 
        '11:40', 
        '12:30';


    -- Saturday Period 5: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-3-DEE', 'Deep Learning', 'EVT-3-DEE', 'Deep Learning', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-3-DEE'), 
        'Saturday', 
        5, 
        '13:10', 
        '14:00';


    -- Saturday Period 6: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-3-DAT', 'Data Visualization', 'EVT-3-DAT', 'Data Visualization', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-3-DAT'), 
        'Saturday', 
        6, 
        '14:00', 
        '14:50';


    -- Saturday Period 7: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-3-OPE', 'Operating Systems', 'EVT-3-OPE', 'Operating Systems', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-3-OPE'), 
        'Saturday', 
        7, 
        '15:00', 
        '15:40';


    -- Saturday Period 8: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-3-SOF', 'Software Project Management', 'EVT-3-SOF', 'Software Project Management', v_dept::department_code, 3, 6, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-3-SOF'), 
        'Saturday', 
        8, 
        '15:40', 
        '16:20';

END $$;

DO $$
DECLARE
    v_ay_id UUID := 'd860d5fb-d5f0-4497-a7ea-073004d80500';
    v_sec_id UUID;
    v_course_ids UUID[];
    v_fac_id UUID;
    v_dept text := 'EVT';
BEGIN
    -- 1. Ensure Section Exists
    INSERT INTO class_sections (name, dept_code, academic_year_id, academic_year, year, semester, section)
    VALUES ('EVT-4-A', v_dept::department_code, v_ay_id, '2025-2026', 4, 8, 'A')
    ON CONFLICT (dept_code, academic_year_id, year, section) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO v_sec_id;

    -- If we missed ID (due to no update), fetch it
    IF v_sec_id IS NULL THEN
        SELECT id INTO v_sec_id FROM class_sections 
        WHERE dept_code = v_dept AND academic_year_id = v_ay_id AND year = 4 AND section = 'A';
    END IF;

    -- 2. Clear existing timetable for this section to avoid clutter
    DELETE FROM timetable WHERE class_section_id = v_sec_id;

    -- 3. Loop and Insert Periods


    -- Monday Period 1: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-4-CLO', 'Cloud Computing', 'EVT-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-4-CLO'), 
        'Monday', 
        1, 
        '09:00', 
        '09:50';


    -- Monday Period 2: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-4-DEE', 'Deep Learning', 'EVT-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-4-DEE'), 
        'Monday', 
        2, 
        '09:50', 
        '10:40';


    -- Monday Period 3: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-4-DAT', 'Data Visualization', 'EVT-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-4-DAT'), 
        'Monday', 
        3, 
        '10:50', 
        '11:40';


    -- Monday Period 4: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-4-OPE', 'Operating Systems', 'EVT-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-4-OPE'), 
        'Monday', 
        4, 
        '11:40', 
        '12:30';


    -- Monday Period 5: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-4-SOF', 'Software Project Management', 'EVT-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-4-SOF'), 
        'Monday', 
        5, 
        '13:10', 
        '14:00';


    -- Monday Period 6: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-4-DEE', 'Deep Learning Lab', 'EVT-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-4-DEE'), 
        'Monday', 
        6, 
        '14:00', 
        '14:50';


    -- Monday Period 7: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-4-DAT', 'Data Visualization Lab', 'EVT-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-4-DAT'), 
        'Monday', 
        7, 
        '15:00', 
        '15:40';


    -- Monday Period 8: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-4-COU', 'Counseling', 'EVT-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-4-COU'), 
        'Monday', 
        8, 
        '15:40', 
        '16:20';


    -- Tuesday Period 1: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-4-DEE', 'Deep Learning', 'EVT-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-4-DEE'), 
        'Tuesday', 
        1, 
        '09:00', 
        '09:50';


    -- Tuesday Period 2: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-4-DAT', 'Data Visualization', 'EVT-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-4-DAT'), 
        'Tuesday', 
        2, 
        '09:50', 
        '10:40';


    -- Tuesday Period 3: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-4-OPE', 'Operating Systems', 'EVT-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-4-OPE'), 
        'Tuesday', 
        3, 
        '10:50', 
        '11:40';


    -- Tuesday Period 4: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-4-SOF', 'Software Project Management', 'EVT-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-4-SOF'), 
        'Tuesday', 
        4, 
        '11:40', 
        '12:30';


    -- Tuesday Period 5: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-4-DEE', 'Deep Learning Lab', 'EVT-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-4-DEE'), 
        'Tuesday', 
        5, 
        '13:10', 
        '14:00';


    -- Tuesday Period 6: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-4-DAT', 'Data Visualization Lab', 'EVT-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-4-DAT'), 
        'Tuesday', 
        6, 
        '14:00', 
        '14:50';


    -- Tuesday Period 7: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-4-COU', 'Counseling', 'EVT-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-4-COU'), 
        'Tuesday', 
        7, 
        '15:00', 
        '15:40';


    -- Tuesday Period 8: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-4-CLO', 'Cloud Computing', 'EVT-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-4-CLO'), 
        'Tuesday', 
        8, 
        '15:40', 
        '16:20';


    -- Wednesday Period 1: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-4-DAT', 'Data Visualization', 'EVT-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-4-DAT'), 
        'Wednesday', 
        1, 
        '09:00', 
        '09:50';


    -- Wednesday Period 2: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-4-OPE', 'Operating Systems', 'EVT-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-4-OPE'), 
        'Wednesday', 
        2, 
        '09:50', 
        '10:40';


    -- Wednesday Period 3: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-4-SOF', 'Software Project Management', 'EVT-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-4-SOF'), 
        'Wednesday', 
        3, 
        '10:50', 
        '11:40';


    -- Wednesday Period 4: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-4-DEE', 'Deep Learning Lab', 'EVT-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-4-DEE'), 
        'Wednesday', 
        4, 
        '11:40', 
        '12:30';


    -- Wednesday Period 5: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-4-DAT', 'Data Visualization Lab', 'EVT-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-4-DAT'), 
        'Wednesday', 
        5, 
        '13:10', 
        '14:00';


    -- Wednesday Period 6: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-4-COU', 'Counseling', 'EVT-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-4-COU'), 
        'Wednesday', 
        6, 
        '14:00', 
        '14:50';


    -- Wednesday Period 7: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-4-CLO', 'Cloud Computing', 'EVT-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-4-CLO'), 
        'Wednesday', 
        7, 
        '15:00', 
        '15:40';


    -- Wednesday Period 8: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-4-DEE', 'Deep Learning', 'EVT-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-4-DEE'), 
        'Wednesday', 
        8, 
        '15:40', 
        '16:20';


    -- Thursday Period 1: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-4-OPE', 'Operating Systems', 'EVT-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-4-OPE'), 
        'Thursday', 
        1, 
        '09:00', 
        '09:50';


    -- Thursday Period 2: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-4-SOF', 'Software Project Management', 'EVT-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-4-SOF'), 
        'Thursday', 
        2, 
        '09:50', 
        '10:40';


    -- Thursday Period 3: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-4-DEE', 'Deep Learning Lab', 'EVT-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-4-DEE'), 
        'Thursday', 
        3, 
        '10:50', 
        '11:40';


    -- Thursday Period 4: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-4-DAT', 'Data Visualization Lab', 'EVT-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-4-DAT'), 
        'Thursday', 
        4, 
        '11:40', 
        '12:30';


    -- Thursday Period 5: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-4-COU', 'Counseling', 'EVT-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-4-COU'), 
        'Thursday', 
        5, 
        '13:10', 
        '14:00';


    -- Thursday Period 6: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-4-CLO', 'Cloud Computing', 'EVT-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-4-CLO'), 
        'Thursday', 
        6, 
        '14:00', 
        '14:50';


    -- Thursday Period 7: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-4-DEE', 'Deep Learning', 'EVT-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-4-DEE'), 
        'Thursday', 
        7, 
        '15:00', 
        '15:40';


    -- Thursday Period 8: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-4-DAT', 'Data Visualization', 'EVT-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-4-DAT'), 
        'Thursday', 
        8, 
        '15:40', 
        '16:20';


    -- Friday Period 1: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-4-SOF', 'Software Project Management', 'EVT-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-4-SOF'), 
        'Friday', 
        1, 
        '09:00', 
        '09:50';


    -- Friday Period 2: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-4-DEE', 'Deep Learning Lab', 'EVT-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-4-DEE'), 
        'Friday', 
        2, 
        '09:50', 
        '10:40';


    -- Friday Period 3: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-4-DAT', 'Data Visualization Lab', 'EVT-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-4-DAT'), 
        'Friday', 
        3, 
        '10:50', 
        '11:40';


    -- Friday Period 4: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-4-COU', 'Counseling', 'EVT-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-4-COU'), 
        'Friday', 
        4, 
        '11:40', 
        '12:30';


    -- Friday Period 5: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-4-CLO', 'Cloud Computing', 'EVT-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-4-CLO'), 
        'Friday', 
        5, 
        '13:10', 
        '14:00';


    -- Friday Period 6: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-4-DEE', 'Deep Learning', 'EVT-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-4-DEE'), 
        'Friday', 
        6, 
        '14:00', 
        '14:50';


    -- Friday Period 7: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-4-DAT', 'Data Visualization', 'EVT-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-4-DAT'), 
        'Friday', 
        7, 
        '15:00', 
        '15:40';


    -- Friday Period 8: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-4-OPE', 'Operating Systems', 'EVT-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-4-OPE'), 
        'Friday', 
        8, 
        '15:40', 
        '16:20';


    -- Saturday Period 1: Deep Learning Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-4-DEE', 'Deep Learning Lab', 'EVT-4-DEE', 'Deep Learning Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-4-DEE'), 
        'Saturday', 
        1, 
        '09:00', 
        '09:50';


    -- Saturday Period 2: Data Visualization Lab
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-4-DAT', 'Data Visualization Lab', 'EVT-4-DAT', 'Data Visualization Lab', v_dept::department_code, 3, 8, 'Lab')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-4-DAT'), 
        'Saturday', 
        2, 
        '09:50', 
        '10:40';


    -- Saturday Period 3: Counseling
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-4-COU', 'Counseling', 'EVT-4-COU', 'Counseling', v_dept::department_code, 3, 8, 'theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-4-COU'), 
        'Saturday', 
        3, 
        '10:50', 
        '11:40';


    -- Saturday Period 4: Cloud Computing
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-4-CLO', 'Cloud Computing', 'EVT-4-CLO', 'Cloud Computing', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-4-CLO'), 
        'Saturday', 
        4, 
        '11:40', 
        '12:30';


    -- Saturday Period 5: Deep Learning
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-4-DEE', 'Deep Learning', 'EVT-4-DEE', 'Deep Learning', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-4-DEE'), 
        'Saturday', 
        5, 
        '13:10', 
        '14:00';


    -- Saturday Period 6: Data Visualization
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-4-DAT', 'Data Visualization', 'EVT-4-DAT', 'Data Visualization', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-4-DAT'), 
        'Saturday', 
        6, 
        '14:00', 
        '14:50';


    -- Saturday Period 7: Operating Systems
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-4-OPE', 'Operating Systems', 'EVT-4-OPE', 'Operating Systems', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-4-OPE'), 
        'Saturday', 
        7, 
        '15:00', 
        '15:40';


    -- Saturday Period 8: Software Project Management
    INSERT INTO courses (code, name, course_code, course_name, dept_code, credits, semester, type)
    VALUES ('EVT-4-SOF', 'Software Project Management', 'EVT-4-SOF', 'Software Project Management', v_dept::department_code, 3, 8, 'Theory')
    ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name;
    
    INSERT INTO timetable (class_section_id, faculty_id, course_id, day_of_week, period_number, start_time, end_time)
    SELECT 
        v_sec_id, 
        'bd709c19-36cc-439a-9428-c6327427ff2e', 
        (SELECT id FROM courses WHERE code = 'EVT-4-SOF'), 
        'Saturday', 
        8, 
        '15:40', 
        '16:20';

END $$;
COMMIT;