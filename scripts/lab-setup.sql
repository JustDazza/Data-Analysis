-- =========================================================
-- Project: NCFE Data Analytics Lab - Master Setup
-- Purpose: Database Schema Creation and Initial Data Ingestion
-- Description: Builds core tables and seeds raw measurements (e.g. 452.7g)
-- =========================================================

USE practice_db;

CREATE TABLE IF NOT EXISTS inventory_measurements (
    id INT AUTO_INCREMENT PRIMARY KEY,
    item_name VARCHAR(100) NOT NULL,
    recorded_weight_g DECIMAL(5,1) NOT NULL,
    date_logged TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);

INSERT INTO inventory_measurements (item_name, recorded_weight_g)
VALUES 
    ('Component Alpha', 452.7),
    ('Component Beta', 323.8);

CREATE TABLE IF NOT EXISTS course_progress (
    unit_id INT PRIMARY KEY,
    title VARCHAR(255),
    status ENUM('Not Started', 'In Progress', 'Completed') DEFAULT 'Not Started'
);

INSERT INTO course_progress (unit_id, title, status)

VALUES 
    (1, 'Introduction to data analysis', 'In Progress'),
    (2, 'Data compliance and ethics', 'Not Started'),
    (3, 'Collecting, processing and preparing data', 'Not Started'),
    (4, 'Data validation and quality', 'Not Started'),
    (5, 'Communicating and presenting data', 'Not Started');

SELECT * FROM inventory_measurements;
SELECT * FROM course_progress;