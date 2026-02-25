-- =========================================================
-- Project: NCFE Data Analytics Lab - Data Dictionary
-- Purpose: Defining metadata and standards for practice_db
-- =========================================================

CREATE TABLE IF NOT EXISTS data_dictionary (
    id INT AUTO_INCREMENT PRIMARY KEY,
    table_name VARCHAR(50) NOT NULL,
    column_name VARCHAR(50) NOT NULL,
    data_type VARCHAR(50),
    description TEXT,
    unit_of_measure VARCHAR(20),
    is_nullable BOOLEAN,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

TRUNCATE TABLE data_dictionary;

INSERT INTO data_dictionary (table_name, column_name, data_type, description, unit_of_measure, is_nullable)
VALUES 
('inventory_measurements', 'id', 'INT', 'Primary Key: Unique identifier for each batch record', 'N/A', FALSE),
('inventory_measurements', 'item_name', 'VARCHAR', 'Descriptive label for the inventory batch', 'N/A', TRUE),
('inventory_measurements', 'recorded_weight_g', 'DECIMAL', 'High-precision weight measurement', 'grams (g)', FALSE),
('inventory_measurements', 'date_logged', 'TIMESTAMP', 'Audit timestamp of when the record was created', 'UTC', FALSE);

SELECT * FROM data_dictionary;