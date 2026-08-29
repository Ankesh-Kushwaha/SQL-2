CREATE TABLE Products3 (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    SupplierID INT,
    CategoryID INT,
    Price DECIMAL(10,2)
);

CREATE TABLE OrderDetails (
    OrderDetailsID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY(ProductID) REFERENCES Products3(ProductID)
);

INSERT INTO Products3 (ProductID, ProductName, SupplierID, CategoryID, Price)
VALUES
(1, 'Chais', 1, 1, 18),
(2, 'Chang', 1, 1, 19),
(3, 'Aniseed Syrup', 1, 2, 10),
(4, 'Chef Anton''s Cajun Seasoning', 2, 2, 22),
(5, 'Chef Anton''s Gumbo Mix', 2, 2, 21),
(6, 'Boysenberry Spread', 3, 2, 25),
(7, 'Organic Dried Pears', 3, 7, 30),
(8, 'Northwoods Cranberry Sauce', 3, 2, 40),
(9, 'Mishi Kobe Niku', 4, 6, 97);

INSERT INTO OrderDetails (OrderDetailsID, OrderID, ProductID, Quantity)
VALUES
(1, 10248, 1, 12),
(2, 10248, 2, 10),
(3, 10248, 3, 15),
(4, 10249, 1, 8),
(5, 10249, 4, 4),
(6, 10249, 5, 6),
(7, 10250, 3, 5),
(8, 10250, 4, 18),
(9, 10251, 5, 2),
(10, 10251, 6, 8),
(11, 10252, 7, 9),
(12, 10252, 8, 9),
(13, 10250, 9, 20),
(14, 10249, 9, 4);


select all ProductName from Products3 where true;

-- Retrieve product names if all records in the OrderDetails table have a quantity of 6 or 2
select ProductName from Products3  where ProductID= ALL (select ProductID from OrderDetails where Quantity=6 OR Quantity=2);

-- Find the OrderIDs where the maximum quantity in the order exceeds the average quantity of all orders;
select OrderID  from OrderDetails GROUP BY(OrderID) HAVING MAX(quantity) > ALL (select AVG(quantity) from OrderDetails GROUP BY(OrderID));

-- Top clause;
select * from Products3 order by price DESC limit 2;
select * from Products3;
select * from OrderDetails;