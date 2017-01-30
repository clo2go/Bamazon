CREATE DATABASE Bamazon;

USE Bamazon;
create table Products (
  ItemID INT NOT NULL AUTO_INCREMENT,
  ProductName varchar(45) DEFAULT NULL,
  DepartmentName varchar(45) DEFAULT NULL,
  Price decimal(10,2) DEFAULT NULL,
  StockQuantity int(11) DEFAULT NULL,
  PRIMARY KEY (ItemID)
);