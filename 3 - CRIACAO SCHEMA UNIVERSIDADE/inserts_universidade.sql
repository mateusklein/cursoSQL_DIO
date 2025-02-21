-- Desabilitar temporariamente as verificações de chave estrangeira
SET foreign_key_checks = 0;

-- Inserindo dados na tabela Aluno
INSERT INTO Aluno (idAluno, name) VALUES
(1, 'Joao'),
(2, 'Maria'),
(3, 'Carlos'),
(4, 'Ana'),
(5, 'Pedro'),
(6, 'Luana');

-- Inserindo dados na tabela Professor (antes de Departamento, para atender a restrição de chave estrangeira)
INSERT INTO Professor (idProfessor, Departamento_idDepartamento, name) VALUES
(1, 1, 'Professor Carlos'),
(2, 2, 'Professor Maria'),
(3, 3, 'Professor João'),
(4, 4, 'Professor Ana'),
(5, 5, 'Professor Pedro'),
(6, 6, 'Professor Luana');

-- Agora, insira os dados na tabela Departamento
INSERT INTO Departamento (idDepartamento, Nome, Campus, idProfessor_coordenador) VALUES
(1, 'Departamento de Ciências', 'Campus A', 1),
(2, 'Departamento de Matemática', 'Campus B', 2),
(3, 'Departamento de História', 'Campus C', 3),
(4, 'Departamento de Engenharia', 'Campus D', 4),
(5, 'Departamento de Física', 'Campus E', 5),
(6, 'Departamento de Química', 'Campus F', 6);

-- Inserindo dados na tabela Disciplina
INSERT INTO Disciplina (idDisciplina, Professor_idProfessor, name) VALUES
(1, 1, 'Matemática I'),
(2, 2, 'Física I'),
(3, 3, 'História Antiga'),
(4, 4, 'Química Orgânica'),
(5, 5, 'Cálculo III'),
(6, 6, 'Física Quântica');

-- Inserindo dados na tabela Curso
INSERT INTO Curso (idCurso, Departamento_idDepartamento, name) VALUES
(1, 1, 'Curso de Ciências'),
(2, 2, 'Curso de Matemática'),
(3, 3, 'Curso de História'),
(4, 4, 'Curso de Engenharia'),
(5, 5, 'Curso de Física'),
(6, 6, 'Curso de Química');

-- Inserindo dados na tabela Matriculado
INSERT INTO Matriculado (Aluno_idAluno, Disciplina_idDisciplina) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6);

-- Inserindo dados na tabela Disciplina_Curso
INSERT INTO Disciplina_Curso (Disciplina_idDisciplina, Curso_idCurso) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6);

-- Inserindo dados na tabela Pre_requisitos
INSERT INTO Pre_requisitos (idPre_requisitos) VALUES
(1),
(2),
(3),
(4),
(5),
(6);

-- Inserindo dados na tabela Pre_requisitos_das_disciplinas
INSERT INTO Pre_requisitos_das_disciplinas (Disciplina_idDisciplina, Pre_requisitos_idPre_requisitos) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6);


-- Desabilitar temporariamente as verificações de chave estrangeira
SET foreign_key_checks = 1;
