--The LIKE operator is used in a WHERE clause to search for a specified pattern within a column's text data.

--There are two wildcards often used in conjunction with the LIKE operator:

--A percent sign % - represents zero, one, or multiple characters
--A underscore sign _ - represents a single character

select * from Customers  where customername like 'S%' --match starting character

select contactname from Customers where contactname like '%mma%' or contactname like '%av%' --match in between VALUES

select contactname from Customers where contactname like '__l%' -- _ is use to match a single char

