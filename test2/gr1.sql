-- 1. INDEX
EXPLAIN SELECT * FROM orderlines WHERE quantity > 2;

CREATE INDEX quantity_INDEX 
ON orderlines USING HASH(quantity);

-- =, >, <
CREATE INDEX quantity_INDEX_2 
ON orderlines USING BTREE(quantity);

-- Hash indexes only support equality comparisons when performing lookups.

-- B-Tree indexes are great with inequality lookups, (số lượng giá trị trong cột k lặp lại nhiều)
-- Không có tác dụng khi tìm kiếm text sử dụng điều kiện LIKE '%%'. 
-- Với composite index, WHERE condition cần match full value hoặc match mostleft column để đạt hiệu quả tối đa.

-- Bitmap index scan 
-- low cardinality
-- Chỉ hiệu quả với tìm kiếm full match value.
-- Kết hợp với nhiều index khác để tăng tốc độ với OR, AND.

DROP INDEX IF EXISTS quantity_INDEX;
DROP INDEX IF EXISTS quantity_INDEX_2;

EXPLAIN SELECT * FROM orderlines WHERE quantity > 3;

-- bitmap index scan vs index scan???

-- 2. query
-- k cần orders cũng đc, chỉ cần orderlines??

SELECT * FROM orders;

EXPLAIN
SELECT o1.orderid, SUM(o.quantity)
FROM orders o1
JOIN orderlines o 
ON o.orderid = o1.orderid
GROUP BY o1.orderid
HAVING SUM(o.quantity) > 6
ORDER BY o1.orderid;

EXPLAIN
SELECT o.orderid FROM orders o
WHERE (
SELECT SUM(quantity) FROM orderlines o1
WHERE o1.orderid = o.orderid) > 6
ORDER BY o.orderid;

-- explain??

-- 3. trigger
-- add atribute to table
ALTER TABLE products
ADD in_stock INT;

UPDATE products p SET in_stock = (SELECT quan_in_stock FROM inventory i WHERE i.prod_id = p.prod_id);

UPDATE products p
SELECT quan_in_stock FROM inventory i
WHERE p.prod_id = i.prod_id
SET in_stock = quan_in_stock; 

DROP FUNCTION IF EXISTS trigger_function();
CREATE FUNCTION trigger_function()
	RETURNS TRIGGER
	LANGUAGE plpgsql
AS $$
BEGIN
  IF (TG_OP = 'UPDATE') THEN
    UPDATE products 
    SET in_stock = in_stock + OLD.quantity - NEW.quantity
    WHERE prod_id = NEW.prod_id;
  ELSE 
    UPDATE products
    SET in_stock = in_stock - NEW.quantity
    WHERE prod_id = NEW.prod_id;
  END IF;
  RETURN NEW;
END;
$$

DROP TRIGGER IF EXISTS update ON orderlines;
CREATE TRIGGER update
  AFTER UPDATE OR INSERT
  ON orderlines
  FOR EACH ROW
  EXECUTE PROCEDURE trigger_function();

-- 4. function
CREATE OR REPLACE FUNCTION list_product(limit INT)
RETURNS TABLE(prod_id INT, in_stock INT)
LANGUAGE plpgsql
AS
$$
BEGIN
  RETURN QUERY
  SELECT p.prod_id, p.in_stock
  FROM products 
  WHERE p.in_stock < limit;
END; 
$$

SELECT * FROM list_product(200);
