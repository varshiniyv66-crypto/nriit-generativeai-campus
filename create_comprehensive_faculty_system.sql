-- ============================================
-- COMPREHENSIVE FACULTY PROFILE SYSTEM
-- ============================================
-- Gold Medal Level ERP System
-- Complete Faculty Management with NBA/NAAC Support
-- ============================================

-- ============================================
-- 1. RESEARCH & PUBLICATIONS
-- ============================================

CREATE TABLE IF NOT EXISTS faculty_research_papers (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    faculty_id UUID NOT NULL REFERENCES faculty_profiles(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    authors TEXT NOT NULL,
    journal_name TEXT,
    conference_name TEXT,
    publication_type TEXT NOT NULL, -- journal, conference, book_chapter, patent
    publication_date DATE,
    doi TEXT,
    isbn TEXT,
    issn TEXT,
    volume TEXT,
    issue TEXT,
    pages TEXT,
    publisher TEXT,
    impact_factor DECIMAL(10,3),
    citations_count INTEGER DEFAULT 0,
    scopus_indexed BOOLEAN DEFAULT false,
    web_of_science_indexed BOOLEAN DEFAULT false,
    ugc_approved BOOLEAN DEFAULT false,
    pdf_url TEXT,
    status TEXT DEFAULT 'pending', -- pending, approved, rejected
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX idx_research_papers_faculty ON faculty_research_papers(faculty_id);
CREATE INDEX idx_research_papers_status ON faculty_research_papers(status);

-- ============================================
-- 2. WORKSHOPS & TRAINING
-- ============================================

CREATE TABLE IF NOT EXISTS faculty_workshops (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    faculty_id UUID NOT NULL REFERENCES faculty_profiles(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    type TEXT NOT NULL, -- attended, conducted, organized
    category TEXT NOT NULL, -- FDP, workshop, seminar, conference, webinar
    organizer TEXT,
    venue TEXT,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    duration_days INTEGER,
    certificate_url TEXT,
    description TEXT,
    status TEXT DEFAULT 'pending', -- pending, approved, rejected
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX idx_workshops_faculty ON faculty_workshops(faculty_id);
CREATE INDEX idx_workshops_status ON faculty_workshops(status);

-- ============================================
-- 3. CERTIFICATIONS & AWARDS
-- ============================================

CREATE TABLE IF NOT EXISTS faculty_certifications (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    faculty_id UUID NOT NULL REFERENCES faculty_profiles(id) ON DELETE CASCADE,
    certification_name TEXT NOT NULL,
    issuing_organization TEXT NOT NULL,
    issue_date DATE NOT NULL,
    expiry_date DATE,
    credential_id TEXT,
    credential_url TEXT,
    certificate_url TEXT,
    status TEXT DEFAULT 'pending',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS faculty_awards (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    faculty_id UUID NOT NULL REFERENCES faculty_profiles(id) ON DELETE CASCADE,
    award_name TEXT NOT NULL,
    awarding_body TEXT NOT NULL,
    award_date DATE NOT NULL,
    category TEXT, -- best_teacher, research_excellence, innovation, etc
    description TEXT,
    certificate_url TEXT,
    status TEXT DEFAULT 'pending',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ============================================
-- 4. SUBJECTS & TIMETABLE
-- ============================================

CREATE TABLE IF NOT EXISTS faculty_subjects (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    faculty_id UUID NOT NULL REFERENCES faculty_profiles(id) ON DELETE CASCADE,
    subject_code TEXT NOT NULL,
    subject_name TEXT NOT NULL,
    academic_year TEXT NOT NULL,
    semester INTEGER NOT NULL,
    dept_code TEXT NOT NULL,
    year INTEGER NOT NULL, -- 1, 2, 3, 4
    section TEXT NOT NULL, -- A, B, C
    subject_type TEXT NOT NULL, -- theory, lab, project
    credits INTEGER,
    hours_per_week INTEGER,
    status TEXT DEFAULT 'active',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS faculty_timetable (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    faculty_id UUID NOT NULL REFERENCES faculty_profiles(id) ON DELETE CASCADE,
    subject_id UUID REFERENCES faculty_subjects(id) ON DELETE CASCADE,
    day_of_week INTEGER NOT NULL, -- 1=Monday, 7=Sunday
    period_number INTEGER NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    room_number TEXT,
    academic_year TEXT NOT NULL,
    semester INTEGER NOT NULL,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ============================================
-- 5. NBA/NAAC DOCUMENTATION
-- ============================================

CREATE TABLE IF NOT EXISTS faculty_course_outcomes (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    faculty_id UUID NOT NULL REFERENCES faculty_profiles(id) ON DELETE CASCADE,
    subject_id UUID REFERENCES faculty_subjects(id) ON DELETE CASCADE,
    co_number INTEGER NOT NULL,
    co_description TEXT NOT NULL,
    bloom_level TEXT, -- remember, understand, apply, analyze, evaluate, create
    po_mapping JSONB, -- {PO1: 3, PO2: 2, ...}
    pso_mapping JSONB, -- {PSO1: 2, PSO2: 3, ...}
    assessment_methods TEXT[],
    status TEXT DEFAULT 'pending',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS faculty_assessment_data (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    faculty_id UUID NOT NULL REFERENCES faculty_profiles(id) ON DELETE CASCADE,
    subject_id UUID REFERENCES faculty_subjects(id) ON DELETE CASCADE,
    academic_year TEXT NOT NULL,
    semester INTEGER NOT NULL,
    assessment_type TEXT NOT NULL, -- mid1, mid2, assignment, quiz, lab, project
    total_students INTEGER,
    students_passed INTEGER,
    average_marks DECIMAL(5,2),
    highest_marks DECIMAL(5,2),
    lowest_marks DECIMAL(5,2),
    co_attainment JSONB, -- {CO1: 85, CO2: 78, ...}
    status TEXT DEFAULT 'pending',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ============================================
-- 6. STUDENT MENTORING
-- ============================================

CREATE TABLE IF NOT EXISTS faculty_mentoring_records (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    faculty_id UUID NOT NULL REFERENCES faculty_profiles(id) ON DELETE CASCADE,
    student_id UUID REFERENCES student_profiles(id) ON DELETE CASCADE,
    meeting_date DATE NOT NULL,
    meeting_type TEXT NOT NULL, -- academic, personal, career, placement
    issues_discussed TEXT,
    action_taken TEXT,
    follow_up_required BOOLEAN DEFAULT false,
    follow_up_date DATE,
    parent_informed BOOLEAN DEFAULT false,
    status TEXT DEFAULT 'completed',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ============================================
-- 7. RESEARCH PROJECTS & GRANTS
-- ============================================

CREATE TABLE IF NOT EXISTS faculty_research_projects (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    faculty_id UUID NOT NULL REFERENCES faculty_profiles(id) ON DELETE CASCADE,
    project_title TEXT NOT NULL,
    funding_agency TEXT,
    grant_amount DECIMAL(12,2),
    project_type TEXT, -- sponsored, consultancy, internal
    role TEXT, -- PI, Co-PI, Investigator
    start_date DATE NOT NULL,
    end_date DATE,
    status TEXT NOT NULL, -- ongoing, completed, submitted
    outcome TEXT,
    publications_count INTEGER DEFAULT 0,
    approval_status TEXT DEFAULT 'pending',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ============================================
-- 8. PATENTS & INTELLECTUAL PROPERTY
-- ============================================

CREATE TABLE IF NOT EXISTS faculty_patents (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    faculty_id UUID NOT NULL REFERENCES faculty_profiles(id) ON DELETE CASCADE,
    patent_title TEXT NOT NULL,
    patent_number TEXT,
    application_number TEXT NOT NULL,
    filing_date DATE NOT NULL,
    grant_date DATE,
    status TEXT NOT NULL, -- filed, published, granted
    inventors TEXT NOT NULL,
    patent_office TEXT, -- Indian, US, European, etc
    category TEXT, -- product, process, design
    description TEXT,
    certificate_url TEXT,
    approval_status TEXT DEFAULT 'pending',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ============================================
-- 9. BOOKS & CHAPTERS
-- ============================================

CREATE TABLE IF NOT EXISTS faculty_books (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    faculty_id UUID NOT NULL REFERENCES faculty_profiles(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    type TEXT NOT NULL, -- authored, edited, chapter
    authors TEXT NOT NULL,
    publisher TEXT NOT NULL,
    publication_date DATE NOT NULL,
    isbn TEXT,
    edition TEXT,
    pages INTEGER,
    chapter_title TEXT, -- if type is chapter
    book_title TEXT, -- if type is chapter
    status TEXT DEFAULT 'pending',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ============================================
-- 10. PROFESSIONAL MEMBERSHIPS
-- ============================================

CREATE TABLE IF NOT EXISTS faculty_memberships (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    faculty_id UUID NOT NULL REFERENCES faculty_profiles(id) ON DELETE CASCADE,
    organization_name TEXT NOT NULL,
    membership_type TEXT, -- lifetime, annual, student
    membership_id TEXT,
    start_date DATE NOT NULL,
    end_date DATE,
    position_held TEXT, -- member, committee_member, office_bearer
    status TEXT DEFAULT 'active',
    approval_status TEXT DEFAULT 'pending',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ============================================
-- SUCCESS MESSAGE
-- ============================================

DO $$
BEGIN
    RAISE NOTICE '============================================';
    RAISE NOTICE '🏆 GOLD MEDAL LEVEL ERP SYSTEM CREATED! 🏆';
    RAISE NOTICE '============================================';
    RAISE NOTICE '';
    RAISE NOTICE '✅ TABLES CREATED:';
    RAISE NOTICE '  1. faculty_research_papers - Research publications';
    RAISE NOTICE '  2. faculty_workshops - Workshops & training';
    RAISE NOTICE '  3. faculty_certifications - Certifications';
    RAISE NOTICE '  4. faculty_awards - Awards & recognition';
    RAISE NOTICE '  5. faculty_subjects - Subjects taught';
    RAISE NOTICE '  6. faculty_timetable - Class schedule';
    RAISE NOTICE '  7. faculty_course_outcomes - NBA/NAAC COs';
    RAISE NOTICE '  8. faculty_assessment_data - Assessment records';
    RAISE NOTICE '  9. faculty_mentoring_records - Student mentoring';
    RAISE NOTICE ' 10. faculty_research_projects - Research projects';
    RAISE NOTICE ' 11. faculty_patents - Patents & IP';
    RAISE NOTICE ' 12. faculty_books - Books & chapters';
    RAISE NOTICE ' 13. faculty_memberships - Professional memberships';
    RAISE NOTICE '';
    RAISE NOTICE '✅ FEATURES:';
    RAISE NOTICE '  - Complete faculty profile system';
    RAISE NOTICE '  - Research & publications tracking';
    RAISE NOTICE '  - NBA/NAAC documentation';
    RAISE NOTICE '  - Timetable management';
    RAISE NOTICE '  - Student mentoring records';
    RAISE NOTICE '  - Dean approval workflow';
    RAISE NOTICE '';
    RAISE NOTICE '🎯 READY FOR:';
    RAISE NOTICE '  - NBA Accreditation';
    RAISE NOTICE '  - NAAC Assessment';
    RAISE NOTICE '  - Faculty evaluation';
    RAISE NOTICE '  - Research analytics';
    RAISE NOTICE '  - Public faculty directory';
    RAISE NOTICE '';
    RAISE NOTICE '============================================';
    RAISE NOTICE '🏆 ACHIEVEMENT UNLOCKED: GOLD + DIAMOND! 💎';
    RAISE NOTICE '============================================';
END $$;
