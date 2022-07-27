alter user hr identified by 1234 account unlock;

--=======================================================================

-- 사용자(스키마:schema) 계정 생성 : bookTest
create user bookTest identified by 1234
default tablespace users
temporary tablespace temp;


-- tablespace 생성
create tablespace bookTest
-- datafile 'C:/??/oradata/bookTest.dbf' size 50m
datafile '/Users/HKIT/COY/oradata/bookTest.dbf' size 50m
autoextend on
next 10m
maxsize unlimited;


-- 계정 생성
create user bookTest identified by 1234
default tablespace bookTest;

-- 권한 부여 : connect, resource
grant connect, resource to bookTest;


-- 계정 삭제
drop user bookTest cascade;

-- tablespace 삭제
drop tablespace bookTest including contents and datafiles cascade constraints;

--=======================================================================