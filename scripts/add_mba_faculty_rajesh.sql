-- Insert Dr. KPR Rajesh into MBA Department
INSERT INTO faculty (
        name,
        designation,
        department,
        qualification,
        status,
        date_of_joining,
        pan_number
    )
VALUES (
        'Dr. KPR Rajesh',
        'Associate Professor',
        'MBA',
        'MBA, M.Phil, Ph.D',
        'Regular',
        '2025-07-07',
        'AYXPP2880J'
    );
-- Update department stats if needed (optional, often derived from query)
-- UPDATE department_stats SET faculty_count = faculty_count + 1 WHERE code = 'MBA';