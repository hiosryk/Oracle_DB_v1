--<수업 3.5> 인설트
--데이터속성
--number (n,m)  n:자릿수(뒤에 소수점까지 합해서), m:소수점 
--char(n)  와 varchar(n)


--ex char(10) max길이 2000바이트
--      4글자를 적어도 10칸 그대로 공간이 잡혀있다.
--java라고 저장했다가 java2로 바꾸고싶으면 여유공간이 그대로 남아있으니까
--데이터가 자주 업데이트 되는경우. 좀더 구체적으로 말하면 
--회원가입을할때 네이버의 주소는 바꿀일이 거의없으니까(vc2) 쇼핑몰주소는 내가 배송지를 바꿀수있으니까(vc) 정해진것은없다.
--검색을위한것은 char가 안된다. (*공간을 같이잡아줘야대니까?)
--  varchar2(10) max길이 4000바이트
--    4글자 적으면 6칸이 남음 (효율적으로 공간을 만들어줌)
--java라고 저장했다가 java2로 바꾸고 싶으면 연결고리를만들어서 2를 가져온다. 
--
--long 2gb 가변길이 문자 데이터 (오라클에서는 쓰지말라고한다. 권장사항으로 느려지니까)
--lob 4gb의 텍스트, 동영상, 이미지, 사운드 
--blob를 바이너리 라지 오브젝트 - 쉽게생각해서 파일. (영화 사진 이런거 다 저장가능) - 프로그램상에서 입출력을 해야댐.
                                                                                -- 어렵다. 실질적으로 할일이 없다.
                                                                                --이걸 언제쓸까? 
                                                                                --대학교나회사에서 학생증 사원증같은것들
                                                                                --유실되면 안대는것들
                                        --영속성을 보장받는방법. 두가지. 파일을 이용하는 방법 데이터베이스를 이용하는방법.
                                        --저장 찾아서 수정하고 검색하기가 힘들다. 그래서 데이터베이스쓴다.


--clob  캐릭터 라지 오브젝트 - 문자열중에 큰거 - 이게 프로그램단에서 쓰려면 까다로웠다. 지금은 문제없다. 


--date 날짜. 
--timestamp 일반적으로 데이트로 쓴다. 잘안쓴다.
--rowid 몰라도 된다. 




--*한글의 종류 두가지.(한글은 2바이트다.)
--케잌. 콘솔라스체
--케 .  휴먼옛체


--완성형한글 조합형한글


--ksc5601 코리아스텐다드셋  == euc-kr   2byte      '이거는 한글만 가능하다.'-우리나라사이트들은 과거에 이걸로 만들었엇다.
--우리나라에서만든거 == 국제표준화기구에서만든거 (실질적으로 거의같다고보면댐)
--char는 1000글자.  


-- utf-8 : 유니코드 글자체계 전세계있는 모든문자를 처리할수있다. 중동같은 꼬부랑글자 한글도가능 아프리카 모든문자 가능.
--한글을 쓴다라는개념보다는 그린다고 생각하면댄다. 
-- 한글 3byte로 처리한다.


--char 는 666글자. 




--테이블 만들기
------첫번째테이블-----
--create table table-name
--회원 (필수)  member
--(
--이름         name            varchar2(30)
--아이디       id              vachar2(16)  
--비밀번호     pass            vachar2(16)
--나이         age             number(3)
--이메일아이디 email           vachar2(30)        
--이메일도메인 emaildomain     vachar2(30)
--가입일       joindate        date
-- );
-------두번째테이블----
--create table member_detail
--회원 상세정보 member_detail
--(
--아이디         id              vachar2(30)
--우편번호     zipcode           vachar2(5)             --넘버가아닌이유. 01234 면 1234로 처리해버리니까
--일반주소     address           vachar2(100)
--상세주소     address_detail    vachar2(100)
--전화번호1     tel1             vachar2(3)
--전화번호2     tel2             vachar2(4)
--전화번호3     tel3             vachar2(4)
-----);
--*테이블의 이름은 언더바외에 숫자,특수문자 안됩니다.




--지울때는 drop 테이블
--delete는 안에있는 데이터만 지워라.


--drop table member;
--drop table member_detail;


--참조 되어있기때문에 자식부터 없애야댐. 참조가 되어지는곳부터 지우고 
--cascade 강제로 지울때 (쓰지마라 . 못지울정도로 거미줄이면 그건 테이블을 잘못만든거다. 순서대로 지울수있게 테이블을 만들자)


