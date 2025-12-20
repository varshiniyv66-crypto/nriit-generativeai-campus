"""
Parse the ECE Faculty Excel file - handle different sheet formats
"""

import pandas as pd
import json
from datetime import datetime

def clean_date(date_val):
    if pd.isna(date_val):
        return "N/A"
    if isinstance(date_val, datetime):
        return date_val.strftime("%d-%m-%Y")
    if isinstance(date_val, str):
        return date_val.split(' ')[0] if ' ' in date_val else date_val
    return str(date_val)

def clean_text(val):
    if pd.isna(val):
        return "N/A"
    return str(val).strip()

excel_file = r"C:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\public\2025-26 Faculty Directory\ECE Faculty List NBA (3).xlsx"

xl = pd.ExcelFile(excel_file)
print(f"Found sheets: {xl.sheet_names}")

all_data = {}

for sheet_name in xl.sheet_names:
    print(f"\nProcessing sheet: {sheet_name}")
    
    # Try different header positions (including row 8 for 2022-23)
    for header_row in [8, 7, 6, 5, 4, 3, 2, 1]:
        try:
            df = pd.read_excel(excel_file, sheet_name=sheet_name, header=header_row)
            df.columns = [str(c).strip() for c in df.columns]
            
            # Check if we have the right columns
            cols = df.columns.tolist()
            if any('Name' in str(c) for c in cols):
                print(f"  Found header at row {header_row}: {cols[:5]}")
                break
        except Exception as e:
            continue
    
    faculty_list = []
    
    for idx, row in df.iterrows():
        # Get name
        name = None
        for col in df.columns:
            if 'Name' in col and 'Faculty' in col:
                name = row.get(col)
                break
        
        if pd.isna(name) or str(name).strip() == '':
            continue
        
        name_str = str(name).strip()
        if 'Faculty List' in name_str or 'Department' in name_str or len(name_str) < 3:
            continue
        
        # Get other columns
        sno = row.get('S.No', row.get('S. No', str(len(faculty_list) + 1)))
        qual = row.get('Qualification', 'N/A')
        desig = row.get('Designation', 'N/A')
        doj = row.get('Date of Joining', 'N/A')
            
        faculty = {
            "sno": clean_text(sno),
            "name": name_str,
            "qualification": clean_text(qual),
            "designation": clean_text(desig),
            "doj": clean_date(doj),
            "nature": "Regular"
        }
        
        faculty_list.append(faculty)
    
    print(f"  Extracted {len(faculty_list)} faculty members")
    
    year_key = sheet_name.strip()
    all_data[year_key] = faculty_list

# Save
output_file = r"C:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\src\data\ece_faculty_yearwise.json"

with open(output_file, 'w', encoding='utf-8') as f:
    json.dump(all_data, f, indent=2, ensure_ascii=False)

print(f"\n✅ Generated: {output_file}")
for year, data in all_data.items():
    print(f"  - {year}: {len(data)} faculty")
    if data:
        print(f"    First: {data[0]['name']}")
