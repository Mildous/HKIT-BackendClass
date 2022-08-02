select table_name from user_tables; --테이블 이름 보기

select * from tab;  --모든 테이블 보기

select * from dictionary; --data사전(metadata)

select * from user_constraints;-- 테이블에 걸린 제약조건 확인

select * from user_col_comments; --comments 데이터 사전

select * from employees;

select * from departments;

desc employees;

select * from employees where substr(hire_date, 1, 2) = '07';
select * from employees where hire_date >= '2007-01-01' and hire_date <= '2007-12-31';
select * from employees where hire_date between '2007-01-01' and '2007-12-31';
select * from employees where hire_date like '07%';

select first_name 이름, salary 급여, (salary * 12) 연봉 from employees; -- 별칭에는 큰따옴표만(없어도 무관함), 별칭에 공백이 들어가거나 숫자로 시작하게 되면 따옴표 필히 붙이기.

select first_name 이름, salary 급여, (salary * nvl(commission_pct, 1)) 연봉 from employees;
select first_name as 이름, salary as 급여, (salary * nvl(commission_pct, 1)) as 연봉 from employees;


-----------------------------------------------------------------------------------
-- 관계형 데이터베이스 : 표
select * from tab;

--작성순서--                    --해석순서--
--1 select : 필드명, 집계함수       (5)
--2 from : 테이블명, 테이블명, ...  (1)
--3 where : 레코드에 대한 조건      (2)
--4 group by : 필드명              (3)
--5 having : group에 대한 조건     (4) 
--6 order by : 정렬                (6)

-- count(*)         : null 포함
-- count(필드명)    : null 제외

-- 속성 == 필드 == 칼럼 == degree (열)     column, field
-- record == row == tuple (행)            record, row

-- employees 테이블의 전체 필드 출력
select * from employees;

-- emoloyees 테이블의 first_name과 last_name 필드 출력
select first_name, last_name from employees;

-- employees 테이블의 first_name과 last_name을 name이라는 1개의 필드에 출력
select (first_name || '/' || last_name) as name from employees;

-- employees 테이블의 이름(first_name)과 입사일, 급여를 출력
select first_name, hire_date, salary
from employees;

-- employees 테이블의 이름(fist_name)과 입사일, 급여, 연봉을 출력
select first_name, hire_date, salary, (salary * 12) as "1년치급여" -- where 앞에는 별칭을 줄 때를 제외하면 큰따옴표를 쓸 일 없음
from employees;

select first_name, hire_date, salary, ((salary * 12) + nvl(commission_pct, 0)) as "1년치급여"
from employees;

-- null : 미확정값.. 
-- nvl(필드명, 바꿀값) : (null인 경우, 뒤에 나온 값으로 바꿔라..)

-- distinct로 중복된 데이터를 한번씩만 출력
select distinct department_id from employees;

-- 학생테이블 전자공학과 100명 화학공학과 200명 법학과 50명
-- select * from 학생테이블;
-- select distinct 학과 from 학생테이블;

select sysdate from employees;
select sysdate from dual;

select 1000 + 2000 from dual;
select 1000 - 2000 from dual;
select 1000 * 2000 from dual;
select 1000 / 2000 from dual; -- 몫
select mod(1000, 2000) from dual; -- 나머지

-------------------------------------------------------------------------

select 이름, 학과, 학생수
from 학생정보 outer join 학과인원 on 학생정보.학과 = 학과인원.학과;

select 이름, 학과, 학생수
from 학생정보, 학과인원
where 학생정보.학과 = 학과인원.학과;

-------------------------------------------------------------------------
-- 부서id : 10
select *
from employees
where department_id = 10;


select *
from employees
where first_name = 'Lex';

-- 2005년 이후에 입사한 사원을 출력
select *
from employees
where hire_date >= '2005-01-01';

select *
from employees
where hire_date >= '05-01-01';

select *
from employes
where hire_date >= '05-01-01' and hire_date <= '05-12-31';

/*
* 연산자
산술
비교 : > >= < <= != <> ^=
논리 : and or not
*/

select *
from employees
where hire_date >= '05-01-01' and department_id = '60' and salary > 15000;

select *
from employees
where commission_pct in ('0.1', '0.25', '0.3');

select * from employees
where salary between 15000 and 20000;

select * from employees
where salary >= 15000 and salary <= 20000;

-- 와일드카드(Wild Card)
-- ? : 모든것.. 
-- _ : 한글자..

select * from employees where first_name like '%N%' or first_name like '%n%';

select * from employees where lower(first_name) like '%n%'; -- upper()

select * from employees
where first_name like'_a%';

select * from employees
where first_name like'__a%';

/*
* 살충제 패러독스

요구사항분석 -> 기능상세명세 -> 설계 -> 구현
단위 -> 통합 -> 시스템 -> 인수 -> 알파 -> 베타
*/

-- null

select * from employees where commission_pct is null;

select * from employees where commission_pct is not null;


-- 정렬

select * from employees order by first_name asc; -- asc: 오름차순, desc: 내림차순

select count(*) from employees; -- null값 포함 전체

select count(commission_pct) from employees; -- null값을 제외한 레코드 카운트

-- 문자함수
-- lower(소문자), upper(대문자), initcap(첫글자만 대문자) 

select 'korea' from dual; -- dual: 가상의 레코드

select upper('korea') from dual; -- 문자를 대문자로 변환

select initcap('welCOME to my site !') from dual; -- 첫글자를 대문자로, 나머지는 소문자로..(공백 이후 첫글자도 대문자)

select first_name, salary from employees;

select upper(first_name), salary from employees;

