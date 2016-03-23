-- 03.21수업 - JOIN(2)- Sub Query

-- ppt.135 예제
SELECT b.dept_no FROM employees a, dept_emp b
 WHERE a.emp_no = b.emp_no
 AND a.first_name = 'Fai'
 AND a.last_name = 'Bale';
 
-- 2
SELECT a.emp_no, b.dept_no FROM employees a, dept_emp b
 WHERE a.emp_no = b.emp_no
 AND b.dept_no = 'd004';
 
-- 3
SELECT a.emp_no FROM employees a, dept_emp b
 WHERE a.emp_no = b.emp_no
 AND b.dept_no = (SELECT b.dept_no FROM employees a, dept_emp b
 					WHERE a.emp_no = b.emp_no
 					AND a.last_name = 'Bale');

-- error1; 서브 쿼리 결과가 멀티 로우인경우(in = ANY = ALL)
SELECT a.emp_no FROM employees a, dept_emp b
	WHERE a.emp_no = b.emp_no
	AND b.dept_no in (SELECT b.dept_no FROM employees a, dept_emp b
						WHERE a.emp_no = b.emp_no
						AND a.last_name = 'Bale');

-- p.138 문제1
SELECT AVG(salary) FROM employees a, salaries b
	WHERE a.emp_no = b.emp_no 
	AND to_date = '9999-1-1';

SELECT CONCAT(a.first_name,' ',a.last_name) as name, b.salary
	FROM employees a, salaries b
	WHERE a.emp_no = b.emp_no 
	AND to_date = '9999-1-1'
	AND b.salary < (SELECT AVG(salary) FROM employees a, salaries b
					WHERE a.emp_no = b.emp_no 
					AND to_date = '9999-1-1');

-- p.139 예제
SELECT * FROM employees a, salaries b
	WHERE a.emp_no = b.emp_no
	AND b.to_date = '9999-1-1'
	AND b.salary < 50000;

select emp_no from salaries
	where salary < 50000 and to_date = '9999-1-1';
	
	

