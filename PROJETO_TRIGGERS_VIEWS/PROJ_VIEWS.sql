use company_constraints;

/*
VIEW 1 -> NUMERO DE EMPREGADOS POR DEPARTAMENTO E LOCALIDADE
*/
create or replace view vw_emp_dept_location as
select count(*) as Nro_empregados, Dname, Dlocation from employee e inner join department d on d.dnumber = e.Dno inner join dept_locations dl on d.dnumber = dl.Dnumber group by Dname, Dlocation;

select * from vw_emp_dept_location;

/*
VIEW 2 -> LISTA DE DEPARTAMENTOS E SEUS GERENTES
*/

create or replace view vw_dept_gerentes as 
select concat(Fname, ' ', Minit, ' ', Lname) as Gerente, Dname as Departamento from employee e inner join department d on e.Super_ssn = d.Mgr_ssn;

select * from vw_dept_gerentes;

/*
VIEW 3 -> PROJETOS COM MAIOR NÚMEROS DE EMPREGADOS
*/
create or replace view vw_nroemp_proj as 
select Count(*) as Nro_empregados, Pname as Projeto from works_on w inner join project p on w.Pno = p.Pnumber group by Pname;

select * from vw_nroemp_proj;


/*
VIEW 4 -> LISTA DE PROJETOS, DEPARTAMENTOS E GERENTES
*/
create or replace view vw_project_dept_gerente as 
select Pname as Projeto, Dname as Departamento, concat(Fname, ' ', Minit, ' ', Lname) as Gerente from employee e inner join department d on e.Super_ssn = d.Mgr_ssn inner join project p on p.dnum = d.dnumber;

select * from vw_project_dept_gerente;


/*
VIEW 5 -> QUAIS EMPREGADOS POSSUEM DEPENDENTES E SE SÃO GERENTES
*/
create or replace view vw_dept_gerente as 
select 
	concat(Fname, ' ', Minit, ' ', Lname), 
    IF(de.Essn IS NOT NULL, 'S', 'N') AS TEM_DEPENDENTE,
    Dependent_name as Nome_dependente,
    Relationship as Relacao,
	IF(d.Mgr_ssn IS NOT NULL, 'S', 'N') AS EH_GERENTE
from employee e left join dependent de on e.Ssn = de.Essn left join department d on d.Mgr_ssn = e.Ssn;

SELECT * FROM vw_dept_gerente;
SELECT * FROM vw_dept_gerente WHERE TEM_DEPENDENTE='S';
show tables;