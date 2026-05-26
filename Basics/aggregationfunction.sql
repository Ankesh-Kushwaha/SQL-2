select * from Customers
--An aggregate function is a function that performs a calculation on a set of values, and returns a single value.

--The MIN() function returns the smallest value of the selected column.
--The MIN() function works with numeric, string, and date data types.

select min(budget) from Customers

--The MAX() function returns the largest value of the selected column.
--The MAX() function works with numeric, string, and date data types.

select max(budget) from Customers

--The COUNT() function returns the number of rows that matches a specified criterion.
--COUNT(*) - Counts the total number of rows in a table (including NULL values).
select count(*) from Customers

--COUNT(columnname) - Counts all non-null values in the column.
select count(budget) as total_customer_as_have_budget
 from Customers

 --COUNT(DISTINCT columnname) - Counts only the unique, non-null values in the column. 
 select count(distinct country)  from Customers

 --The SUM() function is used to calculate the total sum of values within a numeric column.
 --The SUM() function ignores NULL values in the column.

select sum(budget) as total_budget from Customers where country='USA'

--The AVG() function returns the average value of a numeric column.
--The AVG() function ignores NULL values in the column.

select AVG(budget) from Customers where country='USA'

select budget from Customers where country='USA'