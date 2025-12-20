"""
Parse Placement Data from Excel files (1, 2, 3)
Generates src/data/placements_yearwise.json
Structure: { "CSE": { "2024-25": [...], "2023-24": [...] }, "ECE": ... }
"""

import pandas as pd
import json
import os
import re

def clean_text(val):
    if pd.isna(val):
        return "N/A"
    return str(val).strip()

def clean_package(val):
    if pd.isna(val):
        return "N/A"
    s = str(val).upper().replace("LPA", "").strip()
    return s + " LPA" if s != "N/A" else "N/A"

folder = r"C:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\public\LATEST  PLACAMNETS YEAR WISE"

# Map files to years
files_map = {
    "ALL_BRANCHES_PLACED_DATA BY dr yvrr (3).xlsx": "2024-25",
    "ALL_BRANCHES_PLACED_DATA BY dr yvrr (2).xlsx": "2023-24",
    "ALL_BRANCHES_PLACED_DATA BY dr yvrr (1).xlsx": "2022-23"
}

# Consolidated data structure
# consolidated_data[DEPT][YEAR] = [List of students]
consolidated_data = {}

def get_dept_key(sheet_name):
    s = sheet_name.upper().strip()
    if s == 'CSE': return 'CSE'
    if s == 'ECE': return 'ECE'
    if s == 'IT': return 'IT'
    if s in ['MECH', 'MECHANICAL']: return 'MECH'
    if s in ['CIVIL', 'CIV', 'CE']: return 'CIVIL'
    if s in ['EEE']: return 'EEE'
    if s in ['CSDS', 'DS', 'DATA SCIENCE']: return 'DS' # Check proper code
    if s in ['AIML', 'AI']: return 'AIML'
    return None

for filename, year in files_map.items():
    file_path = os.path.join(folder, filename)
    if not os.path.exists(file_path):
        print(f"Skipping {filename} (not found)")
        continue
        
    print(f"Processing {filename} ({year})...")
    
    try:
        xl = pd.ExcelFile(file_path)
        
        for sheet in xl.sheet_names:
            dept_key = get_dept_key(sheet)
            if not dept_key:
                continue # Skip non-dept sheets like "ALL_BRANCHES" for now, or use them if dept specific sheets are missing?
                # Actually, relying on dept sheets is safer for now.
            
            print(f"  Parsing sheet '{sheet}' as {dept_key}...")
            
            # Read sheet
            df = pd.read_excel(file_path, sheet_name=sheet)
            
            # Normalize columns
            df.columns = [str(c).upper().strip() for c in df.columns]
            
            # Identify columns
            col_name = None
            col_reg = None
            col_company = None
            col_package = None
            
            for c in df.columns:
                if 'NAME' in c and 'COMPANY' not in c: col_name = c
                elif 'ROLL' in c or 'REG' in c: col_reg = c
                elif 'COMPANY' in c: col_company = c
                elif 'PACKAGE' in c or 'CTC' in c: col_package = c
            
            if not col_name:
                print(f"    Skipping {sheet} (Name column not found)")
                continue
                
            sheet_data = []
            for _, row in df.iterrows():
                name = clean_text(row.get(col_name))
                if not name or name == "N/A" or "Name" in name: continue
                
                # Basic cleaning
                
                student = {
                    "regNo": clean_text(row.get(col_reg)) if col_reg else "N/A",
                    "name": name,
                    "company": clean_text(row.get(col_company)) if col_company else "N/A",
                    "package": clean_package(row.get(col_package)) if col_package else "N/A"
                }
                sheet_data.append(student)
            
            print(f"    Extracted {len(sheet_data)} records")
            
            if dept_key not in consolidated_data:
                consolidated_data[dept_key] = {}
            
            consolidated_data[dept_key][year] = sheet_data
            
    except Exception as e:
        print(f"  Error processing file: {e}")

# Also creating 2025-26 dummy data or using 2024-25 as latest?
# The user file (3) is likely the latest (2024-25 or 2025 placements).
# If the user wants 2025-26, I should check if file 3 is meant to be that.
# 21 Series starts 2021 -> 2025 grad. So 21KP IS 2024-25 Academic Year placements!
# User might call it "2025-26" if looking at next one.
# For now I will stick to mapping 3->24-25.

output_file = r"C:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\src\data\placements_yearwise.json"
with open(output_file, 'w', encoding='utf-8') as f:
    json.dump(consolidated_data, f, indent=2)

print(f"\n✅ Saved to {output_file}")
