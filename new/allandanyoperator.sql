create table Products2 (
  Product_id INT PRIMARY Key,
  Name VARCHAR(50),
  Price DECIMAL(10,5)
);

insert into Products2( Product_id, Name , Price) 
values(2 ,'Tablet', 500),
(3,'Phone',300);

--all operators -> The SQL ALL operator compares a value to every value returned by a subquery. A condition using ALL is TRUE only if it holds for all values in the subquery result.

select * from Products2 where Price > ALL (select Price from Customers where Price<500);
select * from Products2;
