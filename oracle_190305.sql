--<���� 3.5> �μ�Ʈ
--�����ͼӼ�
--number (n,m)  n:�ڸ���(�ڿ� �Ҽ������� ���ؼ�), m:�Ҽ��� 
--char(n)  �� varchar(n)


--ex char(10) max���� 2000����Ʈ
--      4���ڸ� ��� 10ĭ �״�� ������ �����ִ�.
--java��� �����ߴٰ� java2�� �ٲٰ������ ���������� �״�� ���������ϱ�
--�����Ͱ� ���� ������Ʈ �Ǵ°��. ���� ��ü������ ���ϸ� 
--ȸ���������Ҷ� ���̹��� �ּҴ� �ٲ����� ���Ǿ����ϱ�(vc2) ���θ��ּҴ� ���� ������� �ٲܼ������ϱ�(vc) ��������������.
--�˻������Ѱ��� char�� �ȵȴ�. (*������ ���������ߴ�ϱ�?)
--  varchar2(10) max���� 4000����Ʈ
--    4���� ������ 6ĭ�� ���� (ȿ�������� ������ �������)
--java��� �����ߴٰ� java2�� �ٲٰ� ������ ����������� 2�� �����´�. 
--
--long 2gb �������� ���� ������ (����Ŭ������ ����������Ѵ�. ����������� �������ϱ�)
--lob 4gb�� �ؽ�Ʈ, ������, �̹���, ���� 
--blob�� ���̳ʸ� ���� ������Ʈ - ���Ի����ؼ� ����. (��ȭ ���� �̷��� �� ���尡��) - ���α׷��󿡼� ������� �ؾߴ�.
                                                                                -- ��ƴ�. ���������� ������ ����.
                                                                                --�̰� ��������? 
                                                                                --���б���ȸ�翡�� �л��� ����������͵�
                                                                                --���ǵǸ� �ȴ�°͵�
                                        --���Ӽ��� ����޴¹��. �ΰ���. ������ �̿��ϴ� ��� �����ͺ��̽��� �̿��ϴ¹��.
                                        --���� ã�Ƽ� �����ϰ� �˻��ϱⰡ �����. �׷��� �����ͺ��̽�����.


--clob  ĳ���� ���� ������Ʈ - ���ڿ��߿� ū�� - �̰� ���α׷��ܿ��� ������ ��ٷο���. ������ ��������. 


--date ��¥. 
--timestamp �Ϲ������� ����Ʈ�� ����. �߾Ⱦ���.
--rowid ���� �ȴ�. 




--*�ѱ��� ���� �ΰ���.(�ѱ��� 2����Ʈ��.)
--�ɟ�. �ֶܼ�ü
--�� .  �޸տ�ü


--�ϼ����ѱ� �������ѱ�


--ksc5601 �ڸ��ƽ��ٴٵ��  == euc-kr   2byte      '�̰Ŵ� �ѱ۸� �����ϴ�.'-�츮�������Ʈ���� ���ſ� �̰ɷ� ���������.
--�츮���󿡼������ == ����ǥ��ȭ�ⱸ��������� (���������� ���ǰ��ٰ����)
--char�� 1000����.  


-- utf-8 : �����ڵ� ����ü�� �������ִ� ��繮�ڸ� ó���Ҽ��ִ�. �ߵ����� ���ζ����� �ѱ۵����� ������ī ��繮�� ����.
--�ѱ��� ���ٶ�°��亸�ٴ� �׸��ٰ� �����ϸ���. 
-- �ѱ� 3byte�� ó���Ѵ�.


--char �� 666����. 




--���̺� �����
------ù��°���̺�-----
--create table table-name
--ȸ�� (�ʼ�)  member
--(
--�̸�         name            varchar2(30)
--���̵�       id              vachar2(16)  
--��й�ȣ     pass            vachar2(16)
--����         age             number(3)
--�̸��Ͼ��̵� email           vachar2(30)        
--�̸��ϵ����� emaildomain     vachar2(30)
--������       joindate        date
-- );
-------�ι�°���̺�----
--create table member_detail
--ȸ�� ������ member_detail
--(
--���̵�         id              vachar2(30)
--�����ȣ     zipcode           vachar2(5)             --�ѹ����ƴ�����. 01234 �� 1234�� ó���ع����ϱ�
--�Ϲ��ּ�     address           vachar2(100)
--���ּ�     address_detail    vachar2(100)
--��ȭ��ȣ1     tel1             vachar2(3)
--��ȭ��ȣ2     tel2             vachar2(4)
--��ȭ��ȣ3     tel3             vachar2(4)
-----);
--*���̺��� �̸��� ����ٿܿ� ����,Ư������ �ȵ˴ϴ�.




