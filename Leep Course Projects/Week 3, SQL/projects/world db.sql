USE world;

SELECT * FROM city;
SELECT * FROM country;

# Select one Column
SELECT CountryCode FROM city;

# Select multiple Columns
SELECT CountryCode, District FROM city;

# Select with an Alias
SELECT CountryCode As "Country Code" FROM city;

# Complex query with aliases
SELECT 
	CountryCode AS "Country Code", 
    District, 
    Name AS "Country Name" 
FROM 
	city;
    
# Select 10 rows
SELECT *
FROM city
ORDER BY Population DESC
LIMIT 10; # Default = 1000

# Get the average population by city
SELECT
    AVG(Population)
FROM
    city;
    
# Country with highest life expectancy
SELECT 
    NAME AS "Country Name",
    LifeExpectancy
FROM country
ORDER BY LifeExpectancy DESC
LIMIT 1;
    
    
# Select cities from USA
SELECT Count(*)
FROM City
WHERE CountryCode = 'USA';

# Display cities sorted by name in ascending order
SELECT *
FROM city
ORDER BY Name;

# Most populated city
SELECT *
FROM city
ORDER BY Population DESC
LIMIT 1;

# Least Populated City
SELECT *
FROM city
ORDER BY Population
LIMIT 1;

# Country with largest population
SELECT 
    Name,
    Population
FROM country
ORDER BY Population DESC
LIMIT 1;

# New year promotion featuring cities with 'New'
SELECT *
FROM city
WHERE Name LIKE 'New%';

# Cities with population larger than 2,000,000
SELECT *
FROM City
WHERE Population >= 2000000
ORDER BY Population;

# Cities beginning with 'Be'
SELECT *
FROM City
WHERE NAME LIKE 'Be%';

# Cities with population between 500,000-1,000,000
SELECT *
FROM City
WHERE Population BETWEEN 500000 AND 1000000
ORDER BY Population;

# Cities ranked 31-40 by population
SELECT 
    *
FROM
    city
ORDER BY population DESC
LIMIT 30,10;

# Cities Frequency table
SELECT Name, Count(*) as frequency
FROM city
GROUP BY Name
ORDER BY Count(*) DESC;

# Identify capital of spain
SELECT * FROM country
INNER JOIN city
	ON country.Capital = city.ID
WHERE city.Name = 'Madrid';


# Cities from europe
SELECT * FROM city
INNER JOIN country
	ON city.CountryCode = country.Code
WHERE Continent = 'Europe';


# AVG population by country 
SELECT Name, AVG(population)
FROM country
GROUP BY name;

#Capital city comparison
SELECT ID, city.Name AS 'Capital', city.Population, country.Name AS 'Country' FROM city
INNER JOIN country
	ON city.ID = country.Capital
ORDER BY city.Population DESC;

# low population density
SELECT Name, Population
FROM Country
WHERE Population != 0
ORDER BY Population;

# GDP* Per Capita
SELECT 
Name, 
GNP/cast(Population AS decimal) AS 'GDP Per Capita'
FROM country
WHERE Population > 0
ORDER BY GNP/Population DESC;

SELECT *
FROM city;

SELECT *
FROM country;

SHOW CREATE TABLE country;

USE world;