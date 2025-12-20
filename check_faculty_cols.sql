
-- Check faculty_profiles column names
SELECT column_name FROM information_schema.columns WHERE table_name = 'faculty_profiles' ORDER BY ordinal_position LIMIT 20;
