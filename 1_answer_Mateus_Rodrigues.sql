SELECT 
	f.title AS filme,
	count(f.film_id) AS quantidade
# Retornar Título do filme e Contagem de quantas vezes os titulos foram alugados
	FROM film f
	INNER JOIN inventory i		ON		f.film_id		=	i.film_id 		
	INNER JOIN rental r			ON		i.inventory_id	=	r.inventory_id
/* 	Tabela "film" para informações gerais de cada filme, "inventory" para gerar o relacionamento com "rental" 
	que possui informações de cada aluguel */
GROUP BY 1		# agrupar por filmes
ORDER BY 2 DESC		# organizar os filmes com maior quantidade primeiro
LIMIT 2 		# retornar apenas os 2 
