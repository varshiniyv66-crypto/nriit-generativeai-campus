-- NBA Comprehensive Data Schema
-- Covering: Placements, Mentoring Impact, Events (Workshops/Conferences), IMTL, and PO Attainment

-- 1. Placements Data (Criterion 5)
CREATE TABLE IF NOT EXISTS nba_placements (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    department_id UUID REFERENCES departments(id),
    academic_year TEXT, -- e.g., '2023-24'
    total_students_eligible INTEGER,
    students_placed INTEGER,
    higher_studies_count INTEGER,
    entrepreneurship_count INTEGER,
    min_package NUMERIC(10,2), -- LPA
    max_package NUMERIC(10,2), -- LPA
    avg_package NUMERIC(10,2), -- LPA
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    UNIQUE(department_id, academic_year)
);

-- 2. Events & Research (Workshops, Conferences, Publications Aggregated)
CREATE TABLE IF NOT EXISTS nba_events (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    department_id UUID REFERENCES departments(id),
    academic_year TEXT,
    event_type TEXT CHECK (event_type IN ('Workshop', 'Conference', 'Seminar', 'Guest Lecture', 'FDP', 'Industrial Visit')),
    title TEXT,
    date_start DATE,
    date_end DATE,
    resource_person TEXT,
    participants_count INTEGER,
    outcome_description TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 3. Innovative Teaching & Learning Methods (IMTL)
CREATE TABLE IF NOT EXISTS nba_teaching_methods (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    department_id UUID REFERENCES departments(id),
    method_name TEXT, -- e.g., 'Flipped Classroom', 'Project Based Learning'
    description TEXT,
    course_name TEXT,
    faculty_name TEXT, 
    evidence_url TEXT, -- Link to video/doc
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 4. Mentoring Impact Analysis (Weak Learners vs Advanced Learners)
CREATE TABLE IF NOT EXISTS nba_mentoring_impact (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    department_id UUID REFERENCES departments(id),
    academic_year TEXT,
    weak_learners_identified INTEGER,
    weak_learners_improved INTEGER, -- Impact Metric
    advanced_learners_count INTEGER,
    actions_taken TEXT, -- Text description of remedial classes etc.
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    UNIQUE(department_id, academic_year)
);

-- 5. PO/PSO Attainment Summary (For Charts)
CREATE TABLE IF NOT EXISTS nba_attainment_summary (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    department_id UUID REFERENCES departments(id),
    academic_year TEXT,
    po_code TEXT, -- 'PO1', 'PO2', ... 'PSO1'
    target_level NUMERIC(4,2), -- e.g. 3.0
    attained_level NUMERIC(4,2), -- e.g. 2.8
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    UNIQUE(department_id, academic_year, po_code)
);

-- Insert Sample/Mock Data for Visualization (so Charts aren't empty)
-- CSE Department ID lookup required. Using subquery.

INSERT INTO nba_placements (department_id, academic_year, total_students_eligible, students_placed, avg_package, max_package)
VALUES 
((SELECT id FROM departments WHERE code='CSE' LIMIT 1), '2023-24', 150, 135, 4.5, 12.0),
((SELECT id FROM departments WHERE code='CSE' LIMIT 1), '2022-23', 150, 142, 4.2, 10.5),
((SELECT id FROM departments WHERE code='CSE' LIMIT 1), '2021-22', 120, 115, 3.8, 9.0)
ON CONFLICT DO NOTHING;

INSERT INTO nba_mentoring_impact (department_id, academic_year, weak_learners_identified, weak_learners_improved, actions_taken)
VALUES 
((SELECT id FROM departments WHERE code='CSE' LIMIT 1), '2023-24', 45, 38, 'Remedial classes conducted for Java and OS keys concepts.'),
((SELECT id FROM departments WHERE code='CSE' LIMIT 1), '2022-23', 30, 28, 'Peer tutoring and extra lab sessions.')
ON CONFLICT DO NOTHING;

INSERT INTO nba_attainment_summary (department_id, academic_year, po_code, target_level, attained_level)
VALUES 
((SELECT id FROM departments WHERE code='CSE' LIMIT 1), '2023-24', 'PO1', 3.0, 2.8),
((SELECT id FROM departments WHERE code='CSE' LIMIT 1), '2023-24', 'PO2', 3.0, 2.7),
((SELECT id FROM departments WHERE code='CSE' LIMIT 1), '2023-24', 'PO3', 3.0, 2.9),
((SELECT id FROM departments WHERE code='CSE' LIMIT 1), '2023-24', 'PO4', 3.0, 2.6),
((SELECT id FROM departments WHERE code='CSE' LIMIT 1), '2023-24', 'PO5', 3.0, 3.0)
ON CONFLICT DO NOTHING;
