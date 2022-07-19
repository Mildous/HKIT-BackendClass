select * from tab;

create table member (
memberNo	number          not null,
memberId	varchar2(50)    not null,
memberPw	varchar2(50)    not null,
memberName	varchar2(50)    not null,
memberJumin	varchar2(50)    not null,
memberPhone	varchar2(50)    not null,
memberEmail	varchar2(50)    not null,
memberAddr	varchar2(50)    not null,
regiDate	date            not null,
unique (memberNo),
primary key (memberId),
unique (memberJumin)
);


create sequence seq_member start with 1 increment by 1 nomaxvalue nocache;


insert into member values(seq_member.nextval, 'hong', '1234', '홍길동', '1111112222222', '01012345678', 'hong@gmail.com', '대구', sysdate);

insert into member values(seq_member.nextval, 'lee', '1234', '이성순', '2222223333333', '01098765432', 'lee@gmail.com', '서울', sysdate);

insert into member values(seq_member.nextval, 'jang', '1234', '장천용', '3333334444444', '01099887766', 'jang@gmail.com', '경기', sysdate);
commit;


select seq_member.currval from dual;
select seq_member.nextval from dual;

TRUNCATE table member; --자르기

select * from member;

update member set memberId = 'a', memberName = 'a' where memberNo = '7';

delete from member where memberNo = '8';
commit;

------------------------------------------------------

create table sungjuk (
no number not null,
name varchar2(50) not null,
kor number not null,
eng number not null,
math number not null,
tot number not null,
avg number not null,
grade varchar2(50) not null,
regiDate date not null,
primary key (no)
);

create sequence seq_sungjuk start with 1 increment by 1 nomaxvalue nocache;

select * from sungjuk;
commit;

update sungjuk set kor='60', eng='60', math='60' where no = '1';
update sungjuk set name = '장천용' where no = '3';

-------------------------------------------------------

create table product (
productCode number not null,
productName varchar2(50) not null,
productPrice number not null,
productContent clob not null,
vendor varchar2(50) not null,
regiDate date not null,
primary key (productCode)
);

commit;

create sequence seq_product start with 1 increment by 1 nomaxvalue nocache;

select * from product;

select count(*) from product;