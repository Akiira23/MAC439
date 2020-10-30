CREATE TABLE PESSOA (
	nusp INT PRIMARY KEY, 
	cpf CHAR(11) NOT NULL UNIQUE, 
	nome VARCHAR(50) NOT NULL
);

CREATE TABLE PROFESSOR (
	nusp_prof INT PRIMARY KEY,
	sala VARCHAR(10) NOT NULL,
	FOREIGN KEY(nusp_prof) REFERENCES PESSOA(nusp)
		ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ALUNO (
	id_aluno INT PRIMARY KEY
);

CREATE TABLE ALUNO_REGULAR (
	nusp_aluno_reg INT PRIMARY KEY,
	curso VARCHAR(30) NOT NULL DEFAULT 'Bacharelado em Computação',
	nusp_prof INT,
	id_aluno INT NOT NULL,
	FOREIGN KEY(nusp_aluno_reg) REFERENCES PESSOA(nusp)
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(nusp_prof) REFERENCES PESSOA(nusp)
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(id_aluno) REFERENCES ALUNO(id_aluno)
		ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ALUNO_ESPECIAL (
	email VARCHAR(50) PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	id_aluno INT NOT NULL,
	FOREIGN KEY(id_aluno) REFERENCES ALUNO(id_aluno)
		ON DELETE CASCADE ON UPDATE CASCADE
	
);

CREATE TABLE DISCIPLINA (
	codigo VARCHAR(10) PRIMARY KEY,
	nome VARCHAR(30) NOT NULL
);

CREATE TABLE PRE_REQUISITO (
	cod_disc VARCHAR(10),
	cod_disc_pre_requisito VARCHAR(10),
	PRIMARY KEY(cod_disc, cod_disc_pre_requisito),
	FOREIGN KEY(cod_disc) REFERENCES DISCIPLINA(codigo)
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(cod_disc_pre_requisito) REFERENCES DISCIPLINA(codigo)
		ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE MINISTRA (
	nusp_prof INT,
	cod_disc VARCHAR(10),
	semestre_ano VARCHAR(10),
	PRIMARY KEY(nusp_prof, cod_disc, semestre_ano),
	FOREIGN KEY(nusp_prof) REFERENCES PROFESSOR(nusp_prof)
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(cod_disc) REFERENCES DISCIPLINA(codigo)
		ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE MATRICULA (
	nusp_prof INT,
	cod_disc VARCHAR(10),
	semestre_ano VARCHAR(10),
	id_aluno INT,
	frequencia INT DEFAULT 100
		CONSTRAINT CHK_Freq CHECK (frequencia >= 0 AND frequencia <= 100),
	nota DECIMAL(4,2) DEFAULT 5
		CONSTRAINT CHK_Nota CHECK (nota >= 0 AND nota <= 10),
	situacao VARCHAR(30)
		CONSTRAINT CHK_Sit CHECK (situacao = 'reprovado' OR situacao = 'aprovado' OR situacao = 'recuperação'),
	CONSTRAINT CHK_Matr CHECK ((frequencia > 75 AND nota >= 5) AND situacao = 'aprovado')
);