USE world;

# Return country code and population from 10 highest populated cities
SELECT
	CountryCode AS "Country Code",
    Population
FROM 
	city
ORDER BY
	Population DESC
LIMIT
	10
;
 
# Highest population as country code
SELECT
	CountryCode AS "Country Code",
    Population
FROM city
WHERE Population = 
	(SELECT
		MAX(Population) AS "Population"
	FROM 
		city);
# Not working
SELECT
	CountryCode AS "Country Code",
    Population, 
    RANK() OVER (
		PARTITION BY
			Name
		ORDER BY
			Population DESC) population_rank
FROM city
ORDER BY Population DESC;

# Order by multiple columns
SELECT
	*
FROM 
	city
ORDER BY 
	CountryCode DESC, Population ASC;
    
# Only show 10th value
SELECT
	*
FROM 
	city
ORDER BY
	Population DESC

LIMIT 9, 1; #LIMIT 1 OFFSET 9

# Full string match
SELECT * FROM city WHERE CountryCode = "AFG";
 
# Partial string match LIKE %
SELECT * FROM city WHERE CountryCode LIKE "A%"; # Starts with letter A

SELECT * FROM city WHERE CountryCode LIKE "AR%"; # Starts with AR

# Multiple conditions
SELECT * FROM city
WHERE YEAR(timestamp) = "2026" AND
	MONTH(timestamp) = "12" AND
    DAY(timestamp) = "02";
 
SELECT * FROM city
WHERE YEAR(timestamp) = "2026" OR
	MONTH(timestamp) = "12" OR
    DAY(timestamp) = "02";
    
# Returns the max(population) for when multiple cities have the same name
SELECT 
	Name, 
    MAX(Population) # Aggregation
FROM
	city
GROUP BY Name;
 
 # Not equal to
SELECT * 
FROM countrylanguage
WHERE CountryCode NOT LIKE "CAN";
 
# Not equal to
SELECT * 
FROM countrylanguage
WHERE CountryCode != "CAN";
 
 # Use of list in WHERE statement
SELECT * 
FROM countrylanguage
WHERE CountryCode IN ("CAN", "USA", "AUS");
 
 # Use of list in WHERE statement
SELECT country.Name, countrylanguage.* 
FROM countrylanguage
JOIN country ON countrylanguage.CountryCode = Country.Code
WHERE CountryCode IN ("CAN", "USA", "AUS");

# Null values with filters
SELECT * FROM country
WHERE IndepYear = NULL; # Not working
 
SELECT * FROM country
WHERE IndepYear IS NULL; # Use IS with NULL

# Integration process -> Python + MySQL Database
# Human error
# Humans just try their best
# Humans just do what they can
#WHERE column IS NULL;
#WHERE column = "NULL";
#WHERE column = "Null";
#WHERE column = "Blank";

# Create a new Table
CREATE TABLE example (
	id INT NOT NULL AUTO_INCREMENT, 
    student_name VARCHAR(100) NOT NULL COMMENT "The name of the student", 
    student_age INT,
    PRIMARY KEY (id)
    );

# Data insertion
INSERT INTO example (student_name, student_age) 
VALUES ("Sebastien", "28"); # Transtyping of string to integer
INSERT INTO example (student_name, student_age)
VALUES ("Betty", 8);
INSERT INTO example (student_name, student_age)
VALUES ("Norbert", "twenty two"); # Raises Error
INSERT INTO example (student_name, student_age)
VALUES ("Norbert", 5); # Now works
INSERT INTO example (id, student_name, student_age)
VALUES (999, "Harry", 98); # Override auto-generated id
INSERT INTO example (student_name, student_age)
VALUES ("Andrio", 16);
INSERT INTO example (id, student_name, student_age)
VALUES (2, "Betty", 22); # Raises error because of duplicate id

# Delete Table
DROP TABLE example;

# Changing data
UPDATE example
SET student_name = "Jacques"
WHERE id = 1;
 
# Changing data without using primary key
UPDATE example
SET student_age = 12
WHERE student_name = "Jacques"; # Does not work in all environment

# Some function...
# MAX()
SELECT MAX(Population) 
FROM country; # -> Returns 1 cell
 
# AVG() average
SELECT AVG(Population)
FROM country; # -> Returns 1 cell
 
# CONCAT() concatenation
SELECT CONCAT(Name, " - Population: ", Population) # spaces need to be written manually
FROM country;
 
# DISTINCT() returns all unique values
SELECT DISTINCT(Language)
FROM countrylanguage;
 
# COUNT() number of values
SELECT COUNT(1)
FROM countrylanguage;
 
# Using multiple functions
SELECT DISTINCT(Language), COUNT(1)
FROM countrylanguage
GROUP BY Language;

# Inner join vs left join
SELECT * 
FROM city
INNER JOIN country ON country.Capital = city.ID; # Returns 239 rows
 
SELECT * 
FROM city
LEFT JOIN country ON country.Capital = city.ID
LIMIT 10000;  # Returns 4079 rows

-- SELECT *
-- FROM table1
-- INNER JOIN table2 ON table1.common_column = table2.common_column
-- ORDER DOES NOT MATTER
 
-- SELECT * 
-- FROM table1 (left Table)
-- LEFT JOIN table2 (right Table) ON table1.common_column = table2.common_column
-- All rows from LEFT table (table1) + matching rows from RIGHT table (table2)
 
-- SELECT * 
-- FROM table2 (left Table)
-- RIGHT JOIN table1 (right Table) ON table2.common_column = table1.common_column
-- All rows from RIGHT table (table1) + matching rows from LEFT table (table2)
 
 # Not working because we can't group in a WHERE statement
SELECT * 
FROM city
WHERE Population > AVG(Population);
 
# Hardcoded
SELECT * 
FROM city
WHERE Population > 350468.2236; # Prone to human error, not dynamic
 
SELECT AVG(Population)
FROM city;
 
# With subquery
SELECT * 
FROM city
WHERE Population > (SELECT 
						AVG(Population) 
                        FROM 
							city
					)
;
