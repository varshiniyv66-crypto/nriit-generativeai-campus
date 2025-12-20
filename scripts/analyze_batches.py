import pandas as pd
import os

directory = r"C:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\public\LATEST  PLACAMNETS YEAR WISE"
files = [f for f in os.listdir(directory) if not f.startswith('~$') and f.endswith('.xlsx')]

print("=" * 100)
for filename in files:
    filepath = os.path.join(directory, filename)
    xl = pd.ExcelFile(filepath)
    print(f"\n📂 FILE: {filename}")
    for sheet_name in xl.sheet_names:
        df = pd.read_excel(filepath, sheet_name=sheet_name, header=None)
        # Find first few regd nos
        regds = []
        for i, row in df.iterrows():
            for v in row.values:
                s_v = str(v).upper()
                if "KP" in s_v: # Registry pattern
                    regds.append(s_v)
            if len(regds) >= 10: break
        
        print(f"   Sheet: {sheet_name} | Sample Regd Nos: {', '.join(regds[:5])}...")

print("\n" + "=" * 100)
