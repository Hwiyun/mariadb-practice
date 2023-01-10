-- 테이블간 조인(JOIN) SQL 문제입니다.

-- 문제 1. 
-- 현재 급여가 많은 직원부터 직원의 사번, 이름, 그리고 연봉을 출력 하시오.

select s.emp_no as 사번, e.first_name as 이름, s.salary as 연봉
from employees e join salaries s on e.emp_no = s.emp_no
where s.to_date = '9999-01-01'
group by s.salary
order by s.salary desc;

-- 문제2.
-- 전체 사원의 사번, 이름, 현재 직책을 이름 순서로 출력하세요.

select e.emp_no as 사번, e.first_name as 이름, t.title as 직책
from employees e join titles t on e.emp_no = t.emp_no
where t.to_date = '9999-01-01'
group by e.first_name
order by e.first_name asc;

-- 문제3.
-- 전체 사원의 사번, 이름, 현재 부서를 이름 순서로 출력하세요.

select e.emp_no as 사번, e.first_name as 이름, ds.dept_name as 부서
from employees e 
join dept_emp d on e.emp_no = d.emp_no
join departments ds on ds.dept_no = d.dept_no
where d.to_date = '9999-01-01'
group by e.first_name
order by e.first_name asc;

-- 문제4.
-- 전체 사원의 사번, 이름, 연봉, 직책, 부서를 모두 이름 순서로 출력합니다.

select e.emp_no as 사번, e.first_name as 이름, s.salary as 연봉, t.title as 직책, ds.dept_name as 부서
from employees e 
join dept_emp d on e.emp_no = d.emp_no
join departments ds on ds.dept_no = d.dept_no
join salaries s on s.emp_no = e.emp_no
join titles t on e.emp_no = t.emp_no
group by e.first_name
order by e.first_name asc;

-- 문제5.
-- ‘Technique Leader’의 직책으로 과거에 근무한 적이 있는 모든 사원의 사번과 이름을 출력하세요. 
-- (현재 ‘Technique Leader’의 직책(으로 근무하는 사원은 고려하지 않습니다.) 
-- 이름은 first_name과 last_name을 합쳐 출력 합니다.

select e.emp_no as 사번, concat(e.first_name, ' ', e.last_name) as 풀네임
from employees e
join titles t on t.emp_no = e.emp_no
where t.to_date < '9999-01-01'
and t.title = 'Technique Leader';

-- 문제6.
-- 직원 이름(last_name) 중에서 S(대문자)로 시작하는 직원들의 이름, 부서명, 직책을 조회하세요.

select e.last_name as 이름, ds.dept_name as 부서명, t.title as 직책
from employees e
join dept_emp d on d.emp_no = e.emp_no
join departments ds on ds.dept_no = d.dept_no
join titles t on t.emp_no = e.emp_no
where last_name like 'S%'
group by e.last_name;


-- 문제7.
-- 현재, 직책이 Engineer인 사원 중에서 현재 급여가 40000 이상인 사원을 급여가 큰 순서대로 출력하세요.
select s.salary as 급여
from salaries s
join titles t on t.emp_no = s.emp_no
where s.salary > 40000
and t.to_date = '9999-01-01'
and t.title = 'Engineer'
order by s.salary desc;

-- 문제8.	# where 과 having의 차이
-- 평균 급여가 50000이 넘는 직책을 급여가 큰 순서대로 직책과 평균 급여를 출력하시오.

select t.title as 직책, avg(s.salary) as '평균 급여'
from titles t
join salaries s on s.emp_no = t.emp_no
group by t.title
having avg(s.salary) > 50000
order by avg(s.salary) desc;

select t.title as 직책, avg(s.salary) as '평균 급여'
from titles t, salaries s
where t.emp_no = s.emp_no
group by t.title
having avg(s.salary) > 50000
order by avg(s.salary) desc;

-- 문제9.
-- 현재, 부서별 평균 연봉을 연봉이 큰 부서 순서대로 출력하세요.
select ds.dept_name as 이름, avg(s.salary) as '평균 연봉'
from dept_emp d
join departments ds on ds.dept_no = d.dept_no
join salaries s on s.emp_no = d.emp_no
where d.to_date = '9999-01-01'
group by ds.dept_no
order by avg(s.salary) desc;

-- 문제10.
-- 현재, 직책별 평균 연봉을 연봉이 큰 직책 순서대로 출력하세요.
select t.title as 직책, avg(s.salary) as '평균 연봉'
from titles t
join salaries s on s.emp_no = t.emp_no
where t.to_date = '9999-01-01'
group by t.title
order by avg(s.salary) desc;