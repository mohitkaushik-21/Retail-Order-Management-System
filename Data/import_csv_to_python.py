import os
import pandas as pd

# Use current folder (where script + CSVs are stored)
csv_folder = '.'

# Full path to your Excel folder
output_excel = r"C:\Excel-SQL Projects\Retail-Order-Management-System\Excel\Retail_Order_Management_Dashboard.xlsx"

# Ensure Excel folder exists
os.makedirs(os.path.dirname(output_excel), exist_ok=True)

with pd.ExcelWriter(output_excel, engine='xlsxwriter') as writer:
    for filename in os.listdir(csv_folder):
        if filename.endswith('.csv'):
            sheet_name = filename.replace('.csv', '')[:31]
            file_path = os.path.join(csv_folder, filename)
            df = pd.read_csv(file_path)
            df.to_excel(writer, sheet_name=sheet_name, index=False)

print(f"✅ All CSVs imported into {output_excel}")