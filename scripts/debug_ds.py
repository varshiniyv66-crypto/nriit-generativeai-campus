"""Debug DS file"""
import pandas as pd
excel_file = r"C:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\public\2025-26 Faculty Directory\faculty list DS  FINAL FROM DR YVRR.xlsx"
df = pd.read_excel(excel_file, header=None)
print("First 10 rows:")
for i in range(10):
    print(f"Row {i}: {df.iloc[i].tolist()}")
