use company_constraints;

create or replace view vw_sal_30000 as 
select concat(Fname, ' ', Minit,' ', Lname) as Nome, Salary from employee where Salary > 30000;

select * from vw_sal_20000;