import pandas as pd
import os
import json
import re

directory = r"C:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\public\LATEST  PLACAMNETS YEAR WISE"
output_json = r"C:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\src\data\placements_year_wise.json"

def clean_value(val):
    if pd.isna(val) or val is None:
        return ""
    return str(val).strip()

def extract_year(filename):
    # Search for patterns like 2022-2023 or 2023-24
    match = re.search(r'(\d{4})-(\d{2,4})', filename)
    if match:
        return match.group(0)
    return "UNKNOWN"

def process_placement_excel(filepath):
    xl = pd.ExcelFile(filepath)
    all_data = []
    for sheet_name in xl.sheet_names:
        df = pd.read_excel(filepath, sheet_name=sheet_name, header=None)
        
        # Find header row
        header_row_idx = -1
        for i, row in df.iterrows():
            row_vals = [str(v).lower() for v in row.values if pd.notna(v)]
            keywords = ["name", "regd", "roll", "branch", "company", "package"]
            match_count = sum(1 for kw in keywords if any(kw in v for v in row_vals))
            if match_count >= 2:
                header_row_idx = i
                break
        
        if header_row_idx == -1: continue # Skip if no header found
        
        headers = df.iloc[header_row_idx].values
        cleaned_headers = []
        for j, h in enumerate(headers):
            if pd.notna(h):
                h_str = str(h).strip().upper()
                cleaned_headers.append(h_str)
            else:
                cleaned_headers.append(f"COL_{j}")
        
        data_df = df.iloc[header_row_idx + 1:]
        data_df.columns = cleaned_headers
        
        data = data_df.to_dict(orient='records')
        for row in data:
            item = {str(k): clean_value(v) for k, v in row.items() if not str(k).startswith('COL_')}
            
            # Normalize fields
            normalized = {}
            for k, v in item.items():
                k_upper = k.upper()
                if "NAME OF THE STUDENT" in k_upper or "STUDENT NAME" in k_upper or ("NAME" in k_upper and "COMPANY" not in k_upper and "DEPT" not in k_upper):
                    normalized['name'] = v
                elif "REGD" in k_upper or "ROLL" in k_upper or "HT NO" in k_upper:
                    normalized['regd_no'] = v
                elif "COMPANY" in k_upper or "FIRM" in k_upper:
                    normalized['company'] = v
                elif "PACKAGE" in k_upper or "SALARY" in k_upper or "LPA" in k_upper:
                    normalized['package'] = v
                elif "BRANCH" in k_upper or "DEPT" in k_upper:
                    normalized['branch'] = v
                elif "S.NO" in k_upper or "SI NO" in k_upper or "S NO" in k_upper:
                    normalized['sno'] = v
            
            # If name is still missing but we have a company and a roll number, 
            # maybe the headers were messy.
            if not normalized.get('name') and normalized.get('company'):
                # Check for other fields that might be the name
                pass

            if normalized.get('regd_no') or normalized.get('name'):
                 all_data.append(normalized)
    return all_data

def infer_year(regd_no):
    regd_no = str(regd_no).upper()
    if '19KP' in regd_no or '20KP5A' in regd_no: return '2022-2023'
    if '20KP' in regd_no or '21KP5A' in regd_no: return '2023-2024'
    if '21KP' in regd_no or '22KP5A' in regd_no: return '2024-2025'
    if '18KP' in regd_no or '19KP5A' in regd_no: return '2021-2022'
    return None

def main():
    results = {} 
    files = [f for f in os.listdir(directory) if not f.startswith('~$') and (f.endswith('.xlsx') or f.endswith('.xls'))]
    
    files.sort()
    
    for filename in files:
        filepath = os.path.join(directory, filename)
        data = process_placement_excel(filepath)
        file_year = extract_year(filename)
        
        for entry in data:
            regd = entry.get('regd_no', '')
            # Priority: Inferred year from Regd No > Filename Year
            year = infer_year(regd) or file_year
            
            if year == "UNKNOWN": continue

            branch_raw = entry.get('branch', 'UNKNOWN').upper()
            branch = branch_raw
            # Normalize branch names
            if 'CSE' in branch or 'COMPUTER SCIENCE' in branch: 
                if 'DS' in branch or 'DATA SCIENCE' in branch or 'CSDS' in branch or 'CSD' in branch: branch = 'CSE-DS'
                elif 'AI' in branch or 'ARTIFICIAL' in branch: branch = 'CSE-AI'
                else: branch = 'CSE'
            elif 'CSD' in branch or 'CSDS' in branch: branch = 'CSE-DS'
            elif 'CSIT' in branch: branch = 'IT'
            elif 'ECE' in branch or 'ELECTRONICS' in branch: branch = 'ECE'
            elif 'IT' in branch or 'INFORMATION' in branch: branch = 'IT'
            elif 'CIVIL' in branch: branch = 'CIVIL'
            elif 'MECH' in branch or 'MECHANICAL' in branch: branch = 'MECH'
            elif 'EEE' in branch or 'ELECTRICAL' in branch: branch = 'EEE'
            elif 'MBA' in branch: branch = 'MBA'
            elif 'MCA' in branch: branch = 'MCA'
            
            if year not in results:
                results[year] = {}
            if branch not in results[year]:
                results[year][branch] = []
            
            # Deduplicate by Regd No and Name within that Year/Branch
            name = entry.get('name', '').lower()
            if regd:
                if not any(e.get('regd_no') == regd for e in results[year][branch]):
                    results[year][branch].append(entry)
            else:
                if name and not any(e.get('name', '').lower() == name for e in results[year][branch]):
                    results[year][branch].append(entry)

    with open(output_json, 'w', encoding='utf-8') as f:
        json.dump(results, f, indent=2, ensure_ascii=False)
    
    print(f"Successfully saved placement data to {output_json}")

if __name__ == "__main__":
    main()
