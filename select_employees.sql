-- 기본 select 연습

SELECT * FROM departments;

SELECT first_name, gender, hire_date FROM employees;
SELECT first_name AS 이름, gender AS 성별, hire_date AS '입사한 날' FROM employees;

SELECT CONCAT(first_name,' ', last_name) AS '이름', gender AS 성별, hire_date AS '입사한 날' FROM employees;

SELECT DISTINCT title FROM titles;
SELECT DISTINCT title, emp_no FROM titles; -- 이렇게 사용하면 2개의 데이터를 합쳐서 중복행을 제거하기 때문에 결과가 다 나오는 것.

SELECT CONCAT(first_name,' ', last_name) AS '이름', gender AS 성별, hire_date AS '입사한 날' FROM employees ORDER BY hire_date;
SELECT CONCAT(first_name,' ', last_name) AS '이름', gender AS 성별, hire_date AS '입사한 날' FROM employees ORDER BY hire_date DESC;
SELECT CONCAT(first_name,' ', last_name) AS '이름', gender AS 성별, hire_date AS '입사한 날' FROM employees ORDER BY hire_date ASC, CONCAT(first_name,' ',last_name) ASC;

SELECT CONCAT(first_name,' ', last_name) AS '이름', gender AS 성별, hire_date AS '입사한 날' 
	FROM employees
	WHERE hire_date < '1991-1-1' 
	ORDER BY hire_date ASC, CONCAT(first_name,' ',last_name) ASC;

SELECT CONCAT(first_name,' ', last_name) AS '이름', gender AS 성별, hire_date AS '입사한 날' 
		FROM employees
	WHERE hire_date < '1989-1-1'
		AND gender = 'f' 
	ORDER BY hire_date ASC, CONCAT(first_name,' ',last_name) ASC;

SELECT CONCAT(first_name,' ', last_name) AS '이름', gender AS 성별, hire_date AS '입사한 날' 
		FROM employees
	WHERE hire_date BETWEEN '2000-1-1' AND '2016-12-31'
		AND gender = 'f' 
	ORDER BY hire_date ASC, CONCAT(first_name,' ',last_name) ASC;

SELECT CONCAT(first_name,' ', last_name) AS '이름', gender AS 성별, hire_date AS '입사한 날' 
		FROM employees
	WHERE ('2000-1-1' <= hire_date AND hire_date <= '2016-12-31')
		AND gender = 'f' 
	ORDER BY hire_date ASC, CONCAT(first_name,' ',last_name) ASC;
	
SELECT emp_no, dept_no FROM dept_emp WHERE dept_no in('d005','d009');

-- LIKE를 쓰면 문장이 간단해진다. 1991년도에 시작하는 모든 사람
SELECT CONCAT(first_name,' ', last_name) AS '이름', gender AS 성별, hire_date AS '입사한 날' 
	FROM employees
	WHERE hire_date LIKE '1991%' 
	ORDER BY hire_date ASC;

SELECT count(*) FROM employees;

-- 기본 문제!!

-- 1번
select CONCAT(first_name,' ',last_name) from employees where emp_no=10944;

-- 2번
select CONCAT(first_name,' ',last_name) AS '이름', gender AS 성별, hire_date AS 입사일 
	from employees ORDER BY hire_date;

-- 3번
select count(*) from employees where gender='f';
select count(*) from employees where gender='m';
select count(*) from employees group by gender;
-- group by로도 해보기

-- 4번
select count(*) from salaries where to_date ='9999-1-1';
 
-- 5번
select count(*) from departments;

-- 6번
select count(*) from dept_manager where to_date LIKE '9999%';
select emp_no, count(*) from dept_manager where to_date = '9999-1-1';
-- 맨 첫번째 줄 emp_no가 리턴

-- 7번
select * from departments ORDER BY length(dept_name) DESC;

-- 8번
select count(*) from salaries where to_date='9999-1-1' AND salary > 120000;

-- 9번
select DISTINCT title from titles ORDER BY length(title) DESC;

-- 10번
select count(*) from titles where title = 'Engineer' AND to_date='9999-1-1';

-- 11번
select * from titles where emp_no=13250 ORDER BY to_date;

-- 
select * from salaries where emp_no=10001 and to_date = '9999-1-1';
-- 사번이 10001번인 사원의 현재 연봉은 얼마인가?

select count(*) from salaries where to_date='9999-1-1' AND salary > 120000;
-- 현재 급여가 120,000 이상 받는 사원은 몇 명인가?





