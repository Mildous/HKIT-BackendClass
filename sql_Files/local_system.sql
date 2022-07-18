create tablespace javaOracle
datafile 'C:\Users\HKIT\COY\oradata\javaOracle.dbf' size 50m
autoextend on
next 10m
maxsize unlimited;

create user javaOracle IDENTIFIED by 1234
default tablespace javaOracle;

grant connect, resource to javaOracle;

drop user javaOracle;

drop tablespace javaOracle including contents and datafiles cascade constraints;


