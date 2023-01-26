-- 1
SELECT *
FROM products
ORDER BY title;

-- 2
SELECT c.customerid
FROM customers c
JOIN orders o ON o.customerid = c.customerid;

-- 11
SELECT  p.prod_id , SUM(o1.quantity), EXTRACT(MONTH FROM o2.orderdate) as ordermonth
FROM products p 
JOIN orderlines o1 ON o1.prod_id = p. prod_id 
JOIN orders o2 ON o1.orderid= o2.orderid 
GROUP BY p.prod_id, EXTRACT(MONTH FROM o2.orderdate)
ORDER BY ordermonth;


-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

-- 1
SELECT *
FROM customers
ORDER BY city;

-- 2
SELECT c.* , o.*
FROM customers c
INNER JOIN orders o ON c.customerid = o.customerid
ORDER BY c.customerid;

-- 3
ALTER TABLE customers ALTER COLUMN creditcardexpiration TYPE DATE
using to_date(creditcardexpiration, 'YYYY-MM-01');

-- 4
select o.orderid, o.netamount, o.tax, o.totalamount, sum(ol.quantity * pd.price) as "Total value of order"
from orders as o
inner join orderlines as ol on o.orderid = ol.orderid
inner join products as pd on ol.prod_id = pd.prod_id
group by o.orderid;

-- 5
SELECT p.*
FROM products p
LEFT JOIN orderlines o ON p.prod_id = o.prod_id;

-- 6
SELECT DISTINCT p.* 
FROM products p 
JOIN orderlines o1 ON o1.prod_id = p.prod_id 
JOIN orders o2 ON o1.orderid= o2.orderid 
WHERE o2.orderdate ='2004-12-31';

-- 7
BEGIN;
DELETE 
FROM orders 
WHERE orderdate ='2004-01-01' ; 
SELECT * from orders WHERE orderdate ='2004-01-01' ;
ROLLBACK;
SELECT * from orders WHERE orderdate ='2004-01-01' ;

-- 8
-- comment
-- delete order_id in orders table, then order_id in orderlines are also deleted because order_id in orderlines are foreign key referencing to order_id in orders table.

--9
--select *
--from customers
--where date_part('month',date(creditcardexpiration)) = 6
--and date_part('year',date(creditcardexpiration)) = 2011;

--10
--create temporary table tmpcustomers as select * from customers;
--alter table tmpcustomers drop column state;
--select * from tmpcustomers;

--11
select c.customerid, c.firstname, c.lastname, date_part('month', date(o.orderdate)) as "month", count(o.orderid) as "number of orders"
from customers as c
inner join orders as o
on c.customerid = o.customerid
group by c.customerid, date_part('month', date(o.orderdate))
order by c.firstname, c.lastname, "month";

-- 12
SELECT DISTINCT p.*
FROM products p 
JOIN orderlines o1 ON o1.prod_id = p. prod_id 
GROUP BY p.prod_id
HAVING SUM(o1.quantity) >= ALL
	(SELECT SUM(o2.quantity)
	 FROM orderlines o2
	 GROUP BY o2.prod_id
	)


-- 13
SELECT p.prod_id , SUM(o1.quantity) 
FROM products p 
JOIN orderlines o1 ON o1.prod_id = p. prod_id 
JOIN orders o2 ON o1.orderid= o2.orderid 
JOIN inventory i ON i.prod_id = o1.prod_id
GROUP BY p.prod_id, i.quan_in_stock
HAVING SUM(o1.quantity) > i.quan_in_stock

-- 13 (cach_2)
SELECT DISTINCT p.*
FROM products p 
JOIN orderlines o ON o.prod_id = p.prod_id
GROUP BY p.prod_id
HAVING SUM(o.quantity) > (SELECT quan_in_stock
                         FROM inventory 
                         WHERE prod_id=p.prod_id);

-- 14
SELECT state, COUNT (customerid) 
FROM customers 
GROUP BY state 
HAVING COUNT (customerid) > 200 AND state IS NOT NULL ;

-- 14 (cach_2)
select c.state, count(c.customerid)
from customers as c
where c.state is not null
group by c.state
having count(c.customerid) > 200;