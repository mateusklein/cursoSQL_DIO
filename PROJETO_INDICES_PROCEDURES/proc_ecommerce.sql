use ecommerce;

DROP PROCEDURE IF EXISTS PRC_OPERACOES_ECOM;

DELIMITER $$
CREATE PROCEDURE PRC_OPERACOES_ECOM(
    IN var_escolha INT, 
    IN var_table VARCHAR(255),
    IN var_column VARCHAR(255),
    IN var_mudou VARCHAR(255),
    IN var_id VARCHAR(255),
    IN var_id2 VARCHAR(255)
)
BEGIN
    SET @sql_query = '';
    SET @tabela_existe = 0;
    SET @id_column = NULL;

    -- Verifica se a tabela existe
    SELECT COUNT(*) INTO @tabela_existe
    FROM information_schema.tables
    WHERE table_schema = DATABASE()
    AND table_name = var_table;

    -- Se a tabela existir
    IF @tabela_existe != 0 THEN

        -- Se for para realizar um SELECT
        IF var_escolha = 1 THEN
            SET @sql_query = CONCAT('SELECT * FROM ', var_table);

        -- Se for para realizar um UPDATE
        ELSEIF var_escolha = 2 THEN
            -- Definir chave primária para cada tabela
            IF var_table = 'Cliente' THEN
                SET @id_column = 'idCliente';
            ELSEIF var_table = 'Pedido' THEN
                SET @id_column = 'idPedido';
            ELSEIF var_table = 'Produto' THEN
                SET @id_column = 'idProduto';
            ELSEIF var_table = 'Fornecedor' THEN
                SET @id_column = 'idFornecedor';
            ELSEIF var_table = 'Estoque' THEN
                SET @id_column = 'idEstoque';
            ELSEIF var_table = 'Terceiro_Vendedor' THEN
                SET @id_column = 'idTerceiro_Vendedor';
            ELSEIF var_table = 'Responsavel' THEN
                SET @id_column = 'idResponsavel';
            ELSEIF var_table = 'Ordem_de_Servico' THEN
                SET @id_column = 'idOrdem_de_Servico';
            END IF;
            
            -- Atualização para tabelas com chave única
            IF @id_column IS NOT NULL THEN
                SET @sql_query = CONCAT('UPDATE ', var_table, ' SET ', var_column, ' = ''', var_mudou, ''' WHERE ', @id_column, ' = ', var_id);
            ELSEIF var_table = 'Produto_fornecedor' THEN
                SET @sql_query = CONCAT('UPDATE ', var_table, ' SET ', var_column, ' = ''', var_mudou, ''' WHERE Fornecedor_idFornecedor = ', var_id);
            ELSEIF var_table = 'Produto_em_Estoque' THEN
                SET @sql_query = CONCAT('UPDATE ', var_table, ' SET ', var_column, ' = ''', var_mudou, ''' WHERE Produto_idProduto = ', var_id, ' AND Estoque_idEstoque = ', var_id2);
            ELSEIF var_table = 'Produto_pedido' THEN
                SET @sql_query = CONCAT('UPDATE ', var_table, ' SET ', var_column, ' = ''', var_mudou, ''' WHERE Produto_idProduto = ', var_id, ' AND Pedido_idPedido = ', var_id2);
            ELSEIF var_table = 'Produtos_vendedor' THEN
                SET @sql_query = CONCAT('UPDATE ', var_table, ' SET ', var_column, ' = ''', var_mudou, ''' WHERE idPseller = ', var_id, ' AND Produto_idProduto = ', var_id2);
            ELSEIF var_table = 'Pedido_gerado' THEN
                SET @sql_query = CONCAT('UPDATE ', var_table, ' SET ', var_column, ' = ''', var_mudou, ''' WHERE Pedido_idPedido = ', var_id, ' AND Responsavel_idResponsavel = ', var_id2);
            ELSE
                SET @sql_query = 'SELECT "TABELA NÃO ENCONTRADA/DISPONÍVEL PARA ATUALIZAÇÃO" AS Mensagem';
            END IF;

        -- Se for para realizar um DELETE (agora com base na lógica do UPDATE)
        ELSEIF var_escolha = 3 THEN
            -- Define as tabelas e os critérios de exclusão
            IF var_table = 'Cliente' THEN
                SET @sql_query = CONCAT('DELETE FROM ', var_table, ' WHERE idCliente = ', var_id);
            ELSEIF var_table = 'Pedido' THEN
                SET @sql_query = CONCAT('DELETE FROM ', var_table, ' WHERE idPedido = ', var_id);
            ELSEIF var_table = 'Produto' THEN
                SET @sql_query = CONCAT('DELETE FROM ', var_table, ' WHERE idProduto = ', var_id);
            ELSEIF var_table = 'Fornecedor' THEN
                SET @sql_query = CONCAT('DELETE FROM ', var_table, ' WHERE idFornecedor = ', var_id);
            ELSEIF var_table = 'Estoque' THEN
                SET @sql_query = CONCAT('DELETE FROM ', var_table, ' WHERE idEstoque = ', var_id);
            ELSEIF var_table = 'Terceiro_Vendedor' THEN
                SET @sql_query = CONCAT('DELETE FROM ', var_table, ' WHERE idTerceiro_Vendedor = ', var_id);
            ELSEIF var_table = 'Responsavel' THEN
                SET @sql_query = CONCAT('DELETE FROM ', var_table, ' WHERE idResponsavel = ', var_id);
            ELSEIF var_table = 'Ordem_de_Servico' THEN
                SET @sql_query = CONCAT('DELETE FROM ', var_table, ' WHERE idOrdem_de_Servico = ', var_id);
            ELSEIF var_table = 'Produto_fornecedor' THEN
                SET @sql_query = CONCAT('DELETE FROM ', var_table, ' WHERE Fornecedor_idFornecedor = ', var_id);
            ELSEIF var_table = 'Produto_em_Estoque' THEN
                SET @sql_query = CONCAT('DELETE FROM ', var_table, ' WHERE Produto_idProduto = ', var_id, ' AND Estoque_idEstoque = ', var_id2);
            ELSEIF var_table = 'Produto_pedido' THEN
                SET @sql_query = CONCAT('DELETE FROM ', var_table, ' WHERE Produto_idProduto = ', var_id, ' AND Pedido_idPedido = ', var_id2);
            ELSEIF var_table = 'Produtos_vendedor' THEN
                SET @sql_query = CONCAT('DELETE FROM ', var_table, ' WHERE idPseller = ', var_id, ' AND Produto_idProduto = ', var_id2);
            ELSEIF var_table = 'Pedido_gerado' THEN
                SET @sql_query = CONCAT('DELETE FROM ', var_table, ' WHERE Pedido_idPedido = ', var_id, ' AND Responsavel_idResponsavel = ', var_id2);
            ELSE
                SET @sql_query = 'SELECT "TABELA NÃO ENCONTRADA/DISPONÍVEL PARA DELEÇÃO" AS Mensagem';
            END IF;

        -- Se for uma escolha inválida
        ELSE
            SET @sql_query = 'SELECT "OPÇÃO NÃO DISPONÍVEL, SELECIONE UMA OPÇÃO ENTRE 1, 2 e 3" AS Mensagem';
        END IF;

    -- Se a tabela não existir
    ELSE 
        SET @sql_query = 'SELECT "TABELA NÃO EXISTENTE" AS Mensagem';
    END IF;

    -- Exibindo a query para debug
    SELECT @sql_query AS DebugQuery;

    -- Preparar e executar a consulta dinâmica
    PREPARE stmt FROM @sql_query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

END $$
DELIMITER ;





-- Definindo a variável
SET @ESCOLHA = 2;
SET @NOME_TABELA = 'Produto_pedido';
SET @COLUNA = 'Quantidade';
SET @VALOR_PARA_ALTERAR = 100;
SET @BUSCA1 = 2;
SET @BUSCA2 = 2;

select * from Produto_pedido;

/*
PARÂMETROS PARA USAR NA PROCEDURE:
PRC_OPERACOES_ECOM(ESCOLHA, NOME_TABELA, NOME_COLUNA, VALOR_PARA_ALTERAR, BUSCA1, BUSCA2)
ESCOLHA -> UM NÚMERO ENTRE 1 (select na tabela), 2 (update na tabela) e 3 (delete na tabela)
NOME_TABELA -> NOME DA TABELA EM QUE ESTÁ FAZENDO A OPERAÇÃO
NOME_COLUNA -> NOME DA COLUNA (CAMPO) EM QUE DESEJA ALTERAR, EM CASO DE UPDATE
VALOR_PARA_ALTERAR -> EM CASO DE UM UPDATE DIGITAR UM NOVO VALOR PARA O CAMPO
BUSCA1 -> EM CASO DE UPDATE OU DELETE INFORMAR O PRIMEIRO ID QUE ESTEJA PROCURANDO
BUSCA2 -> EM CASO DE UPDATE OU DELETE EM UMA TABELA QUE PRECISE DE MAIS DE UM REGISTRO PARA BUSCAR (Disciplina_Curso,Pre_requisitos_das_disciplinas) INFORMAR O SEGUNDO ID 
*/

-- Chamada correta da procedure
CALL PRC_OPERACOES_ECOM(@ESCOLHA, @NOME_TABELA, @COLUNA, @VALOR_PARA_ALTERAR, @BUSCA1, @BUSCA2);

select * from professor where idProfessor = 5;