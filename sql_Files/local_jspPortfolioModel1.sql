create table member(
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
grade varchar2(50) not null,
regiDate date not null,
primary key (id),
unique (no)
);

create sequence seq_member start with 1 increment by 1 nomaxvalue nocache;

select * from member;

alter table member add attachInfo clob default '-';

alter table member drop column attachInfo;

---------------------------------------------------------------------------
-- 메모장
-- WebContent/memo
create table memo (
no number not null,
writer varchar2(50) not null,
content clob not null,
regiDate date default sysdate not null,
primary key (no)
);

create sequence seq_memo start with 1 increment by 1 nomaxvalue nocache;

select * from memo;

delete from memo where no = 3;

commit;
--------------------------------------------------------------------------
-- 방명록

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

select * from guestBook;

alter table guestBook add memberNo number default 0;

--------------------------------------------------------------------------
-- 게시판(B)

create table boardBasic (
no number not null,
num number not null,
writer varchar2(50) not null,
subject varchar2(50) not null,
content clob not null,
email varchar2(50) not null,
passwd varchar2(50) not null,
refNo number not null,
stepNo number not null,
levelNo number not null,
hit number not null,
regiDate date not null,
primary key(no)
);

drop table boardBasic cascade constraints;
truncate table boardBasic;
drop sequence seq_boardBasic;
create sequence seq_boardBasic start with 1 increment by 1 nomaxvalue nocache;
-- alter table boardBasic add memberNo number default 0;
-- alter table boardBasic add ip varchar2(50) default '-';


select * from boardBasic;

commit;

-- 부모글의 refNo가 같은 것 중에서
-- 부모글의 levelNo보다 큰 값들은 1씩 증가시키고,
-- 부모글의 levelNo값에 + 1 한다.
update boardBasic set level = levelNo + 1
where refNo = 1 and levelNo > 1;

alter table boardBasic add parentNo number default 0;


-- ------------------------------------------------------
-- 게시판

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
truncate table board;
select * from board;

select * from (
    select A.*, rownum rNum from (
        select * from board where subject like '%10%' order by noticeNo desc, refNo desc, levelNo asc
    ) A
)
where rNum between 1 and 10;

select count(*) from board;



-- --------------------------------------------------------------------
-- 상품관리
-- 테이블 : product
-- 상품코드, 상품이름, 상품가격, 제조사, 첨부파일, 등록일

create table product (
productCode number not null,
productName varchar2(50) not null,
productPrice number not null,
vendorCode number not null,
attachInfo clob not null,
regiDate date default sysdate not null,
primary key(productCode),
foreign key(vendorCode) references vendor(vendorCode)
);

drop table product cascade constraints;
create sequence seq_product start with 1 increment by 1 nomaxvalue nocache;

-- ---------------------------------------------------------------------
-- 제조사 관리
-- 테이블 : vendor

create table vendor (
vendorCode number not null,
vendorName varchar2(50) not null,
regiDate date default sysdate not null,
primary key(vendorCode)
);


create sequence seq_vendor start with 1 increment by 1 nomaxvalue nocache;


truncate table product;
drop sequence seq_product;
-- ---------------------------------------------------------------------
-- 쇼핑몰
-- 테이블 : 



-- ---------------------------------------------------------------------

select * from product;


select p.*, (
    select vendorName from vendor v where v.vendorCode = p.vendorCode) vendorName
from product p where productCode = 4;

select * from (
    select A.*, (
        select vendorName from vendor v where v.vendorCode = A.vendorCode) vendorName,
        rownum rNum from (select p.* from product p where productName like '%제%' order by productCode desc
    ) A
) where rNum between 1 and 10;

-- 제조사 검색

select * from (
    select A.*, (
        select vendorName from vendor v where v.vendorCode = A.vendorCode) vendorName,
        rownum rNum from (select p.* from product p, vendor v where v.vendorCode = p.vendorCode and v.vendorName like '%기%' order by productCode desc
    ) A
) where rNum between 1 and 10;

select * from (
    select A.*, (
        select vendorName from vendor v where v.vendorCode = A.vendorCode) vendorName,
        rownum rNum from (select p.* from product p order by productCode desc
    ) A
) where rNum between 1 and 10;


CREATE TABLE cart (
    cartNo NUMBER NOT NULL,
    memberNo NUMBER NOT NULL,
    productCode NUMBER NOT NULL,
    amount NUMBER NOT NULL,
    regiDate DATE NOT NULL,
    PRIMARY KEY (cartNo)
);
CREATE SEQUENCE seq_cart START WITH 1 INCREMENT BY 1 NOMAXVALUE NOCACHE;
drop sequence seq_cart;
select * from cart;

-- foreign key 설정
alter table cart add constraint fk_cart_memberNo
foreign key(memberNo) references member(no);

-- 제약조건 삭제
alter table cart drop constraint fk_cart_memberNo;

-- 제약조건 추가
alter table cart add constraint fk_cart_productNo
foreign key(productCode) references product(productCode);

drop table cart cascade constraints;