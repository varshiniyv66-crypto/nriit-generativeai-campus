
-- =========================================================
-- MASTER FIX SCRIPT v2: Force Add Missing Columns
-- =========================================================

-- 1. Fix 'class_sections' - Explicitly add 'name'
ALTER TABLE class_sections ADD COLUMN IF NOT EXISTS name TEXT DEFAULT 'New Section';
ALTER TABLE class_sections ADD COLUMN IF NOT EXISTS dept_code TEXT;
ALTER TABLE class_sections ADD COLUMN IF NOT EXISTS academic_year_id UUID REFERENCES academic_years(id);
ALTER TABLE class_sections ADD COLUMN IF NOT EXISTS year INTEGER;
ALTER TABLE class_sections ADD COLUMN IF NOT EXISTS semester INTEGER;
ALTER TABLE class_sections ADD COLUMN IF NOT EXISTS section TEXT;

-- 2. Fix 'courses' - Explicitly add 'code' and 'name'
ALTER TABLE courses ADD COLUMN IF NOT EXISTS code TEXT;
ALTER TABLE courses ADD COLUMN IF NOT EXISTS name TEXT;
ALTER TABLE courses ADD COLUMN IF NOT EXISTS dept_code TEXT;
ALTER TABLE courses ADD COLUMN IF NOT EXISTS semester INTEGER;
ALTER TABLE courses ADD COLUMN IF NOT EXISTS type TEXT;
ALTER TABLE courses ADD COLUMN IF NOT EXISTS credits INTEGER DEFAULT 3;

-- 3. Ensure 'timetable' exists with correct columns
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

-- 4. Constraint Fixes (Safe Re-run)
DROP INDEX IF EXISTS idx_class_sections_unique;
CREATE UNIQUE INDEX IF NOT EXISTS idx_class_sections_unique ON class_sections (dept_code, academic_year_id, year, section);

DO $$
BEGIN
    -- Drop constraint if exists to ensure we can recreate or if it conflicts
    ALTER TABLE class_sections DROP CONSTRAINT IF EXISTS class_sections_dept_code_academic_year_id_year_section_key;
    -- Add unique constraint
    ALTER TABLE class_sections ADD CONSTRAINT class_sections_dept_code_academic_year_id_year_section_key UNIQUE USING INDEX idx_class_sections_unique;
EXCEPTION WHEN OTHERS THEN
    NULL; -- Ignore validation errors if duplicates exist
END $$;
