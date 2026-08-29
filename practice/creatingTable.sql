Create table products(
   product_id INT PRIMARY Key,
   product_name VARCHAR(50),
   category     VARCHAR(50),
   unit_price DECIMAL(10,2)
);

INSERT INTO products(product_id,product_name,category,unit_price) VALUES
(101, 'Laptop', 'Electronics', 500.00),
(102, 'Smartphone', 'Electronics', 300.00),
(103, 'Headphones', 'Electronics', 30.00),
(104, 'Keyboard', 'Electronics', 20.00),
(105, 'Mouse', 'Electronics', 15.00);

create table Sales(
   sales_id INT PRIMARY KEY,
   product_id INT,
   quantity_sold INT,
   sale_date DATE,
   total_price DECIMAL(10,2),
   FOREIGN KEY (product_id) REFERENCES products(product_id)
);

insert into Sales (sales_id,product_id,quantity_sold,sale_date,total_price) VALUES
(1, 101, 5, '2024-01-01', 2500.00),
(2, 102, 3, '2024-01-02', 900.00),
(3, 103, 2, '2024-01-02', 60.00),
(4, 104, 4, '2024-01-03', 80.00),
(5, 105, 6, '2024-01-03', 90.00);


/* retrieve all columns from sales */
select * from Sales;
select * from products;

/* select product name and unit price*/
select product_name , unit_price from products;
/*retrieve sales_id and sales_date from Sales*/
select sales_id,sale_date from Sales;

/*Filter the Sales table to show only sales with a total_price greater than $100.*/
select * from sales  where total_price>100;
/*Filter the Products table to show only products in the 'Electronics' category.*/
select * from products where category='Electronics';

/* Retrieve the sale_id and total_price from the Sales table for sales made on January 3, 2024.*/
select sales_id , total_price from Sales where sale_date='2024-01-03';

/*Retrieve the product_id and product_name from the Products table for products with a unit_price greater than $100.*/
select product_id , product_name from products where unit_price>100;

/*Calculate the total revenue generated from all sales in the Sales table.*/
select sum(total_price) as total_revenue from sales;

/* Calculate the average unit_price of products in the Products table.*/
select round(avg(unit_price),2 )as average_unit_price from Products;

/* Calculate the total quantity_sold from the Sales table.*/
select sum(quantity_sold)as total_unit_sold from sales;

/*Count Sales Per Day from the Sales table*/
select sale_date,count(*) as sale_per_day from sales
GROUP BY sale_date
order by sale_per_day;

/* Retrieve product_name and unit_price from the Products table with the Highest Unit Price*/
select product_name,unit_price from products
where unit_price=(select max(unit_price) from products);

select product_name ,unit_price from products
ORDER BY unit_price desc
LIMIT 1;

/* Retrieve the sale_id, product_id and total_price from the Sales table for sales with a quantity_sold greater than 4.*/
select sales_id,product_id, total_price from sales where quantity_sold>4;

/*. Retrieve the product_name and unit_price from the Products table, ordering the results by unit_price in descending order.*/
select product_name, unit_Price from Products 
ORDER BY unit_price desc;

/* Retrieve the total_price of all sales, rounding the values to two decimal places.*/
select round(sum(total_price),2) as total_price from sales;

/* Calculate the average total_price of sales in the Sales table.*/
select avg(total_price) from Sales;

/*Retrieve the sale_id and sale_date from the Sales table, formatting the sale_date as 'YYYY-MM-DD'.*/
select sales_id , TO_CHAR(sale_date, 'YYYY-MM-DD') as formatted_date from Sales;

/*Calculate the total revenue generated from sales of products in the 'Electronics' category.*/
select sum(total_price) from sales as s 
 left join products as p on s.product_id=p.product_id
where p.category='Electronics';

/*Retrieve the product_name and unit_price from the Products table, filtering the unit_price to show only values between $20 and $600.*/
select product_name ,unit_price from Products 
where unit_price between 20 and 600;

/*Retrieve the product_name and category from the Products table, ordering the results by category in ascending order.*/
select product_name , category from products 
order by category ;

/*INTERMEDIATE*/
/*Calculate the total quantity_sold of products in the 'Electronics' category.*/
select sum(quantity_sold) as total_quantity_sold from Sales as s
inner join products as p on s.product_id=p.product_id
where p.category='Electronics';

/* Retrieve the product_name and total_price from the Sales table, calculating the total_price as quantity_sold multiplied by unit_price.*/
select product_name , (s.quantity_sold*p.unit_price) as total_price from products as p 
inner join sales as s on p.product_id=s.product_id;

/*Identify the Most Frequently Sold Product from Sales table*/
select product_id,count(*) as max_sold from sales 
GROUP BY product_id
ORDER BY max_sold DESC 
limit 1;

/* Find the Products Not Sold from Products table*/
select product_id,product_name from products
where product_id not in (select DISTINCT product_id from sales);

/* Calculate the total revenue generated from sales for each product category.*/
SELECT p.category, sum(s.total_price) from products as p 
inner join sales as s on s.product_id=p.product_id  
group by p.category;

/* Find the product category with the highest average unit price.*/
select category from products 
GROUP BY category
order by avg(unit_price) desc
limit 1;

/* Identify products with total sales exceeding 30.*/
select p.product_name from Products as p
inner join sales as s on p.product_id=s.product_id  
GROUP BY p.product_name
having sum(s.total_price)>30;

/*Retrieve Sales Details for Products with 'Smart' in Their Name*/
select s.sales_id, p.product_name ,s.total_price from sales as s 
inner join products as p on s.product_id=p.product_id
where p.product_name like '%Smart%';

/*Determine the average quantity sold for products with a unit price greater than $100.*/
select avg(s.quantity_sold) from sales as s 
inner join products as p on s.product_id=p.product_id
where p.unit_price>100;

/*Retrieve the product name and total sales revenue for each product.*/
select p.product_name, sum(s.total_price) as total_revenue from sales as s
inner join products as p on p.product_id=s.product_id
GROUP BY p.product_name;

/*List all sales along with the corresponding product names.*/
select s.sales_id, p.product_name from sales as s
inner join products as p on s.product_id=p.product_id;      

/*  Retrieve the product name and total sales revenue for each product.*/
