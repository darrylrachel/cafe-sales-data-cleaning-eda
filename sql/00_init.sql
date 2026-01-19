-- =============================================================
-- Procedure: load schema
-- Purpose:   Create schemas + tables (if needed),
--            truncate, and load CSVs from /datasets.
-- =============================================================

DROP DATABASE IF EXISTS cafe_sales;
CREATE DATABASE cafe_sales;


-- --------------------
-- Schemas
-- --------------------
CREATE SCHEMA IF NOT EXISTS raw;
CREATE SCHEMA IF NOT EXISTS stg;
CREATE SCHEMA IF NOT EXISTS dw;

-- --------------------
-- Tables
-- --------------------
DROP TABLE IF EXISTS raw.cafe_sales;
CREATE TABLE raw.cafe_sales (
    "Transaction ID" TEXT,
    Item TEXT,
    Quantity TEXT,
    "Price Per Unit" TEXT,
    "Total Spent" TEXT,
    "Payment Method" TEXT,
    Location TEXT,
    "Transaction Date" TEXT
);


-- --------------------
-- Truncate for reload
-- --------------------
TRUNCATE TABLE raw.cafe_sales;

-- --------------------
-- Load: File
-- --------------------
COPY raw.cafe_sales
FROM '/datasets/dirty_cafe_sales.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', NULL '', ENCODING 'UTF8');