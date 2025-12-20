"""Debug ECE Sheet in File 3"""
import pandas as pd
excel_file = r"C:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\public\LATEST  PLACAMNETS YEAR WISE\ALL_BRANCHES_PLACED_DATA BY dr yvrr (3).xlsx"
df = pd.read_excel(excel_file, sheet_name='ECE')
print(f"Columns: {df.columns.tolist()}")
print("First 5 rows (cols with 'PACKAGE' or 'CTC'):")
for col in df.columns:
    if 'PACKAGE' in str(col).upper() or 'CTC' in str(col).upper():
        print(f"Column '{col}' sample values: {df[col].head().tolist()}")
