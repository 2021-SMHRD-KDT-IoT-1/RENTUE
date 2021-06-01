create table rent_member(

	rent_id varchar2(20),
	ct_id varchar2(20),
	rent_pw varchar2(20) not null,
	rent_name varchar2(20),
	rent_num varchar2(20),
	rent_addr varchar2(50)
);

create table ct_member(
	
	ct_id varchar2(20),
	ct_pw varchar2(20) not null,
	ct_addr varchar2(50)

);

create table device(

device_num number(20),
rent_id varchar2(20),
ct_id varchar2(20),
device_type char(1),
rent_state char(1) default 'F',
broken char(1) default 'F'

);

create table contact (

 msg_num number(20),
 rent_id varchar2(20),
 msg_title varchar2(20),
 msg_text varchar2(100),
 msg_file varchar2(20)
 
);



-- ��Ʈ pk

ALTER TABLE rent_member ADD CONSTRAINT PK_RENT_MEMBER PRIMARY KEY(
rent_id
);

-- ȸ�� pk

ALTER TABLE ct_member ADD CONSTRAINT PK_CT_MEMBER PRIMARY KEY(
ct_id

);

-- ��� pk
ALTER TABLE device ADD CONSTRAINT PK_DEVICE PRIMARY KEY(
device_num

);

-- �޽��� pk

ALTER TABLE contact ADD CONSTRAINT PK_CONTACT PRIMARY KEY(
msg_num

);


-- ȸ�� ������ fk

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


select * from rent_member;

select * from ct_member;

select * from device;

select * from contact;



drop table rent_member;

drop table ct_member;

drop table device;

drop table contact;
