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

truncate table bookInfo;

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


-- ----------------------------------------------------------------------

select bi.infoNo, bi.subject, bi.created, (
    select author from bookAuthor ba where ba.authorNo = bi.authorNo
) author, (
    select profile from bookProfile bp where bp.profileNo = bi.profileNo
) profile, bi.regiDate from bookInfo bi;


select * from bookInfo;

-- -----------------------------------------------------------------------
-- 학사관리

-- haksaMember
학번 hakbun
이름 name
연락처 phone
부모연락처 parentPhone
주소 addr1 addr2 addr3 addr4
등록일 regiDate

create table haksaMember (
hakbun number not null,
name varchar2(50) not null,
phone varchar2(50) not null,
parentPhone varchar2(50) not null,
addr1 varchar2(50) not null,
addr2 varchar2(50) not null,
addr3 varchar2(50) not null,
addr4 varchar2(50) not null,
regiDate date default sysdate not null,
primary key(hakbun)
);
create sequence seq_haksaMember start with 1 increment by 1 nomaxvalue nocache;

-- haksaSihum
시험번호 sihumNo
시험종류 sihumName
시험일 sihumDate
등록일 regiDate

create table haksasihum (
sihumNo number not null,
sihumName varchar2(50) not null,
sihumDate date not null,
regiDate date default sysdate not null,
primary key (sihumNo)
);
create sequence seq_haksaSihum start with 1 increment by 1 nomaxvalue nocache;

-- haksaSungjuk
성적번호 sungjukNo
국어 kor
영어 eng
수학 mat
과학 sci
역사 his
총점 tot
평균 avg
등급 grade
학번 hakbun
시험번호 sihumNo
등록일 regiDate

create table haksaSungjuk (
sungjukNo number not null,
kor number not null,
eng number not null,
mat number not null,
sci number not null,
his number not null,
tot number not null,
avg number not null,
grade varchar2(50) not null,
hakbun number not null,
sihumNo number not null,
regiDate date default sysdate not null,
primary key (sungjukNo),
foreign key(hakbun) references haksaMember(hakbun),
foreign key(sihumNo) references haksaSihum(sihumNo)
);

create sequence seq_haksaSungjuk start with 1 increment by 1 nomaxvalue nocache;

select * from haksaSungjuk;
select * from haksaMember;
select * from haksaSihum;

select sungjuk.sungjukNo, (
    select name from haksaMember m where m.hakbun = sungjuk.hakbun
    ) name, (
    select sihumName from haksaSihum sihum where sihum.sihumNo = sungjuk.sihumNo
    ) sihumName, sungjuk.tot, sungjuk.avg, sungjuk.grade, sungjuk.regiDate
from haksaSungjuk sungjuk;

select sungjuk.*, (
select name from haksaMember m where m.hakbun = sungjuk.hakbun
) name, (
select sihumName from haksaSihum sihum where sihum.sihumNo = sungjuk.sihumNo
) sihumName
from haksaSungjuk sungjuk where sungjukNo = '';

-- -----------------------------------------------------
select sungjuk.sungjukNo,
(select name from haksaMember m where m.hakbun = sungjuk.hakbun) name,
(select sihumName from haksaSihum sihum where sihum.sihumNo = sungjuk.sihumNo) sihumName,
sungjuk.tot, sungjuk.avg, sungjuk.grade, sungjuk.regiDate
from haksaSungjuk sungjuk, haksaMember m
where m.hakbun = sungjuk.hakbun and m.name like '%홍%';

select count(*) from haksaSungjuk sungjuk
 , haksaMember m where m.hakbun = sungjuk.hakbun and m.name
 like '%홍%';
 
 
select Tb.sungjukNo,
(select name from haksaMember m where m.hakbun = sungjuk.hakbun) name,
(select sihumName from haksaSihum sihum where sihum.sihumNo = sungjuk.sihumNo) sihumName,
Tb.tot, Tb.avg, Tb.grade, Tb.regiDate
from (select Tb.*, rownum rNum from (
        select * from haksaSungjuk sungjuk, haksaMember m where m.hakbun = sungjuk.hakbun and m.name like '%홍%'
        order by sungjukNo desc) Tb
    ) where rNum between 1 and 10;


select i.infoNo, i.subject, i.created, i.regiDate, (
        select authorName from bookAuthor a where a.authorNo = i.authorNo) author, (
        select profileName from bookProfile p where p.profileNo = i.profileNo) profile
from bookInfo i, (
    select Tb.*, rownum rNum from (
        select * from bookInfo i where subject like '%세%' order by infoNo desc 
        ) Tb 
    ) where rNum between 1 and 10;

