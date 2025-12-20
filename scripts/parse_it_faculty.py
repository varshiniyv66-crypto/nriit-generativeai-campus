"""
Parse the IT Faculty DOCX file and generate year-wise JSON data.
"""

import docx
import json
import os
from datetime import datetime

def clean_text(val):
    if not val:
        return "N/A"
    return str(val).strip()

docx_file = r"C:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\public\2025-26 Faculty Directory\faculty list INFORMATIOON TECHNLOGY FINAL 25-26 (1).docx"

print(f"Reading {docx_file}...")

try:
    doc = docx.Document(docx_file)
    faculty_list = []
    
    # Iterate through tables
    for table in doc.tables:
        # Assume first row is header
        headers = [cell.text.strip().lower() for cell in table.rows[0].cells]
        print(f"Table headers: {headers}")
        
        # Check if this is the right table
        if not any('name' in h for h in headers) or not any('designation' in h for h in headers):
            continue
            
        for i, row in enumerate(table.rows):
            if i == 0: continue # Skip header
            
            cells = [cell.text.strip() for cell in row.cells]
            if not cells or len(cells) < 3: continue
            
            # Map columns based on standard format (SNo, Name, Desig, Qual, DOJ)
            # Adjust index based on observed headers if needed, but simple positional guess for now
            
            # Usually: S.No, Name, Qual, Desig, DOJ (or similar order)
            # Let's try to identify by content or column index logic from headers
            
            name = ""
            sno = str(len(faculty_list) + 1)
            desig = "N/A"
            qual = "N/A"
            doj = "N/A"
            
            for idx, header in enumerate(headers):
                val = cells[idx] if idx < len(cells) else ""
                if 'name' in header:
                    name = val
                elif 'designation' in header:
                    desig = val
                elif 'qualification' in header or 'degree' in header:
                    qual = val
                elif 'joining' in header or 'doj' in header:
                    doj = val
                elif 'no' in header and 's' in header:
                    sno = val

            if not name or len(name) < 3 or 'Name' in name:
                continue
                
            faculty = {
                "sno": clean_text(sno),
                "name": clean_text(name),
                "qualification": clean_text(qual),
                "designation": clean_text(desig),
                "doj": clean_text(doj),
                "nature": "Regular"
            }
            faculty_list.append(faculty)
            
    print(f"Extracted {len(faculty_list)} faculty members from IT")
    
    # Replicate for all years
    years = ["2025-26", "2024-25", "2023-24", "2022-23"]
    all_data = {year: faculty_list for year in years}

    # Save
    output_file = r"C:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\src\data\it_faculty_yearwise.json"

    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(all_data, f, indent=2, ensure_ascii=False)

    print(f"\n✅ Generated: {output_file}")
    if faculty_list:
        print(f"  First: {faculty_list[0]['name']}")

except Exception as e:
    print(f"Error: {e}")
