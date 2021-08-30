use employees;
use mysql;
select * from employees;

select * from titles;

select * from employees.titles;

select first_name from employees;

select first_name, last_name, gender from employees;

-- 한줄 주석 
select first_name, last_name, gender -- 이름과 성별 column 가져옴
from employees;

/* block 주석 연습
select first_name, last_name, gender
from employees;
*/

show databases;
show table status;
describe employees;
desc employees;

select first_name as 이름, gender 성별, hire_date '회사 입사일'
from employees;
