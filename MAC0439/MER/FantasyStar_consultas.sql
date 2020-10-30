/*Seleciona os dados de uma aposta que o jogo ainda nao teve o resultado atualizado de uma partida especifica*/

SELECT aposta_id, venceu_aposta, valor, aposta_vencedor, odd, data_hora, id_usuario_aposta, aposta_finalizada FROM aposta
WHERE venceu_aposta IS NULL AND partida_id = 554 AND torneio_id = 8;

/*Mostra o nome dos usuario e a quantidade de apostas em ordem crescente do valor medio das apostas*/

SELECT usuario.nome, COUNT(*) AS numero_de_apostas, CAST(AVG(valor) AS DECIMAL (12,2)) AS media_das_apostas 
FROM aposta JOIN usuario 
ON aposta.id_usuario_aposta = usuario.user_id 
GROUP BY usuario.nome
ORDER BY media_das_apostas DESC;

/*Mostra quantos socios cada organizacao possui*/

SELECT organizacao.nome_org, COUNT(pertence.userorg_id) AS qtd_de_socios
FROM pertence JOIN organizacao 
ON pertence.userorg_id = organizacao.organizacao_id 
GROUP BY organizacao.nome_org
ORDER BY qtd_de_socios DESC;

/*Mostra a quatidade de apostas, a media delas, a odd maxima e minima atingida na aposta de cada time da aposta*/
SELECT aposta_vencedor AS time_apostado, COUNT(*) AS qtd_de_apostas, 
CAST(AVG(valor) AS DECIMAL (12,2)) AS media_das_apostas, MAX(odd) max_odd, MIN(odd) min_odd
FROM aposta
WHERE partida_id = 45 AND torneio_id = 91
GROUP BY aposta_vencedor;

/*Mostra a quantidade de apostas certas, erradas e a sua porcentagem e o nome deles, para os usuarios que acertaram pelo menos uma aposta*/

SELECT usuario.nome, SUM(CASE WHEN aposta.venceu_aposta = TRUE THEN 1 ELSE 0 END) AS qtd_de_apostas_certas, 
SUM(CASE WHEN aposta.venceu_aposta = FALSE THEN 1 ELSE 0 END) AS qtd_de_apostas_erradas,
CAST(AVG(CASE WHEN aposta.venceu_aposta = TRUE THEN 1 WHEN aposta.venceu_aposta = FALSE THEN 0 END)*100 AS DECIMAL (12,2)) AS porcentagem_de_acerto
FROM aposta JOIN usuario
ON aposta.id_usuario_aposta = usuario.user_id
GROUP BY usuario.nome
HAVING SUM(CASE WHEN aposta.venceu_aposta = TRUE THEN 1 ELSE 0 END) > 0
ORDER BY qtd_de_apostas_certas DESC;

/*Lista o nome dos usuarios que possuem maior quantidade de apostas corretas e seus lucros totais da organizacao 'Logitech G'*/
SELECT uspreorg_id.nome, SUM(CASE WHEN venceu_aposta = TRUE THEN 1 ELSE 0 END) AS qtd_de_apostas_certas,
SUM(CASE WHEN aposta.venceu_aposta = TRUE THEN (odd*valor - valor) END) AS lucro_total
FROM aposta, (SELECT pertence.userpremium_id, usuario.nome 
				FROM pertence 
				JOIN usuario ON pertence.userpremium_id = usuario.user_id
				JOIN organizacao ON pertence.userorg_id = organizacao.organizacao_id
				WHERE nome_org = 'Logitech G') uspreorg_id
WHERE uspreorg_id.userpremium_id = id_usuario_aposta
GROUP BY uspreorg_id.nome
ORDER BY SUM(CASE WHEN venceu_aposta = TRUE THEN 1 ELSE 0 END) DESC;

/*Lista a quantidade de projetos que os usuarios premium fizeram e mostra seus respectivos nomes*/

SELECT usuario.nome, COUNT(projeto.projeto_user_id) AS numero_de_projetos
FROM usuario_premium 
JOIN usuario ON usuario_premium.premium_id = usuario.user_id
JOIN projeto ON usuario_premium.projeto_id = projeto.projeto_user_id
GROUP BY usuario.nome
ORDER BY COUNT(projeto.projeto_user_id) DESC;

/*Separa as apostas por sexos e lista a quantidade de apostas, o valor total, o valor medio e a porcentagem de acerto*/

SELECT usuario.sexo, COUNT(usuario.sexo) AS qtd_de_apostas, 
SUM(aposta.valor) AS valor_total_de_apostas, CAST(AVG(aposta.valor) AS DECIMAL (12,2)) AS valor_medio_das_apostas,
CAST(AVG(CASE WHEN aposta.venceu_aposta = TRUE THEN 1 WHEN aposta.venceu_aposta = FALSE THEN 0 END)*100 AS DECIMAL (12,2)) AS porcentagem_de_acerto
FROM usuario 
JOIN aposta ON usuario.user_id = aposta.id_usuario_aposta
GROUP BY usuario.sexo;

/*Lista todas as partidas e os times apostados do torneio 1*/

SELECT DISTINCT partida_id, aposta_vencedor FROM aposta
WHERE torneio_id = 1
ORDER BY partida_id;

/*Lista os times em ordem de valor total apostado, e mostra a quantidade de apostas, o lucro total obtido com as apostas, 
prejuizo total e a porcentagem de acerto do torneio 1*/

SELECT aposta_vencedor, COUNT(aposta.venceu_aposta) AS numero_de_apostas, SUM(valor) AS total_apostado, 
SUM(CASE WHEN aposta.venceu_aposta = TRUE THEN (odd*valor - valor) END) AS lucro_total,
SUM(CASE WHEN aposta.venceu_aposta = FALSE THEN (odd*valor - valor) END) AS prejuizo_total,
CAST(AVG(CASE WHEN aposta.venceu_aposta = TRUE THEN 1 WHEN aposta.venceu_aposta = FALSE THEN 0 END)*100 AS DECIMAL (12,2)) AS porcentagem_de_acerto
FROM aposta
WHERE torneio_id = 1
GROUP BY aposta_vencedor
ORDER BY total_apostado DESC;

/*Lista o total de apostas e o total apostado nos meses a partir de janeiro de 2020*/

SELECT to_char(data_hora, 'Mon') AS MONTH, COUNT(*) AS total_de_apostas, SUM(valor) AS total_apostado
FROM aposta
WHERE data_hora >= '2020-01-01 00:00:00 PM'
GROUP BY to_char(data_hora, 'Mon');

/*Separa por regiao de DDD, a quantidade de apostas, o valor total apostado e a porcentagem de acerto delas*/

SELECT usuario.tel_ddd, COUNT(usuario.user_id) AS quantidade_de_apostas, SUM(aposta.valor) AS valor_total_apostado, 
CAST(AVG(CASE WHEN aposta.venceu_aposta = TRUE THEN 1 WHEN aposta.venceu_aposta = FALSE THEN 0 END)*100 AS DECIMAL (12,2)) AS porcentagem_de_acerto
FROM usuario 
JOIN aposta 
ON usuario.user_id = aposta.id_usuario_aposta
GROUP BY usuario.tel_ddd
ORDER BY quantidade_de_apostas DESC;