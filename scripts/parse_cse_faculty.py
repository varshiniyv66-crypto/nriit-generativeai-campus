"""
Parse the CSE Faculty Excel file with multiple year sheets
and generate proper JSON data for the faculty directory.
"""

import pandas as pd
import json
from datetime import datetime

def clean_date(date_val):
    """Clean and format date values"""
    if pd.isna(date_val):
        return "N/A"
    if isinstance(date_val, datetime):
        return date_val.strftime("%d-%m-%Y")
    if isinstance(date_val, str):
        # Remove time portion if present
        return date_val.split(' ')[0] if ' ' in date_val else date_val
    return str(date_val)

def clean_text(val):
    """Clean text values"""
    if pd.isna(val):
        return "N/A"
    return str(val).strip()

# Read the CSE Excel file with all sheets
excel_file = r"C:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\public\2025-26 Faculty Directory\CSE-Faculty--FINAL.xlsx"

# Get all sheet names
xl = pd.ExcelFile(excel_file)
print(f"Found sheets: {xl.sheet_names}")

# Parse each sheet
all_data = {}

for sheet_name in xl.sheet_names:
    print(f"\nProcessing sheet: {sheet_name}")
    
    # Read the sheet
    df = pd.read_excel(excel_file, sheet_name=sheet_name, header=2)  # Skip header rows
    
    # Clean column names
    df.columns = df.columns.str.strip()
    
    print(f"Columns found: {df.columns.tolist()}")
    print(f"Total rows: {len(df)}")
    
    # Extract faculty data
    faculty_list = []
    
    for _, row in df.iterrows():
        # Skip empty rows
        name = row.get('Name of the Faculty', row.get('NAME', ''))
        if pd.isna(name) or str(name).strip() == '' or 'Faculty List' in str(name):
            continue
            
        faculty = {
            "sno": clean_text(row.get('S.No', row.get('S.NO', ''))),
            "name": clean_text(name),
            "qualification": clean_text(row.get('Qualification', row.get('QUALIFICATION', 'N/A'))),
            "designation": clean_text(row.get('Designation', row.get('DESIGNATION', 'N/A'))),
            "doj": clean_date(row.get('Date of Joining', row.get('DOJ', ''))),
            "pan": clean_text(row.get('PAN Number', row.get('PAN', 'N/A'))),
            "nature": clean_text(row.get('Nature of Association', row.get('NATURE', 'Regular')))
        }
        
        # Only add if name is valid
        if faculty["name"] and faculty["name"] != "N/A":
            faculty_list.append(faculty)
    
    print(f"Extracted {len(faculty_list)} faculty members from {sheet_name}")
    
    # Store data with proper year key
    year_key = sheet_name.replace("CSE-", "").strip()
    all_data[year_key] = faculty_list

# Generate the JSON output
output_file = r"C:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\src\data\cse_faculty_yearwise.json"

with open(output_file, 'w', encoding='utf-8') as f:
    json.dump(all_data, f, indent=2, ensure_ascii=False)

print(f"\n✅ Generated: {output_file}")
print(f"Years available: {list(all_data.keys())}")
for year, data in all_data.items():
    print(f"  - {year}: {len(data)} faculty members")
