SELECT * FROM Customers

select customername ,city from  Customers

--selecting distinct query from the table
select distinct country from Customers

--using where clause use to filter data on certain condition
select country,contactname,customername,city,postalCode from Customers where country='India'

--operators use with the where clause =,>,<,>=,<=,!=or<>, BETWEEN ,LIKE ,IN
ALTER TABLE Customers ADD Budget DECIMAL(50,5);--adding a particular column to the table
UPDATE customers SET budget=40000.00 where customerid BETWEEN 1 and 5 --updating between range

-- > operator
SELECT customername, budget from Customers WHERE budget>5000

SELECT customername from Customers where customername LIKE 'M%' --matched with the starting character of the letter

select customername from Customers where customername like '%a%'; --matched with all the values the character present in middle

select customername from Customers Where customername like '%s'; --matched with the character at the end of the value

select country from Customers;

--IN operator
select customername , country, budget from Customers where country in ('India','USA','Australia');

--sql order by use to sort the data in ascending and descending order
select customername , budget from Customers ORDER BY budget DESC

-- SQL AND -> both the condition must be true
select customername from Customers where customername like 'S%'

Select* from Customers as c where c.country='India' AND c.customername like 'S%'

--SQL OR -> either of the condition is true return true
select customername , contactname,country from Customers where country='India' OR country='USA'

--SQL NOT return all left of the condition
select customername , country from Customers where NOT country='India'

-- INSERT INTO - two ways possible to syntax

insert into
 Customers (CustomerID, CustomerName, ContactName, Address, PostalCode, City, Country) 
 values    (16,'Ankesh Kushwaha', 'Ayush', 'Greater-Noida' ,201310,'Graeter-Noida', 'India')

--2nd ways 
insert into Customers values (17, 'Ankit', 'Ankit','Greater Noida')

select * from Customers

--handling NULL Values 
select * from Customers where budget IS NOT NULL

-- update query
update Customers set budget=500000 ,postalcode=201310 where customerid=17

--delete query 
delete from Customers where country is NULL

select * from Customers

--return only top three query
select * from Customers where country='India' limit 3


