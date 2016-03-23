-- JOIN 문제

-- 1번
SELECT e.emp_no, CONCAT(last_name,' ',first_name) AS '이름',s.salary 
FROM employees e, salaries s
	WHERE e.emp_no = s.emp_no AND s.to_date = '9999-1-1'
	ORDER BY s.salary DESC;
	
-- 2번
SELECT e.emp_no, CONCAT(last_name,' ',first_name) AS '이름', t.title
	FROM employees e, titles t
	WHERE e.emp_no = t.emp_no AND t.to_date = '9999-1-1'
	ORDER BY e.last_name;

-- 3번
SELECT a.emp_no, CONCAT(last_name,' ',first_name) AS '이름', c.dept_name
	FROM employees a, dept_emp b, departments c
	WHERE (a.emp_no = b.emp_no AND b.dept_no = c.dept_no)
	AND b.to_date = '9999-1-1'
	ORDER BY a.last_name;

-- 4번
SELECT a.emp_no, CONCAT(last_name,' ',first_name) AS '이름', c.salary, d.title,e.dept_name
	FROM employees a, dept_emp b, salaries c, titles d, departments e
	WHERE (a.emp_no = b.emp_no AND a.emp_no = d.emp_no AND a.emp_no = c.emp_no AND b.dept_no = e.dept_no)
	AND b.to_date = '9999-1-1' AND c.to_date = '9999-1-1' AND d.to_date='9999-1-1'
	ORDER BY 이름 desc;

-- 5번
SELECT a.emp_no, CONCAT(last_name,' ',first_name) AS '이름'
	FROM employees a, titles b
	WHERE a.emp_no = b.emp_no
	AND b.to_date != '9999-1-1'
	ORDER BY 이름;
	
-- 6번 *
SELECT CONCAT(last_name,' ',first_name) AS '이름', b.dept_name, d.title 
	FROM employees a, departments b, dept_emp c, titles d
	WHERE (a.emp_no = c.emp_no AND a.emp_no = d.emp_no AND c.dept_no = b.dept_no)
	AND a.last_name LIKE 'S%';

-- 7번
SELECT a.emp_no, b.salary
	FROM employees a, salaries b, titles c
	WHERE (a.emp_no = b.emp_no AND a.emp_no = c.emp_no)
	AND c.title = 'Engineer' AND b.salary >= 40000
	ORDER BY b.salary DESC;

-- 8번
SELECT a.emp_no, b.title, c.salary
	FROM employees a, titles b, salaries c
	WHERE (a.emp_no = b.emp_no AND a.emp_no = c.emp_no)
	AND c.salary >= 50000 AND c.to_date = '9999-1-1' AND b.to_date = '9999-1-1'
	ORDER BY c.salary DESC;
	 
-- 9번
SELECT c.dept_no, AVG(salary) AS AVG_TITLE_SALARY
	FROM employees a, salaries s, dept_emp c
	WHERE (a.emp_no = s.emp_no AND a.emp_no = c.emp_no)
	AND s.to_date = '9999-1-1' AND c.to_date = '9999-1-1'
	group by c.dept_no ORDER BY AVG_TITLE_SALARY DESC;
	
-- 10번
SELECT c.title, AVG(salary) AS AVG_TITLE_SALARY
	FROM employees a, salaries b, titles c
	WHERE (a.emp_no = b.emp_no AND a.emp_no = c.emp_no)
	AND b.to_date = '9999-1-1' AND c.to_date = '9999-1-1'
	group by c.title ORDER BY AVG_TITLE_SALARY DESC;
	

	

