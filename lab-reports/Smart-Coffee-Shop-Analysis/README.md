# ☕ Smart Coffee Shop: Relational Data Warehouse & BI Analysis

## 📌 Project Overview
This project involves the end-to-end development of a **MySQL relational database** for a multi-outlet coffee chain. Using a dataset of approximately 50,000 transactions, I performed ETL (Extract, Transform, Load) processes, established entity relationships, and conducted deep-dive analytics into inventory waste, customer demographics, and sales performance.



---

## 🛠️ Technical Stack
* **Database Engine:** MySQL (Latest)
* **Infrastructure:** Docker & Docker Compose
* **Management Tool:** HeidiSQL
* **Language:** SQL (Joins, Aggregations, Subqueries)
* **Data Source:** [Coffee Shop Sales Dataset (Kaggle)](https://www.kaggle.com/datasets/ylchang/coffee-shop-sample-data-1113)

---

## 🏗️ Database Architecture
The data warehouse consists of **9 interconnected tables** built to provide a 360-degree view of the business operations.

### **Core Tables**
* **`201904_sales_reciepts`**: The central Fact Table containing transactional data (Note: spelling reflects raw source fidelity).
* **`product`**: Product catalogue with wholesale and retail pricing.
* **`customer`**: Personally Identifiable Information (PII) for loyalty tracking.
* **`pastry_inventory`**: Daily tracking of stock, sales, and waste.
* **`sales_targets`**: Monthly performance benchmarks per outlet.
* **`staff`, `sales_outlet`, `dates`, `generations`**: Dimension tables for HR, Geography, and Demographic analysis.

---

## 🧠 Key Technical Challenges & Solutions

### **1. Data Type Optimisation (LO 2.2 & 2.7)**
During the schema creation phase, I manually adjusted HeidiSQL's suggested data types. I converted `TINYINT` to `INT` for primary keys to ensure scalability beyond 255 records and set `DECIMAL(10,2)` for financial columns to maintain mathematical accuracy for revenue calculations.

### **2. Reserved Keyword Conflicts**
I encountered a **1064 Syntax Error** when querying the `year_month` column in the `sales_targets` table. I resolved this by using **backticks** (`` `year_month` ``) to escape the reserved SQL keyword, ensuring the "Gap Analysis" query functioned correctly.

### **3. Data Normalisation (LO 2.3)**
A significant format mismatch was identified between the Targets table (Format: `Apr-19`) and the Sales table (ISO Date). I performed a "Data Audit" using `DISTINCT` queries and successfully integrated these disparate sources using a `LIKE` operator and string filtering.

---

## 📊 Business Insights & Results

### **🛒 Inventory Waste (Prescriptive Analytics)**
The analysis revealed that the **Ginger Scone** was a significant "Waste King", with a **71.91% waste rate**. Out of 2,976 units baked, 2,140 were discarded. 
* **Recommendation:** Reduce daily scone production by 60% to recover wholesale margins and reduce spoilage costs.



### **👥 Customer Demographics**
* **Top Spenders:** **Baby Boomers** generated the highest revenue, spending **£11,201.05** on coffee in April 2019.
* **VIP Identification:** Identified "Hanna" as the top individual customer (£459.75 spent).
* **Ethical Note (LO 2.8):** Handling PII (names/emails) required strict adherence to Data Protection principles (GDPR), ensuring the database remains secure and access-controlled.

### **🏁 Performance vs. Target (Gap Analysis)**
Every outlet significantly outperformed its goals. **Outlet 3** was the top performer, achieving **428.96%** of its monthly target.

---

## 🛡️ Ethics & Data Privacy (LO 2.8)
While the "Smart Coffee Shop" dataset consists of **synthetic, fictional data**, I have treated all Personally Identifiable Information (PII)—such as customer names and email addresses—with the same rigour required by **UK GDPR** and the **Data Protection Act 2018**. 

**Key Ethical Considerations:**
* **Data Minimisation:** The database schema was designed to only store essential customer attributes required for loyalty analysis.
* **Privacy by Design:** In a production environment, I would recommend the encryption of the `customer_email` field and the anonymisation of `birthdate` to `birth_year`.
* **Storage Security:** Access to the MySQL instance is restricted via password authentication and isolated Docker networking.

---

## 💻 Sample Query: The "Triple Join"
This query demonstrates the ability to link Sales, Customers, and Generations to identify high-revenue demographic segments.

```sql
SELECT 
    g.generation,
    ROUND(SUM(s.line_item_amount), 2) AS total_revenue
FROM `201904_sales_reciepts` s -- Source table retains Kaggle spelling fidelity
JOIN customer c ON s.customer_id = c.customer_id
JOIN generations g ON c.birth_year = g.birth_year
GROUP BY g.generation
ORDER BY total_revenue DESC;
```