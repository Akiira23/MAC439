PESSOA

INSERT INTO pessoa (nusp, cpf, nome)
		VALUES (5875122,86293414160, 'Elza Agatha Sophia Figueiredo');
INSERT INTO pessoa (nusp, cpf, nome)
		VALUES (9532879,13377813390, 'Antonella Isabel Stefany da Conceição');
INSERT INTO pessoa (nusp, cpf, nome)
		VALUES (8837152,55133865260, 'Mário Martin Lima');
INSERT INTO pessoa (nusp, cpf, nome)
		VALUES (8695562,37167574546, 'Sebastião Leandro da Cunha');
INSERT INTO pessoa (nusp, cpf, nome)
		VALUES (3596232,17808688630, 'Marlene Rayssa da Cruz');      
INSERT INTO pessoa (nusp, cpf, nome)
		VALUES (8995417,88922714239, 'Arthur Lucas Cláudio Campos');

PROFESSOR
      
INSERT INTO professor (nusp_prof, sala)
		VALUES (5875122, 'B-105');
INSERT INTO professor (nusp_prof, sala)
		VALUES (3596232, 'F-5');
      
ALUNO

INSERT INTO aluno (id_aluno)
		VALUES (10);
INSERT INTO aluno (id_aluno)
		VALUES (11);
INSERT INTO aluno (id_aluno)
	VALUES (12);
INSERT INTO aluno (id_aluno)
	VALUES (13);
INSERT INTO aluno (id_aluno)
		VALUES (70);
INSERT INTO aluno (id_aluno)
		VALUES (71);

ALUNO REGULAR
      
INSERT INTO aluno_regular (nusp_aluno_reg, nusp_prof, id_aluno)
		VALUES (9532879, 5875122, 10);
INSERT INTO aluno_regular (nusp_aluno_reg, curso, nusp_prof, id_aluno)
		VALUES (8995417, 'Letras', 3596232, 11);
INSERT INTO aluno_regular (nusp_aluno_reg, nusp_prof, id_aluno)
		VALUES (8837152, 5875122, 12);
INSERT INTO aluno_regular (nusp_aluno_reg, curso, nusp_prof, id_aluno)
		VALUES (8695562, 'Letras', 3596232, 13);
      
ALUNO ESPECIAL
      
INSERT INTO aluno_especial (email, nome, id_aluno)
		VALUES ('nicolelaviniadacruz-98@companyvivo.com.br', 'Nicole Lavínia da Cruz', 70);
INSERT INTO aluno_especial (email, nome, id_aluno)
		VALUES ('ccalebemarcosryanlopes@afujita.com.br', 'Calebe Marcos Ryan Lopes', 71);
      
DISCIPLINA

INSERT INTO disciplina (codigo, nome)
		VALUES ('MAC110', 'Introdução à Computação');
INSERT INTO disciplina (codigo, nome)
		VALUES ('FLC0112', 'Introdução Estudos Clássicos');
INSERT INTO disciplina (codigo, nome)
		VALUES ('MAC210', 'Lab Métodos Numéricos');
INSERT INTO disciplina (codigo, nome)
		VALUES ('FLC0113', 'Introdução Estudo Clássico 2');

PRE REQUISITO

INSERT INTO pre_requisito (cod_disc, cod_disc_pre_requisito)
		VALUES ('MAC210', 'MAC110');
INSERT INTO pre_requisito (cod_disc, cod_disc_pre_requisito)
		VALUES ('FLC0113', 'FLC0112');

MINISTRA

INSERT INTO ministra (nusp_prof, cod_disc, semestre_ano)
		VALUES ('5875122', 'MAC210', '2-2020');
INSERT INTO ministra (nusp_prof, cod_disc, semestre_ano)
		VALUES ('3596232', 'FLC0112', '1-2020');

MATRICULA

INSERT INTO matricula (nusp_prof, cod_disc, semestre_ano, id_aluno, nota, situacao)
		VALUES ('5875122', 'MAC210', '2-2020', 10, 5.00, 'aprovado');
INSERT INTO matricula (nusp_prof, cod_disc, semestre_ano, id_aluno, nota, situacao)
		VALUES ('5875122', 'MAC210', '2-2020', 12, 5.00, 'aprovado');
INSERT INTO matricula (nusp_prof, cod_disc, semestre_ano, id_aluno, nota, situacao)
		VALUES ('5875122', 'MAC210', '2-2020', 70, 5.00, 'aprovado');
INSERT INTO matricula (nusp_prof, cod_disc, semestre_ano, id_aluno, nota, situacao)
		VALUES ('3596232', 'FLC0112', '1-2020', 11, 5.00, 'aprovado');
INSERT INTO matricula (nusp_prof, cod_disc, semestre_ano, id_aluno, nota, situacao)
		VALUES ('3596232', 'FLC0112', '1-2020', 13, 5.00, 'aprovado');
INSERT INTO matricula (nusp_prof, cod_disc, semestre_ano, id_aluno, nota, situacao)
		VALUES ('3596232', 'FLC0112', '1-2020', 71, 5.00, 'aprovado');      
