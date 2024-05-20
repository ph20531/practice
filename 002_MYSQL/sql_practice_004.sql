use yhdb;

insert into comment (content, createdAt) values ('정말로 너무 좋습니다. 다음에 또 사용할 의사가 있습니다.', now());

-- createdAt의 기본값 | now() | CURRENT_TIMESTAMP
-- createdAt을 보통 쿼리로 입력하지 않고 테이블 컬럼 기본 값에서 now()를 입력하면
-- 자동으로 CURRENT_TIMESTAMP로 바뀌는데 이렇게 만들면 insert할 때마다 자동으로 현재 시간이 적용된다.
insert into comment (content) values ('최고~');

-- updateAt의 기본값 | now() on update now() | CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
-- 이렇게 하면 기본적으로 now()값을 적용하지만 update문이 실행될 때마다 현재시간 now()를 적용한다.

-- 일단 생성시에는 createdAt, updateAt 둘다 기본적으로 now()
-- '3', '너무 좋아요.', '2024-05-16 01:48:53', '2024-05-16 01:48:53'
insert into comment (content) values ('너무 좋아요.');

-- 하지만 update문 사용 시에는 updateAt만 now()를 다시 적용
-- '3', '최고로 좋습니다.', '2024-05-16 01:48:53', '2024-05-16 01:50:39'
update comment set content = '최고로 좋습니다.' where id = 3;

-- 결과적으로 이렇게 해야 우리가 흔히 사용하는 코멘트 시스템을 개발할 수 있다.
-- 정리해보자면
-- createdAt | CURRENT_TIMESTAMP
-- updateAt | CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
-- insert, update할 때는 comment만 입력 | 기본값 셋팅으로 인해 자동적으로 코멘트 시스템이 작동한다.
select * from comment;