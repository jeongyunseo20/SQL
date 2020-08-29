# 소수점 올림, 반올림, 버림 함수
SELECT ceil(12.345)
SELECT round(12.345, 2)
SELECT TRUNCATE(12.345, 2)

# 예제
SELECT CODE, round((GNP / Population) * 1000, 2)
FROM country



# 조건문

# IF : IF(조건, 참, 거짓)
# 도시의 인구가 100만 이상이면 big city, 100만 미만이면 small city
# column : city_scale

SELECT NAME, Population,
	IF(Population >= 1000000, "big city", "small city") AS city_scale
FROM city

# IFNULL : IFNULL(참, 거짓)
# country 테이블에서 독립년도(IndepYear)가 없으면 0으로 출력

SELECT NAME, IFNULL(IndepYear, 0) AS IndepYear
FROM country

# CASE
# CASE 
# 	WHEN (조건1) THEN (출력1)
# 	WHEN (조건2) THEN (출력2)
# END AS (컬럼명)
# 나라별 10억 이상, 1억 이상, 1억 이하 조건을 출력

SELECT NAME, Population,
CASE
	WHEN Population >= 1000000000 THEN "upper 1 billion"
	WHEN Population >= 100000000 THEN "upper 100 million"
	ELSE "below 100 million"
END AS result
FROM country
