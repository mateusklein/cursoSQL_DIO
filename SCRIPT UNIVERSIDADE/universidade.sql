DROP SCHEMA universidade;

CREATE SCHEMA IF NOT EXISTS universidade;
USE universidade;

-- Criando a tabela Aluno
CREATE TABLE IF NOT EXISTS Aluno (
  idAluno INT NOT NULL,
  name VARCHAR(30) DEFAULT 'NOME',
  PRIMARY KEY (idAluno)
);


CREATE SCHEMA IF NOT EXISTS universidade;
USE universidade;

-- Criar a tabela Departamento sem chave estrangeira
CREATE TABLE IF NOT EXISTS Departamento (
  idDepartamento INT NOT NULL,
  Nome VARCHAR(45) NOT NULL,
  Campus VARCHAR(45) NOT NULL,
  idProfessor_coordenador INT NOT NULL,
  PRIMARY KEY (idDepartamento)
);

-- Criar a tabela Professor com chave estrangeira para Departamento
CREATE TABLE IF NOT EXISTS Professor (
  idProfessor INT NOT NULL,
  Departamento_idDepartamento INT NOT NULL,
  name VARCHAR(30) DEFAULT 'NOME',
  PRIMARY KEY (idProfessor, Departamento_idDepartamento),
  CONSTRAINT fk_Professor_Departamento1 FOREIGN KEY (Departamento_idDepartamento)
    REFERENCES Departamento(idDepartamento) ON DELETE CASCADE
);

-- Adicionar a chave estrangeira fk_Departamento_Professor1 na tabela Departamento
ALTER TABLE Departamento
  ADD CONSTRAINT fk_Departamento_Professor1 FOREIGN KEY (idProfessor_coordenador)
  REFERENCES Professor(idProfessor) ON DELETE CASCADE;


-- Criando a tabela Disciplina
CREATE TABLE IF NOT EXISTS Disciplina (
  idDisciplina INT NOT NULL,
  name VARCHAR(30) DEFAULT 'NOME',
  Professor_idProfessor INT NOT NULL,
  PRIMARY KEY (idDisciplina, Professor_idProfessor),
  CONSTRAINT fk_Disciplina_Professor1 FOREIGN KEY (Professor_idProfessor)
    REFERENCES Professor(idProfessor) ON DELETE CASCADE
);

-- Criando a tabela Curso
CREATE TABLE IF NOT EXISTS Curso (
  idCurso INT NOT NULL,
  Departamento_idDepartamento INT NOT NULL,
  name VARCHAR(30) DEFAULT 'NOME',
  PRIMARY KEY (idCurso, Departamento_idDepartamento),
  CONSTRAINT fk_Curso_Departamento1 FOREIGN KEY (Departamento_idDepartamento)
    REFERENCES Departamento(idDepartamento) ON DELETE CASCADE
);

-- Criando a tabela Matriculado
CREATE TABLE IF NOT EXISTS Matriculado (
  Aluno_idAluno INT NOT NULL,
  Disciplina_idDisciplina INT NOT NULL,
  PRIMARY KEY (Aluno_idAluno, Disciplina_idDisciplina),
  CONSTRAINT fk_Aluno_has_Disciplina_Aluno FOREIGN KEY (Aluno_idAluno)
    REFERENCES Aluno(idAluno) ON DELETE CASCADE,
  CONSTRAINT fk_Aluno_has_Disciplina_Disciplina1 FOREIGN KEY (Disciplina_idDisciplina)
    REFERENCES Disciplina(idDisciplina) ON DELETE CASCADE
);

-- Criando a tabela Disciplina_Curso
CREATE TABLE IF NOT EXISTS Disciplina_Curso (
  Disciplina_idDisciplina INT NOT NULL,
  Curso_idCurso INT NOT NULL,
  PRIMARY KEY (Disciplina_idDisciplina, Curso_idCurso),
  CONSTRAINT fk_Disciplina_has_Curso_Disciplina1 FOREIGN KEY (Disciplina_idDisciplina)
    REFERENCES Disciplina(idDisciplina) ON DELETE CASCADE,
  CONSTRAINT fk_Disciplina_has_Curso_Curso1 FOREIGN KEY (Curso_idCurso)
    REFERENCES Curso(idCurso) ON DELETE CASCADE
);

-- Criando a tabela Pre_requisitos
CREATE TABLE IF NOT EXISTS Pre_requisitos (
  idPre_requisitos INT NOT NULL,
  PRIMARY KEY (idPre_requisitos)
);

-- Criando a tabela Pre_requisitos_das_disciplinas
CREATE TABLE IF NOT EXISTS Pre_requisitos_das_disciplinas (
  Disciplina_idDisciplina INT NOT NULL,
  Pre_requisitos_idPre_requisitos INT NOT NULL,
  PRIMARY KEY (Disciplina_idDisciplina, Pre_requisitos_idPre_requisitos),
  CONSTRAINT fk_Disciplina_has_Pre_requisitos_Disciplina1 FOREIGN KEY (Disciplina_idDisciplina)
    REFERENCES Disciplina(idDisciplina) ON DELETE CASCADE,
  CONSTRAINT fk_Disciplina_has_Pre_requisitos_Pre_requisitos1 FOREIGN KEY (Pre_requisitos_idPre_requisitos)
    REFERENCES Pre_requisitos(idPre_requisitos) ON DELETE CASCADE
);
