CREATE DATABASE IF NOT EXISTS Bamazon;

USE Bamazon
CREATE TABLE Products (
ItemId VARCHAR (100) NOT NULL, 
ProductName VARCHAR (100) NOT NULL, 
DepartmentName VARCHAR (100) NOT NULL, 
Price INTEGER (20) default 0, 
StockQuantity INTEGER (20) default 0, 
PRIMARY KEY(ItemID)
);

CREATE TABLE auctions(
  id INT NOT NULL AUTO_INCREMENT,
  itemname VARCHAR(100) NOT NULL,
  category VARCHAR(45) NOT NULL,
  startingbid INT default 0,
  highestbid INT default 0,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS Products;

CREATE TABLE Products (
  ItemID int(11) NOT NULL AUTO_INCREMENT,
  ProductName varchar(45) DEFAULT NULL,
  DepartmentName varchar(45) DEFAULT NULL,
  Price decimal(10,2) DEFAULT NULL,
  StockQuantity int(11) DEFAULT NULL,
  PRIMARY KEY (ItemID)
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