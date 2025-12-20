import pandas as pd
import os
from docx import Document
import json

directory = r"C:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\public\2025-26 Faculty Directory"
output_json = r"C:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\src\data\faculty_2025_26.json"

def clean_value(val):
    if pd.isna(val) or val is None:
        return ""
    
    # Handle pandas Timestamps
    if hasattr(val, 'strftime'):
        try:
            return val.strftime('%Y-%m-%d')
        except:
            pass
            
    s_val = str(val).strip()
    # Remove the 00:00:00 suffix if present
    if ' 00:00:00' in s_val:
        return s_val.replace(' 00:00:00', '')
    
    return s_val

def process_excel(filepath):
    xl = pd.ExcelFile(filepath)
    all_data = []
    for sheet_name in xl.sheet_names:
        df = pd.read_excel(filepath, sheet_name=sheet_name, header=None)
        
        # Find header row heuristic
        header_row_idx = -1
        for i, row in df.iterrows():
            row_vals = [str(v).lower() for v in row.values if pd.notna(v)]
            # Check for multiple keywords to be sure it's a header
            keywords = ["name", "designation", "qual", "s.no", "sno", "doj"]
            match_count = sum(1 for kw in keywords if any(kw in v for v in row_vals))
            if match_count >= 2:
                header_row_idx = i
                break
        
        if header_row_idx == -1:
            # Fallback: find first row that has at least 4 non-null values
            for i, row in df.iterrows():
                if row.count() >= 4:
                    header_row_idx = i
                    break
        
        if header_row_idx != -1:
            headers = df.iloc[header_row_idx].values
            cleaned_headers = []
            for j, h in enumerate(headers):
                if pd.notna(h):
                    cleaned_headers.append(str(h).replace('\n', ' ').strip())
                else:
                    cleaned_headers.append(f"Col_{j}")
            
            data_df = df.iloc[header_row_idx + 1:]
            data_df.columns = cleaned_headers
            
            data = data_df.to_dict(orient='records')
            for row in data:
                cleaned_row = {str(k).strip(): clean_value(v) for k, v in row.items() if not str(k).startswith('Col_')}
                
                # Find name field
                name_val = ""
                for k, v in cleaned_row.items():
                    k_lower = k.lower()
                    if "name" in k_lower and "dept" not in k_lower:
                        name_val = v
                        break
                
                # Skip meta-rows or empty names
                if name_val and len(name_val) > 3 and not name_val.lower().startswith("faculty list"):
                    if len([v for v in cleaned_row.values() if v]) >= 2:
                        all_data.append(cleaned_row)
                        
    # Deduplicate by name
    seen_names = set()
    unique_data = []
    for item in all_data:
        name_val = ""
        for k, v in item.items():
            k_lower = k.lower()
            if "name" in k_lower and "dept" not in k_lower:
                name_val = v.strip().lower()
                break
        if name_val:
            if name_val not in seen_names:
                seen_names.add(name_val)
                unique_data.append(item)
                
    return unique_data

def process_word(filepath):
    doc = Document(filepath)
    all_data = []
    for table in doc.tables:
        rows = []
        headers = [cell.text.strip() for cell in table.rows[0].cells]
        for row in table.rows[1:]:
            cells = [cell.text.strip() for cell in row.cells]
            if len(cells) == len(headers):
                rows.append(dict(zip(headers, cells)))
        all_data.extend(rows)
    return all_data

def main():
    results = {}
    files = os.listdir(directory)
    for filename in files:
        filepath = os.path.join(directory, filename)
        dept = "UNKNOWN"
        
        # Heuristic to determine department from filename
        fn_lower = filename.lower()
        if "cse" in fn_lower: dept = "CSE"
        elif "ece" in fn_lower: dept = "ECE"
        elif "it" in fn_lower or "technlogy" in fn_lower: dept = "IT" # Typo in user's file: TECHNLOGY
        elif "civil" in fn_lower: dept = "CIVIL"
        elif "ds" in fn_lower: dept = "CSE-DS"
        elif "b s & h" in fn_lower or "bsh" in fn_lower: dept = "BSH"
        
        print(f"Processing {filename} as {dept}...")
        
        data = []
        if filename.endswith(".xlsx") or filename.endswith(".xls"):
            data = process_excel(filepath)
        elif filename.endswith(".docx"):
            data = process_word(filepath)
        
        if dept not in results:
            results[dept] = []
        results[dept].extend(data)

    with open(output_json, 'w', encoding='utf-8') as f:
        json.dump(results, f, indent=2, ensure_ascii=False)
    
    print(f"Successfully saved data to {output_json}")

if __name__ == "__main__":
    main()