--���ﶧ�� drop ���̺�
--delete�� �ȿ��ִ� �����͸� ������.


--drop table member;
--drop table member_detail;


--���� �Ǿ��ֱ⶧���� �ڽĺ��� ���־ߴ�. ������ �Ǿ����°����� ����� 
--cascade ������ ���ﶧ (�������� . ������������ �Ź����̸� �װ� ���̺��� �߸�����Ŵ�. ������� ������ְ� ���̺��� ������)


create table member
(
    name varchar2(30) not null,
    id varchar2(16) ,
    pass varchar2(16) not null,
    age number(3) check (age <150),
    email varchar2(30),
    emaildomain varchar2(30),
    joindate date default sysdate,
    constraint member_id_pk primary key (id)
);


create table member_detail
(
    id varchar2(30),
    zipcode varchar2(5),
    address varchar2(100),
    address_detail varchar2(100),
    tel1 varchar2(3),
    tel2 varchar2(4),
    tel3 varchar2(4),
    constraint member_detail_id_pk foreign key (id) references member (id)
);




--�ִ� ���̺� �״�� ���� (���������� �����ϴٴ°ͤ��� �����B�� ��. ���������� ������ �Ȱ��.)
create table emp_all
as 
select * from employees;
--------------------------------------------------------------------------------
--���̺� ������ �״�� ��������;� �����ʹ� ����.
create table emp_blank
as 
select * from employees 
where 1=0;
--�����غ��� 
select * from emp_blank;
------------------------------------------------------------------
--�̷������ε�  �����ϴٴ°��� �����ִ¿� 
create table emp_50
as
select e.employee_id eid, e.first_name name, e.salary sal, d.department_name dname
from employees e, departments d
where e.department_id = d.department_id
and e.department_id = 50;
--�����غ���
select * from emp_50;
---------------------------------------------------------------
--user_constraints
--�������� �Ŵ¹���ΰ��� 
--�÷����� ���̺� ���� ������ �����ϱ������ ���̾�׷����� �������ܳ��߿�
--������. 
--�̸� ����. ���� 


---------------------------------------------
--DDL ����Ÿ ���Ǵϼ� ������  
--DML ����Ÿ �޴��÷��̼� ������ ����Ÿ ���۾� : �μ�Ʈ, ������Ʈ, ����Ʈ, ����
--insert
insert into member
values ('������','hiosryk','1234',29,'hiosryk','naver.com',sysdate);
--Ȯ���غ���--
select * from member;
-----------------------------
insert into member
values ('hong','������','25',129,'hiosryk','naver.com',sysdate);
--�� ������ �Ǽ��� �ٲ����?
--������ ��������� ���� 




insert into member (id,name,age,pass,email,emaildomain,joindate)
values ('hong','������','25',129,'hiosryk','naver.com',sysdate);




insert into member (id,name,age,pass,email,emaildomain,joindate)
values ('hong','������', 123, sysdate);


--������ ���� �ܿ��� not enough values ����������� �÷��� �����Ͱ� �ϴ��� ���̾ƴϳ�. 
insert into member (id,name,age,joindate)
values ('hong2','��������', 123, sysdate);


insert into member (id,name,age,joindate)
values ('hong2','������3', 123, sysdate);


insert into member (id,name,age,pass,email,emaildomain,joindate)
values ('hello','��ƹ���',17,1234,'emalss','google.com',sysdate);




insert into member_detail (id, zipcode, address, address_detail, tel1, tel2, tel3)
values('������', '12123', '����', '�󵵵�', 010, 124, 1234);
--
insert into member_detail (id, zipcode, address, address_detail, tel1, tel2, tel3)
values ('hello',);
 
---------------------------------------


select *
from member m , member_detail d 
where m.id = d.id;


insert into member
values ('�ƹ���', 'satt','a12312',35,'shshs','naver.com',sysdate);


--�ϳ������̺� �������� �μ�Ʈ�� �Ҽ��մ�.
insert into member(name,id,pass,age,email,emaildomain,joindate)
values ('����Ŭ','oracle','a12345678',29,'oracle','oracle.com',sysdate);


insert into member_detail (id, zipcode, address, address_detail, tel1, tel2, tel3)
values('oracle5', '12345', '����Ŭ�븮', 'oracle������', 010, 124, 1234);
-----------------------�ϴ¹�
insert all 
    into member(id,name,age,pass,email,emaildomain,joindate)
values ('oracle7','����Ŭ2',29,'a12345678','oracle','oracle.com',sysdate)
    into member_detail (id, zipcode, address, address_detail, tel1, tel2, tel3)
values('oracle7', '12345', '����Ŭ�븮', 'oracle������', 010, 124, 1234)
select * from dual;


select * from member;
select * from member_detail;


--update


--delete


--merge �� ����