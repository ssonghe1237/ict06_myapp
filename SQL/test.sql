-------------------------------------------------
-- 아래부터 ict06_team1_midpj 계정에서 작업
-- mvc_user_tbl : mvc_address_tbl => 1 : 1
-- mvc_user_tbl : mvc_board_tbl => 1 : N

--1) mvc_user_tbl 생성
DROP TABLE mvc_user_tbl CASCADE CONSTRAINTS;
CREATE TABLE mvc_user_tbl(
	user_id 	NUMBER(2) PRIMARY KEY,
	user_name   VARCHAR2(30),
	reg_date    DATE
);

INSERT INTO mvc_user_tbl(user_id, user_name, reg_date)
 VALUES(1, 'john', sysdate);

INSERT INTO mvc_user_tbl(user_id, user_name, reg_date)
 VALUES(2, 'terry', sysdate);

COMMIT;

SELECT * FROM mvc_user_tbl;
--1	john	25/01/17
--2	terry	25/01/17

-- 2) mvc_address_tbl 생성
DROP TABLE mvc_address_tbl CASCADE CONSTRAINTS;
CREATE TABLE mvc_address_tbl(
	user_id 	 NUMBER(2),
	user_address VARCHAR2(50),
	CONSTRAINT mvc_address_tbl_user_id_fk FOREIGN KEY(user_id) REFERENCES mvc_user_tbl(user_id)
);

INSERT INTO mvc_address_tbl(user_id, user_address)
 VALUES(1, '서울시 금천구 가산동');

INSERT INTO mvc_address_tbl(user_id, user_address)
 VALUES(2, '서울시 강남구 대치동');

COMMIT;

SELECT * FROM mvc_address_tbl;
--1	서울시 금천구 가산동
--2	서울시 강남구 대치동

-- 3) mvc_board_tbl 생성
DROP TABLE mvc_board_tbl CASCADE CONSTRAINTS;
CREATE TABLE mvc_board_tbl(
	board_num    NUMBER(3) PRIMARY KEY,
	board_title  VARCHAR2(50),
	board_content VARCHAR2(100),
	user_id 	 NUMBER(2),
	CONSTRAINT mvc_board_tbl_user_id_fk FOREIGN KEY(user_id) REFERENCES mvc_user_tbl(user_id)
);

INSERT INTO mvc_board_tbl(board_num, board_title, board_content, user_id)
 VALUES(100, '자바', '반복문', 1);

INSERT INTO mvc_board_tbl(board_num, board_title, board_content, user_id)
 VALUES(101, 'JSP', 'mvc 기본', 1);
 
INSERT INTO mvc_board_tbl(board_num, board_title, board_content, user_id)
 VALUES(102, '스프링', 'mybatis 기본', 1);
 
INSERT INTO mvc_board_tbl(board_num, board_title, board_content, user_id)
 VALUES(103, 'JSP 응용', 'mvc 활용', 2);
 
INSERT INTO mvc_board_tbl(board_num, board_title, board_content, user_id)
 VALUES(104, '스프링', 'mybatis 활용', 2);

INSERT INTO mvc_board_tbl(board_num, board_title, board_content, user_id)
 VALUES(105, '플젝', '성취감', 2);
 
COMMIT;

SELECT * FROM mvc_board_tbl;


--100	자바	반복문	1
--101	JSP	mvc 기본	1
--102	스프링	mybatis 기본	1
--103	JSP 응용	mvc 활용	2
--104	스프링	mybatis 활용	2
--105	플젝	성취감	2
