
-- =========================================================
-- TIMETABLE SCHEMA REPAIR
-- =========================================================

-- 1. Ensure 'timetable' table exists
CREATE TABLE IF NOT EXISTS timetable (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    class_section_id UUID,
    faculty_id UUID,
    course_id UUID,
    day_of_week TEXT,
    period_number INTEGER,
    start_time TIME,
    end_time TIME,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- 2. FORCE ADD MISSING COLUMNS (If table already existed but was empty/wrong)
ALTER TABLE timetable ADD COLUMN IF NOT EXISTS start_time TIME;
ALTER TABLE timetable ADD COLUMN IF NOT EXISTS end_time TIME;
ALTER TABLE timetable ADD COLUMN IF NOT EXISTS day_of_week TEXT;
ALTER TABLE timetable ADD COLUMN IF NOT EXISTS period_number INTEGER;
ALTER TABLE timetable ADD COLUMN IF NOT EXISTS class_section_id UUID;
ALTER TABLE timetable ADD COLUMN IF NOT EXISTS faculty_id UUID;
ALTER TABLE timetable ADD COLUMN IF NOT EXISTS course_id UUID;

-- 3. Fix other tables while we are at it
ALTER TABLE class_sections ADD COLUMN IF NOT EXISTS name TEXT DEFAULT 'New Section';
ALTER TABLE class_sections ADD COLUMN IF NOT EXISTS dept_code TEXT;
ALTER TABLE class_sections ADD COLUMN IF NOT EXISTS academic_year_id UUID;
ALTER TABLE class_sections ADD COLUMN IF NOT EXISTS academic_year TEXT DEFAULT '2025-2026';

ALTER TABLE courses ADD COLUMN IF NOT EXISTS code TEXT;
ALTER TABLE courses ADD COLUMN IF NOT EXISTS name TEXT;
ALTER TABLE courses ADD COLUMN IF NOT EXISTS course_code TEXT; -- Legacy
ALTER TABLE courses ADD COLUMN IF NOT EXISTS course_name TEXT; -- Legacy
