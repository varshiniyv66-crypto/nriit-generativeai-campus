-- Fix Missing PAN Numbers for IT Department Faculty
-- Extracted manually from e-NBA-prequalifier-it.csv to ensure 100% accuracy

UPDATE faculty_profiles SET pan_number = 'AMGPB4443C' WHERE dept_code = 'IT' AND (first_name || ' ' || last_name) ILIKE '%BATTULA%SOWJANYA%';
UPDATE faculty_profiles SET pan_number = 'CAUPP4414P' WHERE dept_code = 'IT' AND (first_name || ' ' || last_name) ILIKE '%PATCHALA%SRINIVAS%';
UPDATE faculty_profiles SET pan_number = 'CKUPG6787L' WHERE dept_code = 'IT' AND (first_name || ' ' || last_name) ILIKE '%GARNEPUDI%SRAVA%'; -- Matches SRAVANILATHA and SRAVANI LATHA
UPDATE faculty_profiles SET pan_number = 'AGNPC4621Q' WHERE dept_code = 'IT' AND (first_name || ' ' || last_name) ILIKE '%USHA%CHERUKURI%';
UPDATE faculty_profiles SET pan_number = 'BZEPA5209F' WHERE dept_code = 'IT' AND (first_name || ' ' || last_name) ILIKE '%PURNIMA%ANNPUREDDY%';
UPDATE faculty_profiles SET pan_number = 'ENNBK9054E' WHERE dept_code = 'IT' AND (first_name || ' ' || last_name) ILIKE '%KONJETI%GAYATHRI%';
UPDATE faculty_profiles SET pan_number = 'FFEPD1851Q' WHERE dept_code = 'IT' AND (first_name || ' ' || last_name) ILIKE '%DUTTA%DEVIKA%';
UPDATE faculty_profiles SET pan_number = 'APCPP4507Q' WHERE dept_code = 'IT' AND (first_name || ' ' || last_name) ILIKE '%SRINIVAS%REDDY%PALLE%';
UPDATE faculty_profiles SET pan_number = 'GKBPK4116E' WHERE dept_code = 'IT' AND (first_name || ' ' || last_name) ILIKE '%KOTA%TRIVENI%DEEPTHI%';
UPDATE faculty_profiles SET pan_number = 'ATPPK6474N' WHERE dept_code = 'IT' AND (first_name || ' ' || last_name) ILIKE '%KAMMILI%JAGAN%MOHAN%';
UPDATE faculty_profiles SET pan_number = 'BEWPD1223D' WHERE dept_code = 'IT' AND (first_name || ' ' || last_name) ILIKE '%DESU%SABARI%GIRINATH%';
UPDATE faculty_profiles SET pan_number = 'CSYPM7167A' WHERE dept_code = 'IT' AND (first_name || ' ' || last_name) ILIKE '%MEDA%MALLIKARJUNA%';
UPDATE faculty_profiles SET pan_number = 'GOIPD3934Q' WHERE dept_code = 'IT' AND (first_name || ' ' || last_name) ILIKE '%NADAPARAJU%DURGA%';
UPDATE faculty_profiles SET pan_number = 'ABTPE8752D' WHERE dept_code = 'IT' AND (first_name || ' ' || last_name) ILIKE '%EDURU%NAGARJUNA%';
UPDATE faculty_profiles SET pan_number = 'BAVPG0343L' WHERE dept_code = 'IT' AND (first_name || ' ' || last_name) ILIKE '%GANGAPATNAM%SRIVIDYA%';
