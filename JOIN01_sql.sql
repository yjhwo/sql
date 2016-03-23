-- 03.21수업 - JOIN(1)

-- EQUI JOIN
SELECT employees.emp_no, CONCAT(last_name,' ',first_name) AS '이름',titles.title FROM employees, titles
	WHERE employees.emp_no = titles.emp_no;

-- 현재 회사에 다니고 있는 사람의 직책을 표시하라.	
SELECT employees.emp_no, CONCAT(last_name,' ',first_name) AS '이름',titles.title FROM employees, titles
	WHERE employees.emp_no = titles.emp_no
	AND titles.to_date = '9999-1-1';

-- 테이블 이름에 alias사용
SELECT e.emp_no, CONCAT(e.last_name,' ',e.first_name) AS '이름',t.title 
	FROM employees e, titles t
	WHERE e.emp_no = t.emp_no
	AND t.to_date = '9999-1-1';	

-- ppt.127 예제.10
SELECT e.emp_no, CONCAT(e.last_name,' ',e.first_name) AS '이름',t.title 
	FROM employees e, titles t
	WHERE e.emp_no = t.emp_no
	AND t.to_date = '9999-1-1' AND e.gender = 'f' AND t.title = 'Engineer';
	
-- NATURAL JOIN
SELECT e.emp_no, CONCAT(e.last_name,' ',e.first_name) AS '이름',t.title 
	FROM employees e 
	NATURAL JOIN titles t 
	-- ON e.emp_no = t.emp_no 이렇게 안 써도 된다.
	WHERE t.to_date = '9999-1-1' AND e.gender = 'f' AND t.title = 'Engineer';
	
-- JOIN ~ USING
SELECT e.emp_no, CONCAT(e.last_name,' ',e.first_name) AS '이름',t.title 
	FROM employees e 
	JOIN titles t USING(emp_no)
	-- emp_no칼럼 한 개만 걸겠다.
	WHERE t.to_date = '9999-1-1' AND e.gender = 'f' AND t.title = 'Engineer';
	
-- JOIN ~ ON
SELECT e.emp_no, CONCAT(e.last_name,' ',e.first_name) AS '이름',t.title 
	FROM employees e 
	JOIN titles t on e.emp_no = t.emp_no
	WHERE t.to_date = '9999-1-1' AND e.gender = 'f' AND t.title = 'Engineer';

-- ppt.132 실습문제 1
SELECT a.emp_no, CONCAT(a.first_name,' ',a.last_name) AS 'name', c.dept_name
	FROM employees a, dept_emp b, departments c
	WHERE (a.emp_no = b.emp_no AND b.dept_no = c.dept_no)
	AND b.to_date = '9999-1-1';

-- ppt.132 실습문제 2
SELECT a.emp_no, CONCAT(first_name, ' ', last_name) AS name, b.salary
    FROM employees a, salaries b
   WHERE a.emp_no = b.emp_no AND to_date = '9999-1-1'
ORDER BY b.salary DESC;