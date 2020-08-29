# select
SELECT CountryCode AS Code, NAME, Population, CONCAT(NAME, "(", Population, ")") AS "city_population"
FROM city
WHERE Population BETWEEN 5000000 AND 8000000
# AND CountryCode LIKE "%R%"
# AND ( CountryCode = "BRA" OR CountryCode = "GBR" )
# AND CountryCode IN ("BRA", "GBR")
ORDER BY CountryCode asc, Population DESC
LIMIT 5, 3


# group by
SELECT CountryCode, COUNT(CountryCode) AS count, avg(Population) AS "avg_population"
FROM city
WHERE Population >= 5000000
GROUP BY CountryCode
HAVING avg_population >= 8000000



# quiz 01
SELECT count(distinct(continent))
FROM country

# quiz 02
SELECT Continent, COUNT(Continent) AS count
FROM country
GROUP BY Continent
ORDER BY COUNT DESC

# quiz 03
SELECT CountryCode, sum(Population) AS Population
FROM city
GROUP BY CountryCode
HAVING Population >= 50000000
ORDER BY Population DESC

# quiz 04
SELECT LANGUAGE, COUNT(Language) AS count
FROM countrylanguage
GROUP BY LANGUAGE
ORDER BY COUNT desc
LIMIT 4, 6

# quiz 05
SELECT LANGUAGE, COUNT(Language) AS count
FROM countrylanguage
GROUP BY LANGUAGE
HAVING COUNT >= 15
ORDER BY COUNT DESC

# quiz 06
SELECT Continent, sum(SurfaceArea) AS SurfaceArea
FROM country
GROUP BY Continent
ORDER BY SurfaceArea DESC
