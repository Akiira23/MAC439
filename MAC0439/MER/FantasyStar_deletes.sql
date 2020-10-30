/*Deleta uma relacao de um usuario premium com uma organizacao com a senha correta*/
DELETE FROM pertence
WHERE userpremium_id IN (SELECT pertence.userpremium_id FROM pertence 
				JOIN usuario 
				ON pertence.userpremium_id = usuario.user_id 
				WHERE pertence.userpremium_id = 12 
					AND pertence.userorg_id = 2
					AND usuario.senha = 'Lix9FQHr8E')
AND userorg_id IN (SELECT pertence.userorg_id FROM pertence 
				JOIN usuario 
				ON pertence.userpremium_id = usuario.user_id 
				WHERE pertence.userpremium_id = 12 
					AND pertence.userorg_id = 2
					AND usuario.senha = 'Lix9FQHr8E');

/*Deleta um projeto de um usuario considerando sua senha*/
DELETE FROM projeto
WHERE projeto_user_id IN (SELECT projeto.projeto_user_id FROM projeto 
				JOIN usuario 
				ON projeto.projeto_user_id = usuario.user_id 
				WHERE projeto.projeto_user_id = 2 
					AND projeto.nome_projeto = 'Vem no x1'
					AND usuario.senha = 'PbhJytLJkC')
AND nome_projeto IN (SELECT projeto.nome_projeto  FROM projeto 
				JOIN usuario 
				ON projeto.projeto_user_id = usuario.user_id 
				WHERE projeto.projeto_user_id = 2
					AND projeto.nome_projeto = 'Vem no x1'
					AND usuario.senha = 'PbhJytLJkC');

/*Remove apostas que ocorreram antes de 2020 e seus saldos foram atualizados*/
DELETE FROM aposta
WHERE data_hora < '2020-01-01 00:00:00.000' AND aposta_finalizada = TRUE;

/*Remove apostas que foram encerradas*/
DELETE FROM aposta
WHERE aposta_finalizada = TRUE AND venceu_aposta IS NOT NULL;

/*Remove um usuario dado sua senha*/
DELETE FROM usuario
WHERE user_id = 22 AND senha = 'GqnQzTjAPb';

/*Limpa todas as tabelas*/
DELETE FROM aposta;
DELETE FROM organizacao;
DELETE FROM pertence;
DELETE FROM projeto;
DELETE FROM usuario;
DELETE FROM usuario_premium;