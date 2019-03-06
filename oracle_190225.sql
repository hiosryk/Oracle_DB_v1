* 숫자함수
--* round  자릿수 지정 반올림
--trunc 자릿수 지정 버림
--floor 소수점 다 버림
--mod 나머지 
*데이터베이스에서는 like연산할때 와일드카드로 쓰니까 %는 쓸수 없었다. 대신 mod 쓰자. 
--abs 절대값.


<숫자함수 예제>
select 1234.5438, round(1234.5438), 
round(1234.5438,1), round(1234.5438,-1),
round(1234.5438,3), round(1234.5438,-3)
from dual;


select 1234.5438, trunc(1234.5438), 
trunc(1234.5438,1), trunc(1234.5438,-1),
trunc(1234.5438,3), trunc(1234.5438,-3)
from dual;


select 1234.5438, floor(1234.5438)
from dual;


select 5 +3, 5 -3, 5 * 3, 5 / 3, mod(5,3)
from dual;


select abs(5), abs(-5), abs(+5)
from dual;


--사원의 사번, 이름, 급여, 커미션 포함급여
--커미션 포함 급여는 100의 자리수로 표현(반올림)


select employee_id, first_name, salary, round(salary + salary*NVL(commission_pct,0),-2)
from employees;


* 문자함수
***문자함수*** 함수는 문자함수가 중요함  그중에서도 변환이 중요함.


--lower, upper, initcap, length
select 'KiTRI' , lower('KiTRI'), upper('KiTRI'), initcap('KiTRI'), length('KiTRI')
from dual;


--concat 은 인자값 두개 합치는거
concat('ename', 'job')


-- 사번, full name
--모범답안-- 단일행함수 concat을 중첩해서 합쳐주자.
select employee_id, concat(first_name, concat(' ', last_name))
from employees;


중복중첩이된다. (함수안에 함수가 들어간다)
단일행함수는 단일행함수끼리 중첩이 가능하다.


***
* substr  문자열에서 원하는 문자를 뽑아냄. 
substr  ('문자열', 시작지점)        = 문자열의 시작지점부터 끝까지 문자 반환
             ('문자열',시작지점,반환할문자의갯수)  = 문자열의 시작지점부터 원하는 갯수만큼 반환


--substr('coolcoffee',5) :             'coolcoffee'의 5번째문자부터 모든 문자를 반환   = 'coffee'
--substr('coffeehot',7,3):          'coffeehot'의 7번째문자부터 3개의 문자를 반환  = 'hot'


* instr 문자열에서 내가 원하는 문자의 위치를 절대위치로  
instr ('문자열', '찾을문자') = 문자열중에서 찾을문자의 위치가 어디니? 
        ('문자열', '문자열에속한찾을문자', 시작지점, 그문자중몇번째문자)  =  결과는 절대위치로 나옴
*결과가 없으면 0 반환


--instr('moonjayeol', 'y')           :   'moonjayeol'의  'y'가 나타나는 절대위치를 반환 =7
--instr('moonjayeol', 'e', 5)       :   'moonjayeol'의 5번째포지션부터 'e'가 나타나는 절대위치를 반환 = 8
--instr('moonjayeol', 'o', 2, 3)  :    'moonjayeol'의 2번째포지션부터 'o'가 3번째에 나타나는 절대위치를 반환 = 9




***substr, instr 중첩함수 이용하기***
--우편번호문제 
--'123-456' zipcode , 첫번째부터 대쉬전까지 zip1 ,대쉬후를 zip2 
--대쉬의 위치가 바뀌더라도 대쉬를 기준으로 zip1 zip2를 나눠주세요. (ex. 1234-56)  


풀이과정
* instr ('문자열', '찾을문자') 이용하여        '- '의 위치를 찾아낸다.
- '-'의 위치:  instr('123-456','-') 
* substr('문자열',시작지점, 문자반환갯수)  을 이용하여 zip1 을 나타내준다. 
zip1 = 대쉬를 기준 앞이므로 대쉬위치-1 해준다. 


                                '123-456'의 1번째자리부터 대시위치-1 갯수만큼 반환
-zip1:             substr('123-456',1,instr('123-456','-')-1) 


                              '123-456'의 대시위치+1부터 모든문자
-zip2:            substr('123-456', instr('123-456','-')+1)




select '123-456' zipcode, 
substr('123-456',1, instr('123-456','-')-1) zip1 , 
substr('123-456', instr('123-456','-')+1) zip2
 
from dual;






 




--날짜함수 (정리필요)
select sysdate, sysdate +3, sysdate -3, to_char(sysdate + 3 /25, 'yyyy-mm-dd hh25:mm:ss')
from dual;
select sysdate, months_between(sysdate, sysdate + 70)
from dual;


select sysdate, 
months_between(sysdate, sysdate + 70),
next_day(sysdate,1), next_day(sysdate,3),
add_months(sysdate,2) ,
last_day(sysdate)
from dual;


--to_char ( 숫자,날짜형식을 문자형식으로 바꿔준다.)
select sysdate, to_char(sysdate,'yyyy yy mm month w ww d dd ddd dy day'
)
from dual;
select sysdate, to_char(sysdate,'hh''hh24''pmhh:mi:ss''mi''hh24:mi:ss''hh24:mi:ss'
)
from dual;
select sysdate, to_char(sysdate, 'yyyy month dd''hh24:mi:ss')
from dual;


