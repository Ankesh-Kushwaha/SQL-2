Select * from Customers
--The JOIN clause is used to combine rows from two or more tables, based on a related column between them.

--(INNER) JOIN: Returns only rows that have matching values in both tables
--LEFT (OUTER) JOIN: Returns all rows from the left table, and only the matched rows from the right table
--RIGHT (OUTER) JOIN: Returns all rows from the right table, and only the matched rows from the left table
--FULL (OUTER) JOIN: Returns all rows when there is a match in either the left or right table


create table Customers2(
   customerid INT Primary KEY,
   customer_name VARCHAR(50),
   city VARCHAR(50),
   signup_year INT
)

create table ORDERS(
   orderid INT PRIMARY KEY,
   customerid INT,
   order_amount DECIMAL(10,2),
   order_date DATE,
   payment_mode VARCHAR(50),
   FOREIGN KEY (customerid) REFERENCES Customers2(customerid)
)

insert into Customers2(customerid,customer_name,city,signup_year) values (1,'Ankesh Kushwaha','Greater Noida',2023);
insert into Customers2 
values (2, 'Diya', 'Mumbai', 2022),
(3, 'Kabir', 'Pune', 2020),
(4, 'Meera', 'Delhi', 2023),
(5, 'Rohan', 'Bangalore', 2021),
(6, 'Isha', 'Chennai', 2022),
(7, 'Vivaan', 'Hyderabad', 2020);
insert into ORDERS values
 (101, 1, 2500, '2024-01-10', 'UPI');
insert into ORDERS values
 (102, 2, 1800, '2024-01-15', 'Card'),
(103, 1, 3200, '2024-02-11', 'Cash'),
(104, 3, 1500, '2024-02-20', 'UPI'),
(105, 5, 4500, '2024-03-05', 'Card'),
(106, 2, 2100, '2024-03-15', 'UPI'),
(107, 7, 5000, '2024-03-18', 'Cash');
select * from Customers2;
select * from ORDERS

--inner join  
--question 1 -> Show all customers who placed orders along with their order amount.
select c.customer_name,o.order_amount from Customers2 as c 
INNER JOIN ORDERS as o ON c.customerid=o.customerid;

--question2 -> find total order amount for each customer
select c.customer_name, SUM(o.order_amount) as total_order_amount FROM Customers2 as  c
INNER JOIN ORDERS as o on c.customerid=o.customerid
GROUP BY(c.customer_name);

--question3 -> Display customers who used UPI payment.
select c.customer_name , o.payment_mode from Customers2 as c 
inner join ORDERS as o on c.customerid=o.customerid where o.payment_mode='UPI';

--LEFT JOIN
--question 1 => Show all customers and their orders, including customers with no orders.
select * from Customers2 as c 
left join ORDERS as o on c.customerid=o.customerid;

--question2 => Find customers who never placed any order.
select * from Customers2 as c 
left join  ORDERS as o on c.customerid=o.customerid where orderid is null;

--question3 => Display customer names with total orders count (including 0 orders).
select c.customer_name , count(orderid) as total_order from Customers2 as c 
left join ORDERS as o on c.customerid=o.customerid 
GROUP BY (c.customer_name);

--RIGHT JOIN 
--question1=> Show all orders even if customer details are missing.
select * from Customers2 as c 
right join ORDERS as o 
on c.customerid=o.customerid;

--Find orders placed by non-existing customers.
select o.orderid ,o.order_date from Customers2 as c 
right join ORDERS as o 
on c.customerid=o.customerid where c.customerid is null

insert into ORDERS values (108, 12, 5000, '2024-03-18', 'Cash');

--FULL OUTER JOIN 
select * from Customers2 
UNION
select * from Customers2

--A self join is a regular join, but the table is joined with itself.
--questions 1=> Find pairs of customers living in the same city.
select c1.customer_name , c2.customer_name from 
Customers2 as c1 
JOIN Customers2 as c2 on c1.customerid<c2.customerid
where c1.city=c2.city

select * from Customers2;
insert into Customers2 values (8,'Ayush','Greater Noida');