
import pandas as pd
import warnings
warnings.simplefilter(action='ignore', category=UserWarning)

file_path = r'c:\Users\CSE_DEAN\Desktop\nriit-generativeai-campus\realupdated data of nriit\all l fcaualty nriit  all deapartmets 2025.xlsx'

def clean_text(text):
    if pd.isna(text): return ""
    return str(text).replace("_x0000_", "").strip()

df = pd.read_excel(file_path, header=None, engine='openpyxl')
df_clean = df.astype(str).applymap(clean_text)

print("--- Row 0 (Headers?) ---")
print(df_clean.iloc[0].to_string())

print("\n--- Row 108 (Battula Sowjanya) ---")
print(df_clean.iloc[108].to_string())
