create schema if not exists company_constraints;
use company_constraints;

select * from information_schema.table_constraints
	where constraint_schema = "company_constraints";

create table employee(
	Fname varchar(15) NOT NULL,
    Minit char,
    Lname varchar(15) not null,
    Ssn char(9) NOT NULL,
    Bdate date,
    Address varchar(30),
    Sex char,
    Salary decimal(10, 2),
    Super_ssn char(9),
    Dno int NOT NULL,
    constraint chk_salary_employee check (Salary > 2000.0),
    constraint pk_employee PRIMARY KEY (Ssn)
);
desc employee;

alter table employee
	add constraint fk_employee
    foreign key	(Super_ssn) references employee(Ssn)
    on delete set null
    on update cascade;

create table department(
	Dname varchar(15) not null,
    Dnumber int not null,
	Mgr_ssn char(9),
    Mgr_start_date date,
    Dept_create_date date,
    constraint chk_date_dept check (Dept_create_date < Mgr_start_date),
    constraint pk_dept primary key (dnumber),
    constraint unique_name_dept unique (Dname),
    Foreign key (Mgr_ssn) references employee(Ssn)
);

alter table department drop constraint department_ibfk_1;
alter table department 
	add constraint fk_dept foreign key(Mgr_ssn) references employee(Ssn)
    on update cascade;

create table dept_locations(
	Dnumber int not null,
    Dlocation varchar(15) not null,
    constraint pk_dept_locations primary key (Dnumber, Dlocation),
    constraint fk_dept_locations foreign key (Dnumber) references department(Dnumber)
);

alter table dept_locations drop constraint fk_dept_locations;
alter table dept_locations
	add constraint fk_dept_locations foreign key(Dnumber) references department(Dnumber)
    on delete cascade
    on update cascade;

create table project(
	Pname varchar(15) not null,
    Pnumber int not null,
    Plocation varchar(15),
    Dnum int not null,
    primary key (Pnumber),
    constraint unique_project unique(Pname),
    constraint fk_project foreign key (Dnum) references department(Dnumber)
);

create table works_on(
	Essn char(9) not null,
    Pno int not null,
    Hours decimal(3, 1) not null,
    primary key (Essn, Pno),
    constraint fk_employee_worsk_on foreign key (Essn) references employee(Ssn),
    constraint fk_project_worsk_on foreign key (Pno) references project(Pnumber)
);

create table dependent(
	Essn char(9) not null,
    Dependent_name varchar(15) not null,
    Sex char,
    Bdate date,
    Relationship varchar(8),
    primary key (Essn, Dependent_name),
    constraint fk_dependent foreign key (Essn) references employee(Ssn)
);


insert into employee values ("John", "B", "Smith", 123456789, "1965-01-09", "731-Fordem-Houston-TX", "M", 30000, Null, 5);


insert into employee values ("Jose", "S", "Andre", 123456782, "1972-01-10", "223-Fordem-Houston-TX", "M", 20000, 123456789, 5),
                            ("Ana", "B", "Andrade", 123456783, "1995-04-11", "712-Fordem-Houston-TX", "F", 10000, 123456782, 4),
                            ("Jorge", "R", "Sdasdas", 123456784, "1991-05-09", "744-Fordem-Houston-TX", "M", 30000, 123456783, 4),
                            ("Lucas", "T", "Aasdasd", 123456785, "1992-06-12", "009-Fordem-Houston-TX", "M", 30000, 123456782, 5),
                            ("Armando", "G", "Cgagsa", 123456786, "1980-07-10", "002-Fordem-Houston-TX", "M", 33000, Null, 5),
                            ("Joana", "H", "Sasdas", 123456787, "1990-08-08", "733-Fordem-Houston-TX", "F", 40000, 123456786, 4),
                            ("Leticia", "N", "Sfafa", 123456788, "1979-09-03", "734-Fordem-Houston-TX", "F", 25000, 123456786, 5);

insert into dependent values (123456786, "Alice", "F", "1994-04-05", "Daughter"),
							 (123456788, "Mario", "M", "1999-04-05", "Son"),
						     (123456782, "Henrique", "M", "1998-04-05", "Son"),
                             (123456782, "Maria", "F", "1999-04-05", "Daughter"),
                             (123456786, "Marta", "F", "1999-04-05", "Daughter"),
                             (123456786, "Laura", "F", "1981-04-05", "Spouse");
                             
insert into department values ("Research", 5, 123456786, "2006-02-12", "2000-01-01"),
							  ("Administration", 4, 123456789, "2001-02-12", "1998-01-01"),
							  ("Headquarters", 1, 123456782, "1996-02-12", "1992-01-01");

insert into dept_locations values (1, "Houston"),
									   (4, "Stafford"),
                                       (1, "Bellaire"),
                                       (5, "Sugarland"),
                                       (5, "Houston");
                                       
insert into project values ("ProductX", 1, "Bellaire", 5),
						   ("ProductY", 2, "Sugarland", 5),
                           ("ProductZ", 3, "Houston", 5),
                           ("Computerization", 10, "Stafford", 4),
                           ("Reorganization", 20, "Houston", 1),
                           ("Newbenefits", 30, "Stafford", 4);
                           
insert into works_on values (123456789, 10, 32.5),
							(123456788, 1, 40.5),
                            (123456786, 2, 20.5),
                            (123456782, 30, 33.5),
                            (123456783, 20, 30.0),
                            (123456785, 1, 28.0),
                            (123456787, 2, 22.5),
                            (123456784, 20, 43.5);