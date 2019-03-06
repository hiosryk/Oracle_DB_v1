* case when then �̿�
--��� �̸� �Ի糯¥ �������
-- �������
-- 1980~ 1990 �ӿ� (���.)
-- 2000 ���� ����
-- ������ ���Ի��
select employee_id, first_name, hire_date, 
    case
        when hire_date between '1980/01/01'and '1990/01/01'
            then '�ӿ�'
        when hire_date < '2000/01/01'
            then '����'
        else '���Ի��'
        end �������
from employees
order by hire_date ;


--��� �̸� �μ���ȣ ��������
-- ��������
--�μ���ȣ 60 ������   
--�μ���ȣ 90 �ӿ���
--       else �񰳹���
select employee_id, first_name, department_id, 
case
when department_id = 60 
    then '������'
when department_id = 90
    then '�ӿ���'
else '�񰳹���'
end ��������
from employees;
--������������ when then when then ��� �������� ��� ó���ұ�?
* decode�� �̿��ϴ� ���
select employee_id, first_name, department_id, 
    decode(department_id,
        60,'������',
        90,'�ӿ���',
        '�񰳹���') ��������
from employees;
--������, ��տ���, ����. �����������.
--decode�� ������ (����) �� �����ϴ�.
--��񱳴ºҰ��� >> ��񱳴� case when then 
--


-----------------------------------------------------------------------------------------
* �׷��Լ�
--ȸ���� �ѻ����, �޿�����, �޿����, �ְ�޿�, �����޿�
----Ǯ�̰���---
SELECT
    *
FROM employees;


--20���̶� �������� 20000���̶�� ��ũ�� �ٳ�����? nono count��°���������.
select count(employee_id)
from employees;
--count�� �������Լ� ������ �ϳ������´�.
--�̰� �˾ƾߵſ�.
--�÷���
count
--����
sum(salary)
--���
avg(salary)
--�ְ�
max(salary)
--����
min(salary)
---------------------�̴ټ������� �� ����ϼž��մϴ�.---------------


--��� �޿����� ���̹޴� ������� ����� �̸��� �޿�
select employee_id, first_name, salary
from employees
where salary > avg(salary); ��������. �ֳ�...
--����: �׷��Լ��� �㰡�����ʽ��ϴ�. 
--sum avg �׷��Լ��� ����? �׷����� �ؾߴ�. 
--�׷��Լ��� where �������� ���ü�������.
--������� �����ϸ���.
--���������� ���� ���� �׷����� �ϴϱ��������.
--�׷��Լ��� ���������� �����Ҽ�����.
--�����ȿ� ������ ����־���Ѵ�.
--��������.
--���ݺ��� �˷��ٰ�
--------------------------------------------------------
-- ��� �̸� �μ���ȣ
select employee_id, first_name, department_id
from employees;
--���̱� ���δ�. �ٵ�...������ ���� , 90�� �μ��� �׷��� ����? 
--�μ��� �̸��� �������?


select employee_id, first_name, department_id, department_name
from employees;
--������. �ֳ� �μ��̸��� dept ���̺������ϱ�. 
select department_name
from departments;


--�ΰ����̺� ������. 
--�����ͺ��̽����忡�� 1:1 ������ ���ذŴ�. �׷��� 160  īŸ�þ�������Ʈ ��. �����ش��ϴ� ������
select * 
from employees, departments;
--�����������̺��� �����ϴ°�. �ܼ������ϸ� �����ѵ����Ͱ������ϱ� �̳��� ���ϴ� �����͸� ��� �����ٰ��Ѵ�.




-------------------------------------------------1���ó�-
* JOIN�Լ�


--������ ���̺��� ���� . ��� 1���̻��� (n-1��) . ���������̴ϱ� 
--���̺�����̺��� ���輺���ִ�. ���̺���� ���������� ���� ���̺���̴�.
--pk primary �⺻Ű 
--fk foreign �̿�Ű �ܷ�Ű


select *
from employees, departments
where employees.department_id = departments.department_id
order by employee_id;


--pk �� �����������ִ�. �ߺ����������Ҽ�����. null �� ���ü�����. Ŵ������� ģ���� ���������� ����μ���. 


--------
-- �����ؼ� �غ���.--
select employees.employee_id, employees.first_name, departments.department_id, departments.department_name
from employees,departments
where  employees.department_id = departments.department_id
order by employee_id;
--���̺� ��Ī�ֱ�--




select e.employee_id, e.first_name, d.department_id, d.department_name
from employees e ,departments d
where  e.department_id = d.department_id
order by employee_id;




--�ǵ�ȵǵ� � Ǯ����ž�.


--�ϳ�Ǯ�� ���ο����� �ڽ��� ����ž�.


--������ ����� �����غý��ϱ� ����������. ���̺� ����� �����ؔf��. ���̺���� ���踦 �˾ƾ� ������ Ǯ���ִ�.






--'Seattle'�� �ٹ��ϴ� ����� ��� �̸� �μ��̸� �����̸�
--
select e.employee_id, e.first_name, d.department_id, l.city
from employees e , locations l, departments d
where l.city = 'Seattle' and e.department_id = d.department_id and d.location_id = l.location_id
order by employee_id;


--'europe' �� �ٹ��ϴ� ����� ��� �̸� �μ��̸� �����̸�


select e.employee_id, e.first_name, d.department_id, l.city
from employees e ,departments d ,locations l,countries c ,regions r
where      e.department_id = d.department_id 
       and d.location_id = l.location_id 
       and c.country_id = l.country_id
       and c.region_id = r.region_id
    and lower(r.region_name) = lower('europe') ;
--��������1.
--�޿��� 10000�̻��� ������� "�̸�", "�ּ�", "�޿�"  
--�޿��� ���������� ����
select e.first_name, l.street_address , e.salary
from employees e,locations l, departments d  
where e.salary >= 10000 and e.department_id = d.department_id and d.location_id = l.location_id 
order by e.salary desc;


--��������2.
--Kevin ����� �ٹ� ���� �μ��̸��� state


select d.department_id, l.state_province
from employees e , departments d , locations l
where  e.department_id = d.department_id and d.location_id = l.location_id
and e.first_name = 'Kevin';


--************************************************************************************************
--������DB ������.
--����Ŭ������ �����ִ°͵����ִ�.
--ansi������ �״�� mssql�� �������� ����õX�ִ°�. ǥ��. 




--10, 80, 90 �� �μ��� �ٹ����� �����
--���, �̸�, ��å�̸�, �μ��̸�


select e.employee_id, e.first_name, d.department_name, j.job_title
from employees e,departments d, jobs j
where e.department_id = d.department_id 
    and 
      e.job_id = j.job_id
      and e.department_id in(10,80,90);




--���̵��ִ¹����Դϴ�--
--����� 200���� ����� �ٹ� �̷� 
--���, �̸�, ��å�̸�(��������ÿ� ��å�� �̸�), �ٹ���� �μ��̸�, �ٹ� ������ ��°¥������ �ݿø�.


select e.employee_id, e.first_name,j.job_title, d.department_name , months_between(end_date, jh.start_date)  
from employees e, job_history jh, departments d, jobs j 
where e.employee_id = jh.employee_id
and jh.job_id = j.job_id
and jh.department_id = d.department_id
and jh.employee_id = 200


;
--�ϳ��ϳ����踦 �ߵ�������.--
--�ѹ��� �̴°� ��������. 
--
--���α׷����� �����߿��ϴ�. �̰Ÿ𸣸� ���α׷� �������.
--�ĺ� ��ĺ�. ���̺� ����ȭ. 


--������� �μ��̸�, ���, �̸�, �Ŵ������, �Ŵ����̸�
select  d.department_name, e.employee_id, ee.employee_id ,ee.first_name
from employees e , departments d , employees ee 
where d.department_id = e.department_id
 and e.manager_id = ee.employee_id
;


--�����Ҷ� ���̺��� �������� �ܿ켼��-
--********************************************************************************************
--�����͸������ϴ°�select
--���� ������ũ ����, select �ѹ������� 2�� 17���Ŀ� �����Ͱ����Դ�
--���� ��ȭ�Ļ�� ������� �߼ұ���̿����δ� �׻���� ���ͼ� �ڸ���ġ �̵�
--2�� 17�ʰɸ����� �ʴ����� ���´�.
--������ ������ �������Ѱ�.
--**********************�Ƹ��������� ������Ʈ***********
--�������� ���������ؾ� �Ҹ��� �ִ�.
--�������ϴ¸�ŭ���ϸ� ��������. ���� 2~3������� ���� ppt 
--AWS ����. 
--�ϳ��ϳ� ĸ���ؼ� (ȸ�������� �����̾��ʿ��ϴϱ�) �����ְ�
-- ��������ϴ°͵� 
--���ܰ����� ���������� ������ �ʿ������� 
--�����ƴ� �ٸ������ ���� �̰��Ҽ���������
-- ���������� ���������¿����� �ϴ°� 
--�Ƹ����� �����Ѵ븦 ���. �ü���� ��ƾ���. �ڹٿ����� ���н��迭 ������ ��Ҵ�. jdk ������ ����Ŭ������ 
--�޿��� ��ġ�ϴ°ͱ��� �����ְ�
--database ������db�� ��ġ�ϴ°� 
--spring ��������. 


--�̹�������Ʈ
--1,2,4 ���� ����ȭ �ĺ� ��ĺ� ��������.
--3��. ȸ�翡�� �Ƹ����� ��ǥ�����̻���µ� ���� ������. 20���� ���ʽ�.
--���߿� ��¥�� �������������� ������.
--�ѵι� ������ �ݹ游����ִ�. �ణ ����ϴ°��վ �Ű�Ἥ������.
--�������ϳ�. ���� ���������. ������ ĸ�����ݾ�. ���������� �������� ÷��. �����Ϻκи� ppt�� ǥ�����ٵ�
--��ó �� �����������ٰ��־��.


---------------------��������Ǯ��--------------------------
--��å ���̵� 'SA_REP' �� �����
--���, �̸�, ��å�̸�, �μ��̸�
--��, �μ��� ���� ��� '���߷�'���� ��� >> Ŵ������ ã�ƶ�.


select e.department_id, e.first_name, e.job_id, d.department_name  
from employees e,departments d, jobs j
where  e.department_id = d.department_id 
        and e.job_id = j.job_id
        and e.job_id = 'SA_REP'
     
        ;