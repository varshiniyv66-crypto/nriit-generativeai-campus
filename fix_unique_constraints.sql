
-- =========================================================
-- FIX: Create Missing Unique Constraint for Courses
-- =========================================================

-- The error "there is no unique or exclusion constraint matching the ON CONFLICT specification"
-- means the 'courses' table does not have a UNIQUE constraint on the 'code' column.

-- 1. Ensure 'code' column is unique
ALTER TABLE courses DROP CONSTRAINT IF EXISTS courses_code_key;
DROP INDEX IF EXISTS idx_courses_code;

CREATE UNIQUE INDEX idx_courses_code ON courses (code);
ALTER TABLE courses ADD CONSTRAINT courses_code_key UNIQUE USING INDEX idx_courses_code;

-- Also fix class_sections just in case
ALTER TABLE class_sections DROP CONSTRAINT IF EXISTS class_sections_name_key; -- If name was unique
-- We need complex constraint for sections
DROP INDEX IF EXISTS idx_class_sections_unique;
CREATE UNIQUE INDEX IF NOT EXISTS idx_class_sections_unique ON class_sections (dept_code, academic_year_id, year, section);
ALTER TABLE class_sections DROP CONSTRAINT IF EXISTS class_sections_dept_code_academic_year_id_year_section_key;
ALTER TABLE class_sections ADD CONSTRAINT class_sections_dept_code_academic_year_id_year_section_key UNIQUE USING INDEX idx_class_sections_unique;

