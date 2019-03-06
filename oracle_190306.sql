테이블 만들엇다가 드랍했던것들이 쌓인걸 보자.
select * from tab
;
지워보자.
purge recyclebin;
--bin으로 시작하는 삭제된 테이블들( 완전 삭제)
--뭔가를 지울때 항상 조심해라. 




select *
from emp_blank;
--blank 테이블 에다가 employees 테이블에 있는 부서번호가 80번인 사원들의 정보를 넣고싶다.




--다른테이블에있는것을 인서트하는법. 서브쿼리를 이용해서 인서트를 할수가있따. *가 가능한이유는 어짜피 blank와 * 구조가 똑같으니까.
insert into emp_blank
select *
from employees
where department_id = 80;
--100번 사원의 사번 이름 직책 부서번호
--emp_blank 에 삽입
insert into emp_blank(employee_id,first_name,last_name,email,job_id,hire_date,department_id)
 
select employee_id, first_name, last_name, email, job_id, hire_date, department_id 
from employees
where employee_id = 100;
--서브쿼리 할때 not null 안했죠. 카피 할때 원본 테이블의 제약 조건도 똑같이 가져온다. 낫널 되있는 것도 다 가져온다.
--인서트 딜리트 업데이트 할때 제약 조건을 따라서 가져온다.
--서브쿼리를 어떻게 만드느냐에 따라서 여러가지 인서트 할 수 있겠다.


--update 알아볼거임. 테이블에 데이터 좀 채워주고
insert into member(name,id,password,age,email,emaildomain,joindate)
values ('java2','byebye','a12345678',40,'sscle','oracle.com',sysdate);
 
insert into member_detail(id,zipcode,address,address_detail,tel1,tel2,tel3)
values ('java2','12312','서울서울서울','집집집','123','123','123');
select * from member;
select * from member_detail;
--update하면 커밋꼭하자.
update member
set password = '1234'
where id = 'java2';  (조건안달아주면 비밀번호 다바뀜)


연습
--'java2' 의 비번을 2222 으로 나이 22 변경
update member
set password = '2222', age= 22
where id = 'java2';
--'java3' 의 비번을 3333으로 나이는 아이디가 oracle 인사람하고 똑같이 같게 변경
update member
set password = '3333', age = (select age from member where id = 'oracle') 
where id = 'java3';
--'java2' 의 zipcode를 11111로 변경


update member_detail
set zipcode = (select zipcode from member_detail where id = 'oracle')
where id = 'java3';
----------
update member
set name = 'third'
where id = 'java3';


select*from member_detail;


update member
set email = '세번쨰'
where id = 'java3';


select* from member;


--업데이트 할때 조건을 안달면 모든 데이터가 다 바뀐다. 조심하자
--member테이블의 id를 못바꾸는 이유 member_detail 데이터에 참조가 안되니까. 프라이머리키여서라기보다는


commit;
rollback;       
--delete
delete member_detail;
--delete [from] member
--간혹 물어보는 분들이 있어서, insert all 처럼 한번에 delete all로 하는거는 없어요. 따로따로 처리해야대요.
--merge 알아보자. (쓸일은 많지않을꺼임.)
예시용 테이블 만들고
drop table product;
 
create table product
(
pid number,
pname varchar2(10),
cnt number,
price number,
constraint product_pid_pk primary key (pid)
 
);


데이터 넣어주고
insert into product (pid,pname,cnt,price)
values (100,'새우깡',100,1500);
 
insert into product (pid,pname,cnt,price)
values (200,'꼬북칩',100,2700);
 
insert into product (pid,pname,cnt,price)
values (300,'빼빼로',120,1000);
확인해보고
select * from product;


--상품코드가 400인 자갈치 1200 150개 입고  (인설트이고)
-- 상품코드가100인 새우깡 1500 50개 입고    (업데이트이긴하지만)  
--포스기라고생각을하고 편의점 알바라고 생각을 해보자. 데이터베이스에 뭐가있는지 없는지 모른다.
--1.셀렉트를해라. 이게 여기잇는지를 찾아봐야댄다.
--2.있으면 업데이트해라, 없으면 인서트해라. 


--셀렉트한번해라 
--프로그램의 if / 오라클의 case when then 
--400번인 상품이 있다면 업데이트, 없다면 인서트
--이럴때쓰는게 merge 다. 근데 잘안써. 인터넷에서 찾아보고 쓴다.
merge into product
using dual
on (pid = 400)
when matched then 
update set cnt = cnt + 150 
when not matched then 
insert (pid,pname, cnt, price)
values (400, '자갈치', 150, 1200);
merge into product
using dual
on (pid = 100)
when matched then 
update set cnt = cnt + 50 
when not matched then 
insert (pid,pname, cnt, price)
values (100, '새우깡', 50, 1500);
commit;
select * from product;


