-- Fix PAN Numbers for All Departments (CSE, IT, ECE)
-- Extracted manually from source CSVs for maximum accuracy

-- ==========================================
-- IT DEPARTMENT
-- ==========================================
UPDATE faculty_profiles SET pan_number = 'AMGPB4443C' WHERE dept_code = 'IT' AND (first_name || ' ' || last_name) ILIKE '%BATTULA%SOWJANYA%';
UPDATE faculty_profiles SET pan_number = 'CAUPP4414P' WHERE dept_code = 'IT' AND (first_name || ' ' || last_name) ILIKE '%PATCHALA%SRINIVAS%';
UPDATE faculty_profiles SET pan_number = 'CKUPG6787L' WHERE dept_code = 'IT' AND (first_name || ' ' || last_name) ILIKE '%GARNEPUDI%SRAVA%';
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

-- ==========================================
-- CSE DEPARTMENT
-- ==========================================
UPDATE faculty_profiles SET pan_number = 'AGZPK9875A' WHERE dept_code = 'CSE' AND (first_name || ' ' || last_name) ILIKE '%NAGESWARA%RAO%';
UPDATE faculty_profiles SET pan_number = 'AJBPJ5874D' WHERE dept_code = 'CSE' AND (first_name || ' ' || last_name) ILIKE '%CHANDRASEKHAR%';
UPDATE faculty_profiles SET pan_number = 'AHJPV7914J' WHERE dept_code = 'CSE' AND (first_name || ' ' || last_name) ILIKE '%PRATAP%';
UPDATE faculty_profiles SET pan_number = 'BCJPD3175R' WHERE dept_code = 'CSE' AND (first_name || ' ' || last_name) ILIKE '%HARI%KRISHNA%';
UPDATE faculty_profiles SET pan_number = 'BISPC5648H' WHERE dept_code = 'CSE' AND (first_name || ' ' || last_name) ILIKE '%BINDU%MADHAVI%';
UPDATE faculty_profiles SET pan_number = 'AQXPY6818K' WHERE dept_code = 'CSE' AND (first_name || ' ' || last_name) ILIKE '%JESSY%KUMARI%';
UPDATE faculty_profiles SET pan_number = 'ASUPN0182C' WHERE dept_code = 'CSE' AND (first_name || ' ' || last_name) ILIKE '%KANTHI%PRIYADARSINI%';
UPDATE faculty_profiles SET pan_number = 'FRNPK0670R' WHERE dept_code = 'CSE' AND (first_name || ' ' || last_name) ILIKE '%MANVITHA%';
UPDATE faculty_profiles SET pan_number = 'CRVPB4846F' WHERE dept_code = 'CSE' AND (first_name || ' ' || last_name) ILIKE '%RAJASHEKHAR%';
UPDATE faculty_profiles SET pan_number = 'CDZPG3632C' WHERE dept_code = 'CSE' AND (first_name || ' ' || last_name) ILIKE '%SOWMYA%';
UPDATE faculty_profiles SET pan_number = 'FMBPP4788J' WHERE dept_code = 'CSE' AND (first_name || ' ' || last_name) ILIKE '%RAZIYA%SULTHANA%';
UPDATE faculty_profiles SET pan_number = 'COTPD0280A' WHERE dept_code = 'CSE' AND (first_name || ' ' || last_name) ILIKE '%THIRUPATHAMMA%';
UPDATE faculty_profiles SET pan_number = 'BBEPP2042K' WHERE dept_code = 'CSE' AND (first_name || ' ' || last_name) ILIKE '%SWATHI%';
UPDATE faculty_profiles SET pan_number = 'EEZPS2467P' WHERE dept_code = 'CSE' AND (first_name || ' ' || last_name) ILIKE '%SOWJANYA%';
UPDATE faculty_profiles SET pan_number = 'APSPN0854N' WHERE dept_code = 'CSE' AND (first_name || ' ' || last_name) ILIKE '%VAMSI%KRISHNA%';
UPDATE faculty_profiles SET pan_number = 'NPYPY5159E' WHERE dept_code = 'CSE' AND (first_name || ' ' || last_name) ILIKE '%RATNA%KUMARI%';

