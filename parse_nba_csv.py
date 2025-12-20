
import re
import os

def parse_nba_file(filepath, dept_code):
    encodings = ['utf-8', 'latin-1', 'cp1252', 'utf-16']
    content = None
    if not os.path.exists(filepath):
        print(f"-- File not found: {filepath}")
        return

    for enc in encodings:
        try:
            with open(filepath, 'r', encoding=enc) as f:
                content = f.readlines()
            break
        except Exception:
            continue
            
    if not content:
        print(f"-- Failed to read file {filepath}")
        return

    print(f"-- Processing {filepath} for {dept_code}")
    
    pan_pattern = re.compile(r'\b[A-Z]{5}[0-9]{4}[A-Z]\b')
    faculty_data = []
    
    for i, line in enumerate(content):
        match = pan_pattern.search(line)
        if match:
            pan = match.group(0)
            
            qual = 'M.Tech' # Default
            if 'Ph.D' in line: qual = 'Ph.D'
            elif 'M.Tech' in line: qual = 'M.Tech'
            elif 'MS' in line: qual = 'MS'
            elif 'B.Tech' in line: qual = 'B.Tech'

            dates = re.findall(r'\d{2}/\d{2}/\d{4}', line)
            joining_date = dates[0] if dates else '2020-01-01'
            
            designation = 'Assistant Professor'
            if 'Associate Professor' in line: designation = 'Associate Professor'
            elif 'Professor' in line and 'Assistant' not in line: designation = 'Professor'
            
            pre_pan = line[:match.start()].strip()
            name_parts = []
            
            if i > 0:
                prev = content[i-1].strip()
                if len(prev) > 2 and "Page" not in prev and "e-NBA" not in prev and not pan_pattern.search(prev):
                    name_parts.append(prev)
            
            name_parts.append(pre_pan)
            
            if i < len(content) - 1:
                next_l = content[i+1].strip()
                if next_l and len(next_l) < 20 and not pan_pattern.search(next_l):
                    name_parts.append(next_l)
            
            full_raw_name = " ".join(name_parts)
            
            n = full_raw_name.replace('"', '').replace("Assistant", "").replace("Professor", "").replace("Associate", "")
            n = re.sub(r'^(MR\.|MRS\.|MS\.|DR\.|KS\.|SK\.)', '', n.strip(), flags=re.IGNORECASE)
            n = re.sub(r'\s+', ' ', n).strip()
            
            # Remove digits if any
            n = re.sub(r'\d+', '', n)
            
            if len(n) < 3: n = "Unknown Faculty"

            faculty_data.append({
                'full_name': n,
                'pan_no': pan,
                'qualification': qual,
                'joining_date': joining_date,
                'designation': designation,
                'dept': dept_code
            })
            
    for fac in faculty_data:
        # Robust Matching: Remove spaces and dots for comparison
        clean_match_key = fac['full_name'].replace(" ", "").replace(".", "")
        
        sql = f"""
UPDATE faculty_profiles 
SET 
    qualification = '{fac['qualification']}', 
    date_of_joining = TO_DATE('{fac['joining_date']}', 'DD/MM/YYYY'),
    pan_number = '{fac['pan_no']}',
    designation = '{fac['designation']}'
WHERE 
    (REPLACE(REPLACE(full_name, ' ', ''), '.', '') ILIKE '%{clean_match_key}%') 
    AND (dept_code ILIKE '{fac['dept']}' OR dept_code IN (SELECT code FROM departments WHERE code='{fac['dept']}'));
"""
        print(sql.strip())

def main():
    base_path = r"c:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\FILESOURCES\CSVs"
    
    files = [
        ("e-NBA-prequalifier-cse.csv", "CSE"),
        ("e-NBA-prequalifier-ece.csv", "ECE"),
        ("e-NBA-prequalifier-it.csv", "IT"),
    ]
    
    print("-- Generated NBA Faculty Updates")
    for fname, dept in files:
        parse_nba_file(os.path.join(base_path, fname), dept)

    print("\n-- Admissions Data (CSE Only - Extracted)")
    print("""
INSERT INTO nba_admissions (department_id, academic_year, sanctioned_intake, admitted_count, lateral_entry_count)
VALUES 
((SELECT id FROM departments WHERE code='CSE' LIMIT 1), '2024-25', 360, 311, 11),
((SELECT id FROM departments WHERE code='CSE' LIMIT 1), '2023-24', 150, 164, 5),
((SELECT id FROM departments WHERE code='CSE' LIMIT 1), '2022-23', 150, 144, 12)
ON CONFLICT (department_id, academic_year) DO UPDATE SET 
    sanctioned_intake = EXCLUDED.sanctioned_intake,
    admitted_count = EXCLUDED.admitted_count;
""")
    
    print("\n-- Vision Placeholder")
    print("""
INSERT INTO nba_program_details (department_id, vision, mission)
VALUES ((SELECT id FROM departments WHERE code='CSE' LIMIT 1), 
'To produce globally competent computer professionals with social responsibility.',
'M1: To provide quality education... M2: To promote research... M3: To inculcate ethical values...')
ON CONFLICT (department_id) DO NOTHING;
""")

if __name__ == "__main__":
    main()
