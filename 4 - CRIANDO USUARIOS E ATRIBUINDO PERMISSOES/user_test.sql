use company_constraints;

create or replace view vw_sal_20000 as 
select concat(Fname, ' ', Minit,' ', Lname) as Nome, Salary from employee where Salary > 20000;

select * from vw_sal_20000;

create user user_test identified by '12345678';

grant all privileges on company_constraints.vw_sal_20000 to user_test;