select length('korea ') from dual; -- 문자열의 길이, 공백도 1칸으로 카운트

-- 1byte = 8bit

select LENGTHB('korea') from dual; -- 문자열의 크기(byte) 영어&숫자 1글자: 1byte, 한글 1글자: 3byte

select first_name, length(first_name) as first_name_length, salary from employees;

select length(upper(first_name)), salary from employees; -- 함수 여러개 결합해서 사용 가능

select first_name, salary, first_name, salary from employees; -- 중복되는 칼럼명은 자동으로 뒤에 숫자가 붙음, 별칭을 붙이는것이 좋음

select substr('Welcome to Oracle..', 4, 3) from dual; -- java의 substring과 같음.. 4번째 문자부터 3글자 자르기.. db의 index는 1부터 시작..

select upper(substr('Welcome to Oracle..', 4, 3)) from dual; -- 잘라낸 글자를 대문자로 변환하여 출력

select substr('Welcome to Oracle', -4, 3) from dual; -- 뒤에서 4번째부터 오른쪽으로 3글자 자르기 -> acl 출력

-- a

select first_name
from employees
where substr(first_name, -1, 1) = 'a';

select first_name
from employees
where first_name like '%a';

select first_name
from employees
where substr(first_name, length(first_name), 1) = 'a';

select first_name
from employees
where substr(first_name, length(first_name)-1, 2) = 'na';

-- 2005년도에 입사한 사원 출력, substr 사용하기..

select *
from employees
where substr(hire_date, 1, 2) = '05';

select first_name, hire_date
from employees
where substr(hire_date, 1, 2) >= '00';

select first_name, hire_date
from employees
where substr(hire_date, 1, 2) in ('00', '01', '02');

select INSTR('WELCOME TO ORACLE', 'O') from dual; -- 앞에서부터 'O'가 있는 인덱스 찾기

select INSTR('WELCOME TO ORACLE', 'O'), INSTR('WELCOME TO ORACLE', 'O', 6, 2) from dual; -- 6번째 인덱스부터 2번째 'O' 위치 찾기

select INSTR('WELCOME TO ORACLE', 'COME') from dual; -- 단어 입력시 해당 단어가 있는 인덱스를 찾음

select substr('WELCOME TO ORACLE', INSTR('WELCOME TO ORACLE', 'COME'), 4) from dual; -- 'COME' 뽑아서 출력


-- LPAD, RPAD

select LPAD('Oracle', 20, '#') from dual; -- 20글자 중 oracle 글자를 제외한 빈칸을 #으로 왼쪽부터 채우기

select RPAD('Oracle', 20, '#') from dual; -- 오른쪽부터 채우기

/*
String a = "sql";
String imsi = "";
for(int i=0; i<20-a.length; i++) {
    imsi += "#";
}
str = imsi + "sql";
*/


-- trim, ltrim, rtrim

select LTRIM('          Oracle') from dual; -- 왼쪽의 공백 제거

select RTRIM('Oracle          ') as a from dual; -- 오른쪽의 공백 제거

select trim('      Oracle     ') as a from dual; -- 양쪽의 공백 제거

select trim('   O r a c l e   ') as a from dual; -- 문자열 사이의 공백은 제거 x

select replace('    O r a c l e    ', ' ', '') as a from dual; -- 모든 공백 제거


-- 필드(문자열) 결합 : concat, ||

select concat('korea', 'fighting') from dual; -- concat은 2개까지만 가능, 거의 사용하지 않음

select 'korea' || '/' || 'fighting' from dual; -- || 사용시 여러개 연결 가능, java의 +와 같음

select (first_name || '/' || last_name) name from employees;


-- replace
select replace('abcdefg', 'c', '000') from dual;


-- 숫자함수
select -10, ABS(-10) from dual;     -- 양수로 전환

select 34.5678, FLOOR(34.5678) from dual;   -- FLOOR : 소숫점 이하 1번째 자리 버림

select 34.5678, ROUND(34.5678) from dual;   -- ROUND : 반올림

select 34.5678, ROUND(34.5678, 2) from dual;    -- 소숫점 이하 2번째 자리까지 표시, 3번째 자리를 반올림

select 34.5678, ROUND(34.5678, -1) from dual;   -- 소숫점 기준 왼쪽으로 1번째 반올림

select TRUNC(34.5678, 2), TRUNC(34.5678, -1), TRUNC(34.5678) from dual;

select MOD(27, 2), MOD(27, 5), MOD(27, 7) from dual;    -- 나머지 구하기


-- 날짜 함수

select sysdate from dual;

select SYSDATE-1 어제, SYSDATE 오늘, SYSDATE+1 내일 from dual;

select first_name, hire_date, ROUND(sysdate - hire_date) 근무일수 from employees;   -- 조건에 소숫점 자릿수가 없으면, 정수로 만들기

/*
형식 : ROUND(date, format)

CC, SCC                                    4자리 연도의 끝 두 글자를 기준으로 반올림
SYYY, YYYY, YEAR, SYEAR, YYY, YY, Y        년(7월 1일부터 반올림)
DDD, D, J                                  일을 기준
HH, HH12, HH24                             시를 기준
Q                                          한 분기의 두 번째 달의 16일을 기준으로 반올림
MONTH, MON, MM, RM                         월(16일을 기준으로 반올림)
DAY, DY, D                                 한 주가 시작되는 날짜
MI                                         분을 기준
*/


select hire_date, ROUND(hire_date, 'MONTH') from employees;

select hire_date, TRUNC(hire_date, 'MONTH') from employees;

select months_between('2019/04/04', '2019/04/15') from dual;

