CREATE TABLE easyuser (
    email     VARCHAR2(30) NOT NULL,
    easyuser_password  NUMBER NOT NULL,
    user_name VARCHAR2(50) NOT NULL,
    nick_name VARCHAR2(50) NOT NULL UNIQUE,
    phone_num VARCHAR2(11) NOT NULL,
    birth     NUMBER,
    sex       VARCHAR2(1),
    easyuser_type NUMBER(1) NOT NULL,
    easyuser_num  NUMBER NOT NULL,
    PRIMARY KEY(email)
);

-- primary key 확인
SELECT a.owner 계정, a.table_name 테이블명, a.constraint_type 제약조건종류, b.column_name 컬럼명
from all_constraints a, all_cons_columns b
where a.constraint_name = b.constraint_name
and a.table_name = UPPER('easyuser')
and a.constraint_type = 'P';


CREATE TABLE easyboard (
  easyboard_num NUMBER PRIMARY KEY,
  email VARCHAR2(30) NOT NULL,
  easyboard_title VARCHAR2(100),
  easyboard_content clob,
  write_date TIMESTAMP NOT NULL,
  easyboard_count NUMBER NOT NULL,
  FOREIGN KEY (email) REFERENCES easyuser(email)
);



CREATE TABLE comments (
  comm_num NUMBER PRIMARY KEY,
  easyboard_num NUMBER NOT NULL,
  email VARCHAR2(30) NOT NULL,
  comm_content clob NOT NULL,
  comm_date TIMESTAMP NOT NULL,
  FOREIGN KEY (easyboard_num) REFERENCES easyboard(easyboard_num),
  FOREIGN KEY (email) REFERENCES easyuser(email)
);



CREATE TABLE board_file (
	file_num	number	NOT NULL primary key,
	easyboard_num	number	NOT NULL,
	email	varchar2(30)	NOT NULL,
	file_name	varchar2(100)	NOT NULL,
	route_name	varchar2(100)	NOT NULL,
	save_name	varchar2(100)	NULL,
    FOREIGN KEY (easyboard_num) REFERENCES easyboard(easyboard_num),
    FOREIGN KEY (email) REFERENCES easyuser(email)
);


CREATE TABLE notice (
	notice_num	number	primary key,
	email	varchar2(30)	NOT NULL,
	notice_title	varchar2(100)	NOT NULL,
	notice_content	clob	NOT NULL,
	write_date	timestamp	NOT NULL,
	notice_count	number	NOT NULL,
    FOREIGN KEY (email) REFERENCES easyuser(email)
);


CREATE TABLE information (
  info_num NUMBER PRIMARY KEY,
  email VARCHAR2(30) NOT NULL,
  info_title VARCHAR2(100) NOT NULL,
  info_content CLOB NULL,
  write_date TIMESTAMP NOT NULL,
  info_count NUMBER NOT NULL,
  info_date DATE NOT NULL,
  info_address VARCHAR2(100) NOT NULL,
  entrance_fee NUMBER NULL,
  serviced_time VARCHAR2(100) NULL,
  closed_day VARCHAR2(100) NULL,
  pic_route VARCHAR2(200) NULL,
  FOREIGN KEY (email) REFERENCES easyuser(email)
);
