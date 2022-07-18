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


insert into member values(seq_member.nextval, 'hong', '1234', 'ȫ�浿', '1111112222222', '01012345678', 'hong@gmail.com', '�뱸', sysdate);

insert into member values(seq_member.nextval, 'lee', '1234', '�̼���', '2222223333333', '01098765432', 'lee@gmail.com', '����', sysdate);

insert into member values(seq_member.nextval, 'jang', '1234', '��õ��', '3333334444444', '01099887766', 'jang@gmail.com', '���', sysdate);
commit;


select seq_member.currval from dual;
select seq_member.nextval from dual;

TRUNCATE table member; --�ڸ���

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