update product 
set cnt = 800
where pid = 100;


rollback;


--업데이트를 하면. 원래 하드에 150잇는것을 메모리에 올린테이블에 200으로 바꾼다. 
-- 처음 접속한 사람이 작업이 끝나기전까지 락이 걸린다. 
--작업이 끝난것을 알려주는게 transaction 하나의작업단위 . 나는작업이끝낫다라고 생각하면댐
--commit 나 정상적으로했어, rollback 나 되돌려줘 
--
commit;
--commit 하자마자 다른데 접속한데가 처리된다.
--어려운것은 없지만. 
--문제가 커밋을 안하고 다른작업을 하면 락이거린다.
--락이 걸린상태에서 꺼버리면 어케될까. 
--다시 열어가지고 커밋하면 될까요? 노노 다시 들어가면 새로운 세션이 열리지.
--그래서. 여러분이 할일이 없겟지만 락을 풀어줘야댄다.
--결론 락이 걸리면 골치아프다.
--update나 delete를 하면 commit을 꼭해준다.
--데이터베이스를 껐다켜도 락이 풀리기는한다. 하지만 네이버가 서버를 내릴순없겟지.
--developer 에서 업데이트 딜리트하다가 이클립스에서 또 업데이트하다가 실수할수있다.
--
insert into product
values (101, '조개깡', 150, 1500);


insert into product
values (102, '문어깡', 250, 1500);


insert into product
values (103, '고래깡', 55, 1500);


savepoint a ;


insert into product
values (104, '한우깡', 58, 1500);


insert into product
values (105, '한돈깡', 120, 1500);


savepoint b;


insert into product
values (106, '버섯깡', 120, 1500);


insert into product
values (107, '차돌깡', 220, 1500);


select * from product;
rollback to b;
--세이브 포인트지점까지는 확실히 실수 없이 했다. 커밋. 실수가있따 세이브포인트 투로 돌아간다.
--커밋.롤백,세이브포인트. 세개 다 잘기억하자.
--커밋  롤백 둘중하나는 꼭해야한다.
--시퀀스 단계 연속적인 일련번호같은것들 
--sequence
create sequence product_pid_seq
start with N1 increment by N2 ;
--with N1부터 by N2 씩 증가시켜라


delete product;
commit;
rollback;
select * from product;
insert into product(pid,pname,cnt,price)
values (product_pid_seq.nextval,'이름',10,1000);


select product_pid_seq.nextval
from dual;
select product_pid_seq.nextval, product_pid_seq.nextval,product_pid_seq.currval
from dual;
select product_pid_seq.currval
from dual;


--create를 drop 한것은 rollback이 안댄다. 트랜잭션은 dml에서만 댄다 (인서트 업데이트 딜리트)
--seq 는 전진만한다. 
--중요한것은. 시퀀스는 일련번호만들때 많이 사용하는데, 커밋이나 롤백하고 전혀 상관이없다. 한가지 더보여줄게.
--nextval은 다음값얻어와라잖아  currval 은 현재값 얻어와라.
--currval 절대 쓸일없다. dba 입장에서도 쓸일이 거의 없을거임. 셀렉트할때는 절대 쓸일없다.
-- 
create sequence product_pid_seq
start with N1 increment by N2 ;


select product_pid_seq.currval
from dual;
만 알아두면댄다.


--인덱스. 알아두면좋다.
--수업을 하기가 애매하다.
--간단한예제는 봐봐야 의미가업다.
--어케쓰느냐에 따라서 속도적인 차이가 많이난다.
--데이터를 적어넣을때 각각에 집어넣을때 인덱스라는것을 걸수가있따.
--걸때 장점이 검색속도가 빨라진다.
--잘사용하면 좋겟지?
--자바라는 단어가 500페이지에 잇다고치자.
--500가니까 자바가 없어.
--그러면 1페이지부터 다시 뒤지겟지?
--결과적으로 501페이지잇엇으면?
--잘못쓰면 오히려 느려진다. 신입한테는 이런거 요구하지않는다.
--뭔지만 알면댄다.
--정상적인 데이터로 하면 빨리찾을수있지만
--데이터마다 인덱스를 걸수 있는데
--외려 오류나면 더 느릴수가있습니다.
--procesure language
--언어해보신분들 반복문 조건문 
--procesure 절차.
--위에서부터 차근차근 실행.
--하다보니까 여러번하네? 반복문
--이럴때하지마라 저럴때하지마라 조건문
--이게뭐다 plsql 
--쿼리문을 완벽하게짜는것도아니고 지금공부해봣자 의미없다.
--자바공부한뒤에 보세요. 
--신입개발자한테 procesure 할일없다.
--dba가 호출하면 준다. 알려준다. 어케만드는지 알필요가없다. 
--자바를 공부하고나서 . 자세히나온 것을 봐야한다. 이책은 구데기다.
--오늘부터 3주~4주 이상은 오라클안한다.
--나는 모자라. 3주동안 따라오면댄다.
--자바와 오라클을 병행하자. 배분을 잘하자.
--오라클공부한다고 자바놓치면 끝이야.
--그날배운거를 기준으로 하자.
--오라클보다 자바가 당연중요함.
--주의해서 쓰시면댈것같다.
어렵습니당.
프로젝트에서
참조하는 사이트 의 다양한 접근.
식별 비식별. 명확하지않다.
이론적으로는가능한데
실제로 테이블을 만들어보면
 
