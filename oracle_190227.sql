--<27��>
--non-equi join.
--��� ����� ��� �̸� �޿� �������
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




--*���* ����� ���, �̸�, �μ���ȣ, �μ��̸�
--��,�μ��� ��������(null)��� �μ��̸��� '���߷���'���� ���


select e.employee_id, e.first_name, d.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id;


--outer ���� --
select e.employee_id, e.first_name, d.department_id, nvl(d.department_name,'���߷���')
from employees e, departments d
where e.department_id = d.department_id(+);


--����: �ΰ��� ���̺��� �����ؼ� �̴µ� null �� ����� �̴´�. 


--(+) ���ʿ��ٿ��ٰ� ���ʿ� �ٿ��ٰ� �ϸ���.
--�߿��Ѱ��� ���������ʴ� �����͸� ������ �ƿ��������� ��ߴ�ٸ� �˾ƾ��Ѵ�.


--�����ڰ����ܽý��� 
--�����������, �����ʾҴ� ����Ʈ �̾Ƴ����Ҷ� 


--��� ����� ���,�̸�,������, ����̸�
--�� ����� ���� ��� ����̸��� '����'���� ���
select e.employee_id, e.first_name, nvl(ee.employee_id,100), nvl(ee.first_name, '����')
from employees e, employees ee
where e.manager_id = ee.employee_id(+)
order by e.employee_id;


--������µ��� ������. �ڲٹ���� ÷����
--ī�Ǹ��������� �ִ°Ϳ��� +����. 
--���� �ƽ������� �̰Ÿ� �߰��ϸ� �����Ͱ����ϴ°�.
--���Ŀ� �����f��ģ������ �ı� ���� : ���⼺.
--�������� ������������ ���ؾߴ�.
--elanc


--��� ����� ���, �̸�, ������, ����̸�, �μ��̸�
--�� ����� ���� ��� ����̸��� '����'���� ���
--��,�μ��� �������� ��� �μ��̸��� '���߷���'���� ���
select e.employee_id, e.first_name, ee.employee_id, nvl(ee.first_name, '����'),  nvl(d.department_name,'���߷���')
from employees e, employees ee, departments d
where e.manager_id = ee.employee_id(+) 
and e.department_id = d.department_id(+)
order by e.employee_id;


----������µ��� ������. �ڲٹ���� ÷����
--ī�Ǹ��������� �ִ°Ϳ��� +����. 
--���� �ƽ������� �̰Ÿ� �߰��ϸ� �����Ͱ����ϴ°�.
--���Ŀ� �����f��ģ������ �ı� ���� : ���⼺.
--�������� ������������ ���ؾߴ�.
--elanc


    ---------------------------------------------------------------------------------
    ---------ANSI JOIN(ǥ�ص����ͺ��̽� �Ȱ�����.)-------------------
    
    --<����Ŭ> īŸ�þ����δ�Ʈ?
    select * 
    from employees, departments;
    
    --cross join-
    select * 
    from employees cross join departments;
    
    ----------------------------------------------
    
    --<����Ŭ>��� �̸� �μ��̸�
    select e.employee_id, e.first_name, d.department_name
    from employees e, departments d
    where e.department_id = d.department_id ;
    
    --[inner] join
    select  e.employee_id, e.first_name, d.department_name
    from employees e  inner join departments d 
    on e.department_id = d.department_id;
    
    --�μ���ȣ�� 50�� ���,�̸�,�μ��̸�
    select  e.employee_id, e.first_name, d.department_name
    from employees e  inner join departments d 
    on e.department_id = d.department_id
    where e.department_id = 50;
    
    --using �̿� (�÷��̸� �Ȱ����� �����մ�.) ���ٺ�
    select  e.employee_id, e.first_name, d.department_name
    from employees e  inner join departments d 
    using (department_id)
    where department_id = 50;
    
    --natural join�� �Ȱ��� �÷��� �ϳ��϶��� ���� �Ȱ��� �÷��� ��� �����ؼ� �����ش�.
    select  e.employee_id, e.first_name, d.department_name
    from employees e  natural join departments d 
    where department_id = 50;