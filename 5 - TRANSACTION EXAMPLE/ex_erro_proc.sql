use transactionExample;

DROP PROCEDURE sql_fail;

DELIMITER //
CREATE procedure sql_fail()
BEGIN
	-- exit da transação caso gerada uma exeção sql
	DECLARE EXIT HANDLER FOR sqlexception
	BEGIN
    
		-- FORMA DE FAZER (PORÉM DEPRECIADA A PARTIR DO 5.5):
		-- get diagnostics condition 1
        -- @p2 = message_text
        -- select @p2 as Transaction_error
		
        ROLLBACK;
        select 'Erro durante a transação' AS Resultado;
	END;
    START TRANSACTION;
    
    -- ISSO DARÁ ERRO (MOSTRAR O ERRO):
    INSERT INTO orders VALUES(9,'2005-05-31', '2005-6-10', '2005-06-11', 'EM PROGRESSO');     
	INSERT INTO ordersDetails VALUES(9, '18_1749', 30, '136', 1),
									(9, '18_2248', 50, '55.09', 2);
	
    -- PARA DAR CERTO:
    /*
    INSERT INTO orders VALUES(9,'2005-05-31', '2005-6-10', '2005-06-11', 'EM PROGRESSO', 106);     
	INSERT INTO ordersDetails VALUES(9, '18_1749', 30, '136'),
									(9, '18_2248', 50, '55.09');
	*/
END//

call sql_fail();
