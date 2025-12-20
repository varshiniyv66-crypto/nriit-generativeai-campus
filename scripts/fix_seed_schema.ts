
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const seedFile = path.resolve(__dirname, '../seed_full_timetables.sql');

const fixDDL = `
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
`;

if (fs.existsSync(seedFile)) {
    let content = fs.readFileSync(seedFile, 'utf8');

    // Insert after the initial CREATE TABLE blocks (approx match) or just at the top.
    // Since SQL executes top-down, putting it at the very top is fine (after the CREATE TABLEs I added previously).
    // The previous prepend pushed CREATE TABLE to top. 
    // I should insert this AFTER the CREATE TABLEs to ensure tables exist before ALTER.

    // Naive approach: Just Put it after the 'CREATE TABLE IF NOT EXISTS timetable ... );' 
    const marker = 'CREATE TABLE IF NOT EXISTS timetable (\n    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),\n    class_section_id UUID REFERENCES class_sections(id) ON DELETE CASCADE,\n    faculty_id UUID REFERENCES faculty_profiles(id),\n    course_id UUID REFERENCES courses(id),\n    day_of_week TEXT,\n    period_number INTEGER,\n    start_time TIME,\n    end_time TIME,\n    created_at TIMESTAMPTZ DEFAULT NOW(),\n    updated_at TIMESTAMPTZ DEFAULT NOW()\n);\n';

    if (content.includes(marker)) {
        content = content.replace(marker, marker + '\n' + fixDDL + '\n');
        fs.writeFileSync(seedFile, content);
        console.log("Injected Schema Fixes into seed_full_timetables.sql");
    } else {
        console.log("Could not find insertion marker. Prepending to top as fallback.");
        fs.writeFileSync(seedFile, fixDDL + '\n' + content);
    }
} else {
    console.error("Seed file not found.");
}
