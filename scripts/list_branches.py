import pandas as pd
import os

directory = r"C:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\public\LATEST  PLACAMNETS YEAR WISE"
files = [f for f in os.listdir(directory) if not f.startswith('~$') and f.endswith('.xlsx')]

branches = set()

for filename in files:
    filepath = os.path.join(directory, filename)
    xl = pd.ExcelFile(filepath)
    for sheet_name in xl.sheet_names:
        df = pd.read_excel(filepath, sheet_name=sheet_name, header=None)
        # Find header row
        header_row_idx = -1
        for i, row in df.iterrows():
            row_vals = [str(v).lower() for v in row.values if pd.notna(v)]
            if any("branch" in v or "dept" in v for v in row_vals):
                header_row_idx = i
                break
        
        if header_row_idx != -1:
            headers = [str(h).upper() for h in df.iloc[header_row_idx].values]
            branch_col_idx = -1
            for j, h in enumerate(headers):
                if "BRANCH" in h or "DEPT" in h:
                    branch_col_idx = j
                    break
            
            if branch_col_idx != -1:
                data_df = df.iloc[header_row_idx + 1:]
                for b in data_df[branch_col_idx].dropna().unique():
                    branches.add(str(b).strip().upper())

print("Detected Branches in Placement Files:")
for b in sorted(list(branches)):
    print(f"- {b}")
