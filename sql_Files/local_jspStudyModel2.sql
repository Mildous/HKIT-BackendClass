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
    primary key (hakbun)
);

create sequence seq_haksaMember start with 1 increment by 1 nomaxvalue nocache;

select * from haksaSihum;
select * from haksaMember;
select * from haksaSungjuk;

truncate table haksaMember;

drop sequence seq_haksaMember;


create table haksaSihum (
    sihumNo number not null,
    sihumName varchar2(50) not null,
    sihumDate date default sysdate not null,
    regiDate date default sysdate not null,
    primary key (sihumNo)
);

create sequence seq_haksaSihum start with 1 increment by 1 nomaxvalue nocache;


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
    primary key (sungjukNo)
);
create sequence seq_haksaSungjuk start with 1 increment by 1 nomaxvalue nocache;

alter table haksaSungjuk add constraint FK_haksaSungjuk_haksaMember
foreign key (hakbun) references haksaMember (hakbun);

alter table haksaSungjuk add constraint FK_haksaSungjuk_haksaSihum
foreign key (sihumNo) references haksaSihum (sihumNo);

select sj.*, 
    (select sihumName from haksaSihum sh where sh.sihumNo = sj.sihumNo) sihumName,
    (select name from haksaMember mb where mb.hakbun = sj.hakbun) studentName
from haksaSungjuk sj;