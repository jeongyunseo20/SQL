# DATE_FORMAT : 날짜 데이터의 포맷을 변경하는 함수
# sakila
USE sakila

# payment에서 월별 총 매출 출력

SELECT DATE_FORMAT(payment_date, "%Y-%m") AS monthly, sum(amount)
FROM payment
GROUP BY monthly

