* case when then 이용
--사번 이름 입사날짜 사원구분
-- 사원구분
-- 1980~ 1990 임원 (등가비교.)
-- 2000 이전 평사원
-- 나머지 신입사원
select employee_id, first_name, hire_date, 
    case
        when hire_date between '1980/01/01'and '1990/01/01'
            then '임원'
        when hire_date < '2000/01/01'
            then '평사원'
        else '신입사원'
        end 사원구분
from employees
order by hire_date ;


--사번 이름 부서번호 직원유형
-- 직원유형
--부서번호 60 개발자   
--부서번호 90 임원진
--       else 비개발자
select employee_id, first_name, department_id, 
case
when department_id = 60 
    then '개발자'
when department_id = 90
    then '임원진'
else '비개발자'
end 직원유형
from employees;
--위에문제에서 when then when then 계속 많아지면 어떻게 처리할까?
* decode를 이용하는 방법
select employee_id, first_name, department_id, 
    decode(department_id,
        60,'개발자',
        90,'임원진',
        '비개발자') 직원유형
from employees;
--저연봉, 평균연봉, 고연봉. 만들수가없다.
--decode는 이퀄비교 (같다) 만 가능하다.
--등가비교는불가능 >> 등가비교는 case when then 
--


-----------------------------------------------------------------------------------------
* 그룹함수
--회사의 총사원수, 급여총합, 급여평균, 최고급여, 최저급여
----풀이과정---
SELECT
    *
FROM employees;


--20명이라 괜찮지만 20000명이라면 스크롤 다내릴래? nono count라는것을쓸꺼야.
select count(employee_id)
from employees;
--count는 단일행함수 무조건 하나만나온다.
--이거 알아야돼요.
--컬럼수
count
--총합
sum(salary)
--평균
avg(salary)
--최고
max(salary)
--최저
min(salary)
---------------------이다섯가지는 꼭 기억하셔야합니다.---------------


--평균 급여보다 많이받는 사원들의 사번과 이름과 급여
select employee_id, first_name, salary
from employees
where salary > avg(salary); 오류난다. 왜냐...
--오류: 그룹함수는 허가되지않습니다. 
--sum avg 그룹함수라 했지? 그룹핑을 해야댐. 
--그룹함수는 where 조건절에 나올수가없다.
--실행순서 생각하면댄다.
--가져오지도 않은 값에 그룹핑을 하니까에러가난다.
--그룹함수를 집접적으로 지정할수없다.
--쿼리안에 쿼리를 집어넣어야한다.
--서브쿼리.
--지금부터 알려줄게
--------------------------------------------------------
-- 사번 이름 부서번호
select employee_id, first_name, department_id
from employees;
--보이긴 보인다. 근데...문제는 뭐냐 , 90번 부서가 그래서 뭔데? 
--부서의 이름도 보고싶지?


select employee_id, first_name, department_id, department_name
from employees;
--에러남. 왜냐 부서이름은 dept 테이블에있으니까. 
select department_name
from departments;


--두개테이블 얻어오자. 
--데이터베이스입장에서 1:1 맵핑을 해준거다. 그래서 160  카타시안프러덕트 곱. 곱에해당하는 데이터
select * 
from employees, departments;
--여러개의테이블을 결합하는것. 단순결합하면 엉뚱한데이터가나오니까 이놈을 원하는 데이터를 잠깐 쉬었다가한다.




-------------------------------------------------1교시끝-
* JOIN함수


--조인한 테이블의 갯수 . 적어도 1나이상의 (n-1개) . 조인조건이니까 
--테이블과테이블의 관계성이있는. 테이블들이 조인조건을 갖춘 테이블들이다.
--pk primary 기본키 
--fk foreign 이웃키 외래키


select *
from employees, departments
where employees.department_id = departments.department_id
order by employee_id;


--pk 는 제약조건이있다. 중복값이존재할수없다. null 이 나올수없다. 킴벌리라는 친구는 뽑을수없다 현재로서는. 


--------
-- 조인해서 해보장.--
select employees.employee_id, employees.first_name, departments.department_id, departments.department_name
from employees,departments
where  employees.department_id = departments.department_id
order by employee_id;
--테이블에 별칭주기--




select e.employee_id, e.first_name, d.department_id, d.department_name
from employees e ,departments d
where  e.department_id = d.department_id
order by employee_id;




--되든안되든 몇개 풀어나갈거야.


--하나풀면 조인에대한 자신이 생길거야.


--예전에 몇개까지 조인해봤습니까 질문많이함. 테이블 몇개까지 연결해봣냐. 테이블과의 관계를 알아야 문제를 풀수있다.






--'Seattle'에 근무하는 사원의 사번 이름 부서이름 도시이름
--
select e.employee_id, e.first_name, d.department_id, l.city
from employees e , locations l, departments d
where l.city = 'Seattle' and e.department_id = d.department_id and d.location_id = l.location_id
order by employee_id;


