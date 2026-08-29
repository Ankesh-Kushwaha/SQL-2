CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    last_name VARCHAR(50),
    country VARCHAR(50),
    age INT,
    phone VARCHAR(11)
);

drop table Customers;

INSERT INTO customers
(customer_id, customer_name, last_name, country, age, phone)
VALUES
(1, 'John', 'Miller', 'USA', 23, '9125368745'),
(2, 'Alex', 'Brown', 'Australia', 21, '9632784152'),
(3, 'Daniel', 'Brooks', 'New Zealand', 24, '8965741538'),
(4, 'Ryan', 'Carter', 'Austria', 21, '9874589736'),
(5, 'Michael', 'Johnson', 'Spain', 22, '8754128965');

select * from Customers;

-- wild cards using % -> it matches partial string
--To fetch records where customer_name starts with 'A'.
select customer_name from Customers where customer_name like 'A%' OR customer_name like '%n';

--To fetch records from the customers table where customer_name contains the letter 'A' at any position.
select * from Customers where customer_name like '%a%' OR customer_name like '%A%';

--To fetch records from the customers table where the country contains the substring 'ra' at any position.
select * from Customers where country like '%ra%';

--2. using _ wildcard The _ wildcard is used to substitute for exactly one character. This is useful when we know part of the string but need to match one specific unknown character.

-- fetch records where customer_name starts with "Dan" and is followed by exactly three characters.
select * from Customers where customer_name  like 'Dan___';

-- This query fetches customers whose Country name has exactly 7 characters.
select * from Customers where country like '_______';

-- 3 using [] wildcard  is used to match a single character from a specified set or range of characters. It is useful for searching values that contain characters from a defined group.

update Customers set customer_name='Ankesh' where customer_id=1;

--updating multiple column at a same time
update Customers set customer_name='Ayush', last_name='Singh' where country='Austria';
select * from Customers;

--alter table 
alter table Customers add email VARCHAR(100);
select * from Customers;

update Customers set email='ankesh123@gmail.com' ;

--swith statement use in sql
SELECT customer_id,
       customer_name,
       age,
       CASE age
           WHEN 21 THEN 'Young Adult'
           WHEN 22 THEN 'Adult'
           WHEN 23 THEN 'Mid Adult'
           WHEN 24 THEN 'Senior Adult'
           ELSE 'Unknown'
       END AS age_group
FROM customers;

select distinct age from Customers;

