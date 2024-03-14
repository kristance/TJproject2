*main
CREATE TABLE "MAIN" (
	"IDX" NUMBER(*,0) NOT NULL ENABLE, 
	"SUBJECT" VARCHAR2(100 BYTE), 
	"CONTENT" CLOB, 
	"HIT" NUMBER(*,0) DEFAULT 0, 
	"GOOD" NUMBER(*,0) DEFAULT 0, 
	"WRITEDATE" TIMESTAMP (6) DEFAULT sysdate, 
	"GUP" NUMBER(*,0), 
	"CATEGORY" VARCHAR2(20 BYTE), 
	"ID" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "MAIN_PK" PRIMARY KEY ("IDX")
);

*maincomment
CREATE TABLE "MAINCOMMENT" (
	"IDX" NUMBER(*,0) NOT NULL ENABLE, 
	"NAME" VARCHAR2(20 BYTE), 
	"CONTENT" VARCHAR2(2000 BYTE), 
	"WRITEDATE" TIMESTAMP (6) DEFAULT sysdate, 
	"GUP" NUMBER(*,0), 
	 CONSTRAINT "MAINCOMMENT_PK" PRIMARY KEY ("IDX")
);

*register
CREATE TABLE "REGISTER" (
    "IDX" NUMBER(*,0) NOT NULL ENABLE, 
	"ID" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"PW" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"NAME" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"NICK" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"EMAIL" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "REGISTER_PK" PRIMARY KEY ("IDX")
);



*�ӽÿ� �ڵ�
DELETE FROM register;
DROP SEQUENCE register_idx_seq;
CREATE SEQUENCE register_idx_seq;

INSERT INTO register (idx, id, pw, name, nick, email) VALUES (register_idx_seq.nextval, 'hong', '1111', 'ȫ�浿', 'gildong', 'a@a.com');
INSERT INTO register (idx, id, pw, name, nick, email) VALUES (register_idx_seq.nextval, 'lim', '2222', '�Ӳ���', 'kkeokjeong', 'b@b.com');
INSERT INTO register (idx, id, pw, name, nick, email) VALUES (register_idx_seq.nextval, 'jang', '3333', '����', 'gilsan', 'c@c.com');
INSERT INTO register (idx, id, pw, name, nick, email) VALUES (register_idx_seq.nextval, 'ill', '4444', '������', 'jimae', 'd@d.com');

select * from register;


DELETE FROM main;
DROP SEQUENCE main_idx_seq;
CREATE SEQUENCE main_idx_seq;
commit;

INSERT INTO main (idx, subject, content, gup, category, id) VALUES (main_idx_seq.nextval, '1��', '1������ ���� ���� �����Դϴ�.', main_idx_seq.currval, '����', 'hong');
INSERT INTO main (idx, subject, content, gup, category, id) VALUES (main_idx_seq.nextval, '2��', '2������ ���� ���� �����Դϴ�.', main_idx_seq.currval, '������', 'lim');
INSERT INTO main (idx, subject, content, gup, category, id) VALUES (main_idx_seq.nextval, '3��', '3������ ���� ���� �����Դϴ�.', main_idx_seq.currval, '�̽��͸�', 'jang');
INSERT INTO main (idx, subject, content, gup, category, id) VALUES (main_idx_seq.nextval, '4��', '4������ ���� ���� �����Դϴ�.', main_idx_seq.currval, '����', 'ill');
INSERT INTO main (idx, subject, content, gup, category, id) VALUES (main_idx_seq.nextval, '5��', '5������ ���� ���� �����Դϴ�.', main_idx_seq.currval, '�ڹ̵�', 'kim');
INSERT INTO main (idx, subject, content, gup, category, id) VALUES (main_idx_seq.nextval, '6��', '6������ ���� ���� �����Դϴ�.', main_idx_seq.currval, '����', 'lee');
INSERT INTO main (idx, subject, content, gup, category, id) VALUES (main_idx_seq.nextval, '7��', '7������ ���� ���� �����Դϴ�.', main_idx_seq.currval, '��Ÿ��', 'bae');
INSERT INTO main (idx, subject, content, gup, category, id) VALUES (main_idx_seq.nextval, '8��', '8������ ���� ���� �����Դϴ�.', main_idx_seq.currval, '����', 'kang');
INSERT INTO main (idx, subject, content, gup, category, id) VALUES (main_idx_seq.nextval, '1234', '1������ ���� ���� �����Դϴ�.', main_idx_seq.currval, '������', 'hong');
INSERT INTO main (idx, subject, content, gup, category, id) VALUES (main_idx_seq.nextval, '5678', '2������ ���� ���� �����Դϴ�.', main_idx_seq.currval, '�̽��͸�', 'lim');
INSERT INTO main (idx, subject, content, gup, category, id) VALUES (main_idx_seq.nextval, '9012', '3������ ���� ���� �����Դϴ�.', main_idx_seq.currval, '�̽��͸�', 'jang');
INSERT INTO main (idx, subject, content, gup, category, id) VALUES (main_idx_seq.nextval, '2345', '4������ ���� ���� �����Դϴ�.', main_idx_seq.currval, '��Ÿ��', 'ill');
INSERT INTO main (idx, subject, content, gup, category, id) VALUES (main_idx_seq.nextval, '6789', '5������ ���� ���� �����Դϴ�.', main_idx_seq.currval, '�ڹ̵�', 'kim');
INSERT INTO main (idx, subject, content, gup, category, id) VALUES (main_idx_seq.nextval, '0123', '6������ ���� ���� �����Դϴ�.', main_idx_seq.currval, '����', 'lee');
INSERT INTO main (idx, subject, content, gup, category, id) VALUES (main_idx_seq.nextval, '1357', '7������ ���� ���� �����Դϴ�.', main_idx_seq.currval, '��Ÿ��', 'bae');
INSERT INTO main (idx, subject, content, gup, category, id) VALUES (main_idx_seq.nextval, '2468', '8������ ���� ���� �����Դϴ�.', main_idx_seq.currval, '����', 'kang');

DELETE FROM maincomment;
DROP SEQUENCE maincomment_idx_seq;
CREATE SEQUENCE maincomment_idx_seq;
commit;

INSERT INTO maincomment (idx, name, content, gup) VALUES (maincomment_idx_seq.nextval, 'hong', '�����մϴ�1', main_idx_seq.currval);
INSERT INTO maincomment (idx, name, content, gup) VALUES (maincomment_idx_seq.nextval, 'lim', '�����մϴ�2', main_idx_seq.currval);
INSERT INTO maincomment (idx, name, content, gup) VALUES (maincomment_idx_seq.nextval, 'jang', '�����մϴ�3', main_idx_seq.currval);
INSERT INTO maincomment (idx, name, content, gup) VALUES (maincomment_idx_seq.nextval, 'ill', '�����մϴ�4', main_idx_seq.currval);


select * from maincomment where gup = 1 order by idx asc;
select * from main;
select count(*) from main;
select * from main order by hit desc;
select * from maincomment;
select * from maincomment where idx = 6;
select * from maincomment order by idx desc;
commit;

