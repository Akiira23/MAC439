CREATE TABLE USUARIO (
   user_ID INT PRIMARY KEY,
   tel_DDD SMALLINT NOT NULL,
   tel_Numero INT NOT NULL,
   CPF CHAR(11) NOT NULL,
   saldo INT NOT NULL DEFAULT 0
      CHECK (saldo >= 0),
   senha VARCHAR(30) NOT NULL,
   email VARCHAR(60) NOT NULL,
   nome VARCHAR(80) NOT NULL UNIQUE,
   sexo  CHAR(1) NOT NULL
);

CREATE TABLE APOSTA (
   aposta_ID INT PRIMARY KEY,
   venceu_aposta BOOLEAN DEFAULT NULL,
   valor DECIMAL(10,2) NOT NULL
      CHECK (valor >= 2 AND valor < 50000),
   aposta_vencedor VARCHAR(40) NOT NULL,
   odd DECIMAL(6,2) NOT NULL
      CHECK (odd > 1),
   data_hora TIMESTAMP NOT NULL,
   partida_ID INT NOT NULL,
   torneio_ID INT NOT NULL,
   id_usuario_aposta INT NOT NULL,
   aposta_finalizada BOOLEAN DEFAULT FALSE,
	FOREIGN KEY(id_usuario_aposta) REFERENCES USUARIO(user_ID)
		ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE USUARIO_PREMIUM (
   premium_ID INT PRIMARY KEY,
   projeto_ID INT NOT NULL UNIQUE,
	FOREIGN KEY(premium_ID) REFERENCES USUARIO(user_ID)
		ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ORGANIZACAO (
   organizacao_ID INT PRIMARY KEY,
   nome_org VARCHAR(40) NOT NULL,
   CEO VARCHAR(50) NOT NULL
);

CREATE TABLE PERTENCE (
   UserPremium_ID INT NOT NULL,
   UserOrg_ID INT NOT NULL,
   PRIMARY KEY(UserPremium_ID, UserOrg_ID)
);

CREATE TABLE PROJETO (
   projeto_user_id INT NOT NULL,
   nome_projeto VARCHAR(40) NOT NULL,
   PRIMARY KEY (projeto_user_id, nome_projeto),
	FOREIGN KEY(projeto_user_id) REFERENCES USUARIO_PREMIUM(projeto_ID)
		ON DELETE CASCADE ON UPDATE SET CASCADE
)