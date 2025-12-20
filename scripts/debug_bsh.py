"""Debug BSH file"""
import pandas as pd
excel_file = r"C:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\public\2025-26 Faculty Directory\B S & H25-26 FACULTY LIST  DINAL FROM dr yvrr.xlsx"
df = pd.read_excel(excel_file, header=None)
print("First 15 rows of BSH:")
for i in range(15):
    print(f"Row {i}: {df.iloc[i].tolist()}")
