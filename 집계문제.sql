-- 집계 SQL 과제

-- 1번
select salary from salaries;
SELECT MAX(salary) AS '최고임금', MIN(salary) AS '최저임금',MAX(salary)-MIN(salary) AS '최고임금-최저임금'
	FROM salaries;
	
-- 2번	
select DATE_FORMAT(MAX(hire_date),'%Y년 %m월 %d일') from employees;

-- 3번
select emp_no,from_date from titles 
	having MAX(to_date - from_date) ;
-- 3번 선생님 min사용
select DATE_FORMAT(min(hire_date), '%Y-%m-%d') from employees;

select * from salaries; 
-- 4번
select AVG(salary) from salaries where to_date LIKE '9999%';

-- 5번
select MAX(salary) AS '최고연봉', MIN(salary) AS '최저연봉' from salaries;

-- 6번
select 2016-DATE_FORMAT(MAX(birth_date),'%Y'),
		2016- DATE_FORMAT(MIN(birth_date),'%Y') from employees;

-- Q.(group by)근무 기간 동안 자신이 받았던 최고 연봉과 최저 연봉의 차이가 50000인 사원을 출력하세요.
-- emp_no 최고연봉 최저연봉 연봉차이
select emp_no, max(salary), min(salary), max(salary) - min(salary) from salaries group by emp_no having(max(salary) - min(salary)) = 50000;

select * from salaries;
select emp_no from salaries;
