# create table & data

CREATE TABLE user (
user_id int(11) unsigned NOT NULL AUTO_INCREMENT,
name varchar(30) DEFAULT NULL,
PRIMARY KEY (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE addr (
id int(11) unsigned NOT NULL AUTO_INCREMENT,
addr varchar(30) DEFAULT NULL,
user_id int(11) DEFAULT NULL,
PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO user(name)
VALUES ("jin"),
("po"),
("alice"),
("petter");

INSERT INTO addr(addr, user_id)
VALUES ("seoul", 1),
("pusan", 2),
("deajeon", 3),
("deagu", 5),
("seoul", 6);

# JOIN : merge()

# inner join

SELECT addr.addr, addr.user_id, user.name
FROM addr
JOIN user
ON addr.user_id = user.user_id

# world 도시 이름, 국가 이름을 출력
SELECT city.CountryCode, city.Name, country.Name
FROM city
JOIN country
ON city.CountryCode = country.Code


# left join
SELECT id, addr.addr, addr.user_id, IFNULL(user.name, "-")
FROM addr
LEFT JOIN user
ON addr.user_id = user.user_id

# right join
SELECT id, addr.addr, user.user_id, user.name
FROM addr
right JOIN user
ON addr.user_id = user.user_id

# union : select 문의 결과를 합쳐서 출력
# 자동으로 중복을 제거(제거 안하려면 union all)
SELECT NAME
FROM user
UNION
SELECT addr
FROM addr

# outer join
SELECT user.name, addr.addr, addr.user_id
FROM user
LEFT JOIN addr
ON user.user_id = addr.user_id
UNION
SELECT user.name, addr.addr, addr.user_id
FROM user
right JOIN addr
ON user.user_id = addr.user_id

# sub-query : 쿼리문 안에 쿼리가 있는 문법
# select, from, where

# 전체 나라 수, 전체 도시 수, 전체 언어 수를 출력

select
(SELECT COUNT(*)
FROM country) AS total_country,

(SELECT COUNT(*)
FROM city) AS total_city,

(SELECT count(DISTINCT(LANGUAGE))
FROM countrylanguage) AS total_language


# 800만 이상이 되는 도시의 국가 코드, 도시 이름, 국가 이름, 도시 인구수를 출력

SELECT *
FROM
	(SELECT CountryCode, NAME, Population
	FROM city
	WHERE Population >= 8000000) AS city_data
JOIN 
	(SELECT CODE, NAME
	FROM country) AS country
ON city_data.countrycode = country.code

# 800만 이상 도시의 국가 코드, 국가 이름, 대통령 이름 출력

SELECT CODE, NAME, HeadOfState
FROM country
WHERE CODE IN(
	SELECT distinct(CountryCode)
	FROM city
	WHERE Population >= 8000000
)

# index : 데이터를 검색할 때 빠르게 찾을 수 있도록 해주는 기능
USE employees

explain
SELECT COUNT(*)
FROM salaries
WHERE to_date > "2000-01-01"

CREATE INDEX tdate
ON salaries (to_date)

DROP INDEX tdate
ON salaries

# view : 특정 쿼리문에 대한 결과를 저장하는 개념
USE world

# (select code, name from country) as code_name을 쓴 것과 똑같은 결과
CREATE VIEW code_name AS
SELECT CODE, NAME
FROM country

SELECT *
FROM city
JOIN code_name
ON city.CountryCode = code_name.code