--'europe' 에 근무하는 사원의 사번 이름 부서이름 도시이름


select e.employee_id, e.first_name, d.department_id, l.city
from employees e ,departments d ,locations l,countries c ,regions r
where      e.department_id = d.department_id 
       and d.location_id = l.location_id 
       and c.country_id = l.country_id
       and c.region_id = r.region_id
    and lower(r.region_name) = lower('europe') ;
--문제내기1.
--급여가 10000이상인 사원들의 "이름", "주소", "급여"  
--급여가 높은순으로 정렬
select e.first_name, l.street_address , e.salary
from employees e,locations l, departments d  
where e.salary >= 10000 and e.department_id = d.department_id and d.location_id = l.location_id 
order by e.salary desc;


--문제내기2.
--Kevin 사원이 근무 중인 부서이름과 state


select d.department_id, l.state_province
from employees e , departments d , locations l
where  e.department_id = d.department_id and d.location_id = l.location_id
and e.first_name = 'Kevin';


--************************************************************************************************
--마리아DB 요즘뜬다.
--오라클에서만 쓸수있는것들이있다.
--ansi조인은 그대로 mssql에 가져가도 실행시킰있는것. 표준. 




--10, 80, 90 번 부서에 근무중인 사원의
--사번, 이름, 직책이름, 부서이름


select e.employee_id, e.first_name, d.department_name, j.job_title
from employees e,departments d, jobs j
where e.department_id = d.department_id 
    and 
      e.job_id = j.job_id
      and e.department_id in(10,80,90);




--난이도있는문제입니다--
--사번이 200번인 사원의 근무 이력 
--사번, 이름, 직책이름(일했을당시에 직책의 이름), 근무당시 부서이름, 근무 개월수 둣째짜리에서 반올림.


select e.employee_id, e.first_name,j.job_title, d.department_name , months_between(end_date, jh.start_date)  
from employees e, job_history jh, departments d, jobs j 
where e.employee_id = jh.employee_id
and jh.job_id = j.job_id
and jh.department_id = d.department_id
and jh.employee_id = 200


;
--하나하나관계를 잘따져보자.--
--한번에 뽑는거 하지마라. 
--
--프로그램에서 가장중요하다. 이거모르면 프로그램 못만들어.
--식별 비식별. 테이블 정규화. 


--모든사원의 부서이름, 사번, 이름, 매니저사번, 매니저이름
select  d.department_name, e.employee_id, ee.employee_id ,ee.first_name
from employees e , departments d , employees ee 
where d.department_id = e.department_id
 and e.manager_id = ee.employee_id
;


--복습할때 테이블구조 연관관계 외우세요-
--********************************************************************************************
--데이터를낭비하는것select
--다음 프로젝크 쿼리, select 한번돌리면 2분 17초후에 데이터가나왔다
--엥쿼 이화식사단 엥쿼사단 중소기업이움직인다 그사람이 들어와서 자리배치 이동
--2분 17초걸리던게 초단위로 나온다.
--기존의 쿼리를 수정만한것.
--**********************아마존웹서비스 프로젝트***********
--면접에서 이정도는해야 할말이 있다.
--남들이하는만큼만하면 취업힘들다. 예전 2~3기수전에 만든 ppt 
--AWS 설정. 
--하나하나 캡쳐해서 (회원가입은 설명굳이안필요하니까) 보여주고
-- 서버등록하는것들 
--간단간단한 설정에대한 설명이 필요해지고 
--내가아닌 다른사람이 보고도 이걸할수있을정도
-- 순차적으로 리눅스상태에서도 하는거 
--아마존이 컴터한대를 줬다. 운영체제를 깔아야지. 자바에서는 유닉스계열 리눅스 깔았다. jdk 웹서버 오라클같은거 
--쭈우우욱 설치하는것까지 보여주고
--database 마리아db로 설치하는거 
--spring 연동까지. 


--이번프로직트
--1,2,4 조는 정규화 식별 비식별 설명위주.
--3명. 회사에서 아마존을 발표할일이생겻는데 저거 재사용함. 20만원 보너스.
--나중에 진짜로 쓸수있을정도로 만들자.
--한두번 만들어보면 금방만들수있다. 약간 헤딩하는게잇어도 신경써서만들자.
--마지막하나. 예제 만들수있죠. 예제를 캡쳐하잖아. 폴더를만들어서 예제까지 첨부. 예제일부분만 ppt에 표시할텐데
--출처 다 같은폴더에다가넣어라.


---------------------지금은못풀음--------------------------
--직책 아이디가 'SA_REP' 인 사원의
--사번, 이름, 직책이름, 부서이름
--단, 부서가 없는 경우 '대기발령'으로 출력 >> 킴벌리를 찾아라.


select e.department_id, e.first_name, e.job_id, d.department_name  
from employees e,departments d, jobs j
where  e.department_id = d.department_id 
        and e.job_id = j.job_id
        and e.job_id = 'SA_REP'
     
        ;