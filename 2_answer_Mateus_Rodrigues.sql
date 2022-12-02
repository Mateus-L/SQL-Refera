WITH alugados as(
		SELECT 
			f.film_id AS filme,
			count(f.film_id) AS quantidade
		# Retornar id do filme e Contagem de quantas vezes os titulos foram alugados
			FROM film f
			INNER JOIN inventory i			ON	f.film_id	=	i.film_id 		
			INNER JOIN rental r			ON	i.inventory_id	=	r.inventory_id
		GROUP BY 1		
		ORDER BY 2 DESC	
		LIMIT 16 		
				) # Subquery com a mesma estrutura da questão anterior, porém com 16 filmes na lista dessa vez
SELECT 
	concat(a.first_name, ' ', a.last_name) AS ator
# Retornar nome e sobrenome do ator concatenados
FROM film f
INNER JOIN alugados al			ON  	f.film_id		=	al.filme	# JOIN com subquery criada acima com o WITH
INNER JOIN film_actor fa		ON	f.film_id		=	fa.film_id	# Tabela de relacionamento
INNER JOIN actor a			ON	fa.actor_id		=	a.actor_id	# Informações gerais de atores
GROUP BY a.actor_id					# Agrupar por ator
ORDER BY count(a.actor_id) DESC 			# Fazer a contagem e ordenar pelos atores que mais apareceram
LIMIT 1							# Retornar apenas o ator que mais aparece
