--<2.28>
-- 부서이름이 'IT' 에 근무하는 사원의 사번, 이름, 급여
--select * from departments;


select  e.employee_id, e.first_name, e.salary
from employees e, departments d
where e.department_id = d.department_id
 and d.department_name= 'IT';
 
--조인을했을떄안좋은점. 말그대로 카타시안프로덕트가나온다.
--160건에대해서 조건만족하는것들 뽑아온다.
--네이버라고생각해보자 회원정보가 5천만건이다 그테이블에 조인해야대
--그 테이블 100개만 조인해봐도 50억
--만 십만 백만 천만 단위의 테이블이겠지. 그러면 버겁겠지?
--employees 에만 있는 데이터인데 굳이 조인을해야대나 하고 생각이든다.


select employee_id, first_name, salary
from employees
where department_id = (select department_id
                        from departments 
                        where department_name = 'IT');








--조건에 "값"이 나와야대는데 "select"가 나오니까 먼저계산할수있게 괄호해준다.
--이렇게 보면 나중에 보기가 어려워진다.
--select에 맞춰서 붙여준다.
--하위 질의, 부질의 라고 하는것입니다.


--'Seattle' 에 근무하는 사원의 사번, 이름, 급여


select employee_id, first_name, salary 
from employees
where department_id in
                     (select department_id
                        from departments
                        where location_id= 
                                        (select location_id
                                        from locations
                                        where city= 'Seattle')
                    );




-------------------
--이걸다합치자는소리네.
select employee_id, first_name, salary
from employees
where department_id in (10,90,110,190);




select *
from departments
where location_id = 1700




select *
from locations
where city='Seattle';






--이걸다합치자는소리네.
select employee_id, first_name, salary
from employees
where department_id in ( select department_id
                        from departments
                        where location_id = 
                                           ( select location_id
                                from locations
                                where city='Seattle')
                                
                        );        






--지역번호가 1700인 부서에서 일하는 사원의 
--사번, 이름, 부서번호, 부서이름


select e.employee_id, first_name, e.department_id, d.department_name    
from employees e, departments d
where e.department_id = d.department_id
and d.location_id = 1700;
              
--위에꺼를 바꿔보자. 서브쿼리이용해서 from에도 쓸수있어.
--inline view 
--
select e.employee_id, first_name, e.department_id, d.department_name    
from employees e, (select department_id, department_name
                    from departments
                    where location_id = 1700) d
where e.department_id = d.department_id;      




--'Kevin'보다 급여를 많이 받는 사원의 사번, 이름, 급여


--풀이과정--
select employee_id, first_name, salary
from employees;


-----
select employee_id, first_name, salary
from employees
where salary > (
                select salary
                from employees
                where first_name = 'Kevin'
                );






--50번 부서에있는 사원들 보다 급여를 많이 받는 사원의 사번,이름, 급여
--여기잇는사람들보다 많이받는사람들
select employee_id, first_name, salary
from employees
where salary >                
                (select max(salary)
                from employees
                where department_id =50
                );
--모범답안--
select employee_id, first_name, salary
from employees
where salary > all (select salary
                from employees
                where department_id =50
                );


               
--모든부서에 근무하는 사원들의 평균 급여보다 많이 받는 사원의 사번, 이름, 급여


select employee_id, first_name, salary
from employees
where salary > 
               (select avg(salary)
                from employees
                where department_id is not null
                );
----------------------------------------
>
select avg(salary)
from employees
where department_id= 20 ;
                
-----------의도한것----------------
from employees
where salary 
                
                






--부서번호가 20번인 사원의 평균 급여보다 크고 그중에서
--매니저가있는부서번호가 20이 아닌 사원의 사번, 이름, 급여 ,부서번호


select distinct ee.employee_id, ee.first_name, ee.salary, ee.department_id
from employees e, employees ee
where ee.department_id != 20
        and e.manager_id = ee.employee_id
        and e.salary > (select avg(salary)
       
        from employees
        where department_id= 20);




----------------------------------------
select e.employee_id
from employees e, employees ee
where e.manager_id = ee.employee_id
and ee.department_id != 20;
---------------------------------------------


--시간을많이끌어준문제-------------------------------------------------
--부서번호가 20번의 평균 급여보다 크고
--부서장 사원으로 부서번호가 20이 아닌 사원의
--사번 이름 급여 부서번호
select distinct e20.employee_id, e20.first_name, e20.salary, d.department_id
from (
    select employee_id, first_name, salary
    from employees
    where salary > (select avg(salary)
                    from employees
                    where department_id = 20
                    )
                    
     ) e20, departments d
     
    where e20.employee_id = d.manager_id
    and d.department_id !=20;
--------------------------------------------------------------------------
--select절에다가도 서브쿼리 쓸수있다.
--20번 부서의 평균급여 
--50번 부서의 급여총합
--80번 부서의 인원수
select
        (select avg(salary) from employees where department_id =20) avg20,
        (select sum(salary) from employees where department_id =50) sum50,
        (select count(employee_id) from employees where department_id =80) count80
from dual;
--단일행 단일값만 나올수있다. 행이고 열이고 무조건 하나만
------------------------------------------------------------------------
--모든 사원의 사번 이름 급여 등급 부서이름
--단 A는 1등급, B는 2등급.....F 6등급출력.
--모르겠..
select e.employee_id, 
        e.first_name, 
        e.salary, 
        jg.grade_level, 
        d.department_name 
from employees e , job_grades jg, departments d 
where e.department_id = d.department_id 
and
    e.salary between jg.lowest_sal and jg.highest_sal
;
----------------------------------------------------
---이상태에서 jg는 조인 하지말고 
select e.employee_id, e.first_name, e.salary,
        case
        when (select grade_level from job_grades where e.salary between lowest_sal and highest_sal) = 'A'
        then '1등급'
        when (select grade_level from job_grades where e.salary between lowest_sal and highest_sal) = 'B'
        then '2등급'
        when (select grade_level from job_grades where e.salary between lowest_sal and highest_sal) = 'C'
        then '3등급'
        when (select grade_level from job_grades where e.salary between lowest_sal and highest_sal) = 'D'
        then '4등급'
        when (select grade_level from job_grades where e.salary between lowest_sal and highest_sal) = 'E'
        then '5등급'
        else '6등급'
        end 등급,
d.department_name
from employees e, departments d
where e.department_id = d. department_id;
--------비슷한 방법---------
select e.employee_id, e.first_name, e.salary,
        decode ((select grade_level from job_grades where e.salary between lowest_sal and highest_sal),
        'A','1등급',
        'B','2등급',
        'C','3등급',
        'D','4등급',
        'E','5등급',
        '6등급')등급,
d.department_name
from employees e, departments d
where e.department_id = d. department_id;


----------------------------------------------------
--orderby절에도 서브쿼리넣을수있지만 실제로 거의 쓸일없다. 알아만두세요.










--
--앞으로 프로젝트할때 제일 많이하는 과오중에하나가 뭐냐면은
--db니가 제일잘하니까 db니가 짜와이거다.
--자기만 구조를 잘아니까.
--나머지사람들은 db구조를 몰라요
--자바 아무리잘해도
--전부 db에 있는거 끄집어내서 화면에다가 뿌리는건데
--구조모르면 select를 못하죠.
--그러면 자바 아무리잘해도 절대 못하겟져.
--테이블에 어떤게있는지 어떤 연관이있는지 
--확실하게 파악을해야한다.
--반드시 잘하는사람만 하면 안돼고 다 같이해야한다.
--초반에는 좀 빠르게 진행할지몰라도
--실질적으로 최종적으로보면은 더 느리다. 다같이하세요.