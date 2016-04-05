desc guestbook;

-- insert(add.jsp)
INSERT INTO guestbook
	VALUES(null,'고길동',now(),'안녕',password('1234'));
	
-- select(index.jsp에서 dao만들 때 사용)
SELECT no,name,DATE_FORMAT(reg_date,'%Y-%m-%d %h:%i:%s'),message from guestbook;

-- delete(delete.jsp)
DELETE FROM guestbook WHERE no=1 AND passwd = password('1234');

-- select
SELECT * FROM guestbook;