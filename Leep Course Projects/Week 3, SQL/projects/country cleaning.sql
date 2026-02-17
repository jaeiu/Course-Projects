SHOW CREATE TABLE country;

SELECT COUNT(*),
	SUM(CASE WHEN IndepYear IS NULL THEN 1 ELSE 0 END) AS null_column
FROM country;

UPDATE country
SET HeadOfState = ""
WHERE HeadOfState IS NULL;

SELECT headofstate, COUNT(*)
FROM country
GROUP BY headofstate;

ALTER TABLE country
MODIFY COLUMN region VarChar(26) NOT NULL DEFAULT '';

ALTER TABLE country
ADD GNPOld dec(10,2);

SELECT * FROM country;