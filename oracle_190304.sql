----------------------------------------------
--03.04
--부서번호가 50이거나 90인 사원과
--급여가 10000 이상인 사원의
---사번 이름 급여 부서번호
--union
select employee_id, first_name, salary, department_id
from employees
where department_id in (50,90)


union


select employee_id, first_name, salary, department_id
from employees
where salary >= 10000;


------------------------------------------------------
--union all
select employee_id, first_name, salary, department_id
from employees
where department_id in (50,90)


union all


select employee_id, first_name, salary, department_id
from employees
where salary >= 10000;
------------------------------------------------------
--intersect (교집합)
select employee_id, first_name, salary, department_id
from employees
where department_id in (50,90)


intersect


select employee_id, first_name, salary, department_id
from employees
where salary >= 10000;
------------------------------------------------------
--minus (차집합)
select employee_id, first_name, salary, department_id
from employees
where department_id in (50,90)
minus
select employee_id, first_name, salary, department_id
from employees
where salary >= 10000;




select employee_id, first_name, salary, department_id
from employees
where salary >= 10000
minus
select employee_id, first_name, salary, department_id
from employees
where department_id in (50,90);


------------------------------------------------------
--group by 절. 어렵지는 않지만 하다보면 헷갈린다.
--부서별 급여총합, 평균급여, 사원수, 최대급여, 최소급여


select department_id, sum(salary), avg(salary), count(employee_id), max(salary), min(salary)
from employees 
group by department_id;
-------------------------------------------------------
--having
--부서별 급여총합, 평균급여, 사원수, 최대급여, 최소급여
--평균급여가 5000 이하인 부서
select department_id, sum(salary), avg(salary), count(employee_id), max(salary), min(salary)
from employees 
group by department_id having avg(salary) <= 5000;


--------------------------------------------------------
--각 부서별의 평균 급여(=평균급여) 보다 많이 받는 사원의
--사번 이름 급여
select employee_id, first_name, salary
from employees
where salary > all
(select avg(salary)
from employees
group by department_id);


---------------------------------------------------------


--부서별 최고 급여를 받는 사원의 
--부서이름, 사번 이름 급여


select d.department_name, e.employee_id, e.first_name, e.salary
from employees e, departments d (select 


where salary = (select max(salary) from employees group by department_id) ; 


select d.department_name, e.employee_id, e.salary
from employees e, (
                        select department_id, max(salary) mx
                        from employees 
                        group by department_id 
                        ) m, departments d
where e.department_id = m.department_id 
and e.salary = m.mx
and e.department_id = d.department_id;
--표 같은거만들때 사용한다.
-----------------------------------------------------------
select employee_id, salary
from employees;
--rownum : 행번호를 알아낼수가있다.
select rownum, employee_id, salary
from employees
where rownum < 10;




select rownum, employee_id, salary
from employees
where rownum < 10
and rownum >5 ;
--크다 비교가 불가능하다.


-------------------------------------오후에 총괄문제----------
--나는누구여긴어디--


--TOP N Query
--순위 사번 이름 급여 입사한 연대 부서이름
--급여순 순위. 
--한페이지당 5명씩 출력.
--2 page 출력. 
--1980년대 1990년대 2000년대
--게시판 에서 쓴다. 쇼핑몰 다음페이지의 상품목록. 이거모르면 웹페이지 아무것도 못만든다.
--
--문제풀어보는중--
select rownum, employee_id, first_name, salary, hire_date, department_name
from employees e , departments d
where e.department_id = d.department_id
and rownum < 6
order by salary desc;




select employee_id, salary, department_name
from employees 
where salary > &page;
---------------------------실패.




-------------------------풀이


select rownum employee_id, first_name, salary
from employees
order by salary desc;


select b.rn ranking, b.emp, b.fir, b.sal
    case
        when to_char(hire_date, 'yyyy')< '1990'
        then '1980년대'
        when to_char(hire_date, 'yyyy')< '2000'
        then '1990년대'
        else '2000'년대
        
        end hire
        


from(
select rownum rn.a* 
from(
    select rownum employee_id, first_name, salary, hire_date
    from employees
    order by salary desc
    ) a
    
    where rownum <= %page * 5
 
 ) b
  where b.rn > %page * 5 - 5; 
  
  
  ----------------------------
--  rank() over()          똑같이 만들수있따. 요걸로 바꿔보세요.


--