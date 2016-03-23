-- 서브쿼리 문제

-- 1번
select count(*) from employees a, salaries b
	where a.emp_no = b.emp_no
	and b.to_date = '9999-1-1'
	and b.salary > (select AVG(salary) from employees a, salaries b
					where a.emp_no = b.emp_no
					and to_date = '9999-1-1');

-- 2번
select b.dept_no, max(c.salary) as max_salary
 	from employees a, dept_emp b , salaries c
	where a.emp_no = b.emp_no
	and a.emp_no = c.emp_no
	and b.to_date = '9999-1-1'
	and c.to_date = '9999-1-1'
 	group by b.dept_no;

-- 값 안 나옴(in은 성능이 안좋다)
select * from employees a, dept_emp b, salaries c
	where a.emp_no = b.emp_no
	and a.emp_no = c.emp_no
	and b.to_date = '9999-1-1'
	and c.to_date = '9999-1-1'
	and (b.dept_no,c.salary) in (select b.dept_no, max(c.salary) 
 									from employees a, dept_emp b , salaries c
									where a.emp_no = b.emp_no
									and a.emp_no = c.emp_no
									and b.to_date = '9999-1-1'
									and c.to_date = '9999-1-1'
 									group by b.dept_no); 
-- 값 나옴									
select a.emp_no, b.dept_no, d.max_salary from employees a, dept_emp b,
	(select b.dept_no, max(c.salary) as max_salary
	from employees a, dept_emp b, salaries c
	where a.emp_no = b.emp_no
	and a.emp_no = c.emp_no
	and b.to_date = '9999-1-1'
	and c.to_date = '9999-1-1'
	group by b.dept_no) d
	where a.emp_no = b.emp_no
	and b.dept_no = d.dept_no
	and b.to_date = '9999-1-1';
	
-- 3번
select AVG(salary) from employees a, salaries b, dept_emp c
					where (a.emp_no = b.emp_no and a.emp_no = c.emp_no)
					and b.to_date = '9999-1-1' and c.to_date = '9999-1-1'
					group by c.emp_no;
					
select a.emp_no, CONCAT(a.first_name,' ',a.last_name) as name, b.salary
	from employees a, salaries b
	where a.emp_no = b.emp_no and b.to_date = '9999-1-1'
	and b.salary > any(select AVG(b.salary) from employees a, salaries b, dept_emp c
					where (a.emp_no = b.emp_no and a.emp_no = c.emp_no)
					and b.to_date = '9999-1-1' and c.to_date = '9999-1-1'
					group by c.dept_no);
					
-- 4번
select a.emp_no, CONCAT(a.first_name,' ',a.last_name) as name, manager_name, b.dept_name
	from employees a, departments b,dept_emp d,
		(select a.emp_no, CONCAT(a.first_name,' ',a.last_name) as manager_name, c.dept_no
		from employees a, dept_manager c
		where a.emp_no = c.emp_no
		and c.to_date = '9999-1-1') c
	where a.emp_no = d.emp_no and d.dept_no = c.dept_no and b.dept_no = d.dept_no;
	

select * from dept_emp;
select * from employees;
select * from dept_manager;

-- 5번
select AVG(salary)
	from employees a, dept_emp b, departments c, salaries d
	where (a.emp_no = d.emp_no and a.emp_no = b.emp_no and b.dept_no = c.dept_no)
	group by b.dept_no; 
	