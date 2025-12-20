
import pandas as pd
import warnings

warnings.simplefilter(action='ignore', category=UserWarning)

file_path = r'c:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\realupdated data of nriit\all l fcaualty nriit  all deapartmets 2025.xlsx'

def clean_text(text):
    if pd.isna(text): return ""
    # Remove null bytes, whitespace, and quotes
    s = str(text).replace("_x0000_", "").replace('"', '').replace("'", "").strip()
    return s

def parse_date(date_str):
    if not date_str or date_str == "nan": return None
    try:
        # Try DD/MM/YYYY
        parts = date_str.split('/')
        if len(parts) == 3:
            return f"{parts[2]}-{parts[1]}-{parts[0]}"
    except:
        pass
    return None

print("Reading Excel...")
df = pd.read_excel(file_path, header=None, engine='openpyxl')
# Apply robust cleaning
df = df.astype(str).map(clean_text)

sql_statements = []
sql_statements.append("-- FIX REAL DATA: PAN and DOJ")
sql_statements.append("BEGIN;")

dept_map = {
    "COMPUTER SCIENCE AND ENGINEERING": "CSE",
    "COMPUTER SCIENCE & ENGINEERING": "CSE",
    "INFORMATION TECHNOLOGY": "IT",
    "ELECTRONICS AND COMMUNICATIONS ENGINEERING": "ECE",
    "ELECTRONICS & COMMUNICATION ENGINEERING": "ECE",
    "COMPUTER SCEINCE & ENGINEERING(DATA SCIENCE)": "CSE",
    "ARTIFICAL INTELLIGENCE AND MACHINE LEARNING": "CSE",
}

for index, row in df.iterrows():
    dept_raw = row[21].upper() 
    
    dept_code = None
    for k, v in dept_map.items():
        if k in dept_raw:
            dept_code = v
            break
            
    if not dept_code:
        continue

    fname = row[7]
    lname = row[8]
    pan = row[9]
    doj_raw = row[22]
    doj = parse_date(doj_raw)
    
    if not fname or not lname: continue
    
    # Simple check for invalid names like "N", "Valid PAN", etc.
    if len(fname) < 2 and len(lname) < 2: continue
    
    updates = []
    if pan and len(pan) >= 10: # PAN is usually 10 chars
        updates.append(f"pan_number = '{pan}'")
    if doj:
        updates.append(f"date_of_joining = '{doj}'")
        
    if updates:
        set_clause = ", ".join(updates)
        sql = f"""
UPDATE faculty_profiles 
SET {set_clause}
WHERE dept_code = '{dept_code}' 
AND (
    (first_name || ' ' || last_name) ILIKE '%{fname}%{lname}%' 
    OR 
    (last_name || ' ' || first_name) ILIKE '%{fname}%{lname}%'
);"""
        sql_statements.append(sql)

sql_statements.append("COMMIT;")

out_path = "scripts/fix_real_data.sql"
with open(out_path, "w") as f:
    f.write("\n".join(sql_statements))

print(f"Generated {len(sql_statements)} statements in {out_path}")
