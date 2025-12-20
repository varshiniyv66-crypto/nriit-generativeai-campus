"""
Parse the AIML Faculty Excel file and generate year-wise JSON data.
Data is same for all 4 years as per user request.
"""

import pandas as pd
import json

def clean_text(val):
    if pd.isna(val):
        return "N/A"
    return str(val).strip()

excel_file = r"C:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\public\2025-26 Faculty Directory\AIML Faculty list for NBA.xlsx"

# The file seems to have header at row 6 (0-indexed)
# Columns detected: S. No, Name of the Faculty, Designation
try:
    df = pd.read_excel(excel_file, header=6)
    # Clean column names
    df.columns = [str(c).strip() for c in df.columns]
    print(f"Columns found: {df.columns.tolist()}")
    
    faculty_list = []
    
    for idx, row in df.iterrows():
        # Get Name
        name = row.get('Name of the Faculty', row.get('NAME', row.get('Faculty Name', '')))
        
        if pd.isna(name) or str(name).strip() == '':
            continue
            
        name_str = str(name).strip()
        if 'Faculty List' in name_str or 'DEPARTMENT' in name_str:
            continue
            
        # Get other fields
        sno = row.get('S. No', row.get('S.No', str(len(faculty_list) + 1)))
        desig = row.get('Designation', 'N/A')
        
        # Qualification and DOJ are not in the top preview, check if they exist, else N/A
        qual = row.get('Qualification', 'N/A')
        doj = row.get('Date of Joining', 'N/A')
            
        faculty = {
            "sno": clean_text(sno),
            "name": name_str,
            "qualification": clean_text(qual),
            "designation": clean_text(desig),
            "doj": clean_text(doj), # Keep as text since we don't have real dates
            "nature": "Regular"
        }
        
        faculty_list.append(faculty)

    print(f"Extracted {len(faculty_list)} faculty members")

    # Replicate for all years
    years = ["2025-26", "2024-25", "2023-24", "2022-23"]
    all_data = {year: faculty_list for year in years}

    # Save
    output_file = r"C:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\src\data\cse_ai_faculty_yearwise.json"

    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(all_data, f, indent=2, ensure_ascii=False)

    print(f"\n✅ Generated: {output_file}")
    for year, data in all_data.items():
        print(f"  - {year}: {len(data)} faculty")

except Exception as e:
    print(f"Error: {e}")
