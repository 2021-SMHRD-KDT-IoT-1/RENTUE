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



create sequence num_wifi -- ������ �̸�
increment by 1 --��������(�⺻�� : 1)
start with 1 -- ���ۼ���
minvalue 1 -- �ּҰ�
maxvalue 100 -- �ִ밪
nocycle; --�ִ밪 ���� �� �ٽ� ������ ������?

drop table wifi

select * from wifi

desc wifi
