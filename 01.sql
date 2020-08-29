# Server - Database - Table

# 1. Create
# 1-1. 데이터 베이스

SHOW DATABASES; # 현재 데이터 확인

# 생성

CREATE DATABASE test;

# 선택

USE test

# 현재 확인
SELECT DATABASE()



# 1-2. Table
CREATE TABLE USER1(
	USER_id INT,
	NAME VARCHAR(20),
	email VARCHAR(30),
	age INT(3),
	rdate DATE
)

# Server - Database - Table
# 1. 데이터 베이스

SHOW DATABASES; # 현재 데이터 확인

# 생성

CREATE DATABASE test;

# 선택

USE test

# 현재 확인
SELECT DATABASE()



# 2. Table
CREATE TABLE USER1(
	USER_id INT,
	NAME VARCHAR(20),
	email VARCHAR(30),
	age INT(3),
	rdate DATE
)

CREATE TABLE USER2(
	USER_id INT PRIMARY KEY auto_increment,
	NAME VARCHAR(20) NOT NULL,
	email VARCHAR(30) UNIQUE NOTtest null,
	age INT(3) DEFAULT 30,
	rdate TIMESTAMP
)

# 2. 수정 Alter
# 2-1. 데이터 베이스

SHOW VARIABLES LIKE "character_set_database"
ALTER DATABASE test CHARACTER SET = UTF8

# 2-2. 테이블

ALTER TABLE USER2 ADD tmp TEXT
ALTER TABLE USER2 MODIFY COLUMN tmp INT(3)
ALTER TABLE USER2 DROP tmp



# 3. Drop
# 3-1. 데이터 베이스 삭제
CREATE DATABASE tmp
DROP DATABASE tmp
SHOW DATABASES

# 3-2. 테이블 삭제
DROP TABLE USER3
SELECT DATABASE()


# 4. Insert

INSERT INTO USER1(user_id, NAME, email, age, rdate)
VALUE(1, "jin", "jin@gmail.com", 32, NOW())
SELECT NOW()

INSERT INTO USER1(user_id, NAME, email, age, rdate)
VALUE(2, "sena", "sena@gmail.com", 30, NOW()),
(3, "poter", "pt@gmail.com", 34, NOW()),
(4, "po", "po@gmail.com", 36, NOW()),
(5, "andy", "andy@naver.com", 31, NOW()),
(6, "jane", "jane@naver.com", 35, NOW())


# 5. SELECT

SELECT user_id AS "ID", NAME AS "UserName", age AS "AGES"
FROM USER1

SELECT *
FROM USER1


# DISTINCT 중복제거
SELECT distinct(NAME)
FROM USER1

# where 조건검색
# 32세 이상인 사용자를 검색해서 이름의 종류 개수를 출력
SELECT count(distinct(NAME))
FROM USER1
WHERE age >= 32

SELECT *
FROM USER1
WHERE age >= 30 and age <36

# between A and B
SELECT *
FROM USER1
WHERE age between 30 AND 34

# ORDER BY 정렬
SELECT *
FROM USER1
ORDER BY NAME, age DESC

# 나이가 33세에서 40세 사이에 있는 사용자를 이름순으로 내림차순 정렬하고 중복 데이터를 제거해서 출력
SELECT DISTINCT(name)
FROM USER1
WHERE age BETWEEN 33 AND 39
ORDER BY NAME DESC

# concat
SELECT NAME, age, CONCAT(NAME, "(", age, ")") AS "name_age" 
FROM USER1

# like : where 절에서 특정 문자열이 들어간 데이터를 조회
SELECT *
FROM USER1
-- WHERE email LIKE "%@naver.%"
WHERE email not LIKE "p%"

# in : 여러개의 조건을 조회할 때 사용
SELECT *
FROM USER1
WHERE name IN ("andy", "poter", "po")

SELECT *
FROM USER1
WHERE name IN (
	SELECT distinct(NAME)
	FROM USER1
	WHERE age > 31
)

SELECT distinct(NAME)
FROM USER1
WHERE age > 31

# LIMIT
SELECT *
FROM USER1
LIMIT 3

SELECT *
FROM USER1
LIMIT 3, 5

# 6. UPDATE

UPDATE USER1
SET age = 32, rdate = "2019-12-12"
WHERE age BETWEEN 32 AND 35

SELECT *
FROM USER1
WHERE age BETWEEN 32 AND 35

# 7. delete
DELETE FROM USER1
WHERE rdate > "2020-08-01"

SELECT *
FROM USER1