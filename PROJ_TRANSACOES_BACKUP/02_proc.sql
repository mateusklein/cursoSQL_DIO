/*
CODE 2 - CRIANDO PROCEDURES QUE EXECUTAM UMA TRANSAÇÃO E CASO DE ERRO EXECUTE O ROLLBACK
*/ 

use ecommerce;

set @@autocommit = 0;

DROP PROCEDURE prc_insere_prod;

DELIMITER //
CREATE procedure prc_insere_prod(IN p_categoria VARCHAR(45), IN p_desc VARCHAR(45), IN p_valor DECIMAL(10,2))
BEGIN
	-- exit da transação caso gerada uma exeção sql
	DECLARE EXIT HANDLER FOR sqlexception
	BEGIN
        ROLLBACK to sp_insercao;
        select 'Erro ao inserir o produto, voltando para o savepoint seguro' AS Resultado;
	END;
    START TRANSACTION;
    
    SAVEPOINT sp_insercao;
    -- ISSO DA CERTO:
    SET @novo_valor := (SELECT max(idProduto)+1 from produto);
	INSERT INTO PRODUTO VALUES (@novo_valor, p_categoria, p_desc, p_valor);
    
    SAVEPOINT sp_insercao;
    -- ISSO DA ERRO (ELE VOLTARÁ PARA O SAVEPOINT ACIMA):
    SET @novo_valor := (SELECT max(idProduto) from produto);
	INSERT INTO PRODUTO VALUES (@novo_valor, p_categoria, p_desc, p_valor);
    commit;
    
    select 'Produto inserido com sucesso' AS Resultado;
    -- PARA DAR ERRO:
    /*
		SET @novo_valor := (SELECT max(idProduto) from produto); -- SELECIONANDO UM ID QUE JA EXISTA
		INSERT INTO PRODUTO VALUES (@novo_valor, p_categoria, p_desc, p_valor);
	*/
END//

call prc_insere_prod('Exemplo', 'My_ex', 3200.5);
SELECT * FROM produto;



DROP PROCEDURE prc_insere_prodped;

DELIMITER //
CREATE procedure prc_insere_prodped(IN p_idped VARCHAR(45), IN p_idprod VARCHAR(45), IN p_qtd VARCHAR(45), IN p_status VARCHAR(45))
BEGIN
	DECLARE EXIT HANDLER FOR sqlexception
	BEGIN
        ROLLBACK;
        select 'Erro ao inserir o ProdPedido' AS Resultado;
	END;
    START TRANSACTION;
    
    -- ISSO DA CERTO:
	INSERT INTO produto_pedido VALUES (p_idped, p_idprod, p_qtd, p_status);
    
    commit;
    
    select 'ProdPedido inserido com sucesso' AS Resultado;
END//

call prc_insere_prodped(4, 5, 12, 'disponível'); -- assim da certo
call prc_insere_prodped(44, 5, 12, 'disponível'); -- chamando com um id que não exista da erro 
call prc_insere_prodped(44, 5, 12, 'nao existe'); -- chamando com uma descrição fora do enum dará erro


SELECT * FROM produto_pedido;