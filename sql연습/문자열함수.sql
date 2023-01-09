-- 문자열 함수

-- upper
select upper('busan'), upper('BusaN'), upper('Busan') from dual;
select upper(first_name) from employees;
 
-- lower
select lower('busan'), lower('BusaN'), lower('Busan') from dual;
select upper(first_name) from employees;

-- substring(문자열, index, length)
select substring('Hello Wolrd', 3, 2);

-- 예제) 1989년에 입사한 사원들의 이름, 입사일을 출력하라
select first_name, hire_date
  from employees
 where substring(hire_date, 1, 4) = '1989';
 
-- lpad(왼쪽 정렬), rpad(왼쪽 정렬)
select lpad('1234', 10, '-'), rpad('1234', 10, '-');

-- 예제) 직원들의 월급을 왼쪽 정렬(빈공간 *)
select lpad(salary, 10, '*') from salaries;

-- trim, ltrim, rtrim
select
concat('---', ltrim('     hello     '), '---'),
concat('---', rtrim('     hello     '), '---'),
concat('---', trim(both ' ' from '     hello     '), '---'),
concat('---', trim(trailing 'x' from 'xxxxxhelloxxxxx'), '---'),
concat('---', trim(leading 'x' from 'xxxxxhelloxxxxx'), '---'),
concat('---', trim(both 'x' from 'xxxxxhelloxxxxx'), '---')
 from dual;
 
-- length
select length('Hello World') from dual; 