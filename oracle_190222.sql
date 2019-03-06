국어 영어 수학 - 다잘해야대. 


국어- 먼저 이해부터 해야겠지? 말로써 순서를 정리할 수 있다면 그것을 수식으로 표현하면 되는것 뿐이다. 그러니까 이해하는게 제일 
            중요해.


영어 -  나중에 api문서 보면 다 영어로 되어있어.     
            그리고 구글링할때 (네이버로는 spring 까지만 가도 정보가 없다.) 죄다 영어야.
            젤 유명한사이트 overflow.com  요 사이트를 실질적으로 많이 보게 될텐데
            계속 들어가다보면 이제 댓글에 thanks 있는거 보고 그 코드 따라하게 될거야.


* Where 조건절

*순서를 잘 알아야해
 
순서대로 코딩하면 자동완성도 알려줘서 좋다.
말로 먼저 표현하고 그것을 토대로 수식을 만들어가면 돼.

select                               3
from                                 1
where                                2


비교연산자를 이용하여 조건을 명시할 수 있다.


=, <, >, <= , >= , <> (!=, ^=)


예제)


--사번, 이름, 급여(조건: 5000이상 받는 사원의) 부서번호


select employee_id, first_name, salary, department_id
from employees
where salary >= 5000;


--사번이 100인 사원의 사번 이름 부서번호


select employee_id, first_name, department_id
from employees
where employee_id =100;


--부서번호가 50이 아닌 사원의 사번 이름 부서번호
select employee_id, first_name, department_id
from employees
where department_id != 50;
 
select employee_id, first_name, department_id
from employees
where department_id ^= 50;


select employee_id, first_name, department_id
from employees
where department_id <> 50;


-- 근무도시가 seattle 인 지역의 지역번호 우편번호


select location_id, postal_code
from locations
where city='Seattle';
*seattle로 하면 오류가 날꺼야. 
    
데이터는 대소문자를 구별하거든.


번외) 이거는 아직 몰라도 된다.
만약 대소문자 구별을 못하는 상황에서 찾아내려면?
>lower 소문자로 바꾸는거 upper 대문자로 바꾸는거






**데이터베이스에서 '=' 의 의미는
'같다'
잘 기억해두세요. 이거 배우고 프로그램 배우면 헷갈리니까.


데이터베이스의 같다는 = 이다


팁- 실행하고싶은거만 실행하려면 
블록처리
하고 하면댄다.




* 논리연산자 NOT AND OR 


where 조건절에다가 논리연산자를 사용하여 조건을 결합해 표현 할 수 있다.


NOT
AND
OR




이 문제를 비교연산자로 풀어봐. 안될껄?


-- 급여를 5000이상 10000미만를 받는 사원의 사번, 이름, 급여, 부서번호


아, 
비교연산자만으로는 실질적으로 두개 비교가 불가능하네
따로따로 띄어도안대고 붙여서도 안되니까...


그러면 뭐가하나 필요하겠네. 바로 논리 연산자.


논리연산에는 크게 3가지가 있어요.


조건식에서 나올수있는거 


학교에서 배워봤죠?


* AND 연산자


*프로그램과는 다르게 앞뒤에 null이 나온다.
결과값이 달라진다. 꼭 기억하세요.
AND
T
F
Null
T
T
F
N
F
F
F
F
Null
N
F
N


*프로그램에서는 && 
오라클에서는 and 논리 연산자를 쓴다.


and 연산은 앞에 F가 나오면 뒤는 확인할 필요도 없이 F 이다. (일을 줄여준다.)


* OR 연산자
OR
T
F
Null
T
T
T
T
F
T
F
N
Null
T
N
N
or 연산은 앞에가 T 면 뒤는 볼 것도 없이 T 이다. (일을 줄여준다.) 당장은 신경쓰기 힘들겠지만 나중엔 알아두자




여기다가 하나 더 
* NOT 논리 연산자.
      not 이면 true
       true 면 not
      null 이면 null
     
 
