desc guestbook;

-- insert(add.jsp)
INSERT INTO guestbook
	VALUES(null,'고길동',now(),'안녕',password('1234'));
	
-- select(index.jsp에서 dao만들 때 사용)
SELECT no,name,DATE_FORMAT(reg_date,'%Y-%m-%d %h:%i:%s'),message from guestbook
	ORDER BY reg_date desc;

-- delete(delete.jsp)
DELETE FROM guestbook WHERE no=1 AND passwd = password('1234');

-- select
SELECT * FROM guestbook;


-- BOARD
desc board;

SELECT * FROM board;

SELECT no,title,content,DATE_FORMAT(reg_date,'%Y-%m-%d %h:%i:%s'),
		viewCount, group_no,order_no,depth,user_no from board
		ORDER BY reg_date desc;

SELECT b.no, b.title, u.no as user_no, u.name, b.viewCount, DATE_FORMAT(b.reg_date,'%Y-%m-%d %h:%i:%s') 
			from board b, user u where b.user_no = u.no 
			ORDER BY b.group_no DESC, b.order_no ASC;
			
SELECT name FROM user
	WHERE no = 1;
		
insert into board
	values(null,'hello','hello',now(),0,
	 (select ifnull(max(group_no),0)+1 from board as b),
	1,0,1);
	

