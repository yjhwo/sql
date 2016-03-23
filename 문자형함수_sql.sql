-- 문자형 함수

SELECT UPPER('Seoul'), UCASE('seoul');
SELECT LOWER('Seoul'), LCASE('SEOUL');

-- SELECT * FROM USER WHERE LOWER(id) = LOWER('Seoul');
-- pseudo code

SELECT SUBSTRING('Happy Day',3,3);
-- 'Happy Day'에서 3에서부터 3글자 가져오겠다.

-- 첫번째 방법
SELECT CONCAT(first_name,' ',last_name) AS name,hire_date
	FROM employees WHERE '1989-1-1' <= hire_date AND hire_date <= '1989-12-31';
-- 두번째 방법
SELECT CONCAT(first_name,' ',last_name) AS name,hire_date
	FROM employees WHERE hire_date LIKE '1989%';
-- 세번째 방법(1~4번째 글자까지)
SELECT CONCAT(first_name,' ',last_name) AS name,hire_date
	FROM employees WHERE SUBSTRING(hire_date,1,4) = '1989';
	
SELECT LPAD('hi',5,'*'),RPAD('hi',5,'*');

SELECT emp_no,LPAD(CAST(salary AS CHAR),10,'*') from salaries WHERE salary <= 100000;

SELECT CONCAT('--',LTRIM('   hello   '),'--') AS 'LTRIM',
		CONCAT('--',RTRIM('   hello   '),'--')AS 'RTRIM',
		CONCAT('--',TRIM('   hello   '),'--')AS 'TRIM',
		CONCAT('--',TRIM(LEADING 'x' FROM 'xxxhelloxxx'),'--') AS 'LEADING',
		CONCAT('--',TRIM(TRAILING 'x' FROM 'xxxhelloxxx'),'--') AS 'TRALING',
		CONCAT('--',TRIM(BOTH 'x' FROM '   hello   '),'--') AS 'BOTH';
		
SELECT REPLACE('Hello\n','\n','<br>');
-- 개행을 <br>로 바꾸겠다.
				