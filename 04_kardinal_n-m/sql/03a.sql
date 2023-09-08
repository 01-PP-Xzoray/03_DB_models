-- 3a SELECTS 1:1 / n:m

-- 1. JOIN 
SELECT
	*
FROM mydb.purchases
INNER JOIN mydb.servants ON mydb.servants.id = mydb.purchases.servants_id
INNER JOIN mydb.products ON mydb.products.id = mydb.purchases.products_id
INNER JOIN mydb.cats ON mydb.cats.id = mydb.servants.cats_id
;

-- 2. Wer bekommt den Lachs? 
SELECT
	cat_name AS Herrschaft,
    servant_name AS Diener,
    product_name AS Produkt
FROM mydb.purchases
INNER JOIN mydb.servants ON mydb.servants.id = mydb.purchases.servants_id
INNER JOIN mydb.products ON mydb.products.id = mydb.purchases.products_id
INNER JOIN mydb.cats ON mydb.cats.id = mydb.servants.cats_id
WHERE product_name LIKE "%Lachs%" -- irgendwas mit Lachs...
;

-- 2a. Wer bekommt den Lachs? 
SELECT
	concat(
			servant_name, 
            " ist der Diener von ", 
            cat_name,", er kauft ",
            product_name, 
            "- somit bekommt ",
            cat_name, " den Lachs."
            ) 
            AS "Wer bekommt den Lachs?"
FROM mydb.purchases
INNER JOIN mydb.servants ON mydb.servants.id = mydb.purchases.servants_id
INNER JOIN mydb.products ON mydb.products.id = mydb.purchases.products_id
INNER JOIN mydb.cats ON mydb.cats.id = mydb.servants.cats_id
WHERE product_name LIKE "%Lachs%" -- irgendwas mit Lachs...
;

-- 2b. Variante mit einer VIEW
DROP VIEW IF EXISTS mydb.who_purchased_salmon;
CREATE VIEW  mydb.who_purchased_salmon AS
	SELECT
		servant_name AS Diener,
		cats_id
	FROM mydb.purchases
	INNER JOIN mydb.servants ON mydb.servants.id = mydb.purchases.servants_id
	INNER JOIN mydb.products ON mydb.products.id = mydb.purchases.products_id
	WHERE product_name LIKE "%Lachs%" -- irgendwas mit Lachs...
;

SELECT * FROM mydb.who_purchased_salmon;

SELECT
	 concat(cat_name, " bekommt den Lachs.") AS Katze
FROM mydb.cats INNER JOIN mydb.who_purchased_salmon  --  VIEW wird als Tabelle behandelt
ON mydb.cats.id = mydb.who_purchased_salmon.cats_id;



