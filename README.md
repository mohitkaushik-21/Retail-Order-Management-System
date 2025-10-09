# Retail-Order-Management-System
A beginner-friendly data analysis project using SQL and Excel. This repository includes raw CSV datasets, SQL scripts for cleaning and querying, and an Excel dashboard visualizing key retail metrics like sales trends, product performance, and return rates. Ideal for showcasing foundational skills in data modeling, analysis, and visualization.

---

This project showcases a complete workflow for analyzing retail sales data using Python, Excel, and Power Pivot. It automates CSV imports, builds a relational data model, and visualizes key business metrics in an interactive dashboard — perfect for revision and portfolio display.

---

## 📁 Project Structure
C:.
│   README.md
│
├───Dashboard
├───Data
│       Customers_table.csv
│       import_csv_to_python.py
│       Monthly_Orders_Volume.csv
│       Order_table.csv
│       Payment_Method_Breakdown.csv
│       Products_table.csv
│       Retail_Order_Management_Dashboard.xlsx
│       Returns_table.csv
│       Return_Rate_By_Product.csv
│       Sales_by_Category.csv
│       top_customers.csv
│
├───Excel
│       Retail_Order_Management_Dashboard.xlsx
│
└───SQL
        Retail_Order_Management_System.sql

---

## ⚙️ Tools & Technologies

- **Python** (Pandas, XlsxWriter) — for automating CSV import into Excel
- **Excel** — for dashboard layout and visuals
- **Power Pivot** — for data modeling and DAX measures
- **DAX** — for calculated metrics like Total Sales, AOV, Return Rate

---

## 📊 Dashboard Highlights

- **Sales Analysis** over time segmented by payment method  
- **Top 5 Customers** ranked by total sales  
- **Category-wise Sales** visualized in a pie chart  
- **Payment Method Breakdown** for financial insights  
- **Core Measures**:
  - `TotalSalesAmount`

---

## 🧮 Data Model (Star Schema)

- **Fact Table**: `Orders_table`
- **Dimension Tables**:
  - `Customers_table`
  - `Products_table`
  - `Returns_table`
  - `Payment_Method_Breakdown`

Relationships are built in Power Pivot to enable cross-table analysis.

---

## 🚀 Automation Workflow

1. Place all CSVs in the `/Data` folder  
2. Run `import_csv_to_excel.py` to generate a clean Excel workbook  
3. Load sheets into Power Pivot and build relationships  
4. Create DAX measures and design dashboard visuals  
5. Export screenshots and publish to GitHub

---

## 📸 Screenshots

> _Include visuals of your dashboard here — Sales Analysis, Top Customers, Category Breakdown, etc._

---

## 📌 How to Use

- Clone the repo  
- Place your CSVs in `/Data`  
- Run the Python script  
- Open the Excel file in `/Excel`  
- Explore the dashboard and model

---

## 🧠 Learning Outcomes

- Automating Excel workflows with Python  
- Building scalable data models in Power Pivot  
- Designing executive-style dashboards  
- Writing clean DAX for business metrics  
- Structuring projects for GitHub visibility

---

## 📬 Contact

Built by [Mohit](https://github.com/mohitkaushik-21)  
Feel free to fork, star, or reach out for collaboration!
