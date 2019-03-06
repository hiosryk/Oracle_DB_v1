----------------------------------------------
--03.04
--�μ���ȣ�� 50�̰ų� 90�� �����
--�޿��� 10000 �̻��� �����
---��� �̸� �޿� �μ���ȣ
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
--intersect (������)
select employee_id, first_name, salary, department_id
from employees
where department_id in (50,90)


intersect


select employee_id, first_name, salary, department_id
from employees
where salary >= 10000;
------------------------------------------------------
--minus (������)
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
--group by ��. ������� ������ �ϴٺ��� �򰥸���.
--�μ��� �޿�����, ��ձ޿�, �����, �ִ�޿�, �ּұ޿�


select department_id, sum(salary), avg(salary), count(employee_id), max(salary), min(salary)
from employees 
group by department_id;
-------------------------------------------------------
--having
--�μ��� �޿�����, ��ձ޿�, �����, �ִ�޿�, �ּұ޿�
--��ձ޿��� 5000 ������ �μ�
select department_id, sum(salary), avg(salary), count(employee_id), max(salary), min(salary)
from employees 
group by department_id having avg(salary) <= 5000;


--------------------------------------------------------
--�� �μ����� ��� �޿�(=��ձ޿�) ���� ���� �޴� �����
--��� �̸� �޿�
select employee_id, first_name, salary
from employees
where salary > all
(select avg(salary)
from employees
group by department_id);


---------------------------------------------------------


--�μ��� �ְ� �޿��� �޴� ����� 
--�μ��̸�, ��� �̸� �޿�


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
--ǥ �����Ÿ��鶧 ����Ѵ�.
-----------------------------------------------------------
select employee_id, salary
from employees;
--rownum : ���ȣ�� �˾Ƴ������ִ�.
select rownum, employee_id, salary
from employees
where rownum < 10;




select rownum, employee_id, salary
from employees
where rownum < 10
and rownum >5 ;
--ũ�� �񱳰� �Ұ����ϴ�.


-------------------------------------���Ŀ� �Ѱ�����----------
--���´���������--


--TOP N Query
--���� ��� �̸� �޿� �Ի��� ���� �μ��̸�
--�޿��� ����. 
--���������� 5�� ���.
--2 page ���. 
--1980��� 1990��� 2000���
--�Խ��� ���� ����. ���θ� ������������ ��ǰ���. �̰Ÿ𸣸� �������� �ƹ��͵� �������.
--
--����Ǯ�����--
select rownum, employee_id, first_name, salary, hire_date, department_name
from employees e , departments d
where e.department_id = d.department_id
and rownum < 6
order by salary desc;




select employee_id, salary, department_name
from employees 
where salary > &page;
---------------------------����.




-------------------------Ǯ��


select rownum employee_id, first_name, salary
from employees
order by salary desc;


select b.rn ranking, b.emp, b.fir, b.sal
    case
        when to_char(hire_date, 'yyyy')< '1990'
        then '1980���'
        when to_char(hire_date, 'yyyy')< '2000'
        then '1990���'
        else '2000'���
        
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
--  rank() over()          �Ȱ��� ������ֵ�. ��ɷ� �ٲ㺸����.


--