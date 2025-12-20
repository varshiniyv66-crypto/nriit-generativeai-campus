"""
Parse the ECE Faculty Excel file - debug version to find header row
"""

import pandas as pd

excel_file = r"C:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\public\2025-26 Faculty Directory\ECE Faculty List NBA (3).xlsx"

# Read raw data to see structure
df = pd.read_excel(excel_file, sheet_name='2025-26', header=None)

print("First 10 rows of ECE file:")
for i in range(min(10, len(df))):
    print(f"Row {i}: {df.iloc[i].tolist()}")
