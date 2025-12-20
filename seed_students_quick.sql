
-- Insert Dummy Students for Testing
INSERT INTO students (roll_number, first_name, last_name, email, dept_code, section_id, academic_year_id)
SELECT 
    '23CSE201', 'Arjun', 'Reddy', 'arjun.cse@nriit.ac.in', 'CSE', cs.id, cs.academic_year_id
FROM class_sections cs WHERE cs.name = 'CSE-2-A'
ON CONFLICT (roll_number) DO NOTHING;

INSERT INTO students (roll_number, first_name, last_name, email, dept_code, section_id, academic_year_id)
SELECT 
    '23ECE201', 'Priya', 'Sharma', 'priya.ece@nriit.ac.in', 'ECE', cs.id, cs.academic_year_id
FROM class_sections cs WHERE cs.name = 'ECE-2-A'
ON CONFLICT (roll_number) DO NOTHING;
