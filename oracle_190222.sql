���� ���� ���� - �����ؾߴ�. 


����- ���� ���غ��� �ؾ߰���? ���ν� ������ ������ �� �ִٸ� �װ��� �������� ǥ���ϸ� �Ǵ°� ���̴�. �׷��ϱ� �����ϴ°� ���� 
            �߿���.


���� -  ���߿� api���� ���� �� ����� �Ǿ��־�.     
            �׸��� ���۸��Ҷ� (���̹��δ� spring ������ ���� ������ ����.) �˴� �����.
            �� �����ѻ���Ʈ overflow.com  �� ����Ʈ�� ���������� ���� ���� ���ٵ�
            ��� ���ٺ��� ���� ��ۿ� thanks �ִ°� ���� �� �ڵ� �����ϰ� �ɰž�.


* Where ������

*������ �� �˾ƾ���
 
������� �ڵ��ϸ� �ڵ��ϼ��� �˷��༭ ����.
���� ���� ǥ���ϰ� �װ��� ���� ������ ������ ��.

select                               3
from                                 1
where                                2


�񱳿����ڸ� �̿��Ͽ� ������ ����� �� �ִ�.


=, <, >, <= , >= , <> (!=, ^=)


����)


--���, �̸�, �޿�(����: 5000�̻� �޴� �����) �μ���ȣ


select employee_id, first_name, salary, department_id
from employees
where salary >= 5000;


--����� 100�� ����� ��� �̸� �μ���ȣ


select employee_id, first_name, department_id
from employees
where employee_id =100;


--�μ���ȣ�� 50�� �ƴ� ����� ��� �̸� �μ���ȣ
select employee_id, first_name, department_id
from employees
where department_id != 50;
 
select employee_id, first_name, department_id
from employees
where department_id ^= 50;


select employee_id, first_name, department_id
from employees
where department_id <> 50;


-- �ٹ����ð� seattle �� ������ ������ȣ �����ȣ


select location_id, postal_code
from locations
where city='Seattle';
*seattle�� �ϸ� ������ ������. 
    
�����ʹ� ��ҹ��ڸ� �����ϰŵ�.


����) �̰Ŵ� ���� ���� �ȴ�.
���� ��ҹ��� ������ ���ϴ� ��Ȳ���� ã�Ƴ�����?
>lower �ҹ��ڷ� �ٲٴ°� upper �빮�ڷ� �ٲٴ°�






**�����ͺ��̽����� '=' �� �ǹ̴�
'����'
�� ����صμ���. �̰� ���� ���α׷� ���� �򰥸��ϱ�.


�����ͺ��̽��� ���ٴ� = �̴�


��- �����ϰ�����Ÿ� �����Ϸ��� 
���ó��
�ϰ� �ϸ���.




* �������� NOT AND OR 


where ���������ٰ� �������ڸ� ����Ͽ� ������ ������ ǥ�� �� �� �ִ�.


NOT
AND
OR




�� ������ �񱳿����ڷ� Ǯ���. �ȵɲ�?


-- �޿��� 5000�̻� 10000�̸��� �޴� ����� ���, �̸�, �޿�, �μ���ȣ


��, 
�񱳿����ڸ����δ� ���������� �ΰ� �񱳰� �Ұ����ϳ�
���ε��� ���ȴ�� �ٿ����� �ȵǴϱ�...


�׷��� �����ϳ� �ʿ��ϰڳ�. �ٷ� �� ������.


�����꿡�� ũ�� 3������ �־��.


���ǽĿ��� ���ü��ִ°� 


�б����� �������?


* AND ������


*���α׷����� �ٸ��� �յڿ� null�� ���´�.
������� �޶�����. �� ����ϼ���.
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


*���α׷������� && 
����Ŭ������ and �� �����ڸ� ����.


and ������ �տ� F�� ������ �ڴ� Ȯ���� �ʿ䵵 ���� F �̴�. (���� �ٿ��ش�.)


* OR ������
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
or ������ �տ��� T �� �ڴ� �� �͵� ���� T �̴�. (���� �ٿ��ش�.) ������ �Ű澲�� ��������� ���߿� �˾Ƶ���




����ٰ� �ϳ� �� 
* NOT �� ������.
      not �̸� true
       true �� not
      null �̸� null
     
 
����)
-- �޿��� 5000�̻� 12000�̸��� �޴� ����� ���, �̸�, �޿�, �μ���ȣ


select employee_id, first_name, salary, department_id
from employees
where salary >= 5000
and salary <12000;
 
--�μ���ȣ�� 50�� ��� �߿� �޿��� 5000�̻� �޴� ����� ��� , �̸� , �޿�, �μ���ȣ
 
select employee_id, first_name, salary, department_id
from employees
where department_id = 50
and  salary >= 5000;
 
-- �޿��� 5000�̻� 12000���ϸ� �޴� ����� ���, �̸�, �޿�, �μ���ȣ
 
 


select employee_id, first_name, salary, department_id
from employees
where salary >= 5000
and salary <=12000;


-- ���� ǥ�� : between�� �Ẹ��! �̻� ����(����)�� ǥ�������ϴ�. 


select employee_id, first_name, salary, department_id
from employees
where salary between 5000 and 12000;


--Ŀ�̼��� �޴� ����� ���, �̸�, �޿�,Ŀ�̼����Աݾ�  *������ �ؼ��ϴ� �ɷ� �䱸


select employee_id, first_name, salary, salary+salary*commission_pct
from employees
where commission_pct > 0;
��� ���� �Ȱ��� �������ߴµ� �����԰��� �ٸ���.


--������ Ǯ��. null �̿�.  null �� ���ؼ� ������ is�� �ٿ��� is null �� is not null �� ������.


select employee_id, first_name, salary, salary+salary*commission_pct
from employees
where commission_pct is not null
***is not null ���� �򰥸��ϱ� �� ����ϼ���. 


-- �ٹ��μ��� 50 60 90 �� ����� ��� �̸� �μ���ȣ


select employee_id, first_name, salary, department_id
from employees
where department_id = 50
or department_id = 60
or department_id = 90;




���ݱ��� �����ϴ� ����Ŭ �����? ��ճ���? 
���� ��մµ�


���� 4��¥��?
���߿� 200�� 300�� ¥�µ�
���߿� ������� 3 �̷��� ���Ϳ�.


���ϴ� ���� ���������� ����� ���� ����. 


�Խ��� -���


-�Ｚ ����-
�̰��� - 4700�� 
����� - 1800��


������ 60~70%�� ��Ÿ��.
�׷��� ���α׷��� ���°Ŵ�.


������ �ͼ����������ϱ� ���� �ڵ带 ���. �ð� ����� �ִ� ������ �װ���.
���߿��� �ڵ��ϼ��� �Ἥ ������ ��Ȯ�ϰ� ��Ÿ�� ����.
 
-- �ٹ��μ��� 50 60 80 �� ����� ��� �̸� �μ���ȣ (���� �� ��������. 50�̰ų� 60�̰ų� 80�̰ų�)


select employee_id, first_name, first_name, department_id
from employees
where department_id = 50
or department_id = 60
or department_id = 80;


-- �ٹ��μ��� 50 60 80 �� �ƴ� ����� ��� �̸� �μ���ȣ (���� �� ��������. 50�� �ƴϰ� 60���ƴϰ� 80�� �ƴϿ���)


select employee_id, first_name, first_name, department_id
from employees
where  department_id <> 50
and  department_id != 60
and not department_id = 80;






���� �̰� �鰳 ���̸� �̰ŵ� ������? �̰� �ذ��ϴ¹���� ���Ŀ� �Ұ�. 
������ ���� ö���� �������� �ܿ������������� ���� �ؾߴ�


-- in ������ ����ؼ� �� �����ϰ�. ���� ����Ѵ� �� �������. (���� �����ʴ� ���� ��)  any , all�� �ִٶ�� �˾Ƶ���. exist�� ���� �Ⱦ���.


-- �ٹ��μ��� 50 60 80 �� ����� ���, �̸�, �μ���ȣ


select employee_id, first_name, first_name, department_id
from employees
where department_id in (50,60,80) ;


-- �ٹ��μ��� 50 60 80 �� �ƴ� ����� ���,�̸�, �μ���ȣ


-- not in ���
select employee_id, first_name, first_name, department_id
from employees
where department_id not in (50,60,80) ;






--�޿��� 3000�̻� �̰ų� 8000�̻� �̰ų� 5000 �̻��� ����� ��� �̸� �޿�


select employee_id, first_name, salary
from employees
where salary >= 3000
or salary >= 8000
or salary >= 5000;


--  any ������ (ũ�� ��񱳸� ���ټ��ִ� �׷��Ƿ� any �տ� ��ȣ�� ��)
select employee_id, first_name, salary
from employees
where salary >= any (3000,8000,5000);


--�޿��� 3000�̻��̰� 8000�̻��̰� 5000�̻��� ����� ��� �̸� �޿�


select employee_id, first_name, salary
from employees
where salary >= 3000
and salary >= 8000
and salary >= 5000;




-- all ������ ���δ� ����
select employee_id, first_name, salary
from employees
where salary >= all (3000,8000,5000);






��¥������ ���ϱ��ϰ� ���⸸ �����ؿ�. 
--����ð�, 3����, 3�ð��� 
select to_char(sysdate,'yy.mm.dd hh24:mi:ss') "����ð�" ,
 to_char (sysdate+3,'yy.mm.dd hh24:mi:ss') "3����" ,
 to_char(sysdate+3/24,'yy.mm.dd hh24:mi:ss') "3�ð���"
from dual;


����� ���� (db �����ڰ� ���� ����� ��� ��) ����Ͻú��� �ٳ���.


���ϵ�ī��
%
_
-���ϵ�ī��� ���� �ִ°� �ΰ������ִ�.
 
 ù���� : %
 
�������͵� ����̾���. % 
%�� �ڸ����� ����̾���.
 
 
�ι�° : _ ����ٴ�.
 
�����͵� ���������
����ٴ� �ڸ����� �ǹ��Ѵ�.




-- �̸��� 'S' �� �����ϴ� ����� ���, �̸�
select employee_id , first_name
from employees
where first_name like 'S%';
 
-- �̸��� 'e'�� ���� ����� ���, �̸�
select employee_id , first_name
from employees
where first_name like '%e%';
 
-- �̸��� 'y'�� ������ ����� ���, �̸�
select employee_id , first_name
from employees
where first_name like  '%y';
 
--�̸����� ������ ����°�� 'e'�� ����� ��� , �̸�
select employee_id , first_name
from employees
where first_name like '%e__';
 
�긦 ��� ���̾���? 
���̹� �˻����� �˻��ϸ� ����� �͵� ã���شٰų�
�Խ��� �����̳� �������� ã�⿡��  like �� �˻��� �ϰ���
�ۼ��� ã��� ���ؾ� �ɱ�? = (����) �˻��� �ϰ��� 
 
 
* order by ����
 
where �������� �� ������ �Ҽ��־��ݾ�.
order by �� �Ἥ ������ ���ټ��ִ�.
 
select             3
from               1
where              2  
order by           4             
����  �� �˾Ƶΰ�.
 
���� ���ٶ� ���ڷ� �������� ���������� �Ӽ��̸��� ���������.
 
���������� asc (����Ʈ �⺻��)
 
���������� desc;
 
������ ���¸� �����ϸ鼭 �� ������ �Ҽ� �־�.
�޸� , �� �̿��ϸ� �� ������� �� �� �ִ�.
 
 
-- ��� ����� ��� �̸� �޿�
-- �� �޿��� ����     
select employee_id, first_name, salary
from employees
order by salary desc;
 
-- �μ� ��ȣ ��� �̸� �޿�
 
--�� �μ��� �޿� ������ ����   ( �μ����� �����ϰ� �޿������� �ٽ� ���� ) ���ļ������ �޸��� ������.
select department_id, employee_id, first_name, salary
from employees
order by department_id , salary desc;
 
where 
 
order by
 
���� �⺻���� select ����.

-----������ �����ϱ⿡ �ռ� ������ ����-----
db�� �����ϴ°� 
 
join �����̴�.
 
�����.
 
���̶�� ǥ���Ѵ�.
 
��������
 
 
�̰������� ���� �߿��� �κ� 
 
���� �ַ��� �Ѹ����� 
���������� �׷��� ����� �ʴ�.
 
 
ó���� ������Ⱑ ��ƴ�.
 
���������ȵȴ�.
 
������ ȭ���Ϻ����� ������ü�� ��鸱���ֵ�.
