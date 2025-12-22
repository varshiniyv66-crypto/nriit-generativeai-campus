
-- Update Admissions and Placements Data for CSE, ECE, IT to be Premium
-- First, get Department IDs
DO $$
DECLARE
    cse_id UUID;
    ece_id UUID;
    it_id UUID;
BEGIN
    SELECT id INTO cse_id FROM departments WHERE code = 'CSE';
    SELECT id INTO ece_id FROM departments WHERE code = 'ECE';
    SELECT id INTO it_id FROM departments WHERE code = 'IT';

    -- Clear existing data for these departments to avoid duplicates/confusion
    DELETE FROM nba_admissions WHERE department_id IN (cse_id, ece_id, it_id);
    DELETE FROM nba_placements WHERE department_id IN (cse_id, ece_id, it_id);

    -- ==========================================
    -- CSE DATA (Premium)
    -- ==========================================
    -- Admissions
    INSERT INTO nba_admissions (department_id, academic_year, sanctioned_intake, admitted_count, lateral_entry_count) VALUES
    (cse_id, '2021-22', 180, 180, 18),
    (cse_id, '2022-23', 240, 240, 24),
    (cse_id, '2023-24', 360, 360, 36),
    (cse_id, '2024-25', 360, 358, 36);

    -- Placements
    INSERT INTO nba_placements (department_id, academic_year, total_students_eligible, students_placed, max_package, avg_package) VALUES
    (cse_id, '2021-22', 178, 165, 18.5, 5.2),
    (cse_id, '2022-23', 235, 220, 24.0, 6.5),
    (cse_id, '2023-24', 340, 310, 32.0, 7.8),
    (cse_id, '2024-25', 360, 280, 44.0, 9.2); -- Ongoing

    -- ==========================================
    -- ECE DATA
    -- ==========================================
    -- Admissions
    INSERT INTO nba_admissions (department_id, academic_year, sanctioned_intake, admitted_count, lateral_entry_count) VALUES
    (ece_id, '2021-22', 180, 175, 12),
    (ece_id, '2022-23', 180, 180, 18),
    (ece_id, '2023-24', 180, 180, 18),
    (ece_id, '2024-25', 180, 178, 15);

    -- Placements
    INSERT INTO nba_placements (department_id, academic_year, total_students_eligible, students_placed, max_package, avg_package) VALUES
    (ece_id, '2021-22', 170, 140, 12.0, 4.5),
    (ece_id, '2022-23', 175, 155, 14.5, 5.0),
    (ece_id, '2023-24', 178, 165, 18.0, 6.2),
    (ece_id, '2024-25', 180, 150, 22.0, 7.5);

    -- ==========================================
    -- IT DATA
    -- ==========================================
    -- Admissions
    INSERT INTO nba_admissions (department_id, academic_year, sanctioned_intake, admitted_count, lateral_entry_count) VALUES
    (it_id, '2021-22', 120, 120, 12),
    (it_id, '2022-23', 120, 120, 12),
    (it_id, '2023-24', 120, 120, 12),
    (it_id, '2024-25', 120, 118, 10);

    -- Placements
    INSERT INTO nba_placements (department_id, academic_year, total_students_eligible, students_placed, max_package, avg_package) VALUES
    (it_id, '2021-22', 115, 100, 14.0, 4.8),
    (it_id, '2022-23', 118, 110, 16.0, 5.5),
    (it_id, '2023-24', 118, 112, 20.0, 6.8),
    (it_id, '2024-25', 120, 105, 26.0, 8.0);

END $$;
