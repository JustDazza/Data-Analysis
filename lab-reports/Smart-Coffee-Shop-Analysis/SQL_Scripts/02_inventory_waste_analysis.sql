/* PROJECT: Smart Coffee Shop Data Warehouse
PURPOSE: Customer Segmentation and Demographic Spend Analysis
AUTHOR: JustDazza
LO EVIDENCE: LO 2.5 (Demographic Profiling) & LO 2.8 (Ethics and GDPR).
NOTES: 
- This query joins the Sales, Customer, and Generations tables.
- Identifies 'Baby Boomers' as the primary revenue group.
- Treats PII (Personally Identifiable Information) with strict data protection principles.
*/

-- 1. Identify Top Spending Generations
-- Analysis reveals Baby Boomers lead with over £11,200 in coffee spend.
SELECT 
    g.generation,
    p.product_category,
    COUNT(s.transaction_id) AS total_transactions,
    SUM(s.quantity) AS items_purchased,
    SUM(s.line_item_amount) AS total_revenue
FROM `201904_sales_reciepts` s
JOIN customer c ON s.customer_id = c.customer_id
JOIN generations g ON c.birth_year = g.birth_year
JOIN product p ON s.product_id = p.product_id
GROUP BY g.generation, p.product_category
ORDER BY total_revenue DESC;

-- 2. VIP Loyalty Identification (Top 10 Customers)
-- Used to identify candidates for targeted marketing campaigns.
SELECT 
    c.customer_first_name,
    c.customer_email,
    COUNT(s.transaction_id) AS visit_count,
    SUM(s.line_item_amount) AS total_spent,
    MAX(s.transaction_date) AS most_recent_visit
FROM `201904_sales_reciepts` s
JOIN customer c ON s.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_first_name, c.customer_email
ORDER BY total_spent DESC
LIMIT 10;

/* ETHICAL REFLECTION:
The query above accesses PII (Names and Emails). In a real-world scenario:
1. Access would be restricted to authorised marketing personnel only.
2. Email addresses would be masked (e.g., h****@example.com) for general reporting.
3. Customers would have the 'Right to be Forgotten' under UK GDPR, requiring 
   the ability to delete or anonymise these specific records upon request.
*/