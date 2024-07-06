-- Q12: Analyze the cumulative revenue generated over time.
SELECT order_date,
Round(sum(revenue) OVER(ORDER BY order_date),2) AS cumulative_revenue
FROM
	(SELECT 
		orders.order_date,
		ROUND(SUM(order_details.quantity * pizzas.price),
				2) AS revenue
	FROM
		pizzas
			LEFT JOIN
		order_details ON pizzas.pizza_id = order_details.pizza_id
			LEFT JOIN
		orders ON orders.order_id = order_details.order_id
	GROUP BY orders.order_date) As revenue_by_date ;