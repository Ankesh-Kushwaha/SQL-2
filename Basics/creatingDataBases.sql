CREATE DATABASE CompanyDB; -- create Employees database
CREATE TABLE Customers(
  CustomerID SERIAL PRIMARY KEY,
  CustomerName VARCHAR(50),
  ContactName VARCHAR(50),
  Address VARCHAR(50),
  PostalCode INT,
  City VARCHAR(50),
  Country VARCHAR(50)
);


DROP TABLE Customers;

SELECT * FROM Customers

--inserting data into the table
INSERT INTO Customers
(CustomerID, CustomerName, ContactName, Address, PostalCode, City, Country)
VALUES
(1, 'TechNova Solutions', 'Rahul Sharma', '12 MG Road', 110001, 'Delhi', 'India'),

(2, 'BlueWave Retail', 'Ananya Verma', '45 Park Street', 700016, 'Kolkata', 'India'),

(3, 'GreenLeaf Foods', 'Michael Brown', '78 Sunset Blvd', 90001, 'Los Angeles', 'USA'),

(4, 'Skyline Traders', 'Priya Kapoor', '22 Ring Road', 560001, 'Bangalore', 'India'),

(5, 'Nordic Furnitures', 'Emma Wilson', '14 Queen Street', 10115, 'Berlin', 'Germany'),

(6, 'Oceanic Exports', 'David Miller', '9 Harbor Avenue', 2000, 'Sydney', 'Australia'),

(7, 'Sunrise Bakery', 'Sneha Joshi', '67 FC Road', 411004, 'Pune', 'India'),

(8, 'Maple Electronics', 'James Anderson', '81 King Street', 10001, 'New York', 'USA'),

(9, 'Royal Textiles', 'Amit Patel', '5 Ashram Road', 380009, 'Ahmedabad', 'India'),

(10, 'Alpine Sports', 'Sophia Taylor', '33 Lake View', 8001, 'Zurich', 'Switzerland'),

(11, 'Urban Mart', 'Karan Mehta', '90 Civil Lines', 226001, 'Lucknow', 'India'),

(12, 'Pacific Logistics', 'Olivia Davis', '41 Ocean Drive', 6000, 'Perth', 'Australia'),

(13, 'Golden Cafe', 'Arjun Nair', '18 Brigade Road', 560025, 'Bangalore', 'India'),

(14, 'Bright Future Ltd', 'William Scott', '72 Baker Street', 560001, 'London', 'UK'),

(15, 'Elite Automobiles', 'Neha Singh', '27 GT Road', 141001, 'Ludhiana', 'India');

SELECT * FROM Customers;

