-- 03.22(2) - mysql 테이블 DDL
DROP table member;

CREATE TABLE member(
	no INTEGER UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, 
	email VARCHAR(200) NOT NULL default '',
	password VARCHAR(128) NOT NULL,
	name VARCHAR(20) NOT NULL
);
-- AUTO_INCREMENT; 자동 증가. primary key에서는 중요하다.
-- DB에게 맡긴다. 우리가 번호를 지정하는게 아니라 알아서 증가해가면서 늘어남. 사용하는게 안전함
-- null을 주면 자동으로 증가한다.
INSERT INTO member VALUES(null,'kickscar@gmail.com', password('hello'),'안대혁');
-- mysql에서 암호화 시켜주는 password함수. 

-- login
select * from member where email='kickscar@gmail.com' and password = password('hello');

-- 테이블 수정
ALTER TABLE member ADD COLUMN juminbunho CHAR(14) NOT NULL;

-- 칼럼 삭제
ALTER TABLE member DROP COLUMN juminbunho;

ALTER TABLE member ADD COLUMN join_date DATETIME NOT NULL;

-- 테이블 수정(change)
ALTER TABLE member change name name VARCHAR(100) NOT NULL;
-- 						이거를      | 이렇게 새로 만든다.

ALTER TABLE member rename user;

desc user;

-- 테이블 확인(describe)
desc member;



