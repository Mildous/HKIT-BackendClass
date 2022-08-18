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

desc member;