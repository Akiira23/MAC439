/*Atualiza a aposta se ela estiver correta de uma partida 
especifica de um torneio*/
UPDATE aposta
	SET venceu_aposta = CASE
			WHEN aposta_vencedor = 'Team Liquid' THEN TRUE
			ELSE FALSE
		END
	WHERE partida_id = 554 AND torneio_id = 8;
     
/*Atualiza o nome do CEO de uma organizacao*/
UPDATE organizacao
	SET ceo = 'K.Y. Lee'
	WHERE nome_org = 'BENQ';
   
/*atualiza o saldo de todos os usuario se suas apostas estiverem 
finalizadas mas seus saldos ainda nao foram atualizados e depois 
atualiza todas as apostas que ja atualizaram o saldo*/   

UPDATE usuario
	SET saldo = a.odd * a.valor + saldo
	FROM aposta a
	WHERE user_id = a.id_usuario_aposta AND a.venceu_aposta = TRUE AND a.aposta_finalizada = FALSE;

UPDATE aposta
	SET aposta_finalizada = TRUE
	WHERE venceu_aposta IS NOT null AND aposta_finalizada = FALSE;
   
/*atualiza o saldo de uma aposta especifica se ela estiver
finalizada mas o saldo ainda nao foi atualizado e depois 
atualiza ela para as que ja atualizaram o saldo*/  

UPDATE usuario
	SET saldo = a.odd * a.valor + saldo
	FROM aposta a
	WHERE user_id = a.id_usuario_aposta AND a.venceu_aposta = TRUE AND a.aposta_finalizada = FALSE AND a.aposta_id = 2;

UPDATE aposta
	SET aposta_finalizada = TRUE
	WHERE venceu_aposta IS NOT null AND aposta_finalizada = FALSE AND aposta_id = 2;  
   
/*Atualiza uma aposta especifica*/   
UPDATE aposta
	SET aposta_finalizada = TRUE
	WHERE partida_id = 515 AND torneio_id = 121;

/*Aumenta o saldo de um usuario*/
UPDATE usuario
	SET saldo = saldo + 200
	WHERE user_id = 8;

/*Altera o email se a senha estiver correta*/   
UPDATE usuario
	SET email = 'felipedson29@gmail.com'
	WHERE user_id = 1 AND senha = '0PB6iPqx95';

/*Altera a senha se a senha antiga estiver correta*/      
UPDATE usuario
	SET senha = '123'
	WHERE user_id = 1 AND senha = '0PB6iPqx95';

/*Altera o numero do telefone se a senha estiver correta*/    
UPDATE usuario
	SET tel_ddd = 19, tel_numero = 957891453
	WHERE user_id = 4 AND senha = 'DeeI4R7bsQ';
 
/*Altera o nome do projeto*/  
UPDATE projeto
	SET nome_projeto = 'INTERCLASSES #1'
	WHERE projeto_user_id = 7 AND nome_projeto = 'TESTE';