create table member
(
    name varchar2(30) not null,
    id varchar2(16) ,
    pass varchar2(16) not null,
    age number(3) check (age <150),
    email varchar2(30),
    emaildomain varchar2(30),
    joindate date default sysdate,
    constraint member_id_pk primary key (id)
);


create table member_detail
(
    id varchar2(30),
    zipcode varchar2(5),
    address varchar2(100),
    address_detail varchar2(100),
    tel1 varchar2(3),
    tel2 varchar2(4),
    tel3 varchar2(4),
    constraint member_detail_id_pk foreign key (id) references member (id)
);




--있던 테이블 그대로 복사 (서브쿼리가 가능하다는것ㅇ들 보여줒는 예. 복사할일이 많지는 안겠찌만.)
create table emp_all
as 
select * from employees;
--------------------------------------------------------------------------------
--테이블 구조만 그대로 가져오고싶어 데이터는 빼고.
create table emp_blank
as 
select * from employees 
where 1=0;
--구경해보자 
select * from emp_blank;
------------------------------------------------------------------
--이런식으로도  가능하다는것을 보여주는예 
create table emp_50
as
select e.employee_id eid, e.first_name name, e.salary sal, d.department_name dname
from employees e, departments d
where e.department_id = d.department_id
and e.department_id = 50;
--구경해보자
select * from emp_50;
---------------------------------------------------------------
--user_constraints
--제약조건 거는방법두가지 
--컬럼레벨 테이블 레벨 지금은 설명하기힘들고 다이어그램으로 설명해줌나중에
--지금은. 
--이름 조건. 낫널 


---------------------------------------------
--DDL 데이타 데피니션 랭귀지  
--DML 데이타 메니플레이션 렝귀지 데이타 조작어 : 인서트, 업데이트, 딜리트, 머지
--insert
insert into member
values ('김형섭','hiosryk','1234',29,'hiosryk','naver.com',sysdate);
--확인해보자--
select * from member;
-----------------------------
insert into member
values ('hong','김형섭','25',129,'hiosryk','naver.com',sysdate);
--앗 순서가 실수로 바뀌엇네?
--순서를 명시적으로 지정 




insert into member (id,name,age,pass,email,emaildomain,joindate)
values ('hong','김형섭','25',129,'hiosryk','naver.com',sysdate);




insert into member (id,name,age,pass,email,emaildomain,joindate)
values ('hong','김형섭', 123, sysdate);


--에러는 빨리 외우자 not enough values 집어넣으려는 컬럼과 데이터가 일대일 쌍이아니네. 
insert into member (id,name,age,joindate)
values ('hong2','김형섭이', 123, sysdate);


insert into member (id,name,age,joindate)
values ('hong2','김형섭3', 123, sysdate);


insert into member (id,name,age,pass,email,emaildomain,joindate)
values ('hello','김아무개',17,1234,'emalss','google.com',sysdate);




insert into member_detail (id, zipcode, address, address_detail, tel1, tel2, tel3)
values('김형섭', '12123', '서울', '상도동', 010, 124, 1234);
--
insert into member_detail (id, zipcode, address, address_detail, tel1, tel2, tel3)
values ('hello',);
 
---------------------------------------


select *
from member m , member_detail d 
where m.id = d.id;


insert into member
values ('아무투', 'satt','a12312',35,'shshs','naver.com',sysdate);


--하나의테이블에 여러개의 인서트를 할수잇다.
insert into member(name,id,pass,age,email,emaildomain,joindate)
values ('오라클','oracle','a12345678',29,'oracle','oracle.com',sysdate);


insert into member_detail (id, zipcode, address, address_detail, tel1, tel2, tel3)
values('oracle5', '12345', '오라클밸리', 'oracle연구소', 010, 124, 1234);
-----------------------하는법
insert all 
    into member(id,name,age,pass,email,emaildomain,joindate)
values ('oracle7','오라클2',29,'a12345678','oracle','oracle.com',sysdate)
    into member_detail (id, zipcode, address, address_detail, tel1, tel2, tel3)
values('oracle7', '12345', '오라클밸리', 'oracle연구소', 010, 124, 1234)
select * from dual;


select * from member;
select * from member_detail;


--update


--delete


--merge 는 내일