import pandas as pd
import os

# Analyze Faculty file in detail
filepath = r"C:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\realupdated data of nriit\all l fcaualty nriit  all deapartmets 2025.xlsx"

print("=" * 80)
print("FACULTY DATA ANALYSIS")
print("=" * 80)

xl = pd.ExcelFile(filepath)

for sheet_name in xl.sheet_names:
    print(f"\n📋 SHEET: {sheet_name}")
    print("-" * 60)
    
    df = pd.read_excel(filepath, sheet_name=sheet_name, header=None)
    print(f"   Rows: {len(df)}, Columns: {len(df.columns)}")
    
    # Print all rows for understanding
    for i in range(min(15, len(df))):
        row_vals = []
        for v in df.iloc[i].values:
            if pd.notna(v):
                row_vals.append(str(v)[:35])
        print(f"   Row {i}: {' | '.join(row_vals)}")

print("\n" + "=" * 80)
print("ANALYSIS COMPLETE")
print("=" * 80)