예제)
-- 급여를 5000이상 12000미만를 받는 사원의 사번, 이름, 급여, 부서번호


select employee_id, first_name, salary, department_id
from employees
where salary >= 5000
and salary <12000;
 
--부서번호가 50인 사원 중에 급여를 5000이상 받는 사원의 사번 , 이름 , 급여, 부서번호
 
select employee_id, first_name, salary, department_id
from employees
where department_id = 50
and  salary >= 5000;
 
-- 급여를 5000이상 12000이하를 받는 사원의 사번, 이름, 급여, 부서번호
 
 


select employee_id, first_name, salary, department_id
from employees
where salary >= 5000
and salary <=12000;


-- 같은 표현 : between을 써보자! 이상 이하(포함)만 표현가능하다. 


select employee_id, first_name, salary, department_id
from employees
where salary between 5000 and 12000;


--커미션을 받는 사원의 사번, 이름, 급여,커미션포함금액  *문제를 해석하는 능력 요구


select employee_id, first_name, salary, salary+salary*commission_pct
from employees
where commission_pct > 0;
결과 같은 똑같이 나오긴했는데 선생님과는 다르다.


--선생님 풀이. null 이용.  null 로 비교해서 쓸때는 is를 붙여서 is null 과 is not null 을 써주자.


select employee_id, first_name, salary, salary+salary*commission_pct
from employees
where commission_pct is not null
***is not null 순서 헷갈리니까 꼭 기억하세요. 


-- 근무부서가 50 60 90 인 사원의 사번 이름 부서번호


select employee_id, first_name, salary, department_id
from employees
where department_id = 50
or department_id = 60
or department_id = 90;




지금까지 수업하는 오라클 어떤가요? 재밌나요? 
저는 재밌는데


지금 4줄짜죠?
나중에 200줄 300줄 짜는데
나중에 결과값이 3 이런게 나와요.


원하는 답이 나왔을때의 기분이 정말 좋다. 


게시판 -몇만줄


-삼성 배당금-
이건희 - 4700억 
이재용 - 1800억


에러의 60~70%는 오타다.
그래서 프로그램을 쓰는거다.


아직은 익숙하지않으니까 직접 코드를 써라. 시간 충분히 주는 이유가 그거임.
나중에는 자동완성을 써서 빠르고 정확하게 오타를 잡자.
 
-- 근무부서가 50 60 80 인 사원의 사번 이름 부서번호 (말을 잘 이해하자. 50이거나 60이거나 80이거나)


select employee_id, first_name, first_name, department_id
from employees
where department_id = 50
or department_id = 60
or department_id = 80;


-- 근무부서가 50 60 80 이 아닌 사원의 사번 이름 부서번호 (말을 잘 이해하자. 50도 아니고 60도아니고 80도 아니여야)


select employee_id, first_name, first_name, department_id
from employees
where  department_id <> 50
and  department_id != 60
and not department_id = 80;






이제 이게 백개 쌓이면 이거도 귀찮지? 이걸 해결하는방법은 오후에 할게. 
그전에 복습 철저히 집에가서 외워야지하지말고 지금 해야대


-- in 연산자 사용해서 더 간단하게. 자주 사용한다 잘 기억하자. (같다 같지않다 이퀄 비교)  any , all은 있다라고 알아두자. exist는 거의 안쓴다.


-- 근무부서가 50 60 80 인 사원의 사번, 이름, 부서번호


select employee_id, first_name, first_name, department_id
from employees
where department_id in (50,60,80) ;


-- 근무부서가 50 60 80 이 아닌 사원의 사번,이름, 부서번호


-- not in 사용
select employee_id, first_name, first_name, department_id
from employees
where department_id not in (50,60,80) ;






--급여가 3000이상 이거나 8000이상 이거나 5000 이상인 사원의 사번 이름 급여


select employee_id, first_name, salary
from employees
where salary >= 3000
or salary >= 8000
or salary >= 5000;


