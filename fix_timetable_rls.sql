-- =================================================================
-- FIX RLS POLICIES FOR TIMETABLE MANAGEMENT
-- Run this in Supabase SQL Editor to allow timetable operations
-- =================================================================

-- 1. Enable inserts on class_sections
DROP POLICY IF EXISTS "Allow all on class_sections" ON class_sections;
CREATE POLICY "Allow all on class_sections" 
ON class_sections FOR ALL 
USING (true) 
WITH CHECK (true);

-- 2. Enable inserts on courses
DROP POLICY IF EXISTS "Allow all on courses" ON courses;
CREATE POLICY "Allow all on courses" 
ON courses FOR ALL 
USING (true) 
WITH CHECK (true);

-- 3. Enable inserts on timetable
DROP POLICY IF EXISTS "Allow all on timetable" ON timetable;
CREATE POLICY "Allow all on timetable" 
ON timetable FOR ALL 
USING (true) 
WITH CHECK (true);

-- Verify
SELECT tablename, policyname FROM pg_policies 
WHERE tablename IN ('class_sections', 'courses', 'timetable');
