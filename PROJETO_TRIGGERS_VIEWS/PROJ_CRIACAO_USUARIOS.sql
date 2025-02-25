/*
CRIANDO USUÁRIOS E ATRIBUINDO PERMISSÕES A CADA UM DELES
*/

CREATE USER empregado IDENTIFIED BY '12345678';
CREATE USER gerente IDENTIFIED BY '12345678';
CREATE USER project_manager IDENTIFIED BY '12345678';
CREATE USER rh identified by '12345678';

grant select on department to gerente;
grant select on rh to gerente;

grant select on dependent to empregado;
grant select on dependent to rh;

grant select on dept_locations to gerente;
grant select on dept_locations to rh;

grant select on employee to gerente;
grant select on employee to rh;

grant select on messages to employee;

grant select on project to project_manager;
grant select on project to gerente;

grant select on works_on to project_manager;
grant select on works_on to gerente;

grant select on vw_emp_dept_location to gerente;

grant select on vw_dept_gerentes to empregado;
grant select on vw_dept_gerentes to gerente;

grant select on vw_nroemp_proj to project_manager;
grant select on vw_nroemp_proj to gerente;

grant select on vw_project_dept_gerente to project_manager;
grant select on vw_project_dept_gerente to gerente;
grant select on vw_project_dept_gerente to rh;

grant select on vw_dept_gerente to gerente;