--'mm'  달 3자리로 표현
--'month' 풀네임 달 ex)january
--w 이번달의 몇주차
--ww 이번해의 몇주차 
--d 요일 
--dd 한달중의 몇번째 날인지 (일)
--ddd 이번해의 몇번째 날인지
--dy 3자리로 요일 표현
--day 풀네임 요일
--hh 시
--am(pm) 
--hh24
--mi 분
--ss 초
select to_char(sysdate, 'yyyy mm dd hh24 mi ss'),
        to_char(trunc(sysdate),'yyyy mm dd hh24 mi ss'),
        to_char(trunc(sysdate,'dd'),'yyyy mm dd hh24 mi ss'),
        to_char(trunc(sysdate,'mm'),'yyyy mm dd hh24 mi ss'),
        to_char(trunc(sysdate,'yy'),'yyyy mm dd hh24 mi ss'),
        to_char(trunc(sysdate,'hh'),'yyyy mm dd hh24 mi ss'),
        to_char(trunc(sysdate,'mi'),'yyyy mm dd hh24 mi ss')
from dual;




--숫자<> 문자<> 날짜
--  <<<<<<<>>>>>>>


--숫자 to_char >>>> 문자


--문자 to_date >>>> 날짜


--문자 to_number >>>> 숫자


-- 날짜 to_char >>> 문자


select to_char(




--------------------------------------------------
select 'a'
from dual;


select 3   , '3'
from dual;


--문자의 3 
select '3'     
from dual;


--오라클의 + 는 산술연산만 되기때문에 자동으로 숫자로 바뀐다. 자동형변환
select '3' + '5'
from dual;


select 3 + 5 
from dual;


select 1123456.789,
to_char(1123456.789,'000,000,000.00'),
to_char(1123456.789,'999,999,999.99')
from dual;


select '123,456.98' , to_number('123,456.98', '000,000.00')+3
from dual;


--숫자를 문자로바꾸고 날짜로 바꾸자. 
--20190225142154 >>날짜 >>3일 후 


--모범답안
select 20190225142154, to_char(to_date(to_char(20190225142154,'00000000000000'), 'yyyy mm dd hh24 mi ss') +3, 'yyyy mm dd hh24 mi ss')
from dual;
--이따가 응용한게 나올거다.
--일반함수


-- nvl 널이아니면 앞에 널이면 뒤에, 
--nvl2 널이아니면 1 널이면 0  
select commission_pct, nvl(commission_pct,0) , nvl2(commission_pct, 1,0)
from employees;


-- 연봉등급
-- 급여가 4000미만인 사원은 저연봉
-- 급여가 10000미만인 사원은 평균연봉
-- 급여가 10000이상은 사원은 고연봉
-- 사번, 이름, 급여, 연봉등급 을 뿌리고싶어.


select employee_id, first_name, salary,
      case 
            when salary < 4000
                then '저연봉'
            when salary < 10000
                then '평균연봉'
                   else '고연봉'
        end 연봉등급
from employees
order by salary desc;


--사원구분
--1980년도 입사 임원 
--1990년도 입사 평사원
--2000년도 입사 신입사원
-- 사번 , 이름, 입사일, 사원구분


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


--아스키코드값. 이놈은 반드시 기억을 하셔야한다. 
-- 48, 65, 97
select ascii ('0'), ascii('A'), ascii('a') , chr(47) , chr(48)
from dual;


select case when 'abc' < 'abd' then '작다'
else '크다'
end
from dual;


문제만들기.
--시스템시간기준 144일후 yyyy mm dd day  형태로 나타내주세요. 별칭은 "수료일"


select to_char(sysdate+144,'yyyy mm dd day') "수료일"
from dual;


--2019/07/21 은 2019년도로부터 몇 번째 날 일까??


select to_char(to_date (to_char('20190721', '00000000'),'yyyy mm dd'), 'ddd') 
from dual;


--  Q1. 각 사원의 이름, 부서번호, 급여, 급여별 레벨을 출력하기
-- 단, 레벨의 종류와 기준은 Job_Grades 테이블을 참고한다.
-- 단, 레벨을 기준으로 오름차순 정렬한다.
-- 단, 레벨에 별칭을 준다(급여별 레벨).


select first_name, employee_id, salary, 
    case    
        when salary between '1000' and '2999'
            then 'A'
        when salary <= 5999
            then 'B'
        when salary <= 9999
            then 'C'
        when salary <= 14999
            then 'D'
        when salary <= 24999
            then 'E'
        else 'F'
    end "급여별 레벨"
from employees
order by "급여별 레벨";


select *
from job_grades;
 
 
select last_name, department_id, salary,
        case when salary <2999 then 'A'
                when salary <5999 then 'B'
                when salary <9999 then 'C'
                when salary <14999 then 'D'
                when salary <24999 then 'E'
                else 'F'
        end as "급여별 레벨"
from employees
order by "급여별 레벨";


--  Q2. 강의 A가 2019년02월20일부터 2019년07월16일까지 실행될 때, 총 기간이 며칠인지 구하시오
-- 단, 날짜는 20190220, 20190716 형태의 숫자로부터 시작한다.
-- 단, 주말도 포함한다
-- 단, 별칭은 수강기간


select to_date(to_char(20190716, '00000000'),'yyyymmdd') - to_date(to_char(20190220, '00000000'),'yyyymmdd') + 1 as 수강기간
from dual;
--------------------------------------
테이블과의 관계를 잘 파악하고 오자.