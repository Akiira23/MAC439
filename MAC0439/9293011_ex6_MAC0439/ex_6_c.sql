ALTER TABLE disciplina ADD CONSTRAINT DISCNOME UNIQUE(nome);

ALTER TABLE matricula DROP CONSTRAINT chk_nota;
ALTER TABLE matricula ADD CONSTRAINT CHK_nota CHECK (nota >= 0 AND nota <= 100);

ALTER TABLE matricula DROP COLUMN frequencia;

ALTER TABLE aluno_regular ALTER COLUMN curso DROP DEFAULT;