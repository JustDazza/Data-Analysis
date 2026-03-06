/* PROJECT: Smart Coffee Shop Data Warehouse
PURPOSE: Initial Database Schema and Table Creation
AUTHOR: JustDazza
NOTES: 
- Using MariaDB/MySQL Dialect.
- Primary Keys established for all dimension tables to ensure data integrity.
- Adjusted data types (INT/DECIMAL) from default CSV imports to allow for business scalability.
- Standardised naming conventions across all 9 tables.
*/

-- 1. Create the Database Schema
CREATE DATABASE IF NOT EXISTS `SmartCoffeeShop`;
USE `SmartCoffeeShop`;

-- 2. Create the Sales Fact Table (Core Transactions)
CREATE TABLE `201904_sales_reciepts` (
    `transaction_id` INT PRIMARY KEY,
    `transaction_date` DATE NOT NULL,
    `transaction_time` TIME NOT NULL,
    `sales_outlet_id` TINYINT NOT NULL,
    `staff_id` INT NOT NULL,
    `customer_id` INT NOT NULL,
    `instore_yn` CHAR(1) NOT NULL,
    `order_id` INT NOT NULL, 
    `line_item_id` TINYINT NOT NULL,
    `product_id` INT NOT NULL,
    `quantity` TINYINT NOT NULL,
    `line_item_amount` DECIMAL(10,2) NOT NULL,
    `unit_price` DECIMAL(10,2) NOT NULL,
    `promo_item_yn` CHAR(1) NOT NULL
);

-- 3. Create the Product Dimension Table
CREATE TABLE `product` (
    `product_id` INT PRIMARY KEY,
    `product_group` VARCHAR(50) NOT NULL,
    `product_category` VARCHAR(50) NOT NULL,
    `product_type` VARCHAR(50) NOT NULL,
    `product` VARCHAR(100) NOT NULL,
    `product_description` TEXT,
    `unit_of_measure` VARCHAR(10) NOT NULL,
    `current_wholesale_price` DECIMAL(10,2) NOT NULL,
    `current_retail_price` DECIMAL(10,2) NOT NULL,
    `tax_exempt_yn` CHAR(1) NOT NULL,
    `promo_yn` CHAR(1) NOT NULL,
    `new_product_yn` CHAR(1) NOT NULL
);

-- 4. Create the Customer Dimension Table (PII Data)
-- Note: Increased VARCHAR limits for email and name to prevent data truncation.
CREATE TABLE `customer` (
    `customer_id` INT PRIMARY KEY,
    `home_store` TINYINT NOT NULL,
    `customer_first_name` VARCHAR(50) NOT NULL,
    `customer_email` VARCHAR(100) NOT NULL,
    `customer_since` DATE NOT NULL,
    `loyalty_card_number` VARCHAR(20) NOT NULL,
    `birthdate` DATE NOT NULL,
    `gender` VARCHAR(10) NOT NULL,
    `birth_year` SMALLINT NOT NULL
);

-- 5. Create the Pastry Inventory Table
CREATE TABLE `pastry_inventory` (
    `sales_outlet_id` TINYINT NOT NULL,
    `transaction_date` DATE NOT NULL,
    `product_id` INT NOT NULL,
    `start_of_day` INT NOT NULL,
    `quantity_sold` INT NOT NULL,
    `waste` INT NOT NULL,
    `percentage_waste` DECIMAL(5,2) NOT NULL
);

-- 6. Create the Staff Dimension Table
CREATE TABLE `staff` (
    `staff_id` INT PRIMARY KEY,
    `first_name` VARCHAR(50) NOT NULL,
    `last_name` VARCHAR(50) NOT NULL,
    `position` VARCHAR(50) NOT NULL,
    `start_date` DATE NOT NULL,
    `location_id` INT NOT NULL
);

-- 7. Create the Sales Outlet Dimension Table
CREATE TABLE `sales_outlet` (
    `sales_outlet_id` TINYINT PRIMARY KEY,
    `sales_outlet_type` VARCHAR(20) NOT NULL,
    `store_square_feet` INT NOT NULL,
    `store_address` VARCHAR(100) NOT NULL,
    `store_city` VARCHAR(50) NOT NULL,
    `store_state_province` VARCHAR(5) NOT NULL,
    `store_telephone` VARCHAR(20) NOT NULL,
    `store_postal_code` VARCHAR(10) NOT NULL,
    `store_longitude` DECIMAL(10,6) NOT NULL,
    `store_latitude` DECIMAL(10,6) NOT NULL,
    `manager_id` INT NOT NULL,
    `neighborhood` VARCHAR(50) NOT NULL
);

-- 8. Create the Sales Targets Table
CREATE TABLE `sales_targets` (
    `sales_outlet_id` TINYINT NOT NULL,
    `year_month` VARCHAR(10) NOT NULL,
    `beans_goal` INT NOT NULL,
    `beverage_goal` INT NOT NULL,
    `food_goal` INT NOT NULL,
    `merchandise_goal` INT NOT NULL,
    `total_goal` INT NOT NULL
);

-- 9. Create the Generations Lookup Table
CREATE TABLE `generations` (
    `birth_year` SMALLINT PRIMARY KEY,
    `generation` VARCHAR(30) NOT NULL
);

-- 10. Create the Dates Dimension Table
CREATE TABLE `dates` (
    `transaction_date` DATE PRIMARY KEY,
    `date_id` INT NOT NULL,
    `week_id` TINYINT NOT NULL,
    `week_desc` VARCHAR(20) NOT NULL,
    `month_id` TINYINT NOT NULL,
    `month_name` VARCHAR(20) NOT NULL,
    `quarter_id` TINYINT NOT NULL,
    `quarter_name` VARCHAR(5) NOT NULL,
    `year_id` SMALLINT NOT NULL
);