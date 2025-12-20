import pandas as pd
import os

filepath = r"C:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\public\LATEST  PLACAMNETS YEAR WISE\2022-2023_ALL_BRANCHES_PLACED_DATA BY dr yvrr (3).xlsx"

print("=" * 80)
print("PLACEMENT DATA ANALYSIS")
print("=" * 80)

xl = pd.ExcelFile(filepath)

for sheet_name in xl.sheet_names:
    print(f"\n📋 SHEET: {sheet_name}")
    print("-" * 60)
    
    df = pd.read_excel(filepath, sheet_name=sheet_name, header=None)
    print(f"   Rows: {len(df)}, Columns: {len(df.columns)}")
    
    # Print first few rows to see structure
    for i in range(min(10, len(df))):
        row_vals = []
        for v in df.iloc[i].values:
            if pd.notna(v):
                row_vals.append(str(v)[:30])
        print(f"   Row {i}: {' | '.join(row_vals)}")

print("\n" + "=" * 80)
