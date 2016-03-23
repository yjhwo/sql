-- 서브쿼리 문제

-- 1번

SELECT count(*)
  FROM employees a, salaries b
 WHERE     a.emp_no = b.emp_no
       AND b.to_date = '9999-1-1'
       AND b.salary > (SELECT AVG(salary)
                         FROM employees a, salaries b
                        WHERE a.emp_no = b.emp_no AND to_date = '9999-1-1');

-- 2번

  SELECT b.dept_no, max(c.salary) AS max_salary
    FROM employees a, dept_emp b, salaries c
   WHERE     a.emp_no = b.emp_no
         AND a.emp_no = c.emp_no
         AND b.to_date = '9999-1-1'
         AND c.to_date = '9999-1-1'
GROUP BY b.dept_no;

-- 값 안 나옴(in은 성능이 안좋다)

SELECT *
  FROM employees a, dept_emp b, salaries c
 WHERE     a.emp_no = b.emp_no
       AND a.emp_no = c.emp_no
       AND b.to_date = '9999-1-1'
       AND c.to_date = '9999-1-1'
       AND (b.dept_no, c.salary) IN
              (  SELECT b.dept_no, max(c.salary)
                   FROM employees a, dept_emp b, salaries c
                  WHERE     a.emp_no = b.emp_no
                        AND a.emp_no = c.emp_no
                        AND b.to_date = '9999-1-1'
                        AND c.to_date = '9999-1-1'
               GROUP BY b.dept_no);

-- 값 나옴

SELECT a.emp_no, b.dept_no, d.max_salary
  FROM employees a,
       dept_emp b,
       (  SELECT b.dept_no, max(c.salary) AS max_salary
            FROM employees a, dept_emp b, salaries c
           WHERE     a.emp_no = b.emp_no
                 AND a.emp_no = c.emp_no
                 AND b.to_date = '9999-1-1'
                 AND c.to_date = '9999-1-1'
        GROUP BY b.dept_no) d
 WHERE     a.emp_no = b.emp_no
       AND b.dept_no = d.dept_no
       AND b.to_date = '9999-1-1';

-- 3번

  SELECT AVG(salary)
    FROM employees a, salaries b, dept_emp c
   WHERE     (a.emp_no = b.emp_no AND a.emp_no = c.emp_no)
         AND b.to_date = '9999-1-1'
         AND c.to_date = '9999-1-1'
GROUP BY c.emp_no;

SELECT a.emp_no, CONCAT(a.first_name, ' ', a.last_name) AS name, b.salary
  FROM employees a, salaries b
 WHERE     a.emp_no = b.emp_no
       AND b.to_date = '9999-1-1'
       AND b.salary >
              ANY (  SELECT AVG(b.salary)
                       FROM employees a, salaries b, dept_emp c
                      WHERE     (a.emp_no = b.emp_no AND a.emp_no = c.emp_no)
                            AND b.to_date = '9999-1-1'
                            AND c.to_date = '9999-1-1'
                   GROUP BY c.dept_no);

-- 4번

SELECT a.emp_no,
       CONCAT(a.first_name, ' ', a.last_name) AS name,
       manager_name,
       b.dept_name
  FROM employees a,
       departments b,
       dept_emp d,
       (SELECT a.emp_no,
               CONCAT(a.first_name, ' ', a.last_name) AS manager_name,
               c.dept_no
          FROM employees a, dept_manager c
         WHERE a.emp_no = c.emp_no AND c.to_date = '9999-1-1') c
 WHERE     a.emp_no = d.emp_no
       AND d.dept_no = c.dept_no
       AND b.dept_no = d.dept_no;


SELECT * FROM dept_emp;

SELECT * FROM employees;

SELECT * FROM dept_manager;

-- 5번

-- 평균연봉이 가장 높은 부서
SELECT de.dept_no,MAX(f.평균) From employees a, salaries b, dept_emp de,(
SELECT b.dept_no, AVG(salary)
    FROM employees a, dept_emp b, salaries d
   WHERE     (a.emp_no = d.emp_no AND a.emp_no = b.emp_no)
         AND b.to_date = '9999-1-1'
         AND d.to_date = '9999-1-1'
GROUP BY b.dept_no) f
WHERE(a.emp_no = de.emp_no) AND de.to_date = '9999-1-1');

--

SELECT a.emp_no,CONCAT(a.first_name, ' ', a.last_name) AS name,
         b.title,
         c.salary;





--
SELECT a.emp_no, CONCAT(first_name,' ',last_name) AS name,
   b.title, c.salary, d.dept_no
FROM employees a,titles b, salaries c, dept_emp d
WHERE a.emp_no=b.emp_no
AND a.emp_no = c.emp_no
AND a.emp_no = d.emp_no
AND b.to_date = '9999-1-1'
AND c.to_date = '9999-1-1'
AND d.dept_no = (SELECT dept_no 
					FROM (SELECT b.dept_no, AVG(salary) as salary
							FROM salaries a, departments b, dept_emp c
							WHERE a.emp_no = c.emp_no
							AND c.dept_no = b.dept_no
							AND c.to_date='9999-1-1'
							GROUP BY b.dept_no) a
 					WHERE salary = (SELECT MAX(salary)
										FROM (SELECT b.dept_no, AVG(salary) as salary
										FROM salaries a, departments b, dept_emp c
										WHERE a.emp_no = c.emp_no
										AND c.dept_no = b.dept_no
										AND c.to_date='9999-1-1'
										GROUP BY b.dept_no) a));
					

SELECT e.emp_no,CONCAT(e.first_name, ' ', e.last_name),t.title,s.salary
FROM employees e, dept_emp de,titles t,salaries s,
   (SELECT de.dept_no,MAX(f.평균)
   FROM employees e,dept_emp de,
      (SELECT de.dept_no,AVG(s.salary) AS 평균
      FROM employees e, salaries s,dept_emp de
      WHERE e.emp_no = s.emp_no AND e.emp_no = de.emp_no
      AND s.to_date = '9999-1-1'
      GROUP BY de.dept_no)f
   WHERE (e.emp_no = de.emp_no)
   AND de.to_date = '9999-1-1')new
WHERE e.emp_no = de.emp_no AND de.dept_no = new.dept_no 
AND e.emp_no = t.emp_no AND e.emp_no = s.emp_no
AND de.to_date = '9999-1-1'
AND t.to_date = '9999-1-1'
AND s.to_date = '9999-1-1'
order by s.salary DESC;