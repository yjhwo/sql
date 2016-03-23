-- 날짜형 함수 ※ 많이 쓰임 ※

-- 날짜
SELECT CURDATE(), CURRENT_DATE;

-- 시간
SELECT CURTIME(), CURRENT_TIME;

-- 날짜 + 시간 ★많이 사용
SELECT NOW(), SYSDATE(), CURRENT_TIMESTAMP;

-- now()는 query가 시작되는 시간으로 비교 하는 것,
-- sysdate()는 
SELECT * FROM salaries WHERE to_date = NOW();
SELECT * FROM salaries WHERE to_date = SYSDATE();

-- formatting(대소문자 구별)
SELECT DATE_FORMAT(NOW(),'%y-%m-%d %H:%i');
SELECT DATE_FORMAT(NOW(),'%y-%m-%d %p %h:%i:%s');

SELECT emp_no,DATE_FORMAT(hire_date,'%Y년%m월%d일') FROM employees
	WHERE hire_date > '2000-1-1';

SELECT CONCAT(first_name,' ',last_name) AS name, hire_date, 
	PERIOD_DIFF(DATE_FORMAT(CURDATE(),'%Y%m'),DATE_FORMAT(hire_date,'%Y%m'))
	FROM employees;

SELECT DATE_ADD(NOW(),INTERVAL 1 MONTH),
	ADDDATE(NOW(), INTERVAL 1 MONTH);
	
SELECT DATE_ADD(NOW(),INTERVAL 10 DAY),
	ADDDATE(NOW(), INTERVAL 10 DAY);

SELECT DATE_ADD(NOW(),INTERVAL 10 YEAR),
	ADDDATE(NOW(), INTERVAL 10 YEAR);
	
SELECT CONCAT(first_name,' ',last_name) AS name, DATE_FORMAT(hire_date,'%Y-%m-%d'),
	DATE_FORMAT(ADDDATE(hire_date,INTERVAL 6 MONTH),'%Y-%m-%d') AS VACATION_DATE
	FROM employees;
	
-- cast ; 거의 사용은 XXX
-- daytime을 date으로 바꿈
SELECT CAST(NOW() AS DATE);

SELECT CAST(1-2 AS UNSIGNED);

SELECT CAST(CAST(1-2 AS UNSIGNED) AS SIGNED);