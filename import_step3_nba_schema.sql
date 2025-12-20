-- NBA Data Schema Extension for NRIIT
-- Adjusted to align with existing schema (using 'dept_code', 'pan_number', 'date_of_joining')

-- 1. Extend Faculty Profiles with NBA-specific fields
-- Existing columns verified: qualification, date_of_joining, pan_number
ALTER TABLE faculty_profiles 
ADD COLUMN IF NOT EXISTS nature_of_association TEXT, -- 'Regular', 'Contract', 'Adjunct'
ADD COLUMN IF NOT EXISTS designation_at_joining TEXT;

-- 2. Admissions Data (Criterion 4 - Enrolment & Placement)
CREATE TABLE IF NOT EXISTS nba_admissions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    department_id UUID REFERENCES departments(id), -- Uses ID linkage for robustness or dept_code if preferred
    academic_year TEXT, -- e.g., '2023-24', 'CAY', 'CAYm1'
    sanctioned_intake INTEGER,
    admitted_count INTEGER,
    lateral_entry_count INTEGER DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    UNIQUE(department_id, academic_year)
);

-- 3. Program Vision & Mission
CREATE TABLE IF NOT EXISTS nba_program_details (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    department_id UUID REFERENCES departments(id),
    vision TEXT,
    mission TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    UNIQUE(department_id)
);

-- 4. Program Outcomes (POs, PSOs, PEOs)
CREATE TABLE IF NOT EXISTS nba_program_outcomes (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    department_id UUID REFERENCES departments(id),
    code TEXT, -- 'PO1', 'PSO1', 'PEO1'
    description TEXT,
    type TEXT CHECK (type IN ('PO', 'PSO', 'PEO')),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    UNIQUE(department_id, code)
);

-- 5. Student Faculty Ratio (SFR) Data
CREATE TABLE IF NOT EXISTS nba_sfr_data (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    department_id UUID REFERENCES departments(id),
    academic_year TEXT,
    ug1_students INTEGER DEFAULT 0,
    ug2_students INTEGER DEFAULT 0,
    ug3_students INTEGER DEFAULT 0,
    ug4_students INTEGER DEFAULT 0,
    pg1_students INTEGER DEFAULT 0,
    pg2_students INTEGER DEFAULT 0,
    total_students INTEGER,
    faculty_count INTEGER,
    sfr NUMERIC(5,2),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