select 
first_name, 
sysdate, 
hire_date, 
MONTHS_BETWEEN(sysdate, hire_date), 
TRUNC(MONTHS_BETWEEN(sysdate, hire_date)), 
FLOOR(MONTHS_BETWEEN(sysdate, hire_date)) from employees;


-- ADD_MONTHS
select first_name, hire_date, ADD_MONTHS(hire_date, 6) from employees;  -- 입사일에 6개월 더함

-- NEXT_DAY
select SYSDATE, NEXT_DAY(SYSDATE, '수요일') from dual;

-- LAST_DAY
select hire_date, LAST_DAY(hire_date) from employees;


-- 문제) 각 직원들에 대해서 직원의 이름과 근속연수를 나타내시오.
-- 단, 근속연수는 연단위를 버림하시오.

select first_name, hire_date, TRUNC((sysdate - hire_date) / 365) as 근속연수 from employees;

select first_name, hire_date, FLOOR(months_between(sysdate, hire_date) / 12) as 근속연수 from employees;


-- rownum : 행(레코드) 번호
-- rowid  : rownum의 주소값

select rownum, rowid, employee_id, first_name from employees;

select rownum, employee_id, first_name from employees order by employee_id desc;


-- 형변환 함수
-- to_char()        : 날짜형이나 숫자형을 문자로 바꾸기
-- to_date()        : 문자를 날짜형으로 바꾸기
-- to_number()      : 문자를 숫자형으로 바꾸기

select sysdate, to_char(sysdate, 'yyyy-mm-dd') from dual;


/*
날짜 출력 형식 종류

YYYY        년도 표현(4자리)
YY          년도 표현(2자리)
MM          월을 숫자로 표현
MON         월을 알파벳으로 표현
DAY         요일 표현
DY          요일을 약어로 표현
------------------------------------
시간 출력 형식의 종류

AM or PM    오전(AM), 오후(PM) 시각 표시
A.M or P.M  오전(A.M), 오후(P.M) 시각 표시
HH or HH12  시간(1 ~ 12)
HH24        24시간으로 표현(0 ~ 23)
MI          분 표현
SS          초 표현

*/

select hire_date, to_char(hire_date, 'yyyy/mm/dd day') a,
to_char(hire_date, 'yy/mon/dd dy') b,
to_char(hire_date, 'yyyy-mm-dd HH:MI:SS') c
from employees;


select 1230000, to_char(1230000) from dual;




/*
숫자 출력 형식

0       자릿수를 나타내며 자릿수가 맞지 않을 경우 0으로 채운다.
9       자릿수를 나타내며 자릿수가 맞지 않아도 채우지 않는다.
L       각 지역별 통화 기호를 앞에 표시한다.
.       소숫점
,       천 단위 자리 구분

*/

select first_name, salary, to_char(salary, 'L999,999') from employees;

select first_name, hire_date, to_date('20051025', 'YYYYMMDD') from employees;


select sysdate - to_date('2008/01/01', 'YYYY/MM/DD') from dual;

select trunc(sysdate - to_date('2008/01/01', 'YYYY/MM/DD')) from dual;

select to_date('2005-12-31'), to_date('2005?12?31'), to_date('20051231') from dual;

select to_date('2005-12-31', 'YYYY-MM-DD') from dual;

select to_char(to_date('2005-12-31 10:01:01', 'YYYY-MM-DD HH:MI:SS'), 'YYYY-MM-DD HH:MI:SS') from dual;


-- to_number(숫자형태의 문자열)

select 100-10, 100+10, 100*10, 100/10 from dual;

select '100' + 1 from dual;
select to_number('100') + 1 from dual;

select to_number('20,000', '99,999') - to_number('10,000', '99,999') from dual;


-- 일반함수
-- nvl (expr1, expr2)

select first_name, salary, commission_pct,
nvl(commission_pct, 0), salary * 12 + nvl(commission_pct, 0) 
from employees 
order by job_id;


-- nvl2 (expr1, expr2, expr3) : expr1이 null이면, 아니면..

select first_name, salary, commission_pct,
nvl2(commission_pct, salary * 12 + commission_pct, salary * 12) a,
salary * 12 + nvl(commission_pct, 0) b
from employees
order by job_id;


-- nullif : 같으면 null, 다르면 첫번째 값

select nullif('A', 'A'), nullif('A', 'B') from dual;


-- coalesce : 인자 중에서 null이 아닌 첫번째 인자를 반환

select first_name, commission_pct, salary, 
coalesce(commission_pct, salary, 0) -- null이 아닌 첫번째 인자가 salary이면 salary값을, pct면 pct 값
from employees
order by job_id;


-- decode 함수 : switch문과 비슷..

select first_name, department_id,
    decode(
        department_id,
        10, 'ACCOUNTING',
        20, 'RESEARCH',
        30, 'SALES',
        40, 'OPERATIONS', 
        'DEFAULT'
        ) dname
from employees
order by department_id asc;


-- case 함수

select first_name, department_id,
    case
        when department_id = 10 then 'ACCOUNTING'
        when department_id = 20 then 'RESEARCH'
        when department_id = 30 then 'SALES'
        when department_id = 40 then 'OPERATIONS'
        else 'default'
    end dname
from employees
order by department_id asc;



-- 집계함수 (sum, avg, max, min, count)


-- sum

select sum(salary) 급여총액 from employees;


-- avg

select avg(salary) 평균급여 from employees;

-- max

select max(salary) 최대급여 from employees;

-- min

select min(salary) 최소급여 from employees;


-- count

select 
sum(salary) TotalSalary, 
trunc(avg(salary)) AVGSalary, 
max(salary) MAXSalary, 
min(salary) MINSalary, 
count(*) AllCount, 
count(salary) SalaryCount 
from employees;


