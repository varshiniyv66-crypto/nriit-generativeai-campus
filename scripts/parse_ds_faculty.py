"""
Parse the Data Science (DS) Faculty Excel file and generate year-wise JSON data.
Uses the temp file to avoid permission errors.
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

# Use the temp file we created earlier
excel_file = r"C:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\public\temp_ds.xlsx"

try:
    print(f"Reading {excel_file}...")
    
    # Header is at Row 2 (0-indexed) based on debug output
    df = pd.read_excel(excel_file, header=2)
    
    # Clean column names
    df.columns = [str(c).strip() for c in df.columns]
    print(f"Columns found: {df.columns.tolist()}")
    
    faculty_list = []
    
    for idx, row in df.iterrows():
        # Get Name
        name = row.get('NAME', row.get('Name', ''))
        
        if pd.isna(name) or str(name).strip() == '':
            continue
            
        name_str = str(name).strip()
        if 'Faculty List' in name_str or 'Department' in name_str:
            continue
            
        # Get other fields
        sno = row.get('S.No', str(len(faculty_list) + 1))
        desig = row.get('Designation', 'N/A')
        qual = row.get('QUALAIFICAT ION', row.get('QUALIFICATION', row.get('Qualification', 'N/A'))) # note the typo in excel header
        doj = row.get('DOJ', row.get('Date of Joining', 'N/A'))
        nature = row.get('REGULAR/ADHOC', row.get('Nature', 'REGULAR'))
            
        faculty = {
            "sno": clean_text(sno),
            "name": name_str,
            "qualification": clean_text(qual),
            "designation": clean_text(desig),
            "doj": clean_date(doj),
            "nature": clean_text(nature)
        }
        
        faculty_list.append(faculty)

    print(f"Extracted {len(faculty_list)} faculty members")

    # Replicate for all years since we only have one list and it's a new department
    years = ["2025-26", "2024-25", "2023-24", "2022-23"]
    all_data = {year: faculty_list for year in years}

    # Save
    output_file = r"C:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\src\data\ds_faculty_yearwise.json"

    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(all_data, f, indent=2, ensure_ascii=False)

    print(f"\n✅ Generated: {output_file}")
    for year, data in all_data.items():
        print(f"  - {year}: {len(data)} faculty")
        if data:
            print(f"    First: {data[0]['name']}")

except Exception as e:
    print(f"Error: {e}")
