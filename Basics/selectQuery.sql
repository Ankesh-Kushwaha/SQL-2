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

