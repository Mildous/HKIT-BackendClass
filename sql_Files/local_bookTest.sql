create table book_all (
id number not null,
subject varchar2(50) not null,
author varchar2(50) not null,
created date not null,
profile varchar2(50) not null
);

select * from book_all;

insert into book_all values (1, '점프 투 파이썬', '박응용', '2019-07-14', '프로그래밍');
insert into book_all values (2, '점프 투 자바', '박응용', '2018-08-25', '프로그래밍');
insert into book_all values (3, '딥 러닝을 이용한 자연어 처리 입문', 'WJY', '2019-07-12', '프로그래밍');
insert into book_all values (4, '공이의 수학정리노트', 'Donghoon', '2019-04-05', '수학');
insert into book_all values (5, '예제로 배우는 ORACLE 11g', '초록우산', '2019-07-12', '데이타베이스');
insert into book_all values (6, '주식 시장을 이기는 마법의 자동매매', '엑슬론', '2019-03-16', '주식');
insert into book_all values (7, '비트코인 개발자 가이드', 'Soori', '2018-02-24', '금융');
insert into book_all values (8, '미국 금융공학 유학', '엑슬론', '2019-07-12', '주식');
insert into book_all values (9, 'Deep Inside VBA', '곽승주', '2019-04-27', 'VBA');
insert into book_all values (10, 'CentOS 만들기', '박응용', '2016-10-19', '프로그래밍');
insert into book_all values (11, 'Windows Server 만들기', '박응용', '2017-08-09', '프로그래밍');

---------------------------------------------------------------------------------------

select *
from book_all
where author = '박응용';

select *
from book_all
where created between '2019/01/01' and '2019/12/31';

select count(profile)
from book_all;

select *
from book_all
where author = '박응용' or profile = '수학';

select *
from book_all
where subject like '%ORACLE%';

-----------------------------------------------------------
drop table book_01;

create table book_01 (
id number not null,
author varchar2(50) not null,
profile varchar2(50) not null,
primary key(id)
-- foreign ket (author_id) references book_01(id)
);

create sequence seq_book_01 start with 20 increment by 1 minvalue 1;

insert into book_01 values (seq_book_01.nextval, '박응용', '프로그래밍');
insert into book_01 values (seq_book_01.nextval, 'WJY', '프로그래밍');
insert into book_01 values (seq_book_01.nextval, 'Donghoon', '수학');
insert into book_01 values (seq_book_01.nextval, '초록우산', '데이타베이스');
insert into book_01 values (seq_book_01.nextval, '엑슬론', '주식');
insert into book_01 values (seq_book_01.nextval, 'Soori', '금융');
insert into book_01 values (seq_book_01.nextval, '곽승주', 'VBA');

commit;

select * from book_01;


create table book_02 (
id number not null,
subject varchar2(50) not null,
created date not null,
author_id number not null,
primary key (id)
);

create sequence seq_book_02 start with 50 increment by 1 minvalue 1;

insert into book_02 values (seq_book_02.nextval, '점프 투 파이썬', '2019-07-14', 20);
insert into book_02 values (seq_book_02.nextval, '점프 투 자바', '2018-08-25', 20);
insert into book_02 values (seq_book_02.nextval, '딥 러닝을 이용한 자연어 처리 입문', '2019-07-12', 21);
insert into book_02 values (seq_book_02.nextval, '공이의 수학정리노트', '2019-04-05', 22);
insert into book_02 values (seq_book_02.nextval, '예제로 배우는 ORACLE 11g', '2019-07-12', 23);
insert into book_02 values (seq_book_02.nextval, '주식 시장을 이기는 마법의 자동매매', '2019-03-16', 24);
insert into book_02 values (seq_book_02.nextval, '비트코인 개발자 가이드', '2018-02-24', 25);
insert into book_02 values (seq_book_02.nextval, '미국 금융공학 유학', '2019-07-12', 24);
insert into book_02 values (seq_book_02.nextval, 'Deep Inside VBA', '2019-04-27', 26);
insert into book_02 values (seq_book_02.nextval, 'CentOS 만들기', '2016-10-19', 20);
insert into book_02 values (seq_book_02.nextval, 'Windows Server 만들기', '2017-08-09', 20);
insert into book_02 values (seq_book_02.nextval, 'Python', '2022-07-27', 200);
commit;

select * from book_02;


select *
from book_01, book_02
where book_01.id = book_02.author_id;

select * from book_01 where id = '20';

select b2.id, b2.subject, b1.author, b2.created, b1.profile
from book_01 b1, book_02 b2
where b1.id = b2.author_id;

select b2.id, b2.subject, b1.author, b2.created, b1.profile
from book_01 b1 inner join book_02 b2 on b1.id = b2.author_id;

--프로그래밍 -> PG

update book_01 set profile = 'PG' where author = '박응용';
commit;

select b2.*, (
    select author from book_01 b1 where b1.id = b2.author_id
) author
from book_02 b2
where substr(created, 1, 2) = '19';

select b2.id, b2.subject, b2.created, (
    select author from book_01 b1 where b1.id = b2.author_id
) author, (
    select profile from book_01 b1 where b1.id = b2.author_id
) profile
from book_02 b2
where substr(created, 1, 2) = '19';


select b2.id, b2.subject, b2.created, b1.author, b1.profile
from book_02 b2, book_01 b1
where b2.author_id = b1.id;


select b2.id, b2.subject, b1.author, b2.created, b1.profile
from book_01 b1, book_02 b2
where b1.id(+) = b2.author_id; --파이썬 출력

select b2.id, b2.subject, b1.author, b2.created, b1.profile
from book_01 b1, book_02 b2
where b1.id = b2.author_id(+); -- 파이썬 미출력

select b2.id, b2.subject, b1.author, b2.created, b1.profile
from book_01 b1 right outer join book_02 b2 on b1.id = b2.author_id;

select b2.id, b2.subject, b1.author, b2.created, b1.profile
from book_01 b1 left outer join book_02 b2 on b1.id = b2.author_id;


create table book_03 (
id      number NOT NULL,
comment VARCHAR2(100) NOT NULL,
wdate DATE NOT NULL,
author_id number NOT NULL
);
CREATE SEQUENCE seq_book_03 START WITH 1 INCREMENT BY 1 MINVALUE 1;
ALTER TABLE book_03 ADD PRIMARY KEY (id);

insert into book_03 values (seq_book_03.NEXTVAL, '좋다', sysdate, 1);
insert into book_03 values (seq_book_03.NEXTVAL, '어렵다', sysdate, 1);
insert into book_03 values (seq_book_03.NEXTVAL, '잘하네', sysdate, 2);
insert into book_03 values (seq_book_03.NEXTVAL, '뭐니이거', sysdate, 1);
commit;