select first_name, job_id
from employees
order by job_id asc;


select count(*), count(job_id)
from employees;


select count(distinct job_id)   -- 중복되지 않는 직업의 갯수
from employees;

select first_name, max(salary) from employees;   -- 단순 컬럼



-- group by
-- 소속 부서별 급여 합계를 부서번호와 함께 출력

select department_id, sum(salary)
from employees
group by department_id
order by sum(salary) desc;

select department_id, sum(salary) hab
from employees
group by department_id
order by hab asc;


-- 소속 부서별 평균 급여

select department_id, avg(salary)
from employees
group by department_id;

select department_id, job_id, count(*), sum(salary)
from employees
group by department_id, job_id
order by department_id asc;


-- 부서별 급여 총액이 3000 이상인 부서의 번호와 부서별 급여 총액 구하기
select department_id, sum(salary)
from employees
group by department_id
having sum(salary) >= 3000;


-- job_id가 IT_PROG를 제외하고 급여 총액이 5000 이상인 직급(job_id)별 급여 총액 구하기
select job_id, sum(salary)
from employees
where job_id != 'IT_PROG'   -- 문자는 대소문자를 구분
group by job_id
having sum(salary) >= 5000;


select job_id, sum(salary)
from employees
group by job_id
having sum(salary) >= '5000' and job_id <> 'IT_PROG';


-- department_id 의 평균 급여 중 최고를 출력하기
select max(trunc(avg(salary))) as avgSalary     -- 집계함수의 중첩은 2번까지 가능
from employees
group by department_id;


-- 하위쿼리, 서브쿼리
-- Lex 보다 급여를 많이 받는 사원 검색..

select first_name, salary from employees where first_name = 'Lex';
select first_name, salary from employees where salary > '17000';

select first_name, salary from employees where salary > (
    select salary from employees where first_name = 'Lex'
);


-- Lex와 동일한 부서에서 근무하는 사원 출력하기
select first_name, department_id from employees where first_name = 'Lex';
select first_name, department_id from employees where department_id = '90';

select first_name, department_id from employees where  department_id = (
    select department_id from employees where first_name = 'Lex'
);


-- 최소 급여를 받는 사원의 이름, 담당업무, 급여를 출력하기
select min(salary) from employees;  -- 2100
select first_name, job_id, salary from employees where salary = '2100';

select first_name, job_id, salary from employees where salary = (
    select min(salary) from employees
);


-- Steven King과 동일한 부서에 근무하는 사원 출력하기
select first_name, last_name, department_id from employees where first_name = 'Steven' and last_name = 'King';
select first_name, last_name, department_id from employees where department_id = '90';

select first_name, last_name, department_id from employees where department_id = (
    select department_id from employees where first_name = 'Steven' and last_name = 'King'
);


select first_name, salary, department_id, (
    select department_name 
    from departments 
    where departments.department_id = employees.department_id
) department_name from employees;


select first_name, job_id, (
    select job_title
    from jobs
    where jobs.job_id = employees.job_id
) job_title from employees;



-- 부서별 최소급여를 받는 사원 구하기

select department_id, (
    select department_name
    from departments
    where departments.department_id = employees.department_id
) department_name, min(salary)
from employees
group by department_id;

-- 다른 테이블에 존재하는 필드를 불러와야 할 때 join, 서브쿼리 사용

select employee_id, first_name, department_id, job_id, salary
from employees
where salary in(
    select min(salary) from employees group by department_id
);



-- 30번 부서의 최소급여
select min(salary) from employees where department_id = '30';

-- 전체 부서의 최소급여
select department_id, min(salary)
from employees 
group by department_id;

-- 부서별로 최소급여가 30번 부서의 최소급여보다 많은 부서의 최소급여를 출력
select department_id, min(salary) minSalary
from employees 
group by department_id
having min(salary) > (
    select min(salary) from employees where department_id = '30'
)
order by minSalary asc;

-- 부서별로 최소급여가 30번 부서의 최소급여보다 많은 부서의 최소급여와 부서이름 출력
select department_id, (
    select department_name
    from departments
    where departments.department_id = employees.department_id
) department_name, min(salary) minSalary
from employees 
group by department_id
having min(salary) > (
    select min(salary) from employees where department_id = '30'
)
order by minSalary asc;


/*
relation
릴레이션

개체(entity) -> table
속성(attribute) -> field, column

*/

-------------------------------------------------------------

-- 다중 행 서브쿼리

select employee_id, first_name, salary
from employees
where salary in ( -- 서브쿼리를 썼을 때 여러 값이 나오면 in 연산자
    select min(salary) from employees group by department_id
);


-- 직급이 IT_PROG인 사원의 급여
select first_name, job_id, salary from employees where job_id = 'IT_PROG';

-- 직급이 IT_PROG가 아니면서 급여가 임의의 IT_PROG보다 낮은 사원을 출력
select employee_id, first_name, job_id, salary
from employees
where salary < any (select salary from employees where job_id = 'IT_PROG') -- salary 기준 여러개의 값 중 최대값보다 작은 것
and job_id <> 'IT_PROG';
-- any 연산자는 서브쿼리가 반환하는 각각의 값과 비교한다
-- < any : 최대값보다 작은 것
-- > any : 최소값보다 큰 것
-- = any : in과 동일


select max(salary)
from employees
where job_id = 'IT_PROG';


-- 직급이 IT_PROG가 아니면서 직급이 IT_PROG인 사원보다 급여가 적은 사원을 모두 출력
select employee_id, first_name, job_id, salary
from employees
where salary < all (select salary from employees where job_id = 'IT_PROG')
and job_id <> 'IT_PROG';

-- all 연산자는 서브쿼리에서 반환하는 모든 값과 비교한다
-- > all : 최대값보다 큰 것
-- < all : 최소값보다 작은 것

select employee_id, first_name, job_id, salary
from employees
where salary < (select min(salary) from employees where job_id = 'IT_PROG')  -- < all과 같음
and job_id <> 'IT_PROG';

----------------------------------------------------------

select first_name,
    (select department_name from departments d where d.department_id = e.department_id) d_id
from employees e;


-- 사원번호가 109인 사원과 담당업무가 같은 사원을 표시(사원이름과 담당업무)

select first_name, job_id from employees  where employee_id = '109';

select first_name, job_id
from employees
where job_id = (
    select job_id from employees where employee_id = '109'
);



-- 사원번호가 110인 사원보다 급여가 많은 사원을 표시(사원이름과 담당업무)

select first_name, job_id, salary from employees where employee_id = '110';

select first_name, job_id
from employees
where salary > (
    select salary from employees where employee_id = '110'
);


-- 최소 급여를 받는 사원의 이름, 담당업무 및 급여를 표시하시오(그룹함수 사용)

select first_name, job_id, salary
from employees
where salary = (select min(salary) from employees);


-------------------------------------------------------------
-- join

-- 카다시안곱
-- 조건없이 테이블을 조인할 경우, 레코드수 x 레코드수


-- employees 테이블의 레코드 갯수 구하기
select count(*) from employees;
-- departments 테이블의 레코드 갯수 구하기
select count(*) from departments;

select 107 * 27 from dual;

-- employees 테이블과 departments 테이블의 레코드 갯수 구하기
select count(*) 
from employees, departments; -- 카다시안곱


select *
from employees, departments
where employee_id = '100';  -- 27개 출력

select *
from employees, departments
where employee_id = '100' and departments.department_id = '90'; -- 1개 출력

select *
from employees, departments
where employee_id = '100' and employees.department_id = '90';   -- 27개 출력


select employee_id, first_name, d.department_id, department_name
from employees e, departments d
where e.employee_id = '100' and d.department_id = '10';


-- 내부조인 : inner join
-- 외부조인 : [left/right] outer join
-- Oracle 문법, ANSI 표준 조인

-- EQUI JOIN(등가조인) == 동등조인
select e.employee_id, e.first_name, e.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id;  

select e.employee_id, e.first_name, e.department_id, d.department_name
from employees e inner join departments d on e.department_id = d.department_id;


-- Lex라는 사원의 사원번호, 이름, 부서아이디, 부서명 출력
select e.employee_id, e.first_name, e.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id and e.first_name = 'Lex';

-- 각 사원들이 소속된 부서정보 보기
select *
from employees, departments
where employees.department_id = departments.department_id;


-- 사원번호가 101인 사원의 사원번호, 사원이름, 소속부서 이름
select e.employee_id, e.first, e.department_name
from employees e, departments d
where e.department_id = d.department_id and e.employee_id = '101';

select employee_id, first_name, (
    select department_name from departments where departments.department_id = employees.department_id
) department_name
from employees
where employee_id = '101';

select employee_id, first_name, department_name, department_id
from employees, departments
where employees.department_id = departments.department_id
and employee_id = '101';


-- 내부조인 : 양쪽 테이블에 함께 존재하는 것
select *
from employees
where department_id is null;

select *
from departments
where department_id is null;

select e.first_name, e.hire_date, e.salary, d.department_name
from employees e, departments d
where e.department_id = d.department_id;

select e.first_name, e.hire_date, e.salary, d.department_name
from employees e INNER JOIN departments d ON e.department_id = d.department_id;


-- 외부조인

select employees.first_name,
    employees.hire_date,
    employees.salary,
    departments.department_name
from employees, departments
where employees.department_id = departments.department_id(+);

-- null이 출력되는 테이블에 (+)를 붙인다
-- + 는 없는 쪽에 붙인다
select employees.first_name, employees.hire_date, employees.salary, departments.department_name
from employees, departments
where employees.department_id = departments.department_id(+);

select e.first_name, e.hire_date, e.salary, d.department_name
from departments d right outer join employees e on e.department_id = d.department_id;



select departments.department_id,
        count(employees.salary),
        sum(employees.salary) as salary_ord
from departments, employees
where departments.department_id = employees.department_id(+)
group by departments.department_id;


select departments.department_id,
        count(employees.salary),
        sum(employees.salary) as salary_ord
from departments, employees
where departments.department_id(+) = employees.department_id
group by departments.department_id;

select departments.department_id,
        count(employees.salary),
        sum(employees.salary) as salary_ord
from departments right outer join employees on departments.department_id = employees.department_id
group by departments.department_id;



-- Steven King 사원의 부서이름 출력하기

--inner join
select d.department_name
from employees e, departments d
where e.department_id = d.department_id and e.first_name = 'Steven' and e.last_name = 'King';

--ansi 표준
select d.department_name
from employees e inner join departments d on e.department_id = d.department_id 
where e.first_name = 'Steven' and e.last_name = 'King';


-- 사원이름과 그 사원이 소속된 부서이름과 지역명 출력하기
select e.first_name, d.department_name, l.city
from employees e, departments d, locations l
where e.department_id = d.department_id and d.location_id = l.location_id;


select e.first_name, d.department_name, l.city --ansi 표준
from employees e inner join departments d on e.department_id = d.department_id
                 inner join locations l on d.location_id = l.location_id;


-- 커미션을 받는 모든 사원의 이름, 부서이름, 지역명 출력
select first_name, commission_pct from employees where commission_pct is not null;

select e.first_name, d.department_name, l.city -- 34명 출력
from employees e, departments d, locations l
where e.department_id = d.department_id and d.location_id = l.location_id and e.commission_pct is not null;

select e.first_name, d.department_name, l.city --ansi 표준
from employees e inner join departments d on e.department_id = d.department_id
                 inner join locations l on d.location_id = l.location_id
where e.commission_pct is not null;

select first_name, department_id, commission_pct
from employees
where commission_pct is not null
order by first_name asc, last_name asc;


---------------------------------------------------------------------
--이름에 A가 포함된 모든 사원의 이름과 부서명을 출력

select e.first_name, d.department_name
from employees e inner join departments d on e.department_id = d.department_id 
where lower(e.first_name) like '%a%';

-- US에 근무하는 사원 출력하기
select e.first_name, l.country_id
from employees e 
                inner join departments d on e.department_id = d.department_id
                inner join locations l on d.location_id = l.location_id
where l.country_id = 'US';

select first_name
from employees e, departments d, locations l
where e.department_id = d.department_id and d.location_id = l.location_id and l.country_id = 'US';


-- 런던 근무하는 모든 사원의 이름, 업무, 부서번호 및 부서명을 출력
select e.first_name, j.job_title, d.department_id, d.department_name
from employees e
                inner join departments d on e.department_id = d.department_id
                inner join jobs j on e.job_id = j.job_id
                inner join locations l on d.location_id = l.location_id
where l.city = 'London';


-- 사원 이름, 부서장 id, 부서장이름 (셀프조인)
select e.first_name, e.manager_id, ee.first_name
from employees e
                inner join employees ee on e.manager_id = ee.employee_id;

-- DDL 데이터 정의어 : create, alter, drop
-- DML 데이터 조작어 : select, insert, update, delete
-- DCL 데이터 제어어 : grant, revoke, commit, rollback, [checkpoint / savepoint]

-- primary key
-- 중복 허용 안한다
-- null 값 허용안한다

-- 제약조건
-- primary key
-- not null
-- default sysdate
-- unique
-- check
-- foreign key : PK <-> FK

create table testMember (
memberNo number not null,
memberId varchar2(50) not null,
memberName varchar2(50) not null,
regiDate date not null
);

-- sequence : 자동으로 일련번호 입력하기 위한 것
create sequence seq_testMember start with 1 increment by 1 nomaxvalue nocache;
select seq_testMember.nextval from dual;
select seq_testMember.currval from dual;


alter table testMember add primary key (memberId);
alter table testMember add unique (memberNo);

select * from testMember;

-- data type
-- number / int
-- varchar2() / varchar() : 가변형
-- char() : 고정형

select * from tab;
create table testDepartments
as
    select * from departments;

select * from testDepartments;

drop table testDepartments cascade constraints;

create table testEmployees
as
    select * from employees where department_id = '20';

drop table testEmployees;


create table testEmployees
as
    select * from employees where employee_id < '0';

select * from testEmployees;


create table testProduct (
    no number not null, -- 상품번호, 시퀀스사용
    productId varchar2(50) not null, --상품Id
    vendorId varchar2(50) not null, --제조사Id
    productName varchar2(50) not null, --상품명
    productPrice number not null,   --가격
    productDesc clob,   --설명
    wDate date default sysdate 
);

create sequence seq_testProduct start with 1 increment by 1 nomaxvalue nocache;

select * from testProduct;

-- insert into testProduct (필드명) values (값)
insert into testProduct (no, productId, vendorId, productName, productPrice, productDesc, wDate)
       values ( seq_testProduct.nextval, 'P001', 'SEC', '무풍에어컨', 1400000, '바람없는 에어컨', sysdate
);

insert into testProduct (no, productId, vendorId, productName, productPrice, productDesc)
       values ( seq_testProduct.nextval, 'P002', 'LG', '창문형에어컨', 700000, '창문에 설치하는 에어컨'
);

insert into testProduct values ( --필드명을 기재하지 않을 땐 필드 갯수와 맞춰서 값을 넣어야 함
    seq_testProduct.nextval, 'P003', 'Winia', '위니아 에어컨', 1000000, '위니아 에어컨', sysdate, null
);

alter table testProduct add bigo varchar2(50);

drop table testProduct;

-------------------------------------------------------

select * from user_constraints;

select constraint_name from user_constraints;


create table testExample01 (
col1 varchar2(10),
col2 varchar2(10) not null
);

create table testExample02 (
col1 varchar2(10),
col2 varchar2(10) constraint cols2_notNull not null
);

create table testExample03 (
col1 varchar2(10) unique,
col2 varchar2(10) constraint cols2_notNull not null
);

-- primary key
-- 테이블 당 1개의 기본키만 생성할 수 있다.
-- 여러 컬럼을 묶어 하나의 기본키로 만드는것이 가능하다. (최대 32개까지 가능)
-- 기본키는 데이터 무결성을 지켜주는 역할을 한다.

-- foreign key
-- 외래키라고 많이 불리는 제약조건이다.
-- 테이블 간의 참조 데이터 무결성을 보장해준다.
-- 참조 데이터 무결성 보장을 통해, 참조 관계가 있는 테이블의 데이터 추가, 삭제, 수정을 통제할 수 있다.
-- 아무래도 '관계'에 관한 제약조건이다 보니, 다른 제약조건에 비해 제약사항이 복잡한데, 아래와 같다.
-- * 참조하는 테이블이 먼저 생성되어 있어야 함
-- * 외래키가 참조하는 컬럼은 참조하는 테이블의 기본키(primary key)여야 함
-- * 여러 컬럼을 외래키로 할 경우, 참조하는 테이블의 기본키와 컬럼 갯수 및 순서가 같아야 함
-- * 기본키와 마찬가지로, 최대 32개 컬럼까지 가능함


