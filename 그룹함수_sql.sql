SELECT AVG(salary), SUM(salary)
	FROM salaries
	WHERE emp_no = 10060; 

SELECT emp_no,salary,from_date,to_date
	FROM salaries
	WHERE emp_no = 10060;
	
-- 이렇게 쓰면 XXX 첫번째 날짜만 보여 주는 것
SELECT from_date,MAX(salary), MIN(salary)
	FROM salaries
	WHERE emp_no = 10060; 

-- 이렇게 써야 함. group by사용
SELECT emp_no, AVG(salary)
	FROM salaries
	GROUP BY emp_no HAVING AVG(salary) <50000;

-- 117쪽, 예제 3. 사원 별 몇 번의 직책 변경이 있었는지 조회
SELECT * FROM titles order by emp_no;

SELECT count(*) from titles group by emp_no;
SELECT emp_no,count(*) from titles group by emp_no;

SELECT emp_no,count(*) from titles group by emp_no HAVING count(*)>2;