-- ==========================================
-- ECE DEPARTMENT
-- ==========================================
UPDATE faculty_profiles SET pan_number = 'AHHPK9247R' WHERE dept_code = 'ECE' AND (first_name || ' ' || last_name) ILIKE '%SRIHARI%RAO%';
UPDATE faculty_profiles SET pan_number = 'AXFPV1084P' WHERE dept_code = 'ECE' AND (first_name || ' ' || last_name) ILIKE '%VENUGOPALA%CHOWDARY%';
UPDATE faculty_profiles SET pan_number = 'DEOPS4571H' WHERE dept_code = 'ECE' AND (first_name || ' ' || last_name) ILIKE '%SESHAGIRI%RAO%';
UPDATE faculty_profiles SET pan_number = 'BUSPD1865K' WHERE dept_code = 'ECE' AND (first_name || ' ' || last_name) ILIKE '%LAKSHMI%DARSI%';
UPDATE faculty_profiles SET pan_number = 'ASKPK4364K' WHERE dept_code = 'ECE' AND (first_name || ' ' || last_name) ILIKE '%SUJATA%KANDUKURI%';
UPDATE faculty_profiles SET pan_number = 'CAGPM8971A' WHERE dept_code = 'ECE' AND (first_name || ' ' || last_name) ILIKE '%MANASA%MANUKONDA%';
UPDATE faculty_profiles SET pan_number = 'ATRPV1800B' WHERE dept_code = 'ECE' AND (first_name || ' ' || last_name) ILIKE '%NAGA%JYOTHI%';
UPDATE faculty_profiles SET pan_number = 'BTRPP5257M' WHERE dept_code = 'ECE' AND (first_name || ' ' || last_name) ILIKE '%PRAMEELA%PODILI%';
UPDATE faculty_profiles SET pan_number = 'FOIPP2075D' WHERE dept_code = 'ECE' AND (first_name || ' ' || last_name) ILIKE '%SRILAKSHMI%PAMARTHI%';
UPDATE faculty_profiles SET pan_number = 'CFBPG9923C' WHERE dept_code = 'ECE' AND (first_name || ' ' || last_name) ILIKE '%SAI%KUMAR%GOPU%';
UPDATE faculty_profiles SET pan_number = 'QPHPS2639M' WHERE dept_code = 'ECE' AND (first_name || ' ' || last_name) ILIKE '%SARIPUDI%SUNEETHA%';
UPDATE faculty_profiles SET pan_number = 'DXPPM3850M' WHERE dept_code = 'ECE' AND (first_name || ' ' || last_name) ILIKE '%BINDU%SRI%';
UPDATE faculty_profiles SET pan_number = 'MURPS2833L' WHERE dept_code = 'ECE' AND (first_name || ' ' || last_name) ILIKE '%YARRU%SREEJA%';
UPDATE faculty_profiles SET pan_number = 'GTAPS5001N' WHERE dept_code = 'ECE' AND (first_name || ' ' || last_name) ILIKE '%SHAHANAJ%SHAIK%';
UPDATE faculty_profiles SET pan_number = 'DCOPP4624Q' WHERE dept_code = 'ECE' AND (first_name || ' ' || last_name) ILIKE '%KANVITHA%';
UPDATE faculty_profiles SET pan_number = 'FQDPS3325A' WHERE dept_code = 'ECE' AND (first_name || ' ' || last_name) ILIKE '%HANEEF%SHAIK%';
UPDATE faculty_profiles SET pan_number = 'ASLPV6028N' WHERE dept_code = 'ECE' AND (first_name || ' ' || last_name) ILIKE '%PAVANI%VELAGA%';
UPDATE faculty_profiles SET pan_number = 'CUHPK9709F' WHERE dept_code = 'ECE' AND (first_name || ' ' || last_name) ILIKE '%KIRAN%KUMAR%';
UPDATE faculty_profiles SET pan_number = 'BDXPT1598R' WHERE dept_code = 'ECE' AND (first_name || ' ' || last_name) ILIKE '%TAMILVANAM%';
UPDATE faculty_profiles SET pan_number = 'CHOPB4463R' WHERE dept_code = 'ECE' AND (first_name || ' ' || last_name) ILIKE '%INDU%LATHA%';
UPDATE faculty_profiles SET pan_number = 'CYUPA3019H' WHERE dept_code = 'ECE' AND (first_name || ' ' || last_name) ILIKE '%VIJAY%KUMAR%';
UPDATE faculty_profiles SET pan_number = 'APIPC7075C' WHERE dept_code = 'ECE' AND (first_name || ' ' || last_name) ILIKE '%SATYANARAYANA%MURTHY%';
UPDATE faculty_profiles SET pan_number = 'BBZPK0581M' WHERE dept_code = 'ECE' AND (first_name || ' ' || last_name) ILIKE '%KALAI%SELVAN%';
UPDATE faculty_profiles SET pan_number = 'BGQPA7840D' WHERE dept_code = 'ECE' AND (first_name || ' ' || last_name) ILIKE '%GIRIDHAR%BABU%';
UPDATE faculty_profiles SET pan_number = 'BNXPP9154K' WHERE dept_code = 'ECE' AND (first_name || ' ' || last_name) ILIKE '%MANOHAR%PATRA%';
UPDATE faculty_profiles SET pan_number = 'BKOPP3138F' WHERE dept_code = 'ECE' AND (first_name || ' ' || last_name) ILIKE '%AMALA%PAYALA%';
UPDATE faculty_profiles SET pan_number = 'CDZPM3649D' WHERE dept_code = 'ECE' AND (first_name || ' ' || last_name) ILIKE '%RAVI%MANCHARLA%';
UPDATE faculty_profiles SET pan_number = 'EGKPD8991P' WHERE dept_code = 'ECE' AND (first_name || ' ' || last_name) ILIKE '%SRAVYA%DOPPALAPUDI%';
UPDATE faculty_profiles SET pan_number = 'ARJPX9955E' WHERE dept_code = 'ECE' AND (first_name || ' ' || last_name) ILIKE '%LAKSHMINARAYANA%MOGILI%';
UPDATE faculty_profiles SET pan_number = 'AVAPB1718M' WHERE dept_code = 'ECE' AND (first_name || ' ' || last_name) ILIKE '%MEENAKSHI%BOLLU%';
UPDATE faculty_profiles SET pan_number = 'AHLPB1060B' WHERE dept_code = 'ECE' AND (first_name || ' ' || last_name) ILIKE '%SAIDAIAH%BANDI%';
UPDATE faculty_profiles SET pan_number = 'ASEPM5158P' WHERE dept_code = 'ECE' AND (first_name || ' ' || last_name) ILIKE '%MARY%JUNITHA%';
UPDATE faculty_profiles SET pan_number = 'AEWPJ3828H' WHERE dept_code = 'ECE' AND (first_name || ' ' || last_name) ILIKE '%KRISHNA%KISHORE%';
UPDATE faculty_profiles SET pan_number = 'AGFPV0118D' WHERE dept_code = 'ECE' AND (first_name || ' ' || last_name) ILIKE '%NAGA%MALLESWARI%';
UPDATE faculty_profiles SET pan_number = 'AIJPD0508K' WHERE dept_code = 'ECE' AND (first_name || ' ' || last_name) ILIKE '%SANJAY%DOLA%';
UPDATE faculty_profiles SET pan_number = 'DRJPS6283L' WHERE dept_code = 'ECE' AND (first_name || ' ' || last_name) ILIKE '%BABA%FARIDDIN%'; -- Also UJJIT & BHASKAR in CSV share this PAN
UPDATE faculty_profiles SET pan_number = 'CDJPT2228K' WHERE dept_code = 'ECE' AND (first_name || ' ' || last_name) ILIKE '%POTHULA%TEJA%';
UPDATE faculty_profiles SET pan_number = 'AYGPN4082P' WHERE dept_code = 'ECE' AND (first_name || ' ' || last_name) ILIKE '%VEERENDRANATH%';
UPDATE faculty_profiles SET pan_number = 'DWQPB6348H' WHERE dept_code = 'ECE' AND (first_name || ' ' || last_name) ILIKE '%SAI%BANAVATHU%';
UPDATE faculty_profiles SET pan_number = 'FEUPS3646D' WHERE dept_code = 'ECE' AND (first_name || ' ' || last_name) ILIKE '%FAIROZE%SHAIK%';

-- End of Fix File --
