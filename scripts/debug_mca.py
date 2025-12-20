"""Debug MCA sheet"""
import pandas as pd
excel_file = r"C:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\public\2025-26 Faculty Directory\ce, mba & mca sTAFF lIST updated.xlsx"
df = pd.read_excel(excel_file, sheet_name='MCA', header=None)
print("First 10 rows of MCA:")
for i in range(10):
    print(f"Row {i}: {df.iloc[i].tolist()}")
