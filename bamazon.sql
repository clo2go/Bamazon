CREATE DATABASE IF NOT EXISTS Bamazon;
USE Bamazon
CREATE TABLE Products (
ItemId VARCHAR (100), 
ProductName VARCHAR (100), 
DepartmentName VARCHAR (100), 
Price INTEGER (20), 
StockQuantity INTEGER (20), 
PRIMARY KEY(ItemID)
);


-- CREATE TABLE Top5000 (
-- position INTEGER(11)NOT NULL,
-- artist VARCHAR (100), 
-- song VARCHAR (100), 
-- year INTEGER (4), 
-- raw_total INTEGER (5.3), 
-- raw_usa INTEGER (5.3), 
-- raw_uk INTEGER (5.3), 
-- raw_eur INTEGER (5.3), 
-- raw_row INTEGER (5.3), 
-- PRIMARY KEY(position)
-- );