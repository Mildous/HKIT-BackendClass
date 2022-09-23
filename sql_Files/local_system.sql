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
grant connect, resource to jspStudyModel2;


-- 계정 삭제
drop user jspStudyModel2 cascade;

-- tablespace 삭제
drop tablespace bookTest including contents and datafiles cascade constraints;

--=======================================================================


create user mystudy identified by 1234

grant connect, resource to mystudy;

revoke connect, resource from mystudy;