--  any 연산자 (크기 등가비교를 해줄수있다 그러므로 any 앞에 등호로 비교)
select employee_id, first_name, salary
from employees
where salary >= any (3000,8000,5000);


--급여가 3000이상이고 8000이상이고 5000이상인 사원의 사번 이름 급여


select employee_id, first_name, salary
from employees
where salary >= 3000
and salary >= 8000
and salary >= 5000;




-- all 연산자 전부다 만족
select employee_id, first_name, salary
from employees
where salary >= all (3000,8000,5000);






날짜에서는 더하기하고 빼기만 가능해요. 
--현재시간, 3일후, 3시간후 
select to_char(sysdate,'yy.mm.dd hh24:mi:ss') "현재시간" ,
 to_char (sysdate+3,'yy.mm.dd hh24:mi:ss') "3일후" ,
 to_char(sysdate+3/24,'yy.mm.dd hh24:mi:ss') "3시간후"
from dual;


토드라는 툴은 (db 개발자가 쓰는 상당히 비싼 툴) 년월일시분초 다나옴.


와일드카드
%
_
-와일드카드로 쓸수 있는것 두가지가있다.
 
 첫번쨰 : %
 
뭐가나와도 상관이없다. % 
%는 자리수가 상관이없다.
 
 
두번째 : _ 언더바다.
 
뭐가와도 상관없지만
언더바는 자릿수를 의미한다.




-- 이름이 'S' 로 시작하는 사원의 사번, 이름
select employee_id , first_name
from employees
where first_name like 'S%';
 
-- 이름에 'e'가 들어가는 사원의 사번, 이름
select employee_id , first_name
from employees
where first_name like '%e%';
 
-- 이름이 'y'로 끝나는 사원의 사번, 이름
select employee_id , first_name
from employees
where first_name like  '%y';
 
--이름에서 끝에서 세번째가 'e'인 사원의 사번 , 이름
select employee_id , first_name
from employees
where first_name like '%e__';
 
얘를 어디서 많이쓸까? 
네이버 검색에서 검색하면 비슷한 것들 찾아준다거나
게시판 제목이나 내용으로 찾기에서  like 로 검색을 하겠지
작성자 찾기는 뭘해야 될까? = (이퀄) 검색을 하겠지 
 
 
* order by 정렬
 
where 절에서는 참 거짓만 할수있었잖아.
order by 를 써서 정렬을 해줄수있다.
 
select             3
from               1
where              2  
order by           4             
순서  잘 알아두고.
 
정렬 해줄때 숫자로 하지말고 직접적으로 속성이름을 명시해주자.
 
오름차순은 asc (디폴트 기본값)
 
내림차순은 desc;
 
정렬한 상태를 유지하면서 또 정렬을 할수 있어.
콤마 , 를 이용하면 그 순서대로 할 수 있다.
 
 
-- 모든 사원의 사번 이름 급여
-- 단 급여순 정렬     
select employee_id, first_name, salary
from employees
order by salary desc;
 
-- 부서 번호 사번 이름 급여
 
--단 부서별 급여 순으로 정렬   ( 부서별로 정렬하고 급여순으로 다시 정렬 ) 정렬순서대로 콤마를 쓰면댄다.
select department_id, employee_id, first_name, salary
from employees
order by department_id , salary desc;
 
where 
 
order by
 
가장 기본적인 select 끄읕.

-----월요일 공부하기에 앞서 주의할 사항-----
db를 포기하는게 
 
join 떄문이다.
 
양대산맥.
 
꽃이라고도 표현한다.
 
서브쿼리
 
 
이과정에서 제일 중요한 부분 
 
겁을 주려고 한말이지 
실질적으로 그렇게 어렵진 않다.
 
 
처음에 개념잡기가 어렵다.
 
절대빠지면안된다.
 
월요일 화요일빠지면 과정전체가 흔들릴수있따.
