-- Seed Program Details for Highlights (Admissions & Placements)
DO $$
DECLARE dept_id UUID;
BEGIN -- CSE
SELECT id INTO dept_id
FROM departments
WHERE code = 'CSE';
IF dept_id IS NOT NULL THEN
DELETE FROM nba_program_details
WHERE department_id = dept_id;
INSERT INTO nba_program_details (
        department_id,
        avg_package_latest,
        fill_rate_latest,
        placement_rate_latest,
        created_at,
        updated_at
    )
VALUES (
        dept_id,
        '6.5 LPA',
        '98.6%',
        '94.2%',
        NOW(),
        NOW()
    );
END IF;
-- CSE-DS
SELECT id INTO dept_id
FROM departments
WHERE code = 'CSE-DS';
IF dept_id IS NOT NULL THEN
DELETE FROM nba_program_details
WHERE department_id = dept_id;
INSERT INTO nba_program_details (
        department_id,
        avg_package_latest,
        fill_rate_latest,
        placement_rate_latest,
        created_at,
        updated_at
    )
VALUES (
        dept_id,
        '6.2 LPA',
        '95.4%',
        '92.1%',
        NOW(),
        NOW()
    );
END IF;
-- CSE-AI
SELECT id INTO dept_id
FROM departments
WHERE code = 'CSE-AI';
IF dept_id IS NOT NULL THEN
DELETE FROM nba_program_details
WHERE department_id = dept_id;
INSERT INTO nba_program_details (
        department_id,
        avg_package_latest,
        fill_rate_latest,
        placement_rate_latest,
        created_at,
        updated_at
    )
VALUES (
        dept_id,
        '6.3 LPA',
        '96.1%',
        '93.5%',
        NOW(),
        NOW()
    );
END IF;
-- ECE
SELECT id INTO dept_id
FROM departments
WHERE code = 'ECE';
IF dept_id IS NOT NULL THEN
DELETE FROM nba_program_details
WHERE department_id = dept_id;
INSERT INTO nba_program_details (
        department_id,
        avg_package_latest,
        fill_rate_latest,
        placement_rate_latest,
        created_at,
        updated_at
    )
VALUES (
        dept_id,
        '5.8 LPA',
        '92.3%',
        '88.7%',
        NOW(),
        NOW()
    );
END IF;
-- IT
SELECT id INTO dept_id
FROM departments
WHERE code = 'IT';
IF dept_id IS NOT NULL THEN
DELETE FROM nba_program_details
WHERE department_id = dept_id;
INSERT INTO nba_program_details (
        department_id,
        avg_package_latest,
        fill_rate_latest,
        placement_rate_latest,
        created_at,
        updated_at
    )
VALUES (
        dept_id,
        '5.9 LPA',
        '94.2%',
        '90.5%',
        NOW(),
        NOW()
    );
END IF;
-- CIVIL
SELECT id INTO dept_id
FROM departments
WHERE code = 'CIVIL';
IF dept_id IS NOT NULL THEN
DELETE FROM nba_program_details
WHERE department_id = dept_id;
INSERT INTO nba_program_details (
        department_id,
        avg_package_latest,
        fill_rate_latest,
        placement_rate_latest,
        created_at,
        updated_at
    )
VALUES (
        dept_id,
        '4.2 LPA',
        '85.0%',
        '76.4%',
        NOW(),
        NOW()
    );
END IF;
-- MBA
SELECT id INTO dept_id
FROM departments
WHERE code = 'MBA';
IF dept_id IS NOT NULL THEN
DELETE FROM nba_program_details
WHERE department_id = dept_id;
INSERT INTO nba_program_details (
        department_id,
        avg_package_latest,
        fill_rate_latest,
        placement_rate_latest,
        created_at,
        updated_at
    )
VALUES (
        dept_id,
        '5.5 LPA',
        '90.0%',
        '82.0%',
        NOW(),
        NOW()
    );
END IF;
-- MCA
SELECT id INTO dept_id
FROM departments
WHERE code = 'MCA';
IF dept_id IS NOT NULL THEN
DELETE FROM nba_program_details
WHERE department_id = dept_id;
INSERT INTO nba_program_details (
        department_id,
        avg_package_latest,
        fill_rate_latest,
        placement_rate_latest,
        created_at,
        updated_at
    )
VALUES (
        dept_id,
        '4.8 LPA',
        '91.5%',
        '85.0%',
        NOW(),
        NOW()
    );
END IF;
-- EEE
SELECT id INTO dept_id
FROM departments
WHERE code = 'EEE';
IF dept_id IS NOT NULL THEN
DELETE FROM nba_program_details
WHERE department_id = dept_id;
INSERT INTO nba_program_details (
        department_id,
        avg_package_latest,
        fill_rate_latest,
        placement_rate_latest,
        created_at,
        updated_at
    )
VALUES (
        dept_id,
        '4.5 LPA',
        '88.0%',
        '79.2%',
        NOW(),
        NOW()
    );
END IF;
-- MECH
SELECT id INTO dept_id
FROM departments
WHERE code = 'MECH';
IF dept_id IS NOT NULL THEN
DELETE FROM nba_program_details
WHERE department_id = dept_id;
INSERT INTO nba_program_details (
        department_id,
        avg_package_latest,
        fill_rate_latest,
        placement_rate_latest,
        created_at,
        updated_at
    )
VALUES (
        dept_id,
        '4.3 LPA',
        '86.5%',
        '78.1%',
        NOW(),
        NOW()
    );
END IF;
-- BSH (Usually doesn't have placements in same way, but providing for consistency)
SELECT id INTO dept_id
FROM departments
WHERE code = 'BSH';
IF dept_id IS NOT NULL THEN
DELETE FROM nba_program_details
WHERE department_id = dept_id;
INSERT INTO nba_program_details (
        department_id,
        avg_package_latest,
        fill_rate_latest,
        placement_rate_latest,
        created_at,
        updated_at
    )
VALUES (dept_id, 'N/A', '98.0%', 'N/A', NOW(), NOW());
END IF;
END $$;