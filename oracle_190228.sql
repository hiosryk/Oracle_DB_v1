--<2.28>
-- �μ��̸��� 'IT' �� �ٹ��ϴ� ����� ���, �̸�, �޿�
--select * from departments;


select  e.employee_id, e.first_name, e.salary
from employees e, departments d
where e.department_id = d.department_id
 and d.department_name= 'IT';
 
--��������������������. ���״�� īŸ�þ����δ�Ʈ�����´�.
--160�ǿ����ؼ� ���Ǹ����ϴ°͵� �̾ƿ´�.
--���̹��������غ��� ȸ�������� 5õ�����̴� �����̺� �����ؾߴ�
--�� ���̺� 100���� �����غ��� 50��
--�� �ʸ� �鸸 õ�� ������ ���̺��̰���. �׷��� ���̰���?
--employees ���� �ִ� �������ε� ���� �������ؾߴ볪 �ϰ� �����̵��.


select employee_id, first_name, salary
from employees
where department_id = (select department_id
                        from departments 
                        where department_name = 'IT');








--���ǿ� "��"�� ���;ߴ�µ� "select"�� �����ϱ� ��������Ҽ��ְ� ��ȣ���ش�.
--�̷��� ���� ���߿� ���Ⱑ ���������.
--select�� ���缭 �ٿ��ش�.
--���� ����, ������ ��� �ϴ°��Դϴ�.


--'Seattle' �� �ٹ��ϴ� ����� ���, �̸�, �޿�


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
--�̰ɴ���ġ�ڴ¼Ҹ���.
select employee_id, first_name, salary
from employees
where department_id in (10,90,110,190);




select *
from departments
where location_id = 1700




select *
from locations
where city='Seattle';






--�̰ɴ���ġ�ڴ¼Ҹ���.
select employee_id, first_name, salary
from employees
where department_id in ( select department_id
                        from departments
                        where location_id = 
                                           ( select location_id
                                from locations
                                where city='Seattle')
                                
                        );        






--������ȣ�� 1700�� �μ����� ���ϴ� ����� 
--���, �̸�, �μ���ȣ, �μ��̸�


select e.employee_id, first_name, e.department_id, d.department_name    
from employees e, departments d
where e.department_id = d.department_id
and d.location_id = 1700;
              
--�������� �ٲ㺸��. ���������̿��ؼ� from���� �����־�.
--inline view 
--
select e.employee_id, first_name, e.department_id, d.department_name    
from employees e, (select department_id, department_name
                    from departments
                    where location_id = 1700) d
where e.department_id = d.department_id;      




--'Kevin'���� �޿��� ���� �޴� ����� ���, �̸�, �޿�


--Ǯ�̰���--
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






--50�� �μ����ִ� ����� ���� �޿��� ���� �޴� ����� ���,�̸�, �޿�
--�����մ»���麸�� ���̹޴»����
select employee_id, first_name, salary
from employees
where salary >                
                (select max(salary)
                from employees
                where department_id =50
                );
--������--
select employee_id, first_name, salary
from employees
where salary > all (select salary
                from employees
                where department_id =50
                );


               
--���μ��� �ٹ��ϴ� ������� ��� �޿����� ���� �޴� ����� ���, �̸�, �޿�


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
                
-----------�ǵ��Ѱ�----------------
from employees
where salary 
                
                






--�μ���ȣ�� 20���� ����� ��� �޿����� ũ�� ���߿���
--�Ŵ������ִºμ���ȣ�� 20�� �ƴ� ����� ���, �̸�, �޿� ,�μ���ȣ


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


--�ð������̲����ع���-------------------------------------------------
--�μ���ȣ�� 20���� ��� �޿����� ũ��
--�μ��� ������� �μ���ȣ�� 20�� �ƴ� �����
--��� �̸� �޿� �μ���ȣ
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
--select�����ٰ��� �������� �����ִ�.
--20�� �μ��� ��ձ޿� 
--50�� �μ��� �޿�����
--80�� �μ��� �ο���
select
        (select avg(salary) from employees where department_id =20) avg20,
        (select sum(salary) from employees where department_id =50) sum50,
        (select count(employee_id) from employees where department_id =80) count80
from dual;
--������ ���ϰ��� ���ü��ִ�. ���̰� ���̰� ������ �ϳ���
------------------------------------------------------------------------
--��� ����� ��� �̸� �޿� ��� �μ��̸�
--�� A�� 1���, B�� 2���.....F 6������.
--�𸣰�..
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
---�̻��¿��� jg�� ���� �������� 
select e.employee_id, e.first_name, e.salary,
        case
        when (select grade_level from job_grades where e.salary between lowest_sal and highest_sal) = 'A'
        then '1���'
        when (select grade_level from job_grades where e.salary between lowest_sal and highest_sal) = 'B'
        then '2���'
        when (select grade_level from job_grades where e.salary between lowest_sal and highest_sal) = 'C'
        then '3���'
        when (select grade_level from job_grades where e.salary between lowest_sal and highest_sal) = 'D'
        then '4���'
        when (select grade_level from job_grades where e.salary between lowest_sal and highest_sal) = 'E'
        then '5���'
        else '6���'
        end ���,
d.department_name
from employees e, departments d
where e.department_id = d. department_id;
--------����� ���---------
select e.employee_id, e.first_name, e.salary,
        decode ((select grade_level from job_grades where e.salary between lowest_sal and highest_sal),
        'A','1���',
        'B','2���',
        'C','3���',
        'D','4���',
        'E','5���',
        '6���')���,
d.department_name
from employees e, departments d
where e.department_id = d. department_id;


----------------------------------------------------
--orderby������ �������������������� ������ ���� ���Ͼ���. �˾Ƹ��μ���.










--
--������ ������Ʈ�Ҷ� ���� �����ϴ� �����߿��ϳ��� ���ĸ���
--db�ϰ� �������ϴϱ� db�ϰ� ¥���̰Ŵ�.
--�ڱ⸸ ������ �߾ƴϱ�.
--������������� db������ �����
--�ڹ� �ƹ������ص�
--���� db�� �ִ°� ������� ȭ�鿡�ٰ� �Ѹ��°ǵ�
--�����𸣸� select�� ������.
--�׷��� �ڹ� �ƹ������ص� ���� ���ϰ���.
--���̺� ����ִ��� � �������ִ��� 
--Ȯ���ϰ� �ľ����ؾ��Ѵ�.
--�ݵ�� ���ϴ»���� �ϸ� �ȵŰ� �� �����ؾ��Ѵ�.
--�ʹݿ��� �� ������ ������������
--���������� ���������κ����� �� ������. �ٰ����ϼ���.