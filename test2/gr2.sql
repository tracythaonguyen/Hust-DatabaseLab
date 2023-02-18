-- 1. index
SELECT prod_id FROM products
WHERE category = 3;

EXPLAIN
CREATE INDEX cate_INDEX 
ON products USING HASH(category);

-- =, >, <
CREATE INDEX cate_INDEX_2 
ON products USING BTREE(category);

SELECT prod_id FROM products
WHERE category > 3;

-- 2. query
DROP INDEX IF EXISTS cate_INDEX;
DROP INDEX IF EXISTS cate_INDEX_2;

EXPLAIN
SELECT DISTINCT p.prod_id
FROM products p
JOIN categories c ON p.category = c.category
WHERE c.categoryname = 'Documentary' 
    AND p.prod_id NOT IN (
      SELECT orderid
      FROM orderlines o
      );

SELECT DISTINCT p.prod_id
FROM p.products 
JOIN categories c ON p.category = c.category
WHERE c.categoryname = 'Documentary' 
    AND NOT EXISTS (
      SELECT orderid
      FROM orderlines o
      WHERE o.prod_id = p.prod_id;
      );

-- 3. TRIGGER
-- add atribute to table
ALTER TABLE customers
ADD orders_value DECIMAL(12,2) DEFAULT 0.00;

UPDATE customers c SET orders_value = (SELECT SUM(totalamount) FROM orders o i WHERE o.customerid = c.customerid);

-- code của Huyền
DROP FUNCTION IF EXISTS update_order_value()
CREATE OR REPLACE FUNCTION update_order_value()
RETURNS TRIGGER AS $$
BEGIN
IF (TG_OP = 'INSERT') THEN
	UPDATE customers
	SET orders_value = orders_value + NEW.totalamount
	WHERE customerid = NEW.customerid;
ELSE 
	IF (TG_OP = 'DELETE') THEN
	UPDATE customers
	SET orders_value = orders_value - OLD.totalamount
	WHERE customerid = OLD.customerid;
  ELSE 
    UPDATE customers 
    SET orders_value = orders_value - (OLD.totalamount - NEW.totalamount)
    WHERE customerid = NEW.customerid;
  END IF;
END IF;
RETURN NEW;
END;
$$ 
LANGUAGE 'plpgsql';

DROP TRIGGER IF EXISTS act_orders ON orders;
CREATE OR REPLACE TRIGGER act_orders
AFTER INSERT OR DELETE OR UPDATE ON orders
FOR EACH ROW
EXECUTE PROCEDURE update_order_value()

-- 4. FUNCTION
CREATE OR REPLACE FUNCTION rate(customerid BIGINT)
RETURN VARCHAR
LANGUAGE plpgsql
AS
$$
DECLARE
  titan VARCHAR := 'titan';
  gOLD VARCHAR := 'gold';
  silver VARCHAR := 'silver';
  total DECIMAL(12,2);
  order DECIMAL(12,2);
  result VARCHAR;
BEGIN
  SELECT c.orders_value INTO total FROM customers c
  WHERE c.customerid = customerid;
  SELECT o.totalamount INTO order FROM orders
  JOIN customer c1 ON c1.customerid = o.customerid
  WHERE o.customerid = cutomerid;
  IF (total >= 50000000 OR order >= 20000000)
  THEN result = titan;
  ELSE IF (total >= 30000000 OR order >= 15000000)
  THEN result = gold;
  ELSE result = silver;
  END IF;
  RETURN result;
END; 
$$

-- test
SELECT * FROM customers WHERE customerid = 7888;
SELECT * FROM orders WHERE customerid = 7888;
INSERT INTO orders(orderdate, customerid, netamount, tax, totalamount) VALUES ('2022-01-03', 7888, 50, 2, 52);

UPDATE orders SET totalamount = 400 WHERE customerid = 7888;