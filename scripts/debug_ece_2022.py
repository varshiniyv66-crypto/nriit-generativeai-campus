"""Debug 2022-23 sheet"""

import pandas as pd

excel_file = r"C:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\public\2025-26 Faculty Directory\ECE Faculty List NBA (3).xlsx"

# Read raw data
df = pd.read_excel(excel_file, sheet_name='2022-23', header=None)

print("First 15 rows of 2022-23 sheet:")
for i in range(min(15, len(df))):
    row_data = df.iloc[i].tolist()
    # Only show non-nan values
    filtered = [str(x) for x in row_data if pd.notna(x)]
    print(f"Row {i}: {filtered[:6]}")
