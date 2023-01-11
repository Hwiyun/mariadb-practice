-- subquery

--
-- 1) select절, insert values(....)의 서브쿼리
--

--
-- 2) from절의 서브쿼리
--
select now() as n, sysdate() as s, 3 + 1 as r from dual;
select a.n, a.r
  from (select now() as n, sysdate() as s, 3 + 1 as r from dual) a;

--  
-- 3) where절의 서브쿼리
--

-- 예제) 현재, Fai bale이 근무하는 부서에서 근무하는 다른 직원의 사번, 이름을 출력하세요.
select b.dept_no
  from employees a, dept_emp b 
 where a.emp_no = b.emp_no
   and b.to_date = '9999-01-01'
   and concat(a.first_name, ' ', a.last_name) = 'Fai Bale';

-- 'd004'

select a.emp_no, a.first_name
  from employees a, dept_emp b 
 where a.emp_no = b.emp_no
   and b.to_date = '9999-01-01'
   and b.dept_no = (select b.dept_no
					from employees a, dept_emp b 
					where a.emp_no = b.emp_no
					and b.to_date = '9999-01-01'
					and concat(a.first_name, ' ', a.last_name) = 'Fai Bale');
                    
select a.emp_no, a.first_name
  from employees a, dept_emp b 
 where a.emp_no = b.emp_no
   and b.to_date = '9999-01-01'
   and b.dept_no = 'd004';
   
   
-- 3-1) 단일행 연산자: =, >, <, >=, <=, <>, !=
-- 실습문제1:
-- 현재, 전체 사원의 평균 연봉보다 적은 급여를 받는 사원의 이름과 급여를 출력하세요.

-- select e.first_name, s.salary
-- from employees e
-- join salaries s on e.emp_no = s.emp_no
-- where to_date


select avg(salary) from salaries where to_date='9999-01-01';

select a.first_name, b.salary
  from employees a, salaries b
 where a.emp_no = b.emp_no
   and b.to_date = '9999-01-01'
   and b.salary < (select avg(salary) 
					from salaries 
                    where to_date='9999-01-01')
order by b.salary desc;

-- 3-2) 복수행 연산자: =

-- 실습문제2:
-- 현재, 가장 적은 평균 급여의 직책과 그 평균 급여를 출력해보세요.

-- 1) 직책별 평균 급여
select t.title, avg(s.salary) as avg_salary
from titles t, salaries s
where t.emp_no = s.emp_no
  and t.to_date = '9999-01-01'
  and s.to_date = '9999-01-01'
group by t.title;

select t.title, avg(s.salary) as avg_salary
from titles t, salaries s
where t.emp_no = s.emp_no
  and t.to_date = '9999-01-01'
  and s.to_date = '9999-01-01'
group by t.title
order by avg(s.salary) asc
    limit 0, 1;
    
-- 2) 직책별 가장 적은 평균 급여
select min(a.avg_salary)
  from (select t.title, avg(s.salary) as avg_salary
		from titles t, salaries s
		where t.emp_no = s.emp_no
		and t.to_date = '9999-01-01'
		and s.to_date = '9999-01-01'
	group by t.title) a;
    
-- 3) solution1: subquery
select t.title, avg(s.salary) as avg_salary
		from titles t, salaries s
		where t.emp_no = s.emp_no
		and t.to_date = '9999-01-01'
		and s.to_date = '9999-01-01'
	group by t.title
		having avg_salary = (select min(a.avg_salary)
							from (select t.title, avg(s.salary) as avg_salary
									from titles t, salaries s
									where t.emp_no = s.emp_no
									and t.to_date = '9999-01-01'
									and s.to_date = '9999-01-01'
									group by t.title) a);
                                    
-- 4) solution2: top-k
  select t.title, avg(s.salary) as avg_salary
    from titles t, salaries s
   where t.emp_no = s.emp_no
     and t.to_date = '9999-01-01'
     and s.to_date = '9999-01-01'
group by t.title
order by avg_salary asc
   limit 0, 1;