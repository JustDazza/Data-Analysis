/* PROJECT: Smart Coffee Shop Data Warehouse
PURPOSE: Sales Performance Vs Monthly Targerts (Gap Analysis)
AUTHOR: JustDazza
LO EVIDENCE: LO 2.6 (Diagnostic Analytics) & LO 2.2 (Technical Troubleshooting).
NOTES: 
- This query joins the Sales Fact Table with the Sales Targets Table.
- Uses Backticks (`year_month`) to escape a reserved SQL keyword.
- Identifies that all outlets exceeded targets by over 300%.
*/

-- 1. Actual Revenue vs. Monthly Target per Outlet
-- This query uses a subquery (actuals) to aggregate sales before joining with targets.
SELECT 
    t.sales_outlet_id,
    t.`total_goal` AS monthly_target,
    actuals.total_revenue AS monthly_actual,
    (actuals.total_revenue - t.`total_goal`) AS variance,
    ROUND((actuals.total_revenue / t.`total_goal`) * 100, 2) AS performance_pct
FROM `sales_targets` t
JOIN (
    /* Aggregating total revenue from the sales fact table */
    SELECT sales_outlet_id, SUM(line_item_amount) AS total_revenue
    FROM `201904_sales_reciepts`
    GROUP BY sales_outlet_id
) AS actuals ON t.sales_outlet_id = actuals.sales_outlet_id
/* Filtering for the specific April 2019 target string */
WHERE t.`year_month` = 'Apr-19'
ORDER BY performance_pct DESC;

/* TECHNICAL TROUBLESHOOTING REFLECTION:
1. Reserved Keyword: The column name 'year_month' is a reserved word in MariaDB. 
   I used backticks to ensure the SQL parser identified it as a column identifier.
2. Data Normalisation: The targets table used a string format ('Apr-19') while 
   the sales table used ISO dates. I performed a 'DISTINCT' audit to identify 
   the correct string for the JOIN/WHERE clause.
*/

-- 2. Category Performance vs. Specific Goals (Beverage vs Food)
-- Analysis shows Beverage goals were significantly surpassed compared to Food.
SELECT 
    t.sales_outlet_id,
    t.beverage_goal,
    SUM(CASE WHEN p.product_category = 'Coffee' OR p.product_category = 'Tea' THEN s.line_item_amount ELSE 0 END) AS beverage_actual
FROM `sales_targets` t
JOIN `201904_sales_reciepts` s ON t.sales_outlet_id = s.sales_outlet_id
JOIN `product` p ON s.product_id = p.product_id
WHERE t.`year_month` = 'Apr-19'
GROUP BY t.sales_outlet_id, t.beverage_goal;