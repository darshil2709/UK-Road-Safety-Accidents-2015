-- Create a new schema called accidents
CREATE SCHEMA IF NOT EXISTS accidents;
-- Use the accidents schema
USE accidents;

-- Create the accident table
CREATE TABLE IF NOT EXISTS accident (
accident_index VARCHAR(13),
accident_severity INT
);

-- Create the vehicles table
CREATE TABLE IF NOT EXISTS vehicles (
accident_index VARCHAR(13),
vehicle_type VARCHAR(50)
);

-- Create the vehicle_types table
CREATE TABLE IF NOT EXISTS vehicle_types (
vehicle_code INT,
vehicle_type VARCHAR(10)
);

-- Load data into the accident table
LOAD DATA LOCAL INFILE 'C:\\Users\\nanav\\Downloads\\Accidents_2015.csv'
INTO TABLE accident
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(accident_index, accident_severity);

-- Load data into the vehicles table
LOAD DATA LOCAL INFILE 'C:\\Users\\nanav\\Downloads\\Vehicles_2015.csv'
INTO TABLE vehicles
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(accident_index, vehicle_type);

-- Load data into the vehicle_types table
LOAD DATA LOCAL INFILE 'C:\\Users\\nanav\\Downloads\\vehicle_types.csv'
INTO TABLE vehicle_types
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
