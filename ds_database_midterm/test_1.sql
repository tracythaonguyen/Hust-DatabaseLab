-- Do Tuan Minh

--1.	Display the list of categories in alphabetical order according to the category name   
SELECT * 
FROM categories
ORDER BY categoryname;

--2.	Display the list of orders and their details (orderlines) 
SELECT * 
FROM orders o1
JOIN orderlines o2 ON o1.orderid=o2.orderid ; 

--3.	Update order date of the order number 2 (ordereid) to Jan 2, 2004 
UPDATE orders
SET orderdate ='2004-01-02'
WHERE orderid=2;

--4.	Re-execute the query number 2. Is there any difference between the answer of these 2 queries 
SELECT * 
FROM orders o1
JOIN orderlines o2 ON o1.orderid=o2.orderid ; 

--5.	Display the list of customers and their order if any 
SELECT c.*, o.* 
FROM customers c 
LEFT JOIN orders o ON c.customerid= o.customerid ;

--6.	Display the list of products appeared in the order(s)  on Jan 1, 2004 
-- 
SELECT DISTINCT p.* 
FROM products p 
JOIN orderlines o1 ON o1.prod_id = p.prod_id 
JOIN orders o2 ON o1.orderid= o2.orderid 
WHERE o2.orderdate ='2004-01-01';

--7.	Delete all orders on Jan 1, 2004 
BEGIN;
DELETE 
FROM orders 
WHERE orderdate ='2004-01-01' ; 
SELECT * from orders WHERE orderdate ='2004-01-01' ;
ROLLBACK;
SELECT * from orders WHERE orderdate ='2004-01-01' ;

--8.	Do you have any comment/remarks on the previous query (number 7) 
--Fuck you

--9.	Display the orders in January, 2004 
SELECT * 
FROM orders 
WHERE orderdate BETWEEN '2004-01-01' AND '2004-01-31';

--10.	Display the list of customers whose credit card is expired in May 2012
SELECT * 
FROM customers 
WHERE creditcardexpiration ='2012/05';

--11.	Display the list of products and total  ordered quantities per month 
-- 
SELECT  p.prod_id , SUM(o1.quantity), EXTRACT(MONTH FROM o2.orderdate) as ordermonth
FROM products p 
JOIN orderlines o1 ON o1.prod_id = p. prod_id 
JOIN orders o2 ON o1.orderid= o2.orderid 
GROUP BY p.prod_id, EXTRACT(MONTH FROM o2.orderdate)
ORDER BY ordermonth;

--12.	Display the products that is not ordered yet 
SELECT *
FROM products
WHERE prod_id NOT IN (SELECT  p.prod_id 
				 FROM products p 
 				 JOIN orderlines o1 ON o1.prod_id = p. prod_id 
				 JOIN orders o2 ON o1.orderid= o2.orderid );

--13.	Display the customers and the total amount of their orders 
SELECT c.*, SUM(o.totalamount)
FROM customers c 
JOIN orders o ON o.customerid= c.customerid 
GROUP BY c.customerid ;

--14.	Display the list of states and the number of customers in each state if it is greater than 200 
SELECT state, COUNT (customerid) 
FROM customers 
GROUP BY state 
HAVING COUNT (customerid) > 200 AND state IS NOT NULL ;

