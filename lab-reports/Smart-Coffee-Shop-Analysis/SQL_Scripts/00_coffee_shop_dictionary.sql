/* PROJECT: Smart Coffee Shop - Data Dictionary
PURPOSE: Metadata for the Unit 2 Portfolio Database
*/

USE `SmartCoffeeShop`; 

CREATE TABLE IF NOT EXISTS coffee_shop_metadata (
    id INT AUTO_INCREMENT PRIMARY KEY,
    table_name VARCHAR(50),
    column_name VARCHAR(50),
    description TEXT,
    unit_of_measure VARCHAR(20)
);

TRUNCATE TABLE coffee_shop_metadata;

INSERT INTO coffee_shop_metadata (table_name, column_name, description, unit_of_measure)
VALUES 
('201904_sales_reciepts', 'line_item_amount', 'Total price for the specific row item', 'GBP (£)'),
('pastry_inventory', 'waste', 'Number of items unsold and discarded', 'Units'),
('pastry_inventory', 'percentage_waste', 'Calculated efficiency of stock usage', 'Percent (%)'),
('sales_targets', 'total_goal', 'The monthly financial target for the outlet', 'GBP (£)'),
('customer', 'birth_year', 'Year used to calculate generation (PII)', 'Year (YYYY)');

SELECT * FROM coffee_shop_metadata;