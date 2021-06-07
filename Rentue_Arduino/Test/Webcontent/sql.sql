create table wifi(
chars varchar2(100),
flon varchar2(100),
flat varchar2(100)
)

create table wifi(
chars varchar2(100),
flon varchar2(100),
flat varchar2(100),
w_date date
)

select *
from(
	select *
	from wifi
	order by w_date desc
)
where rownum = 1



create sequence num_wifi -- 시퀀스 이름
increment by 1 --증감숫자(기본값 : 1)
start with 1 -- 시작숫자
minvalue 1 -- 최소값
maxvalue 100 -- 최대값
nocycle; --최대값 도달 시 다시 시작할 것인지?

drop table wifi

select * from wifi

desc wifi
