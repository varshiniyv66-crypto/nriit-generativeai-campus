
-- =========================================================
-- SUPER FIX v3: Timetable Column Types
-- =========================================================

-- The error "operator does not exist: text >= integer" implies a logic check fail,
-- OR that 'period_number' is TEXT and we are comparing it to INTEGER?
-- OR 'year' is TEXT?

-- Let's ensure ALL columns have correct types.

-- 1. period_number should be INTEGER
ALTER TABLE timetable ALTER COLUMN period_number TYPE INTEGER USING period_number::integer;

-- 2. day_of_week should be TEXT
ALTER TABLE timetable ALTER COLUMN day_of_week TYPE TEXT;

-- 3. start_time/end_time should be TIME or TEXT (TIME is better, but TEXT works)
-- Let's stick to TIME as per my previous fix, or TEXT if TIME fails.
ALTER TABLE timetable ALTER COLUMN start_time TYPE TIME USING start_time::time;
ALTER TABLE timetable ALTER COLUMN end_time TYPE TIME USING end_time::time;

-- 4. Check class_sections year/semester
ALTER TABLE class_sections ALTER COLUMN year TYPE INTEGER USING year::integer;
ALTER TABLE class_sections ALTER COLUMN semester TYPE INTEGER USING semester::integer;

-- 5. Courses semester/credits
ALTER TABLE courses ALTER COLUMN semester TYPE INTEGER USING semester::integer;
ALTER TABLE courses ALTER COLUMN credits TYPE INTEGER USING credits::integer;

-- CRITICAL: CHECK IF RLS POLICIES ARE CAUSING THIS?
-- "operator does not exist: text >= integer" often happens in RLS checks like:
-- "auth.uid() = user_id" or "year >= 2".

-- If the query failing is the INSERT, let's look at the INSERT again.
-- The error prevents the Seed from running.
-- SQL: INSERT INTO timetable ... VALUES (..., 1, ...)

-- Wait, if 'period_number' was TEXT in DB, comparing it to 1 might fail?
-- This script fixes that.

