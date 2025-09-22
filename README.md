# Reverse Logistics & Loss Analysis Dashboard

📊 End-to-end analytics project simulating **e-commerce reverse logistics** and analyzing **business waste** using **Python, SQL, and Power BI**.

---

## 🚀 Project Overview
This project simulates a real-world **reverse logistics and loss containment scenario** inspired by challenges in modern e-commerce operations:  
- Generated **500+ synthetic e-commerce orders and returns** dataset using **Python**.  
- Queried and analyzed data using **SQL** to extract KPIs and business insights.  
- Built an interactive **Power BI dashboard** to visualize returns, vendor/carrier performance, and waste costs.  

---

## 🛠️ Tech Stack
- **Python** → Synthetic dataset generation  
- **SQL** → Data querying & analysis  
- **Power BI** → Dashboard & visualization  

---

## 📂 Repository Structure
├── data/ # Orders & Returns dataset

│ ├── orders.csv

│ ├── returns.csv


├── sql/ # SQL queries for analysis

│ ├── queries.sql


├── notebooks/ # Python dataset generation

│ ├── data_generation.ipynb

├── dashboard/ # Power BI dashboard + screenshots

│ ├── Reverse_Logistics_Dashboard screenshot

└── README.md # Project documentation

---

## 📈 Power BI Dashboard
Key Metrics & Visuals:
- **KPI Cards** → Total Orders, Total Returns, Return Rate %, Waste Cost  
- **Bar Chart** → Vendor vs Return Rate  
- **Pie/Donut Chart** → Return Reasons Distribution  
- **Line Chart** → Monthly Orders vs Returns Trend  
- **Table** → Carrier vs Avg Resolution Time  

---

## 📊 SQL Queries
Some insights extracted using SQL:

```sql
-- Vendor-wise Return Rate
SELECT 
    Vendor,
    ROUND(100.0 * SUM(CASE WHEN Return_Flag = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS return_rate
FROM Orders
GROUP BY Vendor
ORDER BY return_rate DESC;

-- Carrier Avg Resolution Time
SELECT 
    Carrier,
    ROUND(AVG(Resolution_Time_Days), 2) AS avg_resolution_time
FROM Returns
GROUP BY Carrier
ORDER BY avg_resolution_time DESC;
