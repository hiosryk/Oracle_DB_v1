--<27일>
--non-equi join.
--모든 사원의 사번 이름 급여 직무등급
select*
from job_grades;


select e.employee_id ,e.first_name, e.salary, jg.grade_level
from  employees e, job_grades jg
where e.salary >= jg.lowest_sal
and e.salary <= jg.highest_sal
;


select e.employee_id ,e.first_name, e.salary, jg.grade_level
from  employees e, job_grades jg
where e.salary between jg.lowest_sal and jg.highest_sal
;


case when then




--*모든* 사원의 사번, 이름, 부서번호, 부서이름
--단,부서가 미지정일(null)경우 부서이름을 '대기발령중'으로 출력


select e.employee_id, e.first_name, d.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id;


--outer 조인 --
select e.employee_id, e.first_name, d.department_id, nvl(d.department_name,'대기발령중')
from employees e, departments d
where e.department_id = d.department_id(+);


--이해: 두개의 테이블을 조인해서 뽑는데 null 인 결과도 뽑는다. 


--(+) 이쪽에붙였다가 저쪽에 붙였다가 하면댄다.
--중요한것은 만족하지않는 데이터를 뽑을때 아우터조인을 써야댄다를 알아야한다.


--졸업자가진단시스템 
--들었던데이터, 듣지않았던 데이트 뽑아내야할때 


--모든 사원의 사번,이름,상관사번, 상관이름
--단 상관이 없을 경우 상관이름에 '사장'으로 출력
select e.employee_id, e.first_name, nvl(ee.employee_id,100), nvl(ee.first_name, '사장')
from employees e, employees ee
where e.manager_id = ee.employee_id(+)
order by e.employee_id;


--사수없는데가 더많다. 자꾸물어보면 첨에는
--카피만하지말고 있는것에서 +알파. 
--뭔가 아쉬웠던거 이거를 추가하면 좋을것같다하는것.
--오후에 면접봣던친구들의 후기 공유 : 방향성.
--그이전에 스프링까지는 다해야댐.
--elanc


--모든 사원의 사번, 이름, 상관사번, 상관이름, 부서이름
--단 상관이 없을 경우 상관이름에 '사장'으로 출력
--단,부서가 미지정일 경우 부서이름을 '대기발령중'으로 출력
select e.employee_id, e.first_name, ee.employee_id, nvl(ee.first_name, '사장'),  nvl(d.department_name,'대기발령중')
from employees e, employees ee, departments d
where e.manager_id = ee.employee_id(+) 
and e.department_id = d.department_id(+)
order by e.employee_id;


----사수없는데가 더많다. 자꾸물어보면 첨에는
--카피만하지말고 있는것에서 +알파. 
--뭔가 아쉬웠던거 이거를 추가하면 좋을것같다하는것.
--오후에 면접봣던친구들의 후기 공유 : 방향성.
--그이전에 스프링까지는 다해야댐.
--elanc


    ---------------------------------------------------------------------------------
    ---------ANSI JOIN(표준데이터베이스 안가린다.)-------------------
    
    --<오라클> 카타시안프로덕트?
    select * 
    from employees, departments;
    
    --cross join-
    select * 
    from employees cross join departments;
    
    ----------------------------------------------
    
    --<오라클>사번 이름 부서이름
    select e.employee_id, e.first_name, d.department_name
    from employees e, departments d
    where e.department_id = d.department_id ;
    
    --[inner] join
    select  e.employee_id, e.first_name, d.department_name
    from employees e  inner join departments d 
    on e.department_id = d.department_id;
    
    --부서번호가 50인 사번,이름,부서이름
    select  e.employee_id, e.first_name, d.department_name
    from employees e  inner join departments d 
    on e.department_id = d.department_id
    where e.department_id = 50;
    
    --using 이용 (컬럼이름 똑같을때 쓸수잇다.) 같다비교
    select  e.employee_id, e.first_name, d.department_name
    from employees e  inner join departments d 
    using (department_id)
    where department_id = 50;
    
    --natural join은 똑같은 컬럼이 하나일때만 쓰자 똑같은 컬럼을 모두 조인해서 보여준다.
    select  e.employee_id, e.first_name, d.department_name
    from employees e  natural join departments d 
    where department_id = 50;