"""
NRIIT REAL DATA IMPORT SCRIPT
Reads all Excel files with multiple sheets and generates SQL for Supabase
"""

import pandas as pd
import os
import re
from datetime import datetime

# Data folder path
DATA_FOLDER = r"C:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\realupdated data of nriit"
OUTPUT_FILE = r"C:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\import_nriit_real_data.sql"

# Track all students and faculty
all_students = []
all_faculty = []

# Department mapping
DEPT_MAPPING = {
    'CE': 'CIVIL',
    'CIVIL': 'CIVIL',
    'ECE': 'ECE',
    'ECE-A': 'ECE',
    'ECE -A': 'ECE',
    'ECE - A': 'ECE',
    'ECE-B': 'ECE',
    'ECE -B': 'ECE',
    'ECE - B': 'ECE',
    'ECE-C': 'ECE',
    'ECE -C': 'ECE',
    'ECE - C': 'ECE',
    'CSE': 'CSE',
    'CSE-A': 'CSE',
    'CSE -A': 'CSE',
    'CSE - A': 'CSE',
    'CSE-B': 'CSE',
    'CSE -B': 'CSE',
    'CSE - B': 'CSE',
    'CSE-C': 'CSE',
    'CSE -C': 'CSE',
    'CSE - C': 'CSE',
    'CSE-D': 'CSE',
    'CSE -D': 'CSE',
    'CSE - D': 'CSE',
    'IT': 'IT',
    'IT-A': 'IT',
    'IT-B': 'IT',
    'DS': 'CSE-DS',
    'DS-A': 'CSE-DS',
    'DS -A': 'CSE-DS',
    'DS - A': 'CSE-DS',
    'DS-B': 'CSE-DS',
    'DS -B': 'CSE-DS',
    'DS - B': 'CSE-DS',
    'DS-C': 'CSE-DS',
    'DS -C': 'CSE-DS',
    'DS - C': 'CSE-DS',
    'AIML': 'CSE-AI',
    'AIML-A': 'CSE-AI',
    'AIML-B': 'CSE-AI',
    'AI': 'CSE-AI',
    'EVT': 'ECE',  # Assuming EV Technology is under ECE
    'MBA': 'MBA',
    'MBA-A': 'MBA',
    'MBA-B': 'MBA',
    'MCA': 'MCA',
    'DECS': 'ECE',
    'SE': 'CSE',
}

# Section extraction from sheet name
def get_section(sheet_name):
    sheet_upper = sheet_name.upper()
    if '-A' in sheet_upper or ' A' in sheet_upper:
        return 'A'
    elif '-B' in sheet_upper or ' B' in sheet_upper:
        return 'B'
    elif '-C' in sheet_upper or ' C' in sheet_upper:
        return 'C'
    elif '-D' in sheet_upper or ' D' in sheet_upper:
        return 'D'
    return 'A'

def get_dept_code(sheet_name):
    for key, value in DEPT_MAPPING.items():
        if key.upper() in sheet_name.upper():
            return value
    return 'CSE'

def get_year_semester_from_filename(filename):
    """Extract year and semester from filename"""
    filename_upper = filename.upper()
    
    if 'I B.TECH I SEM' in filename_upper or 'I B.TECH 1 SEM' in filename_upper:
        return 1, 1
    elif 'II B.TECH II SEM' in filename_upper or 'II B.TECH 2 SEM' in filename_upper:
        return 2, 4
    elif 'III B.TECH II SEM' in filename_upper or 'III B.TECH 2 SEM' in filename_upper:
        return 3, 6
    elif 'IV B.TECH II SEM' in filename_upper or 'IV B.TECH 2 SEM' in filename_upper:
        return 4, 8
    elif 'MBA I SEM' in filename_upper:
        return 1, 1
    elif 'MBA IV SEM' in filename_upper:
        return 2, 4
    elif 'MCA I SEM' in filename_upper:
        return 1, 1
    elif 'MCA III SEM' in filename_upper:
        return 2, 3
    elif 'MTECH I SEM' in filename_upper:
        return 1, 1
    elif 'MTECH IV SEM' in filename_upper:
        return 2, 4
    return 1, 1

def clean_name(name):
    """Clean and format name"""
    if pd.isna(name):
        return None
    name = str(name).strip()
    # Remove special characters
    name = re.sub(r'[^\w\s\.]', '', name)
    return name.title()

def process_student_file(filepath, filename):
    """Process a student Excel file with multiple sheets"""
    students = []
    year, semester = get_year_semester_from_filename(filename)
    
    try:
        xl = pd.ExcelFile(filepath, engine='openpyxl')
        
        for sheet_name in xl.sheet_names:
            try:
                df = pd.read_excel(filepath, sheet_name=sheet_name, engine='openpyxl')
                
                # Get department and section from sheet name
                dept_code = get_dept_code(sheet_name)
                section = get_section(sheet_name)
                
                # Find the header row (usually has SNO, HTNO/HALL TICKET, STUDENT NAME)
                header_row = None
                for i, row in df.iterrows():
                    row_str = ' '.join([str(v).upper() for v in row.values if pd.notna(v)])
                    if 'SNO' in row_str or 'S.NO' in row_str or 'HTNO' in row_str or 'HALL TICKET' in row_str:
                        header_row = i
                        break
                
                if header_row is not None:
                    # Re-read with proper header
                    df = pd.read_excel(filepath, sheet_name=sheet_name, engine='openpyxl', 
                                      header=header_row)
                    
                    # Find column names (case-insensitive)
                    col_map = {}
                    for col in df.columns:
                        col_upper = str(col).upper()
                        if 'HTNO' in col_upper or 'HALL TICKET' in col_upper or 'HALLTICKET' in col_upper:
                            col_map['roll'] = col
                        elif 'NAME' in col_upper and 'STUDENT' in col_upper:
                            col_map['name'] = col
                        elif col_upper == 'NAME':
                            if 'name' not in col_map:
                                col_map['name'] = col
                        elif 'PHONE' in col_upper or 'MOBILE' in col_upper:
                            col_map['phone'] = col
                    
                    # If we have roll number and name columns
                    if 'roll' in col_map and 'name' in col_map:
                        for _, row in df.iterrows():
                            roll = str(row[col_map['roll']]).strip() if pd.notna(row[col_map['roll']]) else None
                            name = clean_name(row[col_map['name']])
                            phone = str(row.get(col_map.get('phone', ''), '')).strip() if 'phone' in col_map else None
                            
                            if roll and name and len(roll) > 5 and not roll.upper().startswith('NAN'):
                                # Parse name into first and last
                                name_parts = name.split()
                                first_name = name_parts[0] if name_parts else 'Student'
                                last_name = ' '.join(name_parts[1:]) if len(name_parts) > 1 else ''
                                
                                students.append({
                                    'roll_number': roll.upper(),
                                    'first_name': first_name,
                                    'last_name': last_name,
                                    'dept_code': dept_code,
                                    'section': section,
                                    'year': year,
                                    'semester': semester,
                                    'phone': phone if phone and phone != 'nan' else None,
                                    'source_file': filename,
                                    'source_sheet': sheet_name
                                })
            except Exception as e:
                print(f"  Error processing sheet {sheet_name}: {e}")
                
    except Exception as e:
        print(f"Error processing file {filename}: {e}")
    
    return students

def generate_sql(students):
    """Generate SQL insert statements"""
    
    sql = """-- ===========================================
-- NRIIT REAL STUDENT DATA IMPORT
-- Generated: {}
-- Total Students: {}
-- ===========================================

-- Create academic batches if not exist
INSERT INTO academic_batches (batch_year, batch_name, is_current) VALUES
(2025, '2025-26', true),
(2024, '2024-25', false),
(2023, '2023-24', false),
(2022, '2022-23', false)
ON CONFLICT (batch_year) DO NOTHING;

""".format(datetime.now().strftime('%Y-%m-%d %H:%M'), len(students))

    # Group students by department for organized output
    dept_groups = {}
    for student in students:
        dept = student['dept_code']
        if dept not in dept_groups:
            dept_groups[dept] = []
        dept_groups[dept].append(student)
    
    for dept, dept_students in sorted(dept_groups.items()):
        sql += f"\n-- ===========================================\n"
        sql += f"-- {dept} Students ({len(dept_students)} total)\n"
        sql += f"-- ===========================================\n\n"
        
        sql += "DO $$\n"
        sql += "DECLARE\n"
        sql += "    new_user_id UUID;\n"
        sql += "    batch_id UUID;\n"
        sql += "BEGIN\n"
        
        for student in dept_students:
            roll = student['roll_number'].replace("'", "''")
            first = student['first_name'].replace("'", "''") if student['first_name'] else 'Student'
            last = student['last_name'].replace("'", "''") if student['last_name'] else ''
            email = f"{roll.lower()}@nriit.ac.in"
            phone = student['phone'] if student['phone'] else '9999999999'
            section = student['section']
            semester = student['semester']
            year = student['year']
            
            # Determine batch year from roll number (first 2 digits)
            batch_year = 2000 + int(roll[:2]) if roll[:2].isdigit() else 2024
            
            sql += f"""
    -- {roll}: {first} {last}
    SELECT id INTO batch_id FROM academic_batches WHERE batch_year = {batch_year} LIMIT 1;
    
    INSERT INTO users (email, role, is_active, email_verified)
    VALUES ('{email}', 'student', true, true)
    ON CONFLICT (email) DO UPDATE SET last_login = NOW()
    RETURNING id INTO new_user_id;
    
    INSERT INTO student_profiles (
        user_id, roll_number, registration_number, first_name, last_name,
        dept_code, batch_id, current_semester, section, email, phone,
        admission_date, admission_type, is_active
    ) VALUES (
        new_user_id, '{roll}', '{roll}',
        '{first}', '{last}', '{dept}', batch_id, {semester},
        '{section}', '{email}', '{phone}',
        '{batch_year}-07-15', 'EAMCET', true
    ) ON CONFLICT (roll_number) DO NOTHING;
"""
        
        sql += "\nEND $$;\n"
    
    # Summary
    sql += f"""

-- ===========================================
-- IMPORT SUMMARY
-- ===========================================
-- Total Students Imported: {len(students)}
"""
    for dept, dept_students in sorted(dept_groups.items()):
        sql += f"-- {dept}: {len(dept_students)} students\n"
    
    sql += """
-- ===========================================
-- Run this in Supabase SQL Editor!
-- ===========================================
"""
    
    return sql

# Main execution
print("=" * 60)
print("NRIIT DATA IMPORT SCRIPT")
print("=" * 60)

# Process all student files
student_files = [
    "I B.Tech I Sem Nominals Aug 2025.xlsx",
    "II B.Tech II Sem Nominals December 2025.xlsx",
    "III B.Tech II Sem Nominals December 2025.xlsx",
    "IV B.Tech II Sem Nominals December 2025.xlsx",
    "MBA I Sem 2025-26 - Updated.xlsx",
    "MBA IV Sem 2025-26.xlsx",
    "MCA  I Sem 2025-26 - Updated.xlsx",
    "MCA  III Sem 2025-2026.xlsx",
    "MTECH I SEM 2025-26.xlsx",
    "MTECH IV Sem 2025-26 -.xlsx",
]

for filename in student_files:
    filepath = os.path.join(DATA_FOLDER, filename)
    if os.path.exists(filepath):
        print(f"\n📁 Processing: {filename}")
        students = process_student_file(filepath, filename)
        all_students.extend(students)
        print(f"   Found {len(students)} students")

# Remove duplicates based on roll number
unique_students = {}
for student in all_students:
    roll = student['roll_number']
    if roll not in unique_students:
        unique_students[roll] = student

all_students = list(unique_students.values())

print(f"\n\n{'=' * 60}")
print(f"TOTAL UNIQUE STUDENTS: {len(all_students)}")
print("=" * 60)

# Generate SQL
sql = generate_sql(all_students)

# Write to file
with open(OUTPUT_FILE, 'w', encoding='utf-8') as f:
    f.write(sql)

print(f"\n✅ SQL file generated: {OUTPUT_FILE}")
print(f"   Total students: {len(all_students)}")
print(f"\n🚀 Run this SQL in Supabase to import all students!")
