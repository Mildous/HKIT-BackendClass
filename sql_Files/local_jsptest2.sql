create table memberBasic (
no number not null,
id varchar2(50) not null,
passwd varchar2(50) not null,
name varchar2(50) not null,
phone varchar2(50) not null,
email varchar2(50) not null,
jumin varchar2(50) not null,
juso1 varchar2(50) not null,
juso2 varchar2(50) not null,
juso3 varchar2(50) not null,
juso4 varchar2(50) not null,
regiDate date not null,
primary key (id),
unique (no)
);

create sequence seq_memberBasic start with 1 increment by 1 nomaxvalue nocache;

select * from memberBasic;

-- ----------------------------------------------------------

create table book (
no number not null,
subject varchar2(50) not null,
author varchar2(50) not null,
created date not null,
profile varchar2(50) not null, -- 분류
regiDate date not null,
primary key(no)
);

create sequence seq_book start with 1 increment by 1 nomaxvalue nocache;

select * from book;

-- ----------------------------------------------------------

drop table bookInfo cascade constraints;
drop table bookAuthor cascade constraints;
drop table bookProfile cascade constraints;

drop sequence seq_bookProfile;

-- ----------------------------------------------------------

create table bookInfo (
infoNo number not null,
subject varchar2(50) not null,
created date not null,
authorNo number not null,
profileNo number not null,
regiDate date not null,
primary key(infoNo),
foreign key(authorNo) references bookAuthor(authorNo),
foreign key(profileNo) references bookProfile(profileNo)
);
create sequence seq_bookInfo start with 1 increment by 1 nomaxvalue nocache;


create table bookAuthor (
authorNo number not null,
author varchar2(50) not null,
regiDate date not null,
primary key (authorNo)
);
create sequence seq_bookAuthor start with 1 increment by 1 nomaxvalue nocache;


create table bookProfile (
profileNo number not null,
profile varchar2(50) not null,
regiDate date not null,
primary key (profileNo)
);
create sequence seq_bookProfile start with 1 increment by 1 nomaxvalue nocache;

select * from book;
select * from bookInfo;
select * from bookAuthor;
select * from bookProfile;

insert into bookAuthor values (seq_bookAuthor.nextval, '똘콩', sysdate);
insert into bookAuthor values (seq_bookAuthor.nextval, '진이', sysdate);
insert into bookAuthor values (seq_bookAuthor.nextval, '길동이', sysdate);

insert into bookProfile values (seq_bookProfile.nextval, 'PG', sysdate);
insert into bookProfile values (seq_bookProfile.nextval, '프로그램', sysdate);
insert into bookProfile values (seq_bookProfile.nextval, '프로그래밍', sysdate);

commit;

insert into bookInfo values (seq_bookInfo.nextval, '자바는 왜 배울까?', '2022-08-01', 3, 3, sysdate);
insert into bookInfo values (seq_bookInfo.nextval, '해진이와 함께하는 JSP', '2022-08-05', 2, 3, sysdate);
insert into bookInfo values (seq_bookInfo.nextval, '파이썬', '2022-01-01', 1, 2, sysdate);
insert into bookInfo values (seq_bookInfo.nextval, 'PHP 웹 프로그래밍', '2022-02-02', 1, 1, sysdate);

-- -----------------------------------------------------------------------

select * from bookAuthor where authorNo = 3;

select i.*, (
    select author from bookAuthor a where a.authorNo = i.authorNo
) author from bookInfo i;

select i.infoNo, i.subject, i.created, (
    select author from bookAuthor a where a.authorNo = i.authorNo
) author, (
    select profile from bookProfile p where p.profileNo = i.profileNo
) profile, i.regiDate from bookInfo i;

