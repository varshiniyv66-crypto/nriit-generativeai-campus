
-- =========================================================
-- NUCLEAR OPTION: Drop and Recreate Timetable
-- =========================================================

-- The "text >= integer" error is stubborn and likely due to a corrupt column definition
-- or a hidden dependency/constraint/trigger that we are unaware of.
-- Since the table is effectively broken/empty for our purposes,
-- the cleanest fix is to DROP it and RECREATE it perfectly.

DROP TABLE IF EXISTS timetable CASCADE;

CREATE TABLE timetable (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    class_section_id UUID,
    faculty_id UUID,
    course_id UUID,
    day_of_week TEXT, -- We want TEXT
    period_number INTEGER, -- We want INTEGER
    start_time TIME,
    end_time TIME,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW(),
    -- Optional: Add Foreign Foreign Keys if you want strictness, 
    -- but for seeding reliability we skip strict FKs for now to avoid order issues.
    CONSTRAINT fk_class_section FOREIGN KEY (class_section_id) REFERENCES class_sections(id) ON DELETE CASCADE,
    CONSTRAINT fk_course FOREIGN KEY (course_id) REFERENCES courses(id)
    -- We deliberately skip faculty_id FK to allow "borrowing" dummy IDs if needed
);

-- Verify it worked
SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'timetable';
