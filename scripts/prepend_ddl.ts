
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const seedFile = path.resolve(__dirname, '../seed_full_timetables.sql');

const ddl = `
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
-- 2. SEED DATA
-- =============================================
`;

if (fs.existsSync(seedFile)) {
    const currentContent = fs.readFileSync(seedFile, 'utf8');
    // Check if DDL is already there to avoid dupes (simple check)
    if (!currentContent.includes('CREATE TABLE IF NOT EXISTS academic_years')) {
        const newContent = ddl + '\n' + currentContent;
        fs.writeFileSync(seedFile, newContent);
        console.log("Prepended Table Creation SQL to seed_full_timetables.sql");
    } else {
        console.log("DDL already exists in file.");
    }
} else {
    console.error("Seed file not found!");
}
