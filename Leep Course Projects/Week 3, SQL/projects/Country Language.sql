SHOW CREATE TABLE countrylanguage;

ALTER TABLE countrylanguage
MODIFY COLUMN language VarChar(30) NOT NULL DEFAULT '';

SELECT COUNT(*),
	SUM(CASE WHEN percentage IS NULL THEN 1 ELSE 0 END) AS null_column
FROM countrylanguage;

SELECT * FROM countrylanguage;