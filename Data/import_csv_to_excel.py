import os
import pandas as pd

# Folder containing your CSVs
csv_folder = 'data'  # Make sure this folder exists and contains your CSVs
output_excel = 'Retail_Order_Management_Dashboard.xlsx'

with pd.ExcelWriter(output_excel, engine='xlsxwriter') as writer:
    for filename in os.listdir(csv_folder):
        if filename.endswith('.csv'):
            sheet_name = filename.replace('.csv', '')[:31]  # Excel sheet name limit
            file_path = os.path.join(csv_folder, filename)
            df = pd.read_csv(file_path)
            df.to_excel(writer, sheet_name=sheet_name, index=False)

print(f"✅ All CSVs imported into {output_excel}")