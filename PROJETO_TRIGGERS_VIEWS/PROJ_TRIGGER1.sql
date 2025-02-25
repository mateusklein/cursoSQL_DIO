use ecommerce;

show tables;

/*
CRIANDO UMA TRIGGER QUE PREVINE A DELEÇÃO DE UM CLIENTE
AO OCORRER UMA DELEÇÃO ELA INSERE NA TABELA OLD_CLIENTES (BASICAMENTE UMA RÉPLICA DA TABELA ORIGINAL)
SOMENTE EXCLUINDO DE OLD_CLIENTES QUE O CLIENTE REALMENTE DEIXARIA DE EXISTIR
*/

create table old_clientes(
	id int auto_increment primary key,
    nome VARCHAR(50),
    contato VARCHAR(20),
    perfil VARCHAR(45)    
);

delimiter //
create trigger tg_del_cli before delete on cliente
for each row
	insert into old_clientes (nome, contato, perfil) values (old.Nome_completo, old.contato, old.perfil);
//
delimiter ;

delete from cliente where idCliente = 2;


/*
CRIANDO UMA TRIGGER QUE IMPEDE ALTERAÇÃO NO CAMPO PRIORIDADE NA TABELA PEDIDO
NÃO DEIXA ALTERAR PARA UMA PRIORIDADE MENOR EXEMPLO DE ALTA PARA BAIXA OU ALTA PARA MÉDIA E MÉDIA PARA BAIXA
SIGNAL SQLSTATE GERA UM ERRO QUE NÃO DEIXA QUE A ATUALIZAÇÃO OCORRA
*/
DELIMITER //
CREATE TRIGGER tg_prioridade_pedido 
BEFORE UPDATE ON Pedido
FOR EACH ROW
BEGIN
    IF (NEW.Prioridade = 'Baixa' AND (OLD.Prioridade = 'Alta' OR OLD.Prioridade = 'Média')) 
       OR (NEW.Prioridade = 'Média' AND OLD.Prioridade = 'Alta') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: Não é permitido reduzir a prioridade de um pedido.';
    END IF;
END //
DELIMITER ;

update pedido set prioridade = 'Baixa' where idPedido = 4;

/*
CRIANDO UMA TRIGGER QUE COLOCA UMA MENSAGEM PARA O GERENTE QUANDO O FUNCIONÁRIO ESTIVER COM SALÁRIO NULO
COLOCA UMA MENSAGEM NA TABELA MENSAGENS PEDINDO PARA O FUNCIONÁRIO ENTRAR EM CONTATO COM RH
*/

use company_constraints;

DELIMITER //
CREATE TRIGGER tg_atual_salario 
AFTER INSERT ON employee
FOR EACH ROW
BEGIN
    IF (NEW.salary IS NULL) THEN
        INSERT INTO mensagens (mensagem,ssn_messages) values (concat('Entrar em contato com RH para atualizar salário'), new.ssn);
    END IF;
END //
DELIMITER ;

insert into employee values ("Gabriel", "S", "Andre", 553251424, "1972-01-10", "223-Fordem-Houston-TX", "M", null, 123456789, 5);

select * from mensagens;