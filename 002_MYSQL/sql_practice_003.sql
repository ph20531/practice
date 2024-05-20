-- CREATE TABLE people (name VARCHAR(100), birthdate DATE, birthtime TIME, birthdt DATETIME);
use yhdb;

insert into people
(name, birthdate, birthtime, birthdt)
values
( 'Mike', '1990-11-11', '10:07:35', '1990-11-11 10:07:35'),
( 'Larry', '1980-12-25', '04:10:42', '1980-12-25 04:10:42');

select * from people;

select name, birthdate from people;

select name, day(birthdate) from people;
select name, month(birthdate) from people;
select name, year(birthdate) from people;

-- 요일, 달 이름
select name, dayname(birthdate) from people;
select name, monthname(birthdate) from people;

-- 요일을 숫자로
select name, dayofweek(birthdate) from people;

-- 시간도 각각 처리하는 함수가 존재
select name, hour(birthtime), minute(birthtime), second(birthtime) from people;

-- date는 date관련 함수만 time은 time관련 함수만 사용 가능하지만
-- datetime은 date와 time이 모두 존재하기 때문에 모든 함수 사용 가능
select name, day(birthdt) from people;
select name, month(birthdt) from people;
select name, year(birthdt) from people;
select name, dayname(birthdt) from people;
select name, monthname(birthdt) from people;
select name, dayofweek(birthdt) from people;

-- 포맷팅
-- 기본적인 iso 포맷 | 1990-11-15 10:07:35
-- 으로부터 포맷팅 커스터마이징 하기
select name, date_format(birthdt, '%Y년 %m월 %d일 %H시 %i분 %s초 입니다.') from people;

-- UTC는 "Coordinated Universal Time"의 약어로 국제표준시이다.
-- date_format() 함수는 잘 사용하지 않는데 왜냐하면 포맷팅은 보통 프론트엔드 개발자가 해야되기 때문이다.
-- 보통 글로벌 서비스를 목표로 하기 때문에 클라이언트 프로젝트에서 동적으로 포맷팅을 해주어야 한다.

-- 현재 시간을 구하는 방법 | now
select now();

-- 현재의 년월일만 구하는 방법 | current date
select curdate();

-- 현재의 시분초만 구하는 방법 | current time
select curtime();

-- 시간의 차이를 구하는 방법 | date diffrence | 결과값은 일(day)
select datediff(now(), birthdt) from people;

-- 중요 | 연산 ________________________________________________________________________________________________________________________
-- interval [params] year month day hour minute second의 형식으로 사용 가능
-- 태어난 시간으로부터 100일 후의 날짜는? | 날짜 +
select birthdt, date_add(birthdt, interval 100 day) from people;

-- 태어난 시간으로부터 100일 전의 날짜는? | 날짜 -
select birthdt, date_sub(birthdt, interval 100 day) from people;

-- 태어난 시간으로부터 100시간 후의 날짜는? | 날짜 +
select birthdt, date_add(birthdt, interval 100 hour) from people;

-- 태어난 시간으로부터 100시간 전의 날짜는? | 날짜 -
select birthdt, date_sub(birthdt, interval 100 hour) from people;

-- 꼭 함수를 사용하지 않아도 연산자로 연산이 가능하다.
select birthdt + interval 12 year from people;
select birthdt - interval 12 year from people;
select birthdt + interval 72 month from people;
select birthdt - interval 72 month from people;
select birthdt + interval 3254 minute from people;
select birthdt - interval 3254 minute from people;
-- ...
--  ___________________________________________________________________________________________________________________________________