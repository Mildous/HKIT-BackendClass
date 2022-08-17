create table member(
id varchar2(50) not null,
passwd varchar2(50) not null,
name varchar2(50) not null,
phone varchar2(50) not null,
email varchar2(50) not null,
address varchar2(50) not null,
regiDate date not null
);

insert into member values ('hong', '1234', '홍길동', '010-1111-1111', 'hong@gmail.com', '대구', sysdate);
insert into member values ('lee', '2222', '이성순', '010-2222-2222', 'lee@gmail.com', '서울', sysdate);
commit;

select * from member;

create table product (
productCode number not null,
productName varchar2(50) not null,
productPrice number not null,
productContent clob not null,
productCategory varchar2(50) not null,
vendor varchar2(50) not null,
regiDate date not null,
primary key(productCode)
);

create sequence seq_product start with 1 increment by 1 nomaxvalue nocache;

commit;

select * from product;

insert into product values (seq_product.nextval, '사과', 3000, '사과임', '과일', '청송', sysdate);