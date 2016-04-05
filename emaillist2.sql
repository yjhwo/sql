desc emaillist;

-- emaillist getList
SELECT no,first_name,last_name,email FROM emaillist;

-- emaillist insert
INSERT INTO emaillist
	VALUES(null,'홍','길동','gildong@gmail.com');
	
-- commit을 날려야 db로 들어간다.
commit;
