alter user hr identified by 1234 account unlock;

--=======================================================================

-- 사용자(스키마:schema) 계정 생성 : bookTest
create user bookTest identified by 1234
default tablespace users
temporary tablespace temp;


-- tablespace 생성
create tablespace jspStudyModel2
-- datafile 'C:/??/oradata/bookTest.dbf' size 50m
datafile '/Users/HKIT/COY/oradata/jspStudyModel2.dbf' size 50m
autoextend on
next 10m
maxsize unlimited;


-- 계정 생성
create user jspStudyModel2 identified by 1234
default tablespace jspStudyModel2;

-- 권한 부여 : connect, resource
grant connect, resource to bookTest;


-- 계정 삭제
drop user jspStudyModel2 cascade;

-- tablespace 삭제
drop tablespace bookTest including contents and datafiles cascade constraints;

--=======================================================================


create user mystudy identified by 1234

grant connect, resource to mystudy;

revoke connect, resource from mystudy;

-- ======================================================================

create table member_tbl_02 (
    custno number(6) not null,
    custname varchar2(20),
    phone varchar2(13),
    address varchar2(60),
    joindate date default sysdate,
    grade char(1),
    city char(2),
    primary key(custno)
);
truncate table member_tbl_02;
drop sequence seq_member_tbl_02;
create sequence seq_member_tbl_02 start with 100001 increment by 1 nomaxvalue;
select max(custno) + 1 seq from member_tbl_02;
select * from member_tbl_02;

insert into member_tbl_02 values (seq_member_tbl_02.nextval, '김행복', '010-1111-2222', '서울 동대문구 휘경1동', '20151202', 'A', '01');
insert into member_tbl_02 values (seq_member_tbl_02.nextval, '이축복', '010-1111-3333', '서울 동대문구 휘경2동', '20151206', 'B', '01');
insert into member_tbl_02 values (seq_member_tbl_02.nextval, '장믿음', '010-1111-4444', '울릉군 울릉읍 독도1리', '20151001', 'B', '30');
insert into member_tbl_02 values (seq_member_tbl_02.nextval, '최사랑', '010-1111-5555', '울릉군 울릉읍 독도1리', '20151113', 'A', '30');
insert into member_tbl_02 values (seq_member_tbl_02.nextval, '진평화', '010-1111-6666', '제주도 제주시 외나무골', '20151225', 'B', '60');
insert into member_tbl_02 values (seq_member_tbl_02.nextval, '최공단', '010-1111-7777', '제주도 제주시 감나무골', '20151211', 'A', '60');
commit;

create table money_tbl_02 (
    custno number(6) not null,
    salenol number(8) not null,
    pcost number(8),
    amount number(4),
    price number(8),
    pcode varchar2(4),
    sdate date default sysdate,
    primary key(custno, salenol)
);

truncate table money_tbl_02;

select * from money_tbl_02;

insert into money_tbl_02 values (100001, 20160001, 500, 5, 2500, 'A001', '20160101');
insert into money_tbl_02 values (100001, 20160002, 1000, 4, 4000, 'A002', '20160101');
insert into money_tbl_02 values (100001, 20160003, 500, 3, 1500, 'A008', '20160101');
insert into money_tbl_02 values (100002, 20160004, 2000, 1, 2000, 'A004', '20160102');
insert into money_tbl_02 values (100002, 20160005, 500, 1, 500, 'A001', '20160103');
insert into money_tbl_02 values (100003, 20160006, 1500, 2, 3000, 'A003', '20160103');
insert into money_tbl_02 values (100004, 20160007, 500, 2, 1000, 'A001', '20160104');
insert into money_tbl_02 values (100004, 20160008, 300, 1, 300, 'A005', '20160104');
insert into money_tbl_02 values (100004, 20160009, 600, 1, 600, 'A006', '20160104');
insert into money_tbl_02 values (100004, 20160010, 3000, 1, 3000, 'A007', '20160106');

commit;


select m1.custno, m1.custname, m1.grade, sum(price) sales
from member_tbl_02 m1 inner join money_tbl_02 m2
on m1.custno = m2.custno group by m1.custno, m1.custname, m1.grade
order by sum(price) desc;

-- ======================================================================

create table tbl_vote_202005 (
    v_jumin char(13) not null,
    v_name varchar2(20),
    m_no char(1),
    v_time char(4),
    v_area char(20),
    v_confirm char(1),
    primary key (v_jumin)
);

select * from tbl_vote_202005;
truncate table tbl_vote_202005;

