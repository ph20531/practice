use yhdb;

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

select * from books;

ALTER TABLE books
ADD COLUMN full_name VARCHAR(100);

UPDATE books
SET full_name = CONCAT(author_fname, ' ', author_lname);
-- CONCAT_WS(' ', 'A', 'B') | 첫번째 파라미터가 연결 문자열

select title, released_year, full_name from books;

-- 1~10번째 자리
select substring(title, 1, 10) title, pages, released_year from books;

-- 뒤에서 5번째 자리
select substring(title, -5) from books;

-- 3번째부터 끝까지
select substring(title, 3) from books;

select replace(title, 'The', 'Hello') from books;
select replace(lower(title), 'the', 'hello') from books;

select reverse(author_fname) from books;

-- 임의의 컬럼 length
select char_length(title) length, title from books;

select concat(substring(title, 1, 10), '...') substring from books;

select replace(title, ' ', '->') practice001 from books;

insert into books
(title, author_fname, author_lname, released_year, stock_quantity,
pages)
values
('10% Happier', 'Dan', 'Harris', 2014, 29, 256),
('fake_book', 'Freida', 'Harris', 2001, 287, 428),
('Lincoln In The Bardo', 'George', 'Saunders', 2017, 111, 388);

-- 데이터를 유니크하게 만드는 함수 | distinct
select * from books;
select distinct(author_lname) from books;
select distinct(concat(author_fname, ' ', author_lname)) full_name from books;

-- select 함수() as new_name; | as는 생략 가능

-- 기존에 만든 컬럼 제거
ALTER TABLE books DROP COLUMN full_name;

-- 정렬 | order by | asc, desc
select *, concat(author_fname, ' ', author_lname) as full_name from books order by full_name desc;

SELECT * FROM books ORDER BY author_fname ASC, pages DESC;

-- 데이터의 갯수가 많아서 데이터를 끊어서 가져오는 방법 | paging
-- limit 시작 인덱스(0부터 시작), 범위
-- 처음부터 5개 가져오기 | 1 page
select * from books limit 0, 5;
-- 인덱스 6부터 5개 가져오기 | 2 page ...
select * from books limit 5, 5;

-- 백엔드 api에서 페이징을 통해 데이터 가져오는 방식
-- 프론트엔드에서는 페이징할 범위를 백엔드 api에 요청

-- 처음부터 12개 가져오기
select * from books limit 12;

-- 출판년도를 내림차순으로 정렬, 처음부터 7개의 데이터를 가져오시오
select * from books order by released_year limit 0, 7;

-- contains | like는 =과 기능이 같아보이지만 알고리즘이 다르다
-- %는 해당 위치에 어떤 내용이 있어도 상관 없다는 뜻 | 정규식 %까지 활용하여 작성
select * from books where lower(title) like '%the%';

-- 시작이 the로 시작하는 데이터를 가져오시오
select * from books where lower(title) like 'the%';

-- 끝이 the로 끝나는 데이터를 가져오시오
select * from books where lower(title) like '%the';

-- stock_quantity컬럼의 데이터가 2자리라면 가져오기
select * from books where stock_quantity like '__';

-- select from 조회
-- where 조건 and or...
-- like ~처럼
-- order by 정렬
-- limit 제한
select * from books where pages > 100 and lower(title) like '%the%' order by stock_quantity desc limit 3;

select * from books where lower(title) not like '%talk%';

-- 고유한 값 distinct
select author_lname from books;
select distinct author_lname from books;

-- 갯수만 출력
select count(author_lname) from books;
select count(distinct author_lname) from books;

-- 서브쿼리 | 쿼리 안에 쿼리 사용
-- 예제 SELECT column1, column2, (SELECT subquery_column FROM another_table WHERE condition) AS subquery_result FROM your_table;

-- having | group by만의 조건절
-- 예제 SELECT department, COUNT(*) AS employee_count FROM employees GROUP BY department HAVING employee_count > 10;

-- ______________________________________________________________________________________________________________

-- 전체 조회
select * from books;

-- 실습 문제 001
select title from books where lower(title) like '%stories%';

-- 실습 문제 002
select title, max(pages) as pages from books;

-- 실습 문제 003
select concat(title, ' - ', released_year) as summary from books order by released_year desc limit 3;

-- 실습 문제 004
select title, author_lname from books where author_lname like '% %';

-- 실습 문제 005
select title, released_year, stock_quantity from books order by stock_quantity asc limit 3; -- asc는 생략 가능

-- 실습 문제 006
select title, author_lname from books order by author_lname, title;

-- 실습 문제 007
select concat('My favorite author is ', author_lname) as yell from books order by author_lname asc;

-- 실습 문제 008
select * from books where released_year < 1980;

-- 실습 문제 009
select * from books where lower(author_lname) = 'eggers' or lower(author_lname) = 'chabon';

-- 실습 문제 010
select * from books where lower(author_lname) = 'lahiri' and released_year > 2000;

-- 실습 문제 011
select * from books where pages >= 100 and pages <= 200;
-- 또는
select * from books where pages between 100 and 200;

-- 실습 문제 012
select * from books where author_lname like 'C%' or 'S%';

-- 실습 문제 013
-- case when then else 문
select
    title,
    author_lname,
    case
        when lower(title) like '%stories%' then 'Short Stories'
        when lower(title) = 'just kids' then 'Memoir'
        when lower(title) like '%heartbreaking%' then 'Memoir'
        else 'Novel'
    end as TYPE
from
    books;

-- 실습 문제 014
select 
    concat(author_fname, ' ', author_lname) as full_name, 
case
	when count(*) = 1 then '1 book'
    when count(*) >= 2 then '2 books'
    else 'The book does not exist.'
    end as COUNT
from 
    books 
group by 
    full_name;
-- 또는
select title, author_lname, 
if(count(title) = 1, concat(count(title), ' book'), concat(count(title), ' books')) as COUNT
from books
group by author_fname, author_lname
order by author_lname;

-- 실습 문제 015
-- group by로 지정한 컬럼을 기준으로 그룹핑
-- count() | 갯수를 리턴
-- * | 모든 컬럼
select released_year as year, count(*) as books, avg(pages) as avg_pages from books group by released_year order by released_year;

-- ______________________________________________________________________________________________________________

-- 서브 쿼리 활용
-- sub query를 이용하여 stock_quantity가 최소값인 데이터들 조회
select * from books where stock_quantity = (select min(stock_quantity) from books);

-- having 활용
-- released_year별로 그룹핑하되 pages가 300 이상인 데이터만 조회
select released_year, pages from books group by released_year having pages > 300 order by released_year;

-- is null 활용
-- 일부러 stock_quantity만 null인 값을 추가
insert into books (title, author_fname, author_lname, released_year, stock_quantity, pages) values ('The Flowers', 'Neil', 'Gaiman', 2017, null, 324);
-- 전체 조회시에는 조회가 되지만
select * from books;
-- where문에서 =으로 조건 조회하면 에러가 발생하지 않고 작동하지만 실제로는 조회가 되지 않음
select * from books where stock_quantity = null;
-- 그래서 값이 null인지 확인할 때에는 = null이 아니라 is null로 확인해야 함
select * from books where stock_quantity is null;
-- 회사 근무 시에 이런 실수를 많이 하기 때문에 주의해야 한다.

-- 년도가 2000이상인 데이터에서 년도별 stock_quantity의 평균값이 70보다 큰 책들의 년도와 평균값을 조회한 후 평균 stock_quantity를 기준으로 내림차순으로 정렬
-- where은 데이터 값에 대한 조건 | 집계 함수를 사용할 수 없음
-- having은 그룹핑에 대한 조건 | 집계 함수를 사용할 수 있음
select released_year, avg(stock_quantity) as avg_stock from books where released_year >= 2000 group by released_year having avg(stock_quantity) > 70 order by avg_stock desc;

-- 출판년도가 2000년 이상인 책들은 '최신 책'이라고 하고, 그렇지 않은 책들은 '예전 책'이라고 하여 type 컬럼을 만드시오
-- case end문 안에 when then else문 활용
select *,
case
	when released_year > 2000 then '최신 책'
	else '예전 책'
end
as type
from books;

-- 재고수량이 0이상 50 이하라면 *
-- 재고수량이 51이상 100 이하라면 **
-- 그 이외의 경우라면 ***
-- 컬럼명은 stock
select *,
	case
		when stock_quantity between 0 and 50 then '*'
        when stock_quantity between 51 and 100 then '**'
        else '***'
	end as stock
from books;

-- 기존 컬럼의 데이터를 가지고 2가지의 조건으로만 확인하는 경우는 if() 함수를 사용해도 됨
-- 즉, 2가지로 파악할 때에는 if함수가 훨씬 편함
-- pages 컬럼의 값이 300보다 크면 '긴 책'이라고 하고 그렇지 않으면 '짧은 책'이라고 하여 새로운 컬럼 book_type을 만드시오
select *,
if(pages > 300, '긴 책', '짧은 책') as book_type
from books;

-- null인 항목을 다른 값으로 채우는 방법
-- ifnull()함수를 사용
-- stock_quantity가 null인 데이터 확인
select * from books where stock_quantity is null;
-- ifnull()함수를 이용하여 null인 값을 0으로 채운 후 조회
select id, title, author_fname, author_lname, released_year,
ifnull(stock_quantity, 0) as stock_quantity, pages
from books;