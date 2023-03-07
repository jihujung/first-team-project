drop table easyuser;
drop table easyboard;
drop sequence easyboard_num_seq;

-- 선생님 방식
CREATE TABLE easyuser (
    email     VARCHAR2(30) CONSTRAINT easyuser_email PRIMARY KEY,
    easyuser_pass  VARCHAR2(50) NOT NULL,
    easyuser_name VARCHAR2(50) NOT NULL,
    nick_name VARCHAR2(50) NOT NULL UNIQUE,
    phone_num VARCHAR2(11) NOT NULL,
    birth     date,
    sex       VARCHAR2(1) default 1,
    easyuser_type NUMBER(1) NOT NULL,
    easyuser_num  NUMBER NOT NULL
);

-- 선생님 시퀀스 생성 방식
CREATE SEQUENCE easyuser_email_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;


INSERT INTO easyuser 
VALUES ('young@aaaa.com', 'asdf1234', '홍길동', '홍', '01023456789', TO_DATE('20000307', 'YYYYMMDD'), 1, 1, 0);

CREATE TABLE easyboard (
  easyboard_num NUMBER CONSTRAINT easyboard_num PRIMARY KEY,
  email VARCHAR2(30) NOT NULL,
  easyboard_title VARCHAR2(100),
  easyboard_content clob,
  write_date TIMESTAMP NOT NULL,
  easyboard_count NUMBER NOT NULL,
  FOREIGN KEY (email) REFERENCES easyuser(email)
);


CREATE SEQUENCE easyboard_num_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

INSERT INTO easyboard 
VALUES(easyboard_num_seq.nextval, 'young@aaaa.com', '제목1', '내용 테스트.......', 
sysdate, 0 );

select * from easyuser;
select * from easyboard;

CREATE TABLE comments (
  comm_num NUMBER PRIMARY KEY,
  easyboard_num NUMBER NOT NULL,
  comm_content clob NOT NULL,
  comm_date TIMESTAMP NOT NULL,
  FOREIGN KEY (easyboard_num) REFERENCES easyboard(easyboard_num),
  FOREIGN KEY (email) REFERENCES easyuser(email)
);



CREATE TABLE board_file (
	file_num	number	NOT NULL primary key,
	easyboard_num	number	NOT NULL,
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
  info_title VARCHAR2(100) PRIMARY KEY,
  email VARCHAR2(30) NOT NULL,
  info_num NUMBER NOT NULL,
  info_theme  VARCHAR2(10) NOT NULL,
  info_content clob NULL,
  write_date TIMESTAMP NOT NULL,
  info_count NUMBER NOT NULL,
  info_date DATE NOT NULL,
  info_address VARCHAR2(100) NOT NULL,
  entrance_fee NUMBER NULL,
  serviced_time VARCHAR2(100) NULL,
  closed_day VARCHAR2(100) NULL,
  latitude number null,
  longitude number null,
  info_tel VARCHAR2(13) NULL,
  info_homepage VARCHAR2(100) NULL,
  FOREIGN KEY (email) REFERENCES easyuser(email)
);


CREATE TABLE picture (
  pic_name VARCHAR2(100) PRIMARY KEY,
  info_title  VARCHAR2(100),
   FOREIGN KEY (info_title) REFERENCES information(info_title)
);