insert into tbl_vote_202005 values ('99010110001', '김유권', '1', '0930', '제1투표장', 'N');
insert into tbl_vote_202005 values ('89010120002', '이유권', '2', '0930', '제1투표장', 'N');
insert into tbl_vote_202005 values ('69010110003', '박유권', '3', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values ('59010120004', '홍유권', '4', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values ('79010110005', '조유권', '5', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values ('89010120006', '최유권', '1', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values ('59010110007', '지유권', '1', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values ('49010120008', '장유권', '3', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values ('79010110009', '정유권', '3', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values ('89010120010', '강유권', '4', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values ('99010110011', '신유권', '5', '0930', '제1투표장', 'Y');

insert into tbl_vote_202005 values ('79010120012', '오유권', '1', '1330', '제1투표장', 'Y');
insert into tbl_vote_202005 values ('69010110013', '현유권', '4', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('89010110014', '왕유권', '2', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('99010110015', '유유권', '3', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('79010110016', '한유권', '2', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('89010110017', '문유권', '4', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('99010110018', '양유권', '2', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('99010110019', '구유권', '4', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('79010110020', '황유권', '5', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('69010110021', '배유권', '3', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('79010110022', '전유권', '3', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('99010110023', '고유권', '1', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('59010110024', '권유권', '3', '1330', '제2투표장', 'Y');
commit;

create table tbl_member_202005 (
    m_no char(1) not null,
    m_name varchar(20),
    p_code char(2),
    p_school char(1),
    m_jumin char(13),
    m_city varchar2(20),
    primary key (m_no)
);

truncate table tbl_member_202005;

insert into tbl_member_202005 values ('1', '김후보', 'P1', '1', '6603011999991', '수선화동');
insert into tbl_member_202005 values ('2', '이후보', 'P2', '3', '5503011999992', '민들레동');
insert into tbl_member_202005 values ('3', '박후보', 'P3', '2', '7703011999993', '나팔꽃동');
insert into tbl_member_202005 values ('4', '조후보', 'P4', '2', '8803011999994', '진달래동');
insert into tbl_member_202005 values ('5', '최후보', 'P5', '3', '9903011999995', '개나리동');

commit;

create table tbl_party_202005 (
    p_code char(2) not null,
    p_name varchar2(20),
    p_indate date default sysdate,
    p_reader varchar2(20),
    p_tel1 char(3),
    p_tel2 char(4),
    p_tel3 char(4),
    primary key(p_code)
);

insert into tbl_party_202005 values ('P1', 'A정당', '20100101', '위대표', '02', '1111', '0001');
insert into tbl_party_202005 values ('P2', 'B정당', '20100201', '명대표', '02', '1111', '0002');
insert into tbl_party_202005 values ('P3', 'C정당', '20100301', '기대표', '02', '1111', '0003');
insert into tbl_party_202005 values ('P4', 'D정당', '20100401', '옥대표', '02', '1111', '0004');
insert into tbl_party_202005 values ('P5', 'E정당', '20100501', '임대표', '02', '1111', '0005');

commit;

select m.m_name, m.m_no, m.p_school, m.m_jumin, m.m_city,
    (select p_tel1 from tbl_party_202005 p where p.p_code = m.p_code) tel1,
    (select p_tel2 from tbl_party_202005 p where p.p_code = m.p_code) tel2,
    (select p_tel3 from tbl_party_202005 p where p.p_code = m.p_code) tel3,
    (select p_name from tbl_party_202005 p where p.p_code = m.p_code) p_name
from tbl_member_202005 m order by m.m_no asc;

select m.m_name, m.m_no, m.p_school, m.m_jumin, m.m_city, p.p_tel1, p.p_tel2, p.p_tel3, p.p_name
from tbl_member_202005 m inner join tbl_party_202005 p
on m.p_code = p.p_code group by m.m_name, m.m_no, m.p_school, m.m_jumin, m.m_city
order by m.m_no desc;




-- ==============================================

select * from tbl_vote_202005 order by v_time asc;


-- 사용자(스키마:schema) 계정 생성 : bookTest
create user bookTest identified by 1234
default tablespace users
temporary tablespace temp;


-- tablespace 생성
create tablespace jspPortfolioModel2
-- datafile 'C:/??/oradata/bookTest.dbf' size 50m
datafile '/Users/HKIT/COY/oradata/jspPortfolioModel2.dbf' size 50m
autoextend on
next 10m
maxsize unlimited;


-- 계정 생성
create user application_test identified by 1234
default tablespace application_test;

-- 권한 부여 : connect, resource
grant connect, resource to application_test;




create tablespace application_test
datafile '/Users/HKIT/COY/oradata/application_test.dbf' size 50m
autoextend on
next 10m
maxsize unlimited;

create user application_test identified by 1234
default tablespace application_test;

grant connect, resource to application_test;
