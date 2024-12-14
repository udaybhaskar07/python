-- sdcsdvs
/* shcksvmc
sdcasd */

/* Rules in Database/tables/column names
1. No duplicate names
2. Always use lower case
3. Avoid using spacial characters except underscore
4. Avoid using space
5. Donot use inbuilt functions

-- Database Commands */
create database development;
create schema development1;
show databases;
drop database development1;
backup database developemnt to disk ' ';

-- Table commands
create table development.Student(
stuid char,
stuname varchar(30),
marks int);
select * from development.student;
insert into development.student (stuid,stuname,marks) values (1,'Mohana',100);
insert into development.student  values (2,'Mohan',99);
insert into development.student  values ('A4','Mona',98);

Alter table development.student modify column stuid char(5);
Alter table development.student add column Address varchar(255);
Alter table development.student drop column Address;

-- Drop, delete, truncate, update
select * from development.student;
delete from development.student where stuid = '4';
update development.student set stuname = 'Aravind' where stuid = '1';
truncate table development.student;
drop table development.student;

-- Constraints in SQL (Rules on table)
create table development.student(
stuid char(10) unique not null,
stuname varchar(100),
marks int default 0  check(marks <= 100));

create table development.student1(
stuid char(10) unique not null,
stuname varchar(100),
marks int default 0,
check(marks <= 100));

select * from development.student;
insert into development.student (stuid,stuname,marks) values (1,'Mohana',100);
insert into development.student (stuid,stuname,marks) values (2,'Mohana',100);
insert into development.student (stuname,marks) values ('John',100);
insert into development.student (stuid,stuname) values (3,'Mohana');
insert into development.student (stuid,stuname,marks) values (4,'stephen',100);

-- Primary Key and Foreign key
create table development.student3(
stuid char(10),
stuname varchar(100),
marks int default 0  check(marks <= 100),
primary key (stuid));

create table development.student4(
stuid char(10) unique not null,
stuname varchar(255),
marks int,
foreign key (stuid) references student3(stuid));

insert into development.student3 (stuid,stuname,marks) values (1,'ALI',100);
insert into development.student3 (stuid,stuname,marks) values (2,'ALI',100);
select * from development.student3;
select * from development.student4;
insert into development.student4 (stuid,stuname,marks) values (3,'ALI',100);
select * from development.superstore;

-- clauses in SQL
select * from globalorders;
select market,segment,sales from globalorders;
select count(market) from globalorders;
select distinct(market) from globalorders;
select count(distinct(market)) from globalorders;

select * from student;
select * from development.student;

select * from globalorders where market = 'us';

-- Operators in SQL
-- Arithematic Operators (+,-,*,/ Etc)
select quantity,(quantity + 2) as qunatity1 from globalorders;
select quantity,(quantity + 2) qunatity1 from globalorders;
select quantity,(quantity * 2) qunatity1 from globalorders;
select quantity,(quantity - 2) qunatity1 from globalorders;

-- Comparison Operators (>,<,>=,<=,=,<>,!=)
select * from globalorders; -- 26
select market,sales from globalorders where sales > 7000; -- 2
select market,sales from globalorders where sales < 7000; -- 24
select market,sales from globalorders where sales = 8000;
select market,sales from globalorders where sales <> 8000;
select market,sales from globalorders where sales != 8000;

-- Logical Operators (AND, OR, NOT)
select market,segment,sales from globalorders where market = 'US' and market = 'apac';
select market,segment,sales from globalorders where market = 'US' or market = 'apac';
select market,segment,sales from globalorders where market = 'US' and segment = 'consumer';
select market,segment,sales from globalorders where market = 'US' or segment = 'consumer';
select market from globalorders;
select market from globalorders where not market = 'us';
select market from globalorders where market != 'us';

-- Range Operators (Between, not between)
select market,sales from globalorders where sales between 3000 and 5000;
select market,sales from globalorders where sales < 3000 or sales > 5000;
select market,sales from globalorders where sales not between 3000 and 5000;

/* String Operators ( Like and Wildcard)
_ --> represent one character
% --> which represents one or more charcaters */
select market from globalorders;
select market from globalorders where market like 'a%';
select market from globalorders where market like 'a_a_';
select market from globalorders where market like '%c';
select market from globalorders where market like '___c';
select market from globalorders where market like 'a%c';
select market from globalorders where market like '_p%';
select market from globalorders where market like '%p%';
select market from globalorders where market like '%ac';

-- Regular expressions
select customername from globalorders where customername regexp '^a';
select customername from globalorders where customername regexp 'n$';
select customername from globalorders where customername regexp 'ac|an';

-- Groupby, order by, top/limit
select * from window_functions;
select gender,ms,sum(salary) from window_functions group by gender,ms order by sum(salary) desc;
select salary from window_functions order by salary desc;

select gender,ms,sum(salary) from window_functions group by gender,ms
order by sum(salary) desc limit 2;

select gender,ms,salary from window_functions where gender = 'male';
select gender,ms,salary from window_functions having gender = 'male';
select gender,ms,salary from window_functions group by gender where gender = 'male';
select gender,ms,salary from window_functions group by gender having gender = 'male';
select gender,ms,salary from window_functions where gender = 'male' group by gender ;
select gender,ms,salary from window_functions having gender = 'male' group by gender ;

-- Functions in SQL
-- String/text/character fucntions
select customername,upper(customername) CN,lower(customername),
left(customername,3),right(customername,5),length(customername),
replace(customername,'a','@') from globalorders;

-- Numeric Functions
select quantity,power(quantity,2),sqrt(quantity),cos(sales),
tan(sales),profit,abs(profit),sales,round(sales,2),sign(profit)
 from globalorders;

-- Date and Time Functions
select last_update,now(),time(last_update),timestamp(last_update),utc_date(),
utc_time(),utc_timestamp(),year(now()),month(now()),day(now()),
hour(now()),minute(now()),second(now()) from sakila.inventory;

-- Null Functions (isnull, ifnull)
select * from nullfunctions;
select * from nullfunctions where marks = 'null';
select count(isnull(marks)) from nullfunctions where isnull(marks) = 1;
select marks,isnull(marks),ifnull(marks,9999999999) from nullfunctions;

-- Aggregate Functions
select sum(sales),avg(sales),count(sales),min(sales),max(sales) from globalorders;

-- JOINS in SQL
select * from table1;
select * from table2;
select * from table1 cross join table2;
select * from table1 cross join table2 cross join table3;

select * from table1 natural join table2;
select * from table1 t1 inner join table2 t2 on t1.eid = t2.eid;
select * from table1 t1 left join table2 t2 on t1.eid = t2.eid;
select * from table1 t1 right join table2 t2 on t1.eid = t2.eid;
select * from table1 t1 full join table2 t2 on t1.eid = t2.eid;

select * from table1 t1 left join table2 t2 on t1.eid = t2.eid where t2.eid is null;
select * from table1 t1 right join table2 t2 on t1.eid = t2.eid where t1.eid is null;

-- Set Operators
select * from table1 union select * from table2;
select * from table1 union all select * from table2;

-- Subqueries
select marks from nullfunctions;
select marks,isnull(marks) marks1 from nullfunctions;
select count(marks1) from (select marks,isnull(marks) marks1 from nullfunctions) xyz
where marks1 = 1;

-- Special Operators (ALL, ANY, SOME, EXISTS, NOTEXISTS), IN
select market,sales from globalorders;
select market,sales from globalorders where market = ANY (select market from globalorders where market = 'us');
select market,sales from globalorders where market = ANY (select market from globalorders where market = 'uk');

select market,sales from globalorders where market = ALL (select market from globalorders where market = 'us');
select market,sales from globalorders where market = ALL (select market from globalorders where market = 'uk');

select market,sales from globalorders where market = SOME (select market from globalorders where market = 'us');
select market,sales from globalorders where market = SOME (select market from globalorders where market = 'uk');

select market,sales from globalorders where EXISTS (select market from globalorders where market = 'us');
select market,sales from globalorders where EXISTS (select market from globalorders where market = 'uk');

select market,sales from globalorders where NOT EXISTS (select market from globalorders where market = 'us');
select market,sales from globalorders where NOT EXISTS (select market from globalorders where market = 'uk');

select market,sales from globalorders where market IN (select market from globalorders where market = 'us');
select market,sales from globalorders where market IN (select market from globalorders where market = 'uk');

-- Case statements
select market,segment from globalorders;
select market,segment,
case
when market = 'us' and segment = 'consumer' then 'USCONSUMER'
when market = 'us' and segment = 'corporate' then 'USCORPORATE'
when market = 'us' and segment = 'homeoffice' then 'USHOME'
ELSE 'Nothing'
end as Newcolumn
from globalorders;

-- Synonyms (SQL Server)
-- create synonym synonym1 for table1;

-- Views (Simple view, Complexview)
select market,segment,sum(sales) from globalorders group by market;
create view View100 as (select market,segment,sum(sales) from globalorders group by market);
select * from view100;
create view View101 as (select * from table1 union select * from table2);
select * from view101;

-- Indexing
create index index1 on GlobalSuperstore(Sales);

-- Window Functions
-- Row_number(), Rank(), Dense_rank(), First_value(), Last_value(), Nth_value(), Lead(), Lag()
-- select */col names,Aggregatefunctions/windowfunction over(partition by coln order by colms) from tablename;
select * from window_functions;
select gender,ms,salary,sum(salary) over(partition by gender,ms) from window_functions;

-- Row_number()
select gender,ms,salary,row_number() over(partition by gender,ms order by salary desc) from window_functions;

-- rank()and Dense_rank()
select marks,dense_rank() over(order by marks desc) denserank,rank() over(order by marks desc) from rankdenserank;

-- First_value() and last_value()
select gender,ms,salary,first_value(salary) over(partition by gender,ms) from window_functions;
select gender,ms,salary,last_value(salary) over(partition by gender,ms) from window_functions;

-- Nth_value()
select gender,ms,salary,nth_value(salary,2) over(partition by gender) from window_functions;

-- Lead() and lag()
select gender,salary,lead(salary,2) over() from window_functions;
select gender,salary,lag(salary,2) over() from window_functions;

select * from (
select gender,salary,dense_rank() over(partition by gender order by salary desc) as ranking from window_functions) xyz
where ranking < 3;

select * from (
select gender,salary,dense_rank() over(partition by gender order by salary desc) as ranking from window_functions) xyz
where ranking < 3;















