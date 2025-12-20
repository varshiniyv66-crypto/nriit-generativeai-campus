"""Debug DS temp file"""
import pandas as pd
excel_file = r"C:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\public\temp_ds.xlsx"
df = pd.read_excel(excel_file, header=None)
print("First 15 rows:")
for i in range(15):
    print(f"Row {i}: {df.iloc[i].tolist()}")
