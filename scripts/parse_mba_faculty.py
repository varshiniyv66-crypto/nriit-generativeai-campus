"""
Parse the MBA Faculty - Fix header and column mapping
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

excel_file = r"C:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\public\2025-26 Faculty Directory\ce, mba & mca sTAFF lIST updated.xlsx"
sheet_name = 'MBA'

try:
    print(f"Reading sheet {sheet_name}...")
    
    # Header is explicitly at ROW 1
    df = pd.read_excel(excel_file, sheet_name=sheet_name, header=1)
    
    faculty_list = []
    
    for idx, row in df.iterrows():
        # Column names might have whitespace
        name = None
        sno = None
        desig = None
        qual = None
        doj = None
        
        # Mapping based on debug output
        # Name: 'Name of the Faculty'
        # Desig: 'Designation'
        # Qual: 'Qualification'
        # DOJ: 'Date of Joining'
        # S.No: 'S. No.'
        
        name = row.get('Name of the Faculty', row.get('NAME', ''))
        desig = row.get('Designation', 'N/A')
        qual = row.get('Qualification', 'N/A')
        doj = row.get('Date of Joining', 'N/A')
        sno = row.get('S. No.', row.get('S.NO', str(len(faculty_list) + 1)))

        if pd.isna(name) or len(str(name)) < 3 or 'Faculty' in str(name):
            continue
            
        faculty = {
            "sno": clean_text(sno),
            "name": clean_text(name),
            "qualification": clean_text(qual),
            "designation": clean_text(desig),
            "doj": clean_date(doj),
            "nature": "Regular"
        }
        
        faculty_list.append(faculty)

    print(f"Extracted {len(faculty_list)} MBA faculty")

    # Replicate for all years
    years = ["2025-26", "2024-25", "2023-24", "2022-23"]
    all_data = {year: faculty_list for year in years}

    output_file = r"C:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\src\data\mba_faculty_yearwise.json"

    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(all_data, f, indent=2, ensure_ascii=False)

    print(f"\n✅ Generated: {output_file}")
    if faculty_list:
        print(f"  First: {faculty_list[0]['name']}")

except Exception as e:
    print(f"Error: {e}")