create table testExample06 (
    col1 varchar2(10) not null,
    col2 varchar2(10) not null,
    primary key (col1)
);

create table testExample07 (
    col3 varchar2(10) not null,
    col4 varchar2(10) not null,
    col5 varchar2(10) not null,
    primary key (col3),
    foreign key (col5) references testExample06(col1)
);

-- WITH CHECK OPTION
-- WITH CHECK OPTION을 사용하면, 해당 뷰를 통해서 볼 수 있는 범위 내에서만 update 또는 insert가 가능하다

-- WITH READ ONLY
-- select만 가능하고, insert, update, delete는 불가..
-- 이 옵션을 지정하지 않으면 insert, update, delete는 가능..




create table tblMember (
id varchar2(50),
passwd varchar2(50),
name varchar2(50),
phone varchar2(50),
email varchar2(50)
);

select * from tblMember;

create view v_tblMember(id, passwd, name)
as select id, passwd, name from tblMember;

select * from v_tblMember;

insert into v_tblMember (id, passwd, name) values ('hong', '1234', '홍길동');

--------------------------------------------------------------------------------

-- 프로시저 : 스토어드프로시저 (as, begin, end)
select count(*) from employees;
select count(*) from departments;
select 107 + 27 from dual;

select * from user_source;
drop procedure p_counter;


create or replace procedure p_counter
as var1 int;
   var2 int;
begin
   select count(*) into var1 from employees;
   select count(*) into var2 from departments;
   DBMS_OUTPUT.PUT_LINE(var1 + var2);
end;


SET SERVEROUTPUT ON;
execute p_counter;

-------------------------------------------------------------------------------
-- begin과 end 사이에 실행문이 들어감
-- 실행문은 하나만 들어가는것이 아니라 여러개 들어갈 수 있음
-- as에는 변수선언을, 여러개 들어갈 수 있음
-- as에서 선언한 변수를 begin에서 사용하기 때문에 선언하지 않은 변수는 사용할 수 없다

create or replace procedure sp_salaryEname( --매개변수는 소괄호 안에
    v_first_name in employees.first_name%type,  --employees 테이블의 first_name의 타입과 동일, varchar2()
    v_last_name in employees.last_name%type
) -- in은 값을 안으로 들여오는것, out은 바깥에서 쓰는, 내보내는것(return)
as
    v_salary employees.salary%type; --employees 테이블의 salary 타입과 동일
begin
    select salary into v_salary     --into: 담기
    from employees
    where first_name = v_first_name and last_name = v_last_name; --외부(employees)에서 받아옴
    DBMS_OUTPUT.PUT_LINE(v_salary);
end;

SET SERVEROUTPUT ON;
execute sp_salaryEname('Steven', 'King'); -- 매개변수 입력, 실행하면 결과가 나옴(24000)

-- [Steven King의 급여는 24000입니다.]로 출력하기
-- DBMS_OUTPUT.PUT_LINE(  v_first_name || ' ' || v_last_name || '의 급여는 ' || v_salary || '입니다.'  );
-- 프로시저 내용이 바뀌었기 때문에 다시 실행해서 덮어씌워야 함

create or replace procedure sp_salaryEname(
    v_first_name in employees.first_name%type,
    v_last_name in employees.last_name%type
)
as
    v_salary employees.salary%type;
begin
    select salary into v_salary
    from employees
    where first_name = v_first_name and last_name = v_last_name;
    DBMS_OUTPUT.PUT_LINE(  v_first_name || ' ' || v_last_name || '의 급여는 ' || v_salary || '입니다.'  );
end;


-----------------------------------------------------out
-- 내보내는것이기 때문에 출력문 필요 x
create or replace procedure sp_salaryEname2(
    v_first_name in employees.first_name%type,
    v_last_name in employees.last_name%type,
    v_salary out employees.salary%type
)
as
begin
    select salary into v_salary --내보내는 변수 v_salary에 담음
    from employees
    where first_name = v_first_name and last_name = v_last_name;
end;

--out은 앞에 콜론을 붙임
SET SERVEROUTPUT ON;
variable v_salary varchar2(20);
execute sp_salaryEname2('Steven', 'King', :v_salary);
print v_salary;

------------------------------------------------------

create table testEmployees
as select * from employees;

select * from testEmployees;

create or replace procedure sp_updateSalary(v_employee_id in number)
as
begin
    update testEmployees set salary = salary * 1.1 where employee_id = v_employee_id;
end;

select * from testEmployees where employee_id = '200';
execute sp_updateSalary(200);


------------------------------------------------------

-- 메모장

create table testMemo(
idx number primary key,
writer varchar2(50) not null,
memo varchar2(500) not null,
wdate date default sysdate
);

create sequence seq_testMemo start with 1 increment by 1 nomaxvalue nocache;

select * from testMemo;

insert into testMemo(idx, writer, memo) values (seq_testMemo.nextval, 'hong', 'test001');
insert into testMemo(idx, writer, memo) values (seq_testMemo.nextval, 'lee', 'test002');
commit;


create or replace procedure testMemoInsert(
    v_writer in testMemo.writer%type,
    v_memo in testMemo.memo%type
)
as
begin
    insert into testMemo(idx, writer, memo) values (seq_testMemo.nextval, v_writer, v_memo);
    commit;
end;

execute testMemoInsert('hong', 'memo1');

