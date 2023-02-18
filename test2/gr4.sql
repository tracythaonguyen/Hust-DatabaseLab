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

SELECT * FROM inventory WHERE quan_in_stock > 18;

CREATE INDEX idx_hash ON inventory USING HASH(quan_in_stock);
EXPLAIN					   
SELECT * FROM inventory WHERE quan_in_stock > 18;

DROP INDEX IF EXISTS idx_hash;
DROP INDEX IF EXISTS idx_btree;

CREATE INDEX idx_btree ON inventory USING BTREE(quan_in_stock);
EXPLAIN					   
SELECT * FROM inventory WHERE quan_in_stock > 18;

-- 2. query
-- k cần orders cũng đc, chỉ cần orderlines??

2.a SELECT DISTINCT p.prod_id
FROM products p
JOIN inventory i
ON p.prod_id = i.prod_id
WHERE i.quan_in_stock < 100;

SELECT DISTINCT p.prod_id
FROM products p
WHERE p.prod_id IN (SELECT prod_id
                       FROM inventory
                       WHERE quan_in_stock < 100);

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

-- mowis
DROP TRIGGER IF EXISTS update ON orderlines;
CREATE TRIGGER update
  AFTER UPDATE OR INSERT
  ON orderlines
  FOR EACH ROW
  EXECUTE PROCEDURE trigger_function();

CREATE OR REPLACE FUNCTION update_inventory()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'INSERT' THEN
    UPDATE inventory SET quan_in_stock = quan_in_stock - NEW.quantity, sales = sales + NEW.quantity
    WHERE prod_id = NEW.prod_id;
  ELSIF TG_OP = 'UPDATE' THEN
    UPDATE inventory SET quan_in_stock = quan_in_stock + OLD.quantity - NEW.quantity, sales = sales + NEW.quantity - OLD.quantity
    WHERE prod_id = NEW.prod_id;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_trigger
AFTER INSERT OR UPDATE ON orderlines
FOR EACH ROW
EXECUTE FUNCTION update_inventory();

-- 4. function
DROP FUNCTION IF EXISTS list_product;

CREATE OR REPLACE FUNCTION list_product(limits INT)
RETURNS TABLE(prod_id INT, category INT)
LANGUAGE plpgsql
AS
$$
BEGIN
  RETURN QUERY
  SELECT p.prod_id, p.category
  FROM products p
  JOIN inventory i ON i.prod_id = p.prod_id
  WHERE i.quan_in_stock < limits;
END; 
$$

SELECT * FROM list_product(50);
