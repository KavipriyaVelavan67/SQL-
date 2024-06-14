Create database Employee;
use Employee;

Create table employees(
  emp_no INT NOT NULL AUTO_increment,
  date_of_birth date not null,
  first_name varchar(18),
  last_name varchar(10),
  Gender Enum('M','F'),
  hire_date Date not null,
  primary key(emp_no) 
);

Create Table Salaries(
emp_no int not null,
salary int not null,
from_date Date not null,
to_date date not null,
key (emp_no),
foreign key(emp_no)references employees(emp_no),
primary key(emp_no,from_date)
);

Create Table departments(
dept_no char(4) not null,
dept_name varchar(45) not null,
primary key(dept_no),
unique key(dept_name)
);

Create  Table dept_emp(
emp_no int not null,
dept_no char(4) not null,
from_date date not null,
to_date date not null,
key (emp_no),
key (dept_no),
foreign key(emp_no)references employees(emp_no),
foreign key(dept_no) references departments(dept_no),
primary key(emp_no,dept_no)
);

Create Table dept_manager(
dept_no char(4) not null,
emp_no int not null,
from_date date not null,
to_date date not null,
key (emp_no),
key (dept_no),
foreign key(emp_no)references employees(emp_no),
foreign key(dept_no) references departments(dept_no),
primary key(emp_no, dept_no)
);

Create Table titles(
emp_no int not null,
title Varchar(50) not null,
from_date date not null,
to_date date not null,
key (emp_no),
foreign key(emp_no)references employees(emp_no),
primary key(emp_no,title,from_date)
);

select*from employees;
select*from salaries;
select*from departments;
select*from dept_emp;

select*from dept_manager;
select*from titles;

insert into employees(emp_no,date_of_birth,first_name,last_name,Gender,hire_date) Values (001,'2002-08-06',"Kavipriya","Velavan",'F','2024-05-06');
insert into departments Values('AD01',"AI & DS");
insert into dept_emp Values(001, 'AD01','23-04-18','25-04-18');
insert into dept_manager Values('AD01', 001,'23-04-18','25-04-18');
insert into titles Values(001,"Manager",'23-04-18','25-04-18');
insert into salaries Values(001,50000,'23-04-18','25-04-18');

insert into employees(emp_no,date_of_birth,first_name,last_name,Gender,hire_date) Values (005,'2004-01-14',"Navin","Nallasaami",'F','2024-05-12');
insert into departments Values('ECE2',"ECE");
insert into dept_emp Values(002, 'ECE2','22-05-24','25-05-24');
insert into dept_manager Values('ECE2',002,'22-05-24','25-05-24');
insert into titles Values(002,"Developer",'22-05-24','25-05-24');
insert into salaries Values(002,60000,'22-05-24','25-05-24');

insert into employees(emp_no,date_of_birth,first_name,last_name,Gender,hire_date) Values (003,'2003-01-11',"Shobika","Balu",'F','2023-12-12');
insert into departments Values('IT03',"IT");
insert into dept_emp Values(003, 'ITO4','22-09-02','25-09-02');
insert into dept_manager Values('ITO3',003,'22-09-02','25-09-02');
insert into titles Values(003,"Tester",'22-09-02','25-09-02');
insert into salaries Values(003,55000,'22-09-02','25-09-02');

update employees set Gender='M' Where First_name="Navin";

select first_name,hire_date,Gender from employees;
select distinct first_name from employees;

select*from employees where gender ='F';

select * from employees order by hire_date;

select * from salaries order by salary desc ;

select*from employees where first_name="Kavipriya" or Gender="F";

select*from salaries where not salary="10000";
select * from employees limit 2;

select min(salary) from salaries;
select min(salary) as lower_salary from salaries;

select count(*) as number_of_employees from salaries where salary>50000;

select sum(salary) from salaries where from_date>=2024-05-06;
select * from salaries where from_date>=2024-05-06;
select avg(salary) from salaries;

select * from employees where first_name LIKE 'a%';
select * from employees where first_name LIKE '%a';
select * from employees where first_name LIKE '%s%';

select*from employees where last_name LIKE '%_a';
select*from employees where last_name LIKE 'a_%';

select*from salaries where salary in (50000);
select * from dept_manager where from_date between '2023-04-18' and '2025-06-18';

select first_name as MINE from employees where Gender='M';

select* from employees inner join salaries on employees.emp_no=salaries.emp_no;

select em.first_name,sa.salary from employees 
as em inner join salaries as sa
on em.emp_no=sa.emp_no;

select em.first_name as name ,d.dept_no as id 
from employees as em
inner join dept_manager 
as d on em.emp_no=d.emp_no;

select employees.first_name, dept_emp.dept_no from employees 
left join dept_emp on employees.emp_no=dept_emp.emp_no 
where dept_emp.dept_no='AD01';

select*from employees as em right join salaries as sa on em.emp_no=sa.emp_no;

select e.first_name,e.date_of_birth,d.from_date,d.to_date
from employees as e right join dept_manager as d on e.emp_no=d.emp_no;

select * from employees as e cross join salaries as s 
on e.emp_no=s.emp_no;

select* from employees as e,titles as t where e.emp_no=t.emp_no;
select first_name as name, date_of_birth as dob, title,hire_date from employees as r,titles as t where e.emp_no=t.emp_no;

alter table employees add adress Varchar(255) ;
alter table employees drop adress;
alter table departments modify dept_no varchar(50);
alter table employees change first_name f_name varchar(25);

create table employee_details(
emp_no int primary key,
moblie_no int(15) not null default 000000
);

select * from employee_details;
