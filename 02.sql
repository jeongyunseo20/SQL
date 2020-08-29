# quiz 01
SELECT DISTINCT(continent)
FROM country
ORDER BY continent

# quiz 02
SELECT NAME, population
FROM city
WHERE CountryCode = "KOR" AND population >= 1000000
ORDER BY population DESC

# quiz 03
SELECT NAME, CountryCode, population
FROM city
WHERE population BETWEEN 8000000 AND 10000000
ORDER BY population DESC

# quiz 04
SELECT CODE, CONCAT(NAME, "(", IndepYear, ")" ), continent, population
FROM country
WHERE IndepYear BETWEEN 1940 AND 1950
ORDER BY IndepYear, population DESC

# quiz 05
SELECT CountryCode, LANGUAGE, Percentage
from countrylanguage
WHERE LANGUAGE IN ("Spanish", "Korean", "English") AND Percentage >= 95
ORDER BY percentage DESC

# quiz 06
SELECT CODE, NAME, Continent, GovernmentForm, Population
FROM country
WHERE CODE LIKE "A%" AND GovernmentForm LIKE "%Republic%"


# city 테이블에서 나라별 도시의 개수를 출력
SELECT CountryCode, COUNT(CountryCode) AS count
FROM city
GROUP BY CountryCode

# countrylanguage 테이블에서 전체 언어의 개수를 출력
SELECT COUNT(distinct(LANGUAGE)) AS count
FROM countrylanguage

# 대륙별 인구수와 GNP의 최대값을 출력
SELECT Continent, max(Population), max(GNP)
FROM country
GROUP BY Continent

# 대륙별 총 인구수와 인구 1인당 GNP
SELECT Continent, SUM(Population), SUM(GNP), SUM(GNP) / SUM(Population)
FROM country
GROUP BY Continent

# 대륙별 전체 인구를 구하고, 인구수 5억 이상인 대륙만 출력
# having : group by가 실행된 결과에 조건을 추가
SELECT Continent, SUM(Population) AS data
FROM country
GROUP BY Continent
HAVING DATA > 500000000

