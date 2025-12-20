
-- =========================================================
-- GOLD DIAMOND FLAGSHIP: Complete Student Migration
-- =========================================================

-- 1. Create ALL Missing Sections (Bulletproof with ON CONFLICT)
INSERT INTO class_sections (name, dept_code, academic_year_id, academic_year, year, semester, section)
SELECT DISTINCT 
    (sp.dept_code || '-' || CAST(CEIL(sp.current_semester / 2.0) AS INTEGER) || '-' || COALESCE(sp.section, 'A')),
    sp.dept_code,
    (SELECT id FROM academic_years WHERE is_active = true LIMIT 1),
    '2025-2026',
    CAST(CEIL(sp.current_semester / 2.0) AS INTEGER),
    sp.current_semester,
    COALESCE(sp.section, 'A')
FROM student_profiles sp
ON CONFLICT (dept_code, academic_year_id, year, section) DO NOTHING;

-- 2. Migrate ALL 5038 Students (UPSERT - Update if exists, Insert if not)
INSERT INTO students (
    roll_number, first_name, last_name, email, dept_code,
    section_id, academic_year_id, current_year, current_semester, password_hash
)
SELECT 
    sp.roll_number,
    sp.first_name,
    sp.last_name,
    sp.email,
    sp.dept_code,
    cs.id,
    cs.academic_year_id,
    CAST(CEIL(sp.current_semester / 2.0) AS INTEGER),
    sp.current_semester,
    'demo123'
FROM student_profiles sp
JOIN class_sections cs ON 
    cs.name = (sp.dept_code || '-' || CAST(CEIL(sp.current_semester / 2.0) AS INTEGER) || '-' || COALESCE(sp.section, 'A'))
ON CONFLICT (roll_number) 
DO UPDATE SET 
    section_id = EXCLUDED.section_id, 
    academic_year_id = EXCLUDED.academic_year_id,
    current_year = EXCLUDED.current_year,
    current_semester = EXCLUDED.current_semester;

-- 3. FINAL GOLD DIAMOND VERIFICATION
SELECT 
    '🏆 GOLD DIAMOND STATUS' as report,
    (SELECT count(*) FROM student_profiles) as source_profiles,
    (SELECT count(*) FROM students) as active_students,
    (SELECT count(*) FROM class_sections) as total_sections,
    (SELECT count(*) FROM faculty_profiles) as total_faculty;