테이블을 만드는사람의 의도. 
 
오라클 발표할만한게 이거밖에업음. 토의할만한주제.
 
명확하게 되있는것들.
딱 정형화되있는것들 발표.
혼동은없을것이다.
 
지금당장은 필요없는데 3주정도후에 물론 더빨리한다. 1주정도후에 슬슬 프로젝트 얘기할거임. 자바배우지도않는데
자바를 다안배워도 프로젝트 주제설정할수잇죠. 대충 어떤식으로 만들지에대한 의견.
화면누르면 어떤일이잇ㄹ어나고
 
포스기같은거 관심잇게보고. 외형적인것들. 화면을 뿌리기위한. 로직을돌리려면 테이블이필요하지.
 
저런프로그램만들려면 테이블이 어케되야댈까? 
실제주제선정. 
 
화면을 자바를 배운담에 화면구성하는걸 그때 가서 하는게아니라.
종이로그리든 해서 그림을그린다.
 
oven
 
그림으로 원하는모양 만들수있다.
우리는 이렇게 화면구성. 
포스기다. = 일반화면 누르면 나오는 메뉴화면에대한 그림을 그린다.
 
그에대한 데이터베이스 - 테이블
-자바없어도 된다. 
이런것들을 미리해놔야된다.
그래야 코딩할수있는 시간이 생긴다.
 
처음 프로젝트하는사람이많다.
제일문제. 주제선정. 3~4일걸린다. 의견분분. 조율. 
주제선정. 화면그리는것. 생각처럼 후ㅜ다닥 안댄다.
 
완벽하게해야지 7일 테이블
 
2주가까이. 그러면 언젝코딩함?
 
남는시간에 프로젝트하게할거다.
자바부터천천히 오라클이랑 비슷한게 하나도없다.
또 생소한게 생긴다.
 
처음고민이 그거임 뭐야이거. 
 
오라클 당음 자바 
자바하고 오라클 
 
장단점이잇다. 
 
따라갈수잇는시간.
 
자바를하고 오라클.따라간다.? 오라클하다가 자바 다까먹음.
 
프로그램은 차례차례 해야한다.
다시짚어가기가 힘들다.
 
html빼고 다 자바.
 
중간 개별프로젝트.
 
솔직히 3주면충분. 막말로. 신입사원교육 1주일. 
 
주욥분 네트웤 화면구성 다하면 시간이 걸리긴함.
 
내일부터 다음주 금요일까지 진짜 재미없다.
hello java만 찍을거다.
 
뭐하러 이걸하나.
변수가뭔지부터헷갈린다.
 
자바는 데이터타입이 몇개냐. 크게 두개 . 기본, 레퍼런스타입/ 기본은 논리형 분리 문자형 차 숫자형 숫자형은 정수형실수 형 플루 더블 레퍼런스는 오브젝트 와 뭐시기 
                              이거 내일할거임.자료형까지.
이거까지 배운다.
 
 
 
타입을만드는것은
변수만들려고하는거다.
값을저장하려고
값왜저장함?
나중에꺼내쓰려고
단순히 꺼내서보기만할꺼야?
연산하겟지
 
어떨땐 이거 저쩔떈 이거 조건문
 
if as
 
똑같은거 반복문
 
기능이 여러개를만들어야대
 
메쏘드. 
 
기능을 묶어. 클래스 
 
클래스 묶어. 패키지
 
여기까지 다음주금요일 자바 기본문법.
 
 
그다음주 문법들가지고 미리만들ㅇ어놓은거 사용방법. 이과정끝까지.
 
다운로드 자바
실행환경. jre
개발도구 / jdk
 
 
 
11버전 말고
 
8버전
 
Java SE 8 Documentation
 
api문서에서 막 자기가 찾아서 써야댐.
이거사용법알아야대
 
자바 안햇다고하고 수업할거임.
 
필요한거 찾아서 쓰는거를할줄알아야댐.
 
에러가낫을때 대처능력.
 
수업해보다보며안다.
 
이놈을써야대는데
 
무선인터넷이라
느릴때가잇어서. 찾기가힘드니까