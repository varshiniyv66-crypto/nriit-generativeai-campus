
-- =========================================================
-- GOLD DIAMOND: Update Mentor Allocations with REAL Data
-- =========================================================

-- First, let's see the actual column names
SELECT column_name FROM information_schema.columns WHERE table_name = 'mentor_allocations';
