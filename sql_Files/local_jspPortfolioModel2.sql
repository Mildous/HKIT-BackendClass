create table member (
    no number not null,
    id varchar2(10) not null,
    passwd varchar2(250) not null,
    name varchar2(15) not null,
    jumin1 varchar2(6) not null,
    jumin2 varchar2(1) not null,
    phone1 varchar2(3) not null check (phone1 in ('010', '011', '016')),
    phone2 varchar2(4) not null,
    phone3 varchar2(4) not null,
    email1 varchar2(50) not null,
    email2 varchar2(50) not null,
    
    postcode varchar2(50) not null,
    address varchar2(50) not null,
    detailAddress varchar2(50) not null,
    extraAddress varchar2(50) not null,
    
    regiDate date default sysdate,
    primary key (id),
    unique (no)
);

create sequence seq_member start with 1 increment by 1 nomaxvalue nocache;

select * from member;


-- ==============================================

create table memo (
no number not null,
writer varchar2(50) not null,
content clob not null,
regiDate date default sysdate not null,
primary key (no)
);

create sequence seq_memo start with 1 increment by 1 nomaxvalue nocache;

select * from memo;

-- ==============================================

create table guestBook (
no number not null,
name varchar2(50) not null,
email varchar2(50) not null,
passwd varchar2(50) not null,
content clob not null,
regiDate date not null,
primary key (no)
);

create sequence seq_guestBook start with 1 increment by 1 nomaxvalue nocache;
drop sequence seq_guestBook;

select * from guestBook;

-- ==============================================

create table board (
no number not null,
num number not null,
tbl varchar2(50) not null,
writer varchar2(50) not null,
subject varchar2(50) not null,
content clob not null,
email varchar2(50) not null,
passwd varchar2(50) not null,
refNo number not null,
stepNo number not null,
levelNo number not null,
parentNo number not null,
hit number not null,
ip varchar2(50) not null,
memberNo number not null,
noticeNo number not null,
secretGubun varchar2(1) not null check (secretGubun in ('T', 'F')),
regiDate date not null,
attachInfo clob not null,
primary key(no)
);

create sequence seq_board start with 1 increment by 1 nomaxvalue nocache;
drop sequence seq_board;

select * from board;


-- ==============================================

create table testMember (
id varchar2(50) not null,
passwd varchar2(50) not null,
changeDate date default sysdate not null,
primary key(id)
);

insert into testMember
values ('hong', '1234', to_date('2020-01-01 13:00:00', 'YYYY-MM-DD HH24:MI:SS'));

insert into testMember
values ('kim', '1234', to_date('2020-07-01 13:00:00', 'YYYY-MM-DD HH24:MI:SS'));

commit;

select * from testMember;

select trunc(months_between(sysdate, changeDate)) from testMember; -- 개월수 차이 구하기(시험)
select round(months_between(sysdate, changeDate)) from testMember; -- 개월수 차이 반올림
