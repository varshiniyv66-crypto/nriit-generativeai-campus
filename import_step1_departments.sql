-- ===========================================
-- STEP 1: DEPARTMENTS & BATCHES ONLY
-- This is the SAFEST first step
-- Run this before importing students
-- ===========================================

-- FINAL 10 NRIIT DEPARTMENTS
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

-- Ensure batches exist
INSERT INTO academic_batches (batch_year, batch_name, is_current) VALUES
(2025, '2025-29', true), 
(2024, '2024-28', false), 
(2023, '2023-27', false), 
(2022, '2022-26', false), 
(2021, '2021-25', false)
ON CONFLICT DO NOTHING;

-- Verify departments
SELECT code, name FROM departments ORDER BY code;

-- Verify batches  
SELECT batch_year, batch_name, is_current FROM academic_batches ORDER BY batch_year DESC;
