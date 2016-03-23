select * from author;
select * from book;

select * from book a, author b
	where a.author_no = b.no
	order by a.no desc;
	
	
select a.no, a.title, IF(a.state='rent','대여중','재고있음'), b.name
	 from book a, author b
	where a.author_no = b.no
	order by a.no desc;
	
-- ticketing

select * from movie;
select * from customer;