show databases;

USE transactionexample;

-- ALTERAR EM engine=nome_engine
-- PADRÃO É INNODB
create table engine_ex(
	id int primary key
) engine = MEMORY;

SHOW ENGINE MEMORY STATUS;

USE INFORMATION_SCHEMA;
SHOW TABLES LIKE '%INNO%';


SELECT * FROM TABLES WHERE TABLE_SCHEMA = 'transactionexample';