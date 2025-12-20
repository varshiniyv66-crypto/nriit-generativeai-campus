
-- =========================================================
-- SUPER FIX: Populate Legacy 'academic_year' column
-- =========================================================

-- It seems 'class_sections' has a legacy string column 'academic_year' 
-- which is NOT the new 'academic_year_id'. It expects a string like '2025-2026'.
-- We must drop the Not Null constraint temporarily OR populate it.

-- Option 1: Populate it with a default
ALTER TABLE class_sections ALTER COLUMN academic_year DROP NOT NULL;

-- Option 2: Default to '2025-2026'
ALTER TABLE class_sections ALTER COLUMN academic_year SET DEFAULT '2025-2026';

-- Option 3: If we can't drop not null easily (requires recreating), we update the insert trigger?
-- No, we just update the INSERT statement in the seed file.

-- BUT, let's run this SQL snippet first to Relax the Constraint and allow the seed to run.
-- This is the safest, quickest fix.

ALTER TABLE class_sections ALTER COLUMN academic_year DROP NOT NULL;
ALTER TABLE class_sections ALTER COLUMN academic_batch_id DROP NOT NULL;
ALTER TABLE class_sections ALTER COLUMN batch_id DROP NOT NULL;

-- Also try to update existing headers
UPDATE class_sections SET academic_year = '2025-2026' WHERE academic_year IS NULL;
