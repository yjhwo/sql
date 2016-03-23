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
 					AND a.first_name = 'Fai'
 					AND a.last_name = 'Bale');

-- error1
SELECT a.emp_no FROM employees a, dept_emp b
	WHERE a.emp_no = b.emp_no
	AND b.dept_no in (SELECT b.dept_no FROM employees a, dept_emp b
						WHERE a.emp_no = b.emp_no
						AND a.first_name = 'Fai'
						AND a.last_name = 'Bale');