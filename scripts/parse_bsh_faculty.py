"""
Parse the BS&H Faculty - Fix column mapping based on screenshot
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

excel_file = r"C:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\public\2025-26 Faculty Directory\B S & H25-26 FACULTY LIST  DINAL FROM dr yvrr.xlsx"

try:
    print(f"Reading {excel_file}...")
    # Header is at Row 1 (0-indexed)
    df = pd.read_excel(excel_file, header=1)
    
    faculty_list = []
    
    for idx, row in df.iterrows():
        name = row.get('NAME', row.get('Name', ''))
        
        if pd.isna(name) or str(name).strip() == '':
            continue
            
        # Correctly map based on screenshot vs file discrepancy
        # Real DOJ is in 'CAY' column
        # Qualification is in 'HIGHEST DEGREE' column
        
        doj = row.get('CAY', row.get('DOJ', 'N/A'))
        qual = row.get('HIGHEST DEGREE', row.get('Qualification', 'N/A'))
        desig = row.get('Designation', 'N/A')
        sno = row.get('S.NO', str(len(faculty_list) + 1))
        
        # Format DOJ
        doj_str = clean_date(doj)
            
        faculty = {
            "sno": clean_text(sno),
            "name": clean_text(name),
            "qualification": clean_text(qual),
            "designation": clean_text(desig),
            "doj": doj_str,
            "nature": "Regular"
        }
        
        faculty_list.append(faculty)

    print(f"Extracted {len(faculty_list)} BS&H faculty (Corrected)")

    years = ["2025-26", "2024-25", "2023-24", "2022-23"]
    all_data = {year: faculty_list for year in years}

    output_file = r"C:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\src\data\bsh_faculty_yearwise.json"

    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(all_data, f, indent=2, ensure_ascii=False)

    print(f"\n✅ Generated: {output_file}")
    if faculty_list:
        print(f"  First: {faculty_list[0]['name']}")
        print(f"  First DOJ: {faculty_list[0]['doj']} (Should be 15-12-2019)")

except Exception as e:
    print(f"Error: {e}")
