WITH nc AS (
			SELECT
				DISTINCT r.customer_id AS id_cliente,
				MIN(rental_date) OVER (PARTITION BY r.customer_id) AS primeiro_aluguel
				# função para retornar o valor minínimo (primeiro dia) particionado pelo id_cliente
			FROM rental r 
			) # Subquery retornando a lista de clientes e o dia da sua primeira compra
SELECT 
	DATE_FORMAT(r.rental_date, '%M-%Y') AS mês,
	COUNT(nc.id_cliente) AS qtd_clientes
# Data em formatação Mês-Ano (em outros bancos, como o postgres, utilizaria date_trunc) e contagem de clientes por data 
FROM rental r
INNER JOIN nc	ON r.rental_date = nc.primeiro_aluguel 	#JOIN com a subquery criada
GROUP BY 1 			#agrupamento pelo mês
ORDER BY r.rental_date ASC 	#ordenar por mês
