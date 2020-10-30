ALTER TABLE matricula ADD COLUMN dtMatricula DATE NOT NULL;

ALTER TABLE matricula ADD PRIMARY KEY (nusp_prof, cod_disc, semestre_ano, id_aluno);

ALTER TABLE matricula ADD FOREIGN KEY(nusp_prof, cod_disc, semestre_ano) REFERENCES ministra(nusp_prof, cod_disc, semestre_ano)
		ON DELETE CASCADE ON UPDATE CASCADE;
      
ALTER TABLE matricula ADD FOREIGN KEY(id_aluno) REFERENCES aluno(id_aluno)
		ON DELETE CASCADE ON UPDATE CASCADE;