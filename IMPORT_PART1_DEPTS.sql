-- PART 1: DEPARTMENTS & BATCHES (Run this first)
-- ===========================================

INSERT INTO departments (code, name, short_name, is_active) VALUES
('CSE', 'Computer Science and Engineering', 'CSE', true),
('CSE-DS', 'CSE - Data Science', 'CSE-DS', true),
('ECE', 'Electronics and Communication Engineering', 'ECE', true),
('CSE-AI', 'CSE - Artificial Intelligence & ML', 'CSE-AI', true),
('IT', 'Information Technology', 'IT', true),
('EVT', 'Electric Vehicle Technology', 'EVT', true),
('CIVIL', 'Civil Engineering', 'CIVIL', true),
('BSH', 'Humanities and Sciences', 'BSH', true),
('MBA', 'Master of Business Administration', 'MBA', true),
('MCA', 'Master of Computer Applications', 'MCA', true)
ON CONFLICT (code) DO NOTHING;

INSERT INTO academic_batches (batch_year, batch_name, is_current) VALUES
(2025, '2025-29', true), 
(2024, '2024-28', false), 
(2023, '2023-27', false), 
(2022, '2022-26', false), 
(2021, '2021-25', false)
ON CONFLICT DO NOTHING;

SELECT 'PART 1 COMPLETE: Departments & Batches added!' as status;