execute testMemoInsert('jang', 'memo2');

-------------------------------------------------------------------------------

create table testMember(
id varchar2(50) not null,
passwd varchar2(50) not null,
name varchar2(50) not null,
email varchar2(50) not null,
addr varchar2(50) not null,
primary key(id)
);

create or replace procedure sp_testMember(
    v_id in testMember.id%type,
    v_passwd in testMember.passwd%type,
    v_name in testMember.name%type,
    v_email in testMember.email%type,
    v_addr in testMember.addr%type
)
as
begin
    insert into testMember values (v_id, v_passwd, v_name, v_email, v_addr);
end;

select * from testMember;

exec sp_testMember('hong', '1234', '홍길동', 'hong@gmail.com', '대구');
exec sp_testMember('lee', '0987', '이성순', 'lee@gmail.com', '서울');

commit;

-- 프로시저 삭제
drop procedure sp_testMember;
drop procedure sp_salaryEname;


-----------------------------------------------------------------------------
-- 커서 Cursor : 반복문을 이용하여 데이터 전체 읽어오기(getSelectAll)
-- select의 결과가 하나의 행인 경우는 into절을 이용해서 변수에 저장할 수 있다.
-- 그러나, 복수행일 경우 into절을 사용할 수 없다.
-- 이렇게 복수행의 결과를 행단위로 처리하기 위해 사용하는것이 커서이다.

-- %NOTFOUND : 커서 영역의 자료가 모두 FETCH 되었다면 TRUE
-- %FOUND : 커서 영역에 FETCH 되지 않은 자료가 있다면 TRUE
-- %ISOPEN : 커서가 OPEN된 상태이면 TRUE
-- %ROWCOUNT : 커서가 얻어 온 레코드 갯수

-- Fetch : 커서에서 원하는 결과값을 추출하는 것

set serveroutput on;

declare
    v_dept departments%rowtype;
    cursor c1
    is
        select department_id, department_name, location_id from departments;
begin
    dbms_output.put_line('부서번호      부서명     지역아이디');
    dbms_output.put_line('----------------------------------');
    open c1;
        loop
            fetch c1 into v_dept.department_id, v_dept.department_name, v_dept.location_id;
            exit when c1%notfound;
            dbms_output.put_line(v_dept.department_id || '  ' || v_dept.department_name || '     ' || v_dept.location_id);
        end loop;
    close c1;
end;


create or replace procedure cursor_c2
as
    v_dept departments%rowtype;
    cursor c2
    is
        select department_id, department_name, location_id from departments;
begin
    dbms_output.put_line('부서번호      부서명     지역아이디');
    dbms_output.put_line('----------------------------------');
    open c2;
        loop
            fetch c2 into v_dept.department_id, v_dept.department_name, v_dept.location_id;
            exit when c2%notfound;
            dbms_output.put_line(v_dept.department_id || '  ' || v_dept.department_name || '     ' || v_dept.location_id);
        end loop;
    close c2;
end;

exec cursor_c2;


-- 커서를 사용하여 부서 테이블의 모든 내용 조회하기
create or replace procedure cursor_c2
as
    v_dept departments%rowtype;
    cursor c2
    is
        select * from departments;
begin
    dbms_output.put_line('부서번호      부서명     지역아이디');
    dbms_output.put_line('----------------------------------');
        for v_dept in c2 loop
        exit when c2%notfound;
        dbms_output.put_line(v_dept.department_id || '  ' || v_dept.department_name || '     ' || v_dept.location_id);
        end loop;
end;

exec cursor_c2;


--------------------------------------------------------------------
-- 함수 == method, getSelectOne..

create or replace function fn_salary_ename
(
    v_first_name in employees.first_name%type,
    v_last_name in employees.last_name%type
)
    return number
as
    v_salary number(7, 2);
begin
    select salary into v_salary
    from employees
    where first_name = v_first_name and last_name = v_last_name;
    return v_salary;
end;

variable v_salary number;
execute :v_salary := fn_salary_ename('Steven', 'King');
print v_salary;


select employee_id, first_name, fn_salary_ename('Steven', 'King')
from employees
where first_name = 'Steven' and last_name = 'King';


---------------------------------------------------------------
-- 트리거 : 재고파악 시 유용

create table testDepartments
as select * from departments where 1=0;

create table testDepartmentsCopy
as select * from departments where 1=0;


create or replace trigger triggerSample1
    after insert
    on testDepartments
    for each row
begin
    dbms_output.put_line('insert 트리거 발생');
    insert into testDepartmentsCopy values (
        :new.department_id,
        :new.department_name,
        :new.manager_id,
        :new.location_id
    );
end;


select * from testDepartmentsCopy;

select * from testDepartments;

insert into testDepartments values ('10', 'ACCOUNTING', '3', '5');


-- 트리거는 부착한다는 표현을 사용함
create or replace trigger triggerSample2
    after delete
    on testDepartments
    for each row
begin
    dbms_output.put_line('delete 트리거 발생');
    delete from testDepartmentsCopy
    where testDepartmentsCopy.department_id = :old.department_id;
end;

insert into testDepartments values ('20', 'DESIGN', '3', '5');

delete from testDepartments where department_id = '10';

drop table testDepartments;

--------------------------------------------------------------------------

create table testDepartments (
id varchar2(10) primary key,
name varchar2(15) not null,
location varchar2(50)
);

insert into testDepartments values('10', '영업부', '서울 강남구');

savepoint a;

insert into testDepartments values('20', '회계부', '부산 동래구');

savepoint b;

insert into testDepartments values('30', '개발부', '대구 동구');

select * from testDepartments;

rollback;

rollback to a;

