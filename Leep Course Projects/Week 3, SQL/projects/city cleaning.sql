USE world;

# Check for rows and nulls
SELECT COUNT(*) AS No_Null,
	SUM(CASE WHEN ID IS NULL THEN 1 ELSE 0 END) AS Num_Null
FROM city;

# Identify Distinct Values
SELECT name, COUNT(*)
FROM city
GROUP BY name 
ORDER BY COUNT(*) DESC;

# Check for duplicates
SELECT ID, Name, COUNT(*)
FROM city
GROUP BY ID, Name
HAVING COUNT(*) > 1;

# fill missing values
UPDATE city
SET District = "Unknown"
WHERE ID = 921;

#rename table
ALTER TABLE city
RENAME COLUMN Country_Code to CountryCode;

SHOW CREATE TABLE city;


SELECT * FROM city;