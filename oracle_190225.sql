* �����Լ�
--* round  �ڸ��� ���� �ݿø�
--trunc �ڸ��� ���� ����
--floor �Ҽ��� �� ����
--mod ������ 
*�����ͺ��̽������� like�����Ҷ� ���ϵ�ī��� ���ϱ� %�� ���� ������. ��� mod ����. 
--abs ���밪.


<�����Լ� ����>
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


--����� ���, �̸�, �޿�, Ŀ�̼� ���Ա޿�
--Ŀ�̼� ���� �޿��� 100�� �ڸ����� ǥ��(�ݿø�)


select employee_id, first_name, salary, round(salary + salary*NVL(commission_pct,0),-2)
from employees;


* �����Լ�
***�����Լ�*** �Լ��� �����Լ��� �߿���  ���߿����� ��ȯ�� �߿���.


--lower, upper, initcap, length
select 'KiTRI' , lower('KiTRI'), upper('KiTRI'), initcap('KiTRI'), length('KiTRI')
from dual;


--concat �� ���ڰ� �ΰ� ��ġ�°�
concat('ename', 'job')


-- ���, full name
--������-- �������Լ� concat�� ��ø�ؼ� ��������.
select employee_id, concat(first_name, concat(' ', last_name))
from employees;


�ߺ���ø�̵ȴ�. (�Լ��ȿ� �Լ��� ����)
�������Լ��� �������Լ����� ��ø�� �����ϴ�.


***
* substr  ���ڿ����� ���ϴ� ���ڸ� �̾Ƴ�. 
substr  ('���ڿ�', ��������)        = ���ڿ��� ������������ ������ ���� ��ȯ
             ('���ڿ�',��������,��ȯ�ҹ����ǰ���)  = ���ڿ��� ������������ ���ϴ� ������ŭ ��ȯ


--substr('coolcoffee',5) :             'coolcoffee'�� 5��°���ں��� ��� ���ڸ� ��ȯ   = 'coffee'
--substr('coffeehot',7,3):          'coffeehot'�� 7��°���ں��� 3���� ���ڸ� ��ȯ  = 'hot'


* instr ���ڿ����� ���� ���ϴ� ������ ��ġ�� ������ġ��  
instr ('���ڿ�', 'ã������') = ���ڿ��߿��� ã�������� ��ġ�� ����? 
        ('���ڿ�', '���ڿ�������ã������', ��������, �׹����߸��°����)  =  ����� ������ġ�� ����
*����� ������ 0 ��ȯ


--instr('moonjayeol', 'y')           :   'moonjayeol'��  'y'�� ��Ÿ���� ������ġ�� ��ȯ =7
--instr('moonjayeol', 'e', 5)       :   'moonjayeol'�� 5��°�����Ǻ��� 'e'�� ��Ÿ���� ������ġ�� ��ȯ = 8
--instr('moonjayeol', 'o', 2, 3)  :    'moonjayeol'�� 2��°�����Ǻ��� 'o'�� 3��°�� ��Ÿ���� ������ġ�� ��ȯ = 9




***substr, instr ��ø�Լ� �̿��ϱ�***
--�����ȣ���� 
--'123-456' zipcode , ù��°���� �뽬������ zip1 ,�뽬�ĸ� zip2 
--�뽬�� ��ġ�� �ٲ���� �뽬�� �������� zip1 zip2�� �����ּ���. (ex. 1234-56)  


Ǯ�̰���
* instr ('���ڿ�', 'ã������') �̿��Ͽ�        '- '�� ��ġ�� ã�Ƴ���.
- '-'�� ��ġ:  instr('123-456','-') 
* substr('���ڿ�',��������, ���ڹ�ȯ����)  �� �̿��Ͽ� zip1 �� ��Ÿ���ش�. 
zip1 = �뽬�� ���� ���̹Ƿ� �뽬��ġ-1 ���ش�. 


                                '123-456'�� 1��°�ڸ����� �����ġ-1 ������ŭ ��ȯ
-zip1:             substr('123-456',1,instr('123-456','-')-1) 


                              '123-456'�� �����ġ+1���� ��繮��
-zip2:            substr('123-456', instr('123-456','-')+1)




select '123-456' zipcode, 
substr('123-456',1, instr('123-456','-')-1) zip1 , 
substr('123-456', instr('123-456','-')+1) zip2
 
from dual;






 




--��¥�Լ� (�����ʿ�)
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


--to_char ( ����,��¥������ ������������ �ٲ��ش�.)
select sysdate, to_char(sysdate,'yyyy yy mm month w ww d dd ddd dy day'
)
from dual;
select sysdate, to_char(sysdate,'hh''hh24''pmhh:mi:ss''mi''hh24:mi:ss''hh24:mi:ss'
)
from dual;
select sysdate, to_char(sysdate, 'yyyy month dd''hh24:mi:ss')
from dual;


--'mm'  �� 3�ڸ��� ǥ��
--'month' Ǯ���� �� ex)january
--w �̹����� ������
--ww �̹����� ������ 
--d ���� 
--dd �Ѵ����� ���° ������ (��)
--ddd �̹����� ���° ������
--dy 3�ڸ��� ���� ǥ��
--day Ǯ���� ����
--hh ��
--am(pm) 
--hh24
--mi ��
--ss ��
select to_char(sysdate, 'yyyy mm dd hh24 mi ss'),
        to_char(trunc(sysdate),'yyyy mm dd hh24 mi ss'),
        to_char(trunc(sysdate,'dd'),'yyyy mm dd hh24 mi ss'),
        to_char(trunc(sysdate,'mm'),'yyyy mm dd hh24 mi ss'),
        to_char(trunc(sysdate,'yy'),'yyyy mm dd hh24 mi ss'),
        to_char(trunc(sysdate,'hh'),'yyyy mm dd hh24 mi ss'),
        to_char(trunc(sysdate,'mi'),'yyyy mm dd hh24 mi ss')
from dual;




--����<> ����<> ��¥
--  <<<<<<<>>>>>>>


--���� to_char >>>> ����


--���� to_date >>>> ��¥


--���� to_number >>>> ����


-- ��¥ to_char >>> ����


select to_char(




--------------------------------------------------
select 'a'
from dual;


select 3   , '3'
from dual;


--������ 3 
select '3'     
from dual;


--����Ŭ�� + �� ������길 �Ǳ⶧���� �ڵ����� ���ڷ� �ٲ��. �ڵ�����ȯ
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


--���ڸ� ���ڷιٲٰ� ��¥�� �ٲ���. 
--20190225142154 >>��¥ >>3�� �� 


--������
select 20190225142154, to_char(to_date(to_char(20190225142154,'00000000000000'), 'yyyy mm dd hh24 mi ss') +3, 'yyyy mm dd hh24 mi ss')
from dual;
--�̵��� �����Ѱ� ���ðŴ�.
--�Ϲ��Լ�


-- nvl ���̾ƴϸ� �տ� ���̸� �ڿ�, 
--nvl2 ���̾ƴϸ� 1 ���̸� 0  
select commission_pct, nvl(commission_pct,0) , nvl2(commission_pct, 1,0)
from employees;


-- �������
-- �޿��� 4000�̸��� ����� ������
-- �޿��� 10000�̸��� ����� ��տ���
-- �޿��� 10000�̻��� ����� ����
-- ���, �̸�, �޿�, ������� �� �Ѹ���;�.


select employee_id, first_name, salary,
      case 
            when salary < 4000
                then '������'
            when salary < 10000
                then '��տ���'
                   else '����'
        end �������
from employees
order by salary desc;


--�������
--1980�⵵ �Ի� �ӿ� 
--1990�⵵ �Ի� ����
--2000�⵵ �Ի� ���Ի��
-- ��� , �̸�, �Ի���, �������


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


--�ƽ�Ű�ڵ尪. �̳��� �ݵ�� ����� �ϼž��Ѵ�. 
-- 48, 65, 97
select ascii ('0'), ascii('A'), ascii('a') , chr(47) , chr(48)
from dual;


select case when 'abc' < 'abd' then '�۴�'
else 'ũ��'
end
from dual;


���������.
--�ý��۽ð����� 144���� yyyy mm dd day  ���·� ��Ÿ���ּ���. ��Ī�� "������"


select to_char(sysdate+144,'yyyy mm dd day') "������"
from dual;


--2019/07/21 �� 2019�⵵�κ��� �� ��° �� �ϱ�??


select to_char(to_date (to_char('20190721', '00000000'),'yyyy mm dd'), 'ddd') 
from dual;


--  Q1. �� ����� �̸�, �μ���ȣ, �޿�, �޿��� ������ ����ϱ�
-- ��, ������ ������ ������ Job_Grades ���̺��� �����Ѵ�.
-- ��, ������ �������� �������� �����Ѵ�.
-- ��, ������ ��Ī�� �ش�(�޿��� ����).


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
    end "�޿��� ����"
from employees
order by "�޿��� ����";


select *
from job_grades;
 
 
select last_name, department_id, salary,
        case when salary <2999 then 'A'
                when salary <5999 then 'B'
                when salary <9999 then 'C'
                when salary <14999 then 'D'
                when salary <24999 then 'E'
                else 'F'
        end as "�޿��� ����"
from employees
order by "�޿��� ����";


--  Q2. ���� A�� 2019��02��20�Ϻ��� 2019��07��16�ϱ��� ����� ��, �� �Ⱓ�� ��ĥ���� ���Ͻÿ�
-- ��, ��¥�� 20190220, 20190716 ������ ���ڷκ��� �����Ѵ�.
-- ��, �ָ��� �����Ѵ�
-- ��, ��Ī�� �����Ⱓ


select to_date(to_char(20190716, '00000000'),'yyyymmdd') - to_date(to_char(20190220, '00000000'),'yyyymmdd') + 1 as �����Ⱓ
from dual;
--------------------------------------
���̺���� ���踦 �� �ľ��ϰ� ����.