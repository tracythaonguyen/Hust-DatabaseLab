-- 1.	Display the list of Orders in the order starting with the newest order (… the oldest ones)    
SELECT *
FROM orders
ORDER BY orderdate;

-- 2.	Display the list of products and its quantity in stock (inventory) in ascending order of quantity in stock 
SELECT p.*, i.quan_in_stock
FROM products p
JOIN inventory i ON p.prod_id = i.prod_id
ORDER BY i.quan_in_stock;

-- 3.	Convert credit card expiration (customers.creditcardexpiration) into datetime data type. By default, expiration day is 1st day of month  
ALTER TABLE customers ALTER COLUMN creditcardexpiration TYPE DATE
using to_date(creditcardexpiration, 'YYYY-MM-01');

-- 4.	Display the total value of all orders of each customer 
SELECT SUM(totalamount), DISTINCT c.*
FROM customers c
JOIN orders o ON c.customerid=o.customerid
GROUP BY (c.customerid);

select c.customerid, sum(p.price * ol.quantity)
from customers c
inner join orders o on c.customerid = o.customerid
inner join orderlines ol on o.orderid = ol.orderid
inner join products p on p.prod_id = ol.prod_id
group by c.customerid

-- 5.	Display the list of categories and the total amount of orders for each category (in case no order, the total amount will be zero) 
SELECT c.category, COUNT(DISTINCT o.orderid)
FROM categories c 
JOIN products p ON c.category = p.category 
JOIN orderlines o ON p.prod_id = o.prod_id
GROUP BY c.category;

-- 6.	Display the list of categories appeared in the order(s) on Dec 31, 2004 
SELECT c.*
FROM categories c
JOIN products p ON p.category = c.category
JOIN orderlines o ON o.prod_id = p.prod_id
WHERE o.orderdate = '2004-12-31';

-- 7.	Delete all customer who live in the VT state
DELETE 
FROM customers
WHERE state ='VT'; 

-- 8.	Do you have any comment/remarks on the previous query (number 7)
-- delete order_id in orders table, then order_id in orderlines are also deleted because order_id in orderlines are foreign key referencing to order_id in orders table.
-- Before using modifing queries like DELETE we have to check the conditions in the WHERE clause carefully as it can delete, update wrong/undesired rows, especially PRIMARY KEY and FOREIGN KEY

-- 9.	Display the list of customers whose credit card is expired in June 2011
SELECT *
FROM customers
WHERE date_part('year',date(creditcardexpiration)) = 2011 AND
    date_part('month',date(creditcardexpiration)) = 6;

-- 10.	Display the list of customers, their firstname has at least 2 characters “A”
SELECT * 
FROM customers
WHERE firstname like '%A%A%';

-- 11.	Display the list of products and the total ordered quantity of each product per month. The list is in alphabetical order of product name 
SELECT p.prod_id,p.title , SUM(o.quantity) total_order, EXTRACT(MONTH FROM o2.orderdate) month_order
FROM products p 
JOIN orderlines o ON o.prod_id = p. prod_id 
JOIN orders o2 ON o.orderid= o2.customerid 
GROUP BY p.prod_id, EXTRACT(MONTH FROM o2.orderdate) 
ORDER BY p.title;

-- 12.	Display the list of customers having the greatest total amount of their orders
SELECT c.customerid, SUM(o.totalamount)
from customers c
JOIN orders o ON o.customerid = c.customerid
GROUP BY c.customerid
HAVING SUM(o.totalamount) >= ALL
    (
    SELECT SUM(o.totalamount)
    from customers c
    JOIN orders o ON o.customerid = c.customerid
    GROUP BY c.customerid
    );

-- 13.	Display the list of products having the total ordered quantity greater than the quantity in stock 
SELECT p.prod_id , SUM(o1.quantity) 
FROM products p 
JOIN orderlines o1 ON o1.prod_id = p. prod_id 
JOIN orders o2 ON o1.orderid= o2.orderid 
JOIN inventory i ON i.prod_id = o1.prod_id
GROUP BY p.prod_id, i.quan_in_stock
HAVING SUM(o1.quantity) > i.quan_in_stock;

-- 14.	Display the list of states and the number of customers in each state if it is greater than 200 
SELECT state, COUNT (customerid) 
FROM customers 
GROUP BY state 
HAVING COUNT (customerid) > 200 AND state IS NOT NULL;