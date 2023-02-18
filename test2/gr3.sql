-- 1. index (bài cũ)
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
-- DROP INDEX IF EXISTS cate_INDEX;
-- DROP INDEX IF EXISTS cate_INDEX_2;

SELECT DISTINCT c.customerid,c.firstname,c.lastname FROM customers c JOIN orders o ON c.customerid = o.customerid WHERE c.country = 'Canada';

SELECT DISTINCT c.customerid,c.firstname,c.lastname FROM customers c WHERE customerid IN (SELECT customerid FROM orders WHERE customerid IN (SELECT customerid FROM customers WHERE country = 'Canada'));

-- 3. TRIGGER
-- add atribute to table
ALTER TABLE products
ADD total_sold INT DEFAULT 0;

UPDATE products p SET total_sold = (SELECT SUM(o.quantity) FROM orderlines o WHERE o.prod_id = p.prod_id);

DROP FUNCTION IF EXISTS update_total_sold()
CREATE OR REPLACE FUNCTION update_total_sold()
RETURNS TRIGGER AS $$
BEGIN
IF (TG_OP = 'INSERT') THEN
	UPDATE products
	SET total_sold = total_sold + NEW.quantity
	WHERE prod_id = NEW.prod_id;
ELSE 
	IF (TG_OP = 'DELETE') THEN
	UPDATE products
	SET total_sold = total_sold - OLD.quantity
	WHERE prod_id = OLD.prod_id;
  ELSE 
    UPDATE products 
    SET total_sold = total_sold - (OLD.quantity - NEW.quantity)
    WHERE prod_id = NEW.prod_id;
  END IF;
END IF;
RETURN NEW;
END;
$$ 
LANGUAGE 'plpgsql';

DROP TRIGGER IF EXISTS update_sold ON products;
CREATE OR REPLACE TRIGGER update_sold
AFTER INSERT OR DELETE OR UPDATE ON products
FOR EACH ROW
EXECUTE PROCEDURE update_total_sold()

-- 4. FUNCTION
CREATE OR REPLACE FUNCTION rate_product(prod_ids INT)
RETURNS VARCHAR
LANGUAGE plpgsql
AS
$$
DECLARE
  trending VARCHAR := 'trending';
  potential VARCHAR := 'potential';
  new VARCHAR := 'new';
  total INT;
  result VARCHAR;
BEGIN
  -- check total_sold
  UPDATE products p SET total_sold = (SELECT SUM(o.quantity) FROM orderlines o WHERE o.prod_id = p.prod_id);

  SELECT p1.total_sold INTO total FROM products p1
  WHERE p1.customerid = prod_ids;

  IF (total > 30)
  THEN result = trending;
  ELSE IF (total >= 20 OR total <= 30)
    THEN result = potential;
    ELSE result = new;
      END IF; 
  END IF;
  RETURN result;
END; 
$$