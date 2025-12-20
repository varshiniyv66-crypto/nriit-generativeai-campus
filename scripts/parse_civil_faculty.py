"""
Parse the CIVIL Faculty from the updated Excel file (Sheet 'CE')
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
sheet_name = 'CE'

try:
    print(f"Reading sheet {sheet_name}...")
    
    # NO HEADER, DATA STARTS ROW 0
    # Columns appear to be: S.No, Name, Designation, Qualification, DOJ, Pan
    df = pd.read_excel(excel_file, sheet_name=sheet_name, header=None)
    
    faculty_list = []
    
    for idx, row in df.iterrows():
        # Map columns by index
        name = row[1]
        desig = row[2]
        qual = row[3]
        doj = row[4]
        sno = row[0]

        if pd.isna(name) or len(str(name)) < 3:
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

    print(f"Extracted {len(faculty_list)} CIVIL faculty")

    # Replicate for all years
    years = ["2025-26", "2024-25", "2023-24", "2022-23"]
    all_data = {year: faculty_list for year in years}

    output_file = r"C:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\src\data\civil_faculty_yearwise.json"

    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(all_data, f, indent=2, ensure_ascii=False)

    print(f"\n✅ Generated: {output_file}")
    if faculty_list:
        print(f"  First: {faculty_list[0]['name']}")

except Exception as e:
    print(f"Error: {e}")
