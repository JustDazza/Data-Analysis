# ☕ Smart Coffee Shop: Full-Cycle Data Engineering & Operational Analysis

> **📁 Project Assets:** [📊 Download Spreadsheet Analysis (.xlsx)](./Smart_Coffee_Shop_Project.xlsx) | [📂 View SQL Scripts](./)

## 📌 Project Overview
This project demonstrates a full-cycle data workflow for a multi-outlet coffee chain. It spans two distinct phases: 
1. **Data Engineering:** Building a MySQL relational database, performing ETL, and querying via SQL.
2. **Operational Analysis:** Using spreadsheets for advanced statistical modeling, waste tracking, and KPI development.

---

## 🛠️ Technical Stack
* **Database:** MySQL, Docker, HeidiSQL
* **Analytics:** Microsoft Excel / Google Sheets (Pivot Tables, VLOOKUP, Statistical Functions)
* **Languages:** SQL (Joins, Aggregations, Subqueries)
* **Data Source:** [Coffee Shop Sales Dataset (Kaggle)](https://www.kaggle.com/datasets/ylchang/coffee-shop-sample-data-1113)

---

## 🚀 Phase 1: Data Engineering (SQL & Warehouse)
The foundation of this project was the development of a **9-table relational database** designed to provide a 360-degree view of business operations.

### **🏗️ Database Architecture**
* **Fact Table:** `201904_sales_reciepts` (Transactional data).
* **Dimensions:** `product`, `customer` (PII), `pastry_inventory`, `staff`, `sales_outlet`, `dates`, and `generations`.

### **🧠 Technical Challenges**
* **Data Type Optimisation:** Manually adjusted suggested types, converting `TINYINT` to `INT` for primary keys to ensure scalability and using `DECIMAL(10,2)` for financial accuracy.
* **Keyword Conflicts:** Resolved **1064 Syntax Errors** by using backticks to escape reserved keywords like `` `year_month` ``.
* **Normalisation:** Integrated disparate date formats across tables using `LIKE` operators and string filtering.

---

## 📈 Phase 2: Operational Analytics (Spreadsheets & Statistics)
Using the cleaned data, I performed a deep-dive operational audit using advanced spreadsheet techniques to identify margin-leakage and performance trends.

### **⚙️ The ETL Pipeline**
* **Extraction:** Imported 49,874 raw transaction records.
* **Transformation:** Standardised date formats and used `VLOOKUP` to map product IDs to wholesale and retail pricing.
* **Validation:** Implemented `=LEN` and `=ISNUMBER` checks to ensure data integrity before aggregation.

### **🥐 Waste & Efficiency (Prescriptive Analytics)**
* **The "Waste King":** Analysis revealed the **Ginger Scone** had a **71.91% waste rate**.
* **Anomaly Detection:** Identified a **81% waste outlier** for Product 72. By investigating the data, this was verified as a natural outlier caused by a large pre-order cancellation.
* **Statistical Choice:** I utilised the **Median** waste figures rather than the **Mean** for daily reporting to ensure one-off incidents did not skew typical shop performance.

---

## 📊 Combined Business Insights

### **💰 Financial Performance**
* **Total Revenue:** £233,578.45.
* **Mean Transaction Value:** £4.68.
* **Promotional Impact:** Non-promotional items generated a higher mean value (£4.70) compared to promo items (£3.04), suggesting a need for better "bundle" strategies.

### **👥 Customer Demographics**
* **Top Segment:** **Baby Boomers** generated the highest revenue, spending **£11,201.05** in April 2019.
* **Top Outlet:** **Outlet 3** was the star performer, achieving **428.96%** of its monthly target.

---

## 🛡️ Ethics & Data Privacy
While this dataset is synthetic, I have applied **UK GDPR** and **Data Protection Act 2018** standards to all Personally Identifiable Information (PII).
* **Data Minimisation:** Stored only essential customer attributes.
* **Security:** Restricted MySQL access via isolated Docker networking and password authentication.

---

## 💻 Featured Query: Demographic Revenue Split
This "Triple Join" links Sales, Customers, and Generations to identify high-revenue segments.

```sql
SELECT 
    g.generation,
    ROUND(SUM(s.line_item_amount), 2) AS total_revenue
FROM `201904_sales_reciepts` s 
JOIN customer c ON s.customer_id = c.customer_id
JOIN generations g ON c.birth_year = g.birth_year
GROUP BY g.generation
ORDER BY total_revenue DESC;
```

---
*Last Updated: April 2026*
---