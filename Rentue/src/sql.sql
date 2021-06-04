create table ct_member(
   
   ct_id varchar2(20) PRIMARY KEY,
   ct_pw varchar2(20) not null,
   ct_name varchar2(50) not null,
   ct_addr varchar2(100),
   lon number,   -- 경도
   lat number -- 위도
);

create table rent_member(

   rent_id varchar2(20) PRIMARY KEY,
   rent_pw varchar2(20) not null,
   rent_name varchar2(50),
   rent_num varchar2(20),
   rent_addr varchar2(100),
   ct_id varchar2(20),
   CONSTRAINT fk_ct_member_to_rent_member FOREIGN KEY(ct_id)
   REFERENCES ct_member(ct_id) ON DELETE SET NULL
);

create table device(

device_num number(20) PRIMARY KEY,
rent_id varchar2(20),
device_type char(1),
rent_state char(1) default 'F',
broken char(1) default 'F',
CONSTRAINT fk_rent_member_to_device FOREIGN KEY(rent_id)
REFERENCES rent_member(rent_id) ON DELETE SET NULL
);

create table contact (

 msg_num number(20) PRIMARY KEY,
 rent_id varchar2(20),
 msg_title varchar2(20),
 msg_text varchar2(100),
 msg_file varchar2(20)
 
);

create sequence device_num increment by 1 start with 1;


CREATE OR REPLACE FUNCTION RADIANS(nDegrees IN NUMBER) RETURN NUMBER DETERMINISTIC IS
BEGIN
   RETURN nDegrees / 57.29577951308232087679815481410517033235;
END RADIANS;
   -- radians = degrees / (180 / pi)
   -- RETURN nDegrees / (180 / ACOS(-1));

-- 현재 기준좌표 스마트인재캠퍼스, ct_member에 저장되어 있는 좌표값과의 직선 거리 반환(단위 km)
-- 렌탈업체가 입력한 주소를 API와 연동하여 자동으로 좌표를 받아와 해당 좌표를 기준으로 계산해야 함
SELECT ct_id, (6371 * acos( cos( RADIANS(35.1498791)) * cos( RADIANS(lat))
   * cos( RADIANS(lon) - RADIANS(126.919844))
   + sin( RADIANS(35.1498791)) * sin( RADIANS(lat)))) AS distance
FROM ct_member
ORDER BY distance;

-- 계산결과를 바탕으로 가장 가까운 것부터 정렬하여 첫번째 컬럼만 뽑아옴
SELECT ROWNUM, x.ct_id, x.ct_name
FROM (SELECT a.ct_id, a.ct_name, (6371 * acos( cos( RADIANS(35.1498791)) * cos( RADIANS(lat))
   * cos( RADIANS(lon) - RADIANS(126.919844))
   + sin( RADIANS(35.1498791)) * sin( RADIANS(lat)))) AS distance
FROM ct_member a
ORDER BY distance) x
WHERE ROWNUM<=3;




select * from rent_member;

select * from ct_member;

select * from device;

select * from contact;


drop table device;

drop table contact;

drop table rent_member;

drop table ct_member;

-- 테스트용 db 구축
insert into ct_member values('dolmeori', 111, '돌머리해수욕장', '전남 함평군 석성리 523-1', 126.440650, 35.0864430);
insert into ct_member values('byeonsan', 111, '변산해수욕장', '전북 부안군 변산면 변산로 2100', 126.529650, 35.6776313);
insert into ct_member values('yulpo', 111, '율포해수욕장', '전남 보성군 회천면 우암길 24', 127.088538, 34.6699838);
insert into ct_member values('daecheon', 111, '대천해수욕장', '충남 보령시 머드로 123', 126.510837, 36.3155558);
insert into ct_member values('hakdongmongdol', 111, '학동몽돌해변', '경남 거제시 동부면 학동6길 18-1', 128.640243, 34.7733192);
insert into ct_member values('gwakji', 111, '곽지해수욕장', '제주특별자치도 제주시 애월읍 곽지리 1565', 126.303153, 33.4485033);
insert into ct_member values('songdo', 111, '송도해수욕장', '부산 서구 암남동 135-5', 129.016360, 35.0739632);
insert into ct_member values('eurwangni', 111, '을왕리해수욕장', '인천 중구 을왕로13번길 12', 126.373040, 37.4460816);
insert into ct_member values('jebudo', 111, '제부도해수욕장', '경기 화성시 서신면 제부리 190-10', 126.617911, 37.1646043);
insert into ct_member values('jinha', 111, '진하해수욕장', '울산 울주군 서생면 진하리 307-2', 129.347753, 35.3856901);
insert into ct_member values('goraebul', 111, '고래불해수욕장', '경북 영덕군 병곡면 병곡리 58-26', 129.410588, 36.5990555);
insert into ct_member values('gyeongpo', 111, '경포해변', '강원 강릉시 장해로 514', 128.907369, 37.8056863);
insert into ct_member values('jeongdongjin', 111, '정동진해수욕장', '강원 강릉시 강동면 정동진리 64-3', 129.027017, 37.6843303);

insert into rent_member values('admin', 111, '스마트렌트', '563-88-00950', '광주 동구 예술길 31-15', 'dolmeori');
insert into rent_member values('rent', 111, '돌머리렌트', '531-77-05796', '전남 함평군 함평읍 돌머리길 355-177', 'dolmeori');

-- A:튜브, B:핸디 라 가정
insert into device values(device_num.nextval, 'admin', 'A', 'F', 'F');
insert into device values(device_num.nextval, 'test', 'B', 'F', 'F');

select * from device where rent_id='test';
select * from rent_member where ct_id='dolmeori';

insert into rent_member values('admin', 111, '스마트렌트', '563-88-00950', '광주 동구 예술길 31-15', 'dolmeori');

