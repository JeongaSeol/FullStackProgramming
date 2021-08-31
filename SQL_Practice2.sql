use sqldb;

select name, height from usertbl where height between 180 and 183;

select name, addr from usertbl where addr in ('경남', '전남', '경북');

select name, height from usertbl where name like '김%';

select * from usertbl where name like '_종신';

select * from usertbl where height >= (select height from usertbl where name = '김경호');

select name, height from usertbl order by height desc, name asc; -- asc는 생략 가능(default)

select * from buytbl limit 10;

select userID, sum(amount) from buytbl group by userID;

select userID as '사용자아이디', sum(amount) as '총 구매 개수' 
from buytbl group by userID;

use sqldb;

select avg(amount) as '평균 구매 개수' from buytbl;

select userID, avg(amount) as '평균 구매 개수' from buytbl group by userID;

select name, max(height) from usertbl;

select name, max(height), min(height) from usertbl group by Name;

select name, height
from usertbl
where height = (select max(height) from usertbl)
or height = (select min(height)from usertbl);

select count(*) from usertbl;

select count(mobile1) as '휴대폰 소지 사용자' from usertbl;


select num, groupName, sum(price*amount) as '비용'
from buytbl
group by groupName, num
with rollup;

use sqldb;

create table testtbl1(id int, userName char(3), age int);
insert into testtbl1 values(1, '홍길동', 25);
-- insert into testtbl1 values(2, '설현');
insert into testtbl1(userName, age, id) values('하니', 26, 3);

create table testtbl2
(id int auto_increment primary key, userName char(3), age int);

insert into testtbl2 values(null, '지민', 25);
insert into testtbl2 values(null, '유나', 22);
insert into testtbl2 values(null, '유경', 21);

select * from testtbl2;

select last_insert_id();

alter table testtbl2 auto_increment=100;
insert into testtbl2 values(null, '찬미', 23);
select * from testtbl2;

create table testtbl3
(id int auto_increment primary key, userName char(3), age int);
alter table testtbl3 auto_increment = 1000;

set @@auto_increment_increment=3;
insert into testtbl3 values(null, '나연', 20);
insert into testtbl3 values(null, '정연', 18);
insert into testtbl3 values(null, '모모', 19);
select * from testtbl3;

create table testtbl4(id int, Fname varchar(50), Lname varchar(50));
insert into testtbl4 select emp_no, first_name, last_name from employees.employees;

create table testtbl5 (select emp_no, first_name, last_name from employees.employees);

use sqldb;
update buytbl set price = price * 1.5;

delete from testtbl4 where Fname = 'Aamer';
delete from testtbl4 where Fname = 'Aamer' limit 5;

create table membertbl (select userID, name, addr from usertbl limit 3);
alter table membertbl add constraint pk_membertbl primary key (userID);
select * from membertbl;

insert into membertbl values('BBK', '비비코', '미국);  -- error 발생
