-- 
SELECT a.emp_no FROM employees a, dept_emp b
 WHERE a.emp_no = b.emp_no
 AND b.dept_no = (SELECT b.dept_no FROM employees a, dept_emp b
 					WHERE a.emp_no = b.emp_no
 					AND a.first_name = 'Fai'
 					AND a.last_name = 'Bale');

-- 서브쿼리 문제

-- 5번. 현재, 평균연봉이 가장 높은 부서의 사원들의 사번, 이름, 직책, 연봉을 조회하고 연봉 순으로 출력하세요.

-- 1) 부서의 평균 연봉
SELECT b.dept_no, AVG(c.salary) AS avg_salary
	FROM employees a, dept_emp b, salaries c
	WHERE (a.emp_no = b.emp_no AND a.emp_no = c.emp_no)
	AND b.to_date = '9999-1-1' AND c.to_date = '9999-1-1'
	GROUP BY b.dept_no
	ORDER BY AVG(c.salary) DESC;

-- 2) 평균 연봉이 가장 높은 부서
SELECT dept_no, MAX(avg_salary)
	FROM (SELECT b.dept_no, AVG(c.salary) AS avg_salary
			FROM employees a, dept_emp b, salaries c
			WHERE (a.emp_no = b.emp_no AND a.emp_no = c.emp_no)
			AND b.to_date = '9999-1-1' AND c.to_date = '9999-1-1'
			GROUP BY b.dept_no
			ORDER BY AVG(c.salary) DESC) k;

-- 3) 사번, 이름, 직책, 연봉 조회
SELECT e.emp_no, CONCAT(e.first_name,' ',e.last_name) AS name, t.title, s.salary, b.dept_no
	FROM employees e, titles t, salaries s, dept_emp b,
	(SELECT dept_no, MAX(avg_salary)
	FROM (SELECT b.dept_no, AVG(c.salary) AS avg_salary
			FROM employees a, dept_emp b, salaries c
			WHERE (a.emp_no = b.emp_no AND a.emp_no = c.emp_no)
			AND b.to_date = '9999-1-1' AND c.to_date = '9999-1-1'
			GROUP BY b.dept_no
			ORDER BY AVG(c.salary) DESC) k) d
	WHERE (e.emp_no = t.emp_no AND e.emp_no = s.emp_no AND e.emp_no = b.emp_no)
	AND b.dept_no = d.dept_no
	AND t.to_date = '9999-1-1' AND s.to_date = '9999-1-1' AND b.to_date = '9999-1-1'; 

-- 6번 평균 연봉이 가장 높은 부서는?
-- 1) 평균 연봉
SELECT b.dept_no, AVG(c.salary)
	FROM employees a, dept_emp b, salaries c
	WHERE (a.emp_no = b.emp_no AND a.emp_no = c.emp_no)
	AND b.to_date = '9999-1-1' AND c.to_date ='9999-1-1'
	GROUP BY b.dept_no ORDER BY MAX(c.salary) DESC;
-- 2) 평균연봉 가장 높은 부서
SELECT d.dept_name, AVG(c.salary)
	FROM employees a, dept_emp b, salaries c, departments d,
		(SELECT dept_no, MAX(avg_salary)
		FROM (SELECT b.dept_no, AVG(c.salary) AS avg_salary
				FROM employees a, dept_emp b, salaries c
				WHERE (a.emp_no = b.emp_no AND a.emp_no = c.emp_no)
				AND b.to_date = '9999-1-1' AND c.to_date = '9999-1-1'
				GROUP BY b.dept_no
				ORDER BY AVG(c.salary) DESC) k) e
	WHERE (a.emp_no = b.emp_no AND a.emp_no = c.emp_no AND b.dept_no = d.dept_no)
	AND b.dept_no = e.dept_no
	AND b.to_date='9999-1-1' AND c.to_date='9999-1-1'
	GROUP BY d.dept_name;

-- 7번 평균 연봉이 가장 높은 직책?
-- 1) 평균 연봉
SELECT b.title, AVG(c.salary) AS avg_salary
	FROM employees a, titles b, salaries c
	WHERE (a.emp_no = b.emp_no AND a.emp_no = c.emp_no)
	AND b.to_date = '9999-1-1' AND c.to_date = '9999-1-1'
	GROUP BY b.title ORDER BY MAX(c.salary) DESC;
	
-- 2) 평균연봉 가장 높은 직책
SELECT d.title, AVG(c.salary)
	FROM employees a, salaries c, titles d,
		(SELECT title, MAX(avg_salary)
			FROM (SELECT b.title, AVG(c.salary) AS avg_salary
				FROM employees a, titles b, salaries c
				WHERE (a.emp_no = b.emp_no AND a.emp_no = c.emp_no)
				AND b.to_date = '9999-1-1' AND c.to_date = '9999-1-1'
				GROUP BY b.title ORDER BY MAX(c.salary) DESC) k) e
	WHERE (a.emp_no = c.emp_no AND a.emp_no = d.emp_no)
	AND c.to_date='9999-1-1' AND d.to_date = '9999-1-1'
	AND d.title = e.title
	GROUP BY d.title;
	
-- 8번 현재 자신의 매니저보다 높은 연봉을 받고 있는 직원은?
-- 1) 자신의 매니저 구하는 것
SELECT b.dept_no, CONCAT( first_name, ' ', last_name ) AS name, c.salary
           FROM employees a, dept_manager b, salaries c
          WHERE (a.emp_no = b.emp_no AND a.emp_no = c.emp_no)
            AND b.to_date = '9999-1-1'
            AND c.to_date = '9999-1-1';
-- 2) 매니저보다 높은 연봉 받는 직원
SELECT d.dept_name, CONCAT(first_name,' ',last_name) AS name, c.salary, m.name, m.salary
	FROM employees a, dept_emp b, salaries c, departments d,
	(SELECT b.dept_no, CONCAT( first_name, ' ', last_name ) AS name, c.salary
           FROM employees a, dept_manager b, salaries c
          WHERE (a.emp_no = b.emp_no AND a.emp_no = c.emp_no)
            AND b.to_date = '9999-1-1'
            AND c.to_date = '9999-1-1') m
	WHERE (a.emp_no = b.emp_no AND a.emp_no = c.emp_no)
	AND b.dept_no = d.dept_no
	AND b.to_date = '9999-1-1' AND c.to_date='9999-1-1'
	AND b.dept_no = m.dept_no
	AND c.salary > m.salary;