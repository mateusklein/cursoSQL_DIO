DROP PROCEDURE IF EXISTS PRC_OPERACOES_UNIVERSIDADE;

DELIMITER $$
CREATE PROCEDURE PRC_OPERACOES_UNIVERSIDADE(
    IN var_escolha INT, 
    IN var_table VARCHAR(255), 
    IN var_mudou VARCHAR(255),
    IN var_id VARCHAR(255),
    IN var_id2 VARCHAR(255)
)
BEGIN
    SET @sql_query = '';
    SET @tabela_existe = 0;

    SELECT COUNT(*) INTO @tabela_existe
    FROM information_schema.tables
    WHERE table_schema = DATABASE()
    AND table_name = var_table;

	IF @tabela_existe != 0 THEN

		-- Se for para realizar um SELECT
		IF var_escolha = 1 THEN
			SET @sql_query = CONCAT('SELECT * FROM ', var_table);

		-- Se for para realizar um UPDATE
		ELSEIF var_escolha = 2 THEN
			IF var_table = 'Aluno' THEN
				SET @sql_query = CONCAT('UPDATE ', var_table, ' SET Name="', var_mudou, '" WHERE idAluno=', var_id);
			ELSEIF var_table = 'Departamento' THEN
				SET @sql_query = CONCAT('UPDATE ', var_table, ' SET Nome="', var_mudou, '" WHERE idDepartamento=', var_id);
			ELSEIF var_table = 'Professor' THEN
				SET @sql_query = CONCAT('UPDATE ', var_table, ' SET name="', var_mudou, '" WHERE idProfessor=', var_id);
			ELSEIF var_table = 'Disciplina' THEN
				SET @sql_query = CONCAT('UPDATE ', var_table, ' SET name="', var_mudou, '" WHERE idDisciplina=', var_id);
			ELSEIF var_table = 'Curso' THEN
				SET @sql_query = CONCAT('UPDATE ', var_table, ' SET name="', var_mudou, '" WHERE idCurso=', var_id);
			ELSEIF var_table = 'Matriculado' THEN
				SET @sql_query = CONCAT('UPDATE ', var_table, ' SET Disciplina_idDisciplina="', var_mudou, '" WHERE Aluno_idAluno=', var_id);
			ELSEIF var_table = 'Pre_requisitos' THEN
				SET @sql_query = CONCAT('UPDATE ', var_table, ' SET idPre_requisitos="', var_mudou, '" WHERE idPre_requisitos=', var_id);
			ELSEIF var_table = 'Disciplina_Curso' THEN
				SET @sql_query = CONCAT('UPDATE ', var_table, ' SET Disciplina_idDisciplina="', var_mudou, '" WHERE Curso_idCurso=', var_id, ' AND Disciplina_idDisciplina=', var_id2);
			ELSEIF var_table = 'Pre_requisitos_das_disciplinas' THEN
				SET @sql_query = CONCAT('UPDATE ', var_table, ' SET Pre_requisitos_idPre_requisitos="', var_mudou, '" WHERE Disciplina_idDisciplina=', var_id, ' AND Pre_requisitos_idPre_requisitos=', var_id2);
			ELSE 
				SET @sql_query = 'SELECT "TABELA NÃO ENCONTRADA/DISPONÍVEL PARA ATUALIZAÇÃO" AS Mensagem';
			END IF;

		-- Se for para realizar um DELETE
		ELSEIF var_escolha = 3 THEN
			IF var_table = 'Aluno' THEN
				SET @sql_query = CONCAT('DELETE FROM ', var_table, ' WHERE idAluno=', var_id);
			ELSEIF var_table = 'Departamento' THEN
				SET @sql_query = CONCAT('DELETE FROM ', var_table, ' WHERE idDepartamento=', var_id);
			ELSEIF var_table = 'Professor' THEN
				SET @sql_query = CONCAT('DELETE FROM ', var_table, ' WHERE idProfessor=', var_id);
			ELSEIF var_table = 'Disciplina' THEN
				SET @sql_query = CONCAT('DELETE FROM ', var_table, ' WHERE idDisciplina=', var_id);
			ELSEIF var_table = 'Curso' THEN
				SET @sql_query = CONCAT('DELETE FROM ', var_table, ' WHERE idCurso=', var_id);
			ELSEIF var_table = 'Matriculado' THEN
				SET @sql_query = CONCAT('DELETE FROM ', var_table, ' WHERE Aluno_idAluno=', var_id);
			ELSEIF var_table = 'Disciplina_Curso' THEN
				SET @sql_query = CONCAT('DELETE FROM ', var_table, ' WHERE Curso_idCurso=', var_id, ' AND Disciplina_idDisciplina=', var_id2);
			ELSEIF var_table = 'Pre_requisitos' THEN
				SET @sql_query = CONCAT('DELETE FROM ', var_table, ' WHERE idPre_requisitos=', var_id);
			ELSEIF var_table = 'Pre_requisitos_das_disciplinas' THEN
				SET @sql_query = CONCAT('DELETE FROM ', var_table, ' WHERE Disciplina_idDisciplina=', var_id, ' AND Pre_requisitos_idPre_requisitos=', var_id2);
			ELSE 
				SET @sql_query = 'SELECT "TABELA NÃO ENCONTRADA/DISPONÍVEL PARA DELECAO" AS Mensagem';
			END IF;

		-- Se for uma escolha inválida
		ELSE
			SET @sql_query = 'SELECT "OPÇÃO NÃO DISPONÍVEL, SELECIONE UMA OPÇÃO ENTRE 1, 2 e 3" AS Mensagem';
		END IF;
	
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
SET @NOME_TABELA = 'Professor';
SET @VALOR_PARA_ALTERAR = 'Professor Rogerinho';
SET @BUSCA1 = 5;
SET @BUSCA2 = null;

select * from professor where idProfessor = 5;

/*
PARÂMETROS PARA USAR NA PROCEDURE:
PRC_OPERACOES_UNIVERSIDADE(ESCOLHA, NOME_TABELA, VALOR_PARA_ALTERAR, BUSCA1, BUSCA2)
ESCOLHA -> UM NÚMERO ENTRE 1 (select na tabela), 2 (update na tabela) e 3 (delete na tabela)
NOME_TABELA -> NOME DA TABELA EM QUE ESTÁ FAZENDO A OPERAÇÃO
VALOR_PARA_ALTERAR -> EM CASO DE UM UPDATE DIGITAR UM NOVO VALOR PARA O CAMPO
BUSCA1 -> EM CASO DE UPDATE OU DELETE INFORMAR O PRIMEIRO ID QUE ESTEJA PROCURANDO
BUSCA2 -> EM CASO DE UPDATE OU DELETE EM UMA TABELA QUE PRECISE DE MAIS DE UM REGISTRO PARA BUSCAR (Disciplina_Curso,Pre_requisitos_das_disciplinas) INFORMAR O SEGUNDO ID 
*/

-- Chamada correta da procedure
CALL PRC_OPERACOES_UNIVERSIDADE(@ESCOLHA, @NOME_TABELA, @VALOR_PARA_ALTERAR, @BUSCA1, @BUSCA2);

select * from professor where idProfessor = 5;