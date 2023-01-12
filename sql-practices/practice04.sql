-- 서브쿼리(SUBQUERY)

-- 문제1.
-- 현재 평균 급여보다 많은 급여을 받는 직원은 몇 명이나 있습니까?

select avg(s.salary) from salaries s;

select count(s.salary) as '인원수'
from salaries s
where (select avg(s.salary) from salaries s) < s.salary
  and to_date = '9999-01-01';

-- 문제2. (X)
-- 현재, 각 부서별로 최고의 급여를 받는 사원의 사번, 이름, 부서 연봉을 조회하세요. 단 조회결과는 급여의 내림차순으로 정렬되어 나타나야 합니다. 

select d.dept_no, max(s.salary)
from salaries s
join dept_emp d on d.emp_no = s.emp_no
group by dept_no
order by max(s.salary) desc;  

select e.emp_no, e.first_name, s.salary
from employees e
join salaries s on s.emp_no = e.emp_no
join dept_emp d on d.emp_no = e.emp_no
where d.to_date = '9999-01-01'
  and s.to_date = '9999-01-01'
  and (d.emp_no, s.salary) in (select d.dept_no, max(s.salary)
		from salaries s
		join dept_emp d on d.emp_no = s.emp_no
		group by dept_no
		order by max(s.salary) desc);


-- 문제3.
-- 현재, 자신의 부서 평균 급여보다 급여(salary)가 많은 사원의 사번, 이름과 급여을 조회하세요 

select d.dept_no, avg(s.salary)
from salaries s
join dept_emp d on d.emp_no = s.emp_no
where d.to_date = '9999-01-01'
and s.to_date = '9999-01-01'
group by d.dept_no;

 
select d.emp_no, e.first_name, s.salary
from employees e
join salaries s on s.emp_no = e.emp_no
join dept_emp d on d.emp_no = e.emp_no
join (select d.dept_no, avg(s.salary) as avg_salary
		from salaries s
		join dept_emp d on d.emp_no = s.emp_no
		where d.to_date = '9999-01-01'
		and s.to_date = '9999-01-01'
		group by d.dept_no) z on d.dept_no = d.dept_no 
where d.to_date = '9999-01-01'
  and s.to_date = '9999-01-01'
  and s.salary > z.avg_salary;


-- 문제4.
-- 현재, 사원들의 사번, 이름, 매니저 이름, 부서 이름으로 출력해 보세요.
select dm.dept_no, e.first_name, dm.emp_no
from dept_manager dm
join employees e on e.emp_no = dm.emp_no
where dm.to_date = '9999-01-01';

select z.first_name as 'manager name', e.emp_no, e.first_name, ds.dept_name
from employees e
join dept_emp de on de.emp_no = e.emp_no
join departments ds on ds.dept_no = de.dept_no
join (select dm.dept_no, e.first_name, dm.emp_no
		from dept_manager dm
		join employees e on e.emp_no = dm.emp_no
		where dm.to_date = '9999-01-01') z on de.dept_no = z.dept_no
where de.to_date = '9999-01-01';


-- 문제5.
-- 현재, 평균급여가 가장 높은 부서의 사원들의 사번, 이름, 직책, 급여를 조회하고 급여 순으로 출력하세요.
select de.dept_no, avg(s.salary) as avg_salary
from salaries s
join dept_emp de on de.emp_no = s.emp_no
where de.to_date
group by de.dept_no
order by avg(s.salary) desc
limit 0,1;

select e.emp_no, e.first_name, t.title, s.salary, de.dept_no
from employees e
join salaries s on s.emp_no = e.emp_no
join titles t on t.emp_no = e.emp_no
join dept_emp de on de.emp_no = e.emp_no
join (select de.dept_no as dept_no, avg(s.salary) as avg_salary, s.emp_no as emp_no
		from salaries s
		join dept_emp de on de.emp_no = s.emp_no
		where de.to_date = '9999-01-01'
          and s.to_date = '9999-01-01'
		group by de.dept_no
		order by avg(s.salary) desc
		limit 0,1) y on y.dept_no = de.dept_no
where t.to_date = '9999-01-01'
  and s.to_date = '9999-01-01'
  and de.to_date = '9999-01-01'
order by s.salary asc;

-- ------------------------------------------------------------------

select max(z.avg_salary)
from (select de.dept_no, avg(s.salary) as avg_salary
from salaries s
join dept_emp de on de.emp_no = s.emp_no
where s.to_date = '9999-01-01'
  and de.to_date = '9999-01-01'
group by de.dept_no) z;

select de.dept_no
from salaries s
join dept_emp de on de.emp_no = s.emp_no
where s.to_date = '9999-01-01'
  and de.to_date = '9999-01-01'
group by de.dept_no
having avg(s.salary) = (select max(z.avg_salary)
				from (select de.dept_no, avg(s.salary) as avg_salary
				from salaries s
				join dept_emp de on de.emp_no = s.emp_no
                where s.to_date = '9999-01-01'
				  and de.to_date = '9999-01-01'
				group by de.dept_no) z);
                
select e.emp_no, e.first_name, t.title, s.salary
from employees e
join salaries s on s.emp_no = e.emp_no
join titles t on t.emp_no = e.emp_no
join dept_emp de on de.emp_no = e.emp_no
where s.to_date = '9999-01-01'
  and t.to_date = '9999-01-01'
  and de.to_date = '9999-01-01'
  and de.dept_no = (select de.dept_no
					from salaries s
					join dept_emp de on de.emp_no = s.emp_no
                    where s.to_date = '9999-01-01'
                      and de.to_date = '9999-01-01'
					group by de.dept_no
					having avg(s.salary) = (select max(z.avg_salary)
											from (select de.dept_no, avg(s.salary) as avg_salary
											from salaries s
											join dept_emp de on de.emp_no = s.emp_no
                                            where s.to_date = '9999-01-01'
                                              and de.to_date = '9999-01-01'
											group by de.dept_no) z))
order by s.salary desc;



-- select e.emp_no, e.first_name, t.title, s.salary, de.dept_no
-- from employees e
-- join salaries s on s.emp_no = e.emp_no
-- join titles t on t.emp_no = e.emp_no
-- join dept_emp de on de.emp_no = e.emp_no
-- join (select z.dept_no as dept_no, max(z.avg_salary)
-- 		from (select de.dept_no as dept_no, avg(s.salary) as avg_salary
-- 		from salaries s
-- 		join dept_emp de on de.emp_no = s.emp_no
-- 		group by de.dept_no) z) y on y.dept_no = de.dept_no
-- where t.to_date = '9999-01-01'
--   and s.to_date = '9999-01-01'
--   and de.to_date = '9999-01-01'
-- order by s.salary asc;

select de.dept_no as dept_no, avg(s.salary) as avg_salary
from salaries s
join dept_emp de on de.emp_no = s.emp_no
group by de.dept_no
having avg_salary = (
	select max(z.avg_salary)
	from (
		select de.dept_no as dept_no, avg(s.salary) as avg_salary
		from salaries s
		join dept_emp de on de.emp_no = s.emp_no
		group by de.dept_no) z);

-- 문제6.
-- 평균 급여가 가장 높은 부서는? 
-- 부서이름, 평균 급여

select max(z.avg_salary)
from (select de.dept_no, avg(s.salary) as avg_salary
	from dept_emp de
	join salaries s on de.emp_no = s.emp_no
	group by de.dept_no
	order by avg(s.salary) desc) z;
    
select ds.dept_name, avg(s.salary) as avg_salary
from departments ds
join dept_emp de on de.dept_no = ds.dept_no
join salaries s on  de.emp_no = s.emp_no
group by ds.dept_no
having avg(s.salary) = (select max(z.avg_salary)
						from (select de.dept_no, avg(s.salary) as avg_salary
							from dept_emp de
							join salaries s on de.emp_no = s.emp_no
							group by de.dept_no
							order by avg(s.salary) desc) z);


-- 문제7.
-- 평균 급여가 가장 높은 직책?
-- 직책, 평균급여

select z.title as '직책', max(z.avg_salary) as '평균 급여'
from(select t.title as title, avg(s.salary) as avg_salary
from salaries s
join titles t on t.emp_no = s.emp_no
group by t.title
order by avg(s.salary) desc) z;

-- 문제8.
-- 현재 자신의 매니저보다 높은 급여를 받고 있는 직원은?
-- 부서이름, 사원이름, 연봉, 매니저 이름, 매니저 급여 순으로 출력합니다.

select dm.emp_no, e.first_name, dm.dept_no, s.salary
from employees e
join dept_manager dm on dm.emp_no = e.emp_no
join salaries s on s.emp_no = e.emp_no
where s.to_date = '9999-01-01'
  and dm.to_date = '9999-01-01';
  
select ds.dept_name, e.first_name, s.salary, z.first_name as '매니저 이름', z.salary as '매니저 급여'
from employees e
join salaries s on s.emp_no = e.emp_no
join dept_emp de on de.emp_no = e.emp_no
join departments ds on ds.dept_no = de.dept_no
join (select dm.emp_no as emp_no, e.first_name as first_name, dm.dept_no, s.salary as salary
		from employees e
		join dept_manager dm on dm.emp_no = e.emp_no
		join salaries s on s.emp_no = e.emp_no
		where s.to_date = '9999-01-01'
		  and dm.to_date = '9999-01-01') z on z.dept_no = ds.dept_no
where s.to_date = '9999-01-01'
  and de.to_date = '9999-01-01'
  and z.salary < s.salary
order by z.salary desc;
  




