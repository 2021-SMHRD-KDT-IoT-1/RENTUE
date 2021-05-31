create table rent_member(

	rent_id varchar2(20),
	ct_id varchar2(20),
	rent_pw varchar2(20),
	rent_name varchar2(20),
	rent_num varchar2(20),
	rent_addr varchar2(50)
)
select * from rent_member

create table ct_member(
	
	ct_id varchar2(20),
	ct_pw varchar2(20),
	ct_addr varchar2(50)

)
select * from ct_member


create table device(

device_num number(20),
rent_id varchar2(20),
ct_id varchar2(20),
device_type char(1),
rent_state char(1),
broken char(1)

)

select * from device

drop table device

create table contact (

 msg_num number(20),
 rent_id varchar2(20),
 msg_title varchar2(20),
 msg_text varchar2(100),
 msg_file varchar2(20)
 
)



/ 렌트 pk

ALTER TABLE rent_member ADD CONSTRAINT PK_RENT_MEMBER PRIMARY KEY(
rent_id
);

/ 회원 pk

ALTER TABLE ct_member ADD CONSTRAINT PK_CT_MEMBER PRIMARY KEY(
ct_id

);

/ 기기 pk
ALTER TABLE device ADD CONSTRAINT PK_DEVICE PRIMARY KEY(
device_num

);

/ 메시지 pk

ALTER TABLE contact ADD CONSTRAINT PK_CONTACT PRIMARY KEY(
msg_num

);


/ 회원 관제소 fk

ALTER TABLE rent_member ADD CONSTRAINT FK_CT_MEMBER_TO_RENT_MEMBER FOREIGN KEY(
ct_id
) 
REFERENCES ct_member(
ct_id
)

ALTER TABLE device ADD CONSTRAINT FK_RENT_MEMBER_TO_DEVICE FOREIGN KEY(
ct_id
) 
REFERENCES ct_member(
ct_id
)

drop table contact
