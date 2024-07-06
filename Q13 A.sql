-- Q13: Determine the top 3 most ordered pizza types based on revenue for each pizza category.
SELECT category, name, revenue
FROM
(SELECT category,name,revenue,
RANK() OVER(PARTITION BY category ORDER BY revenue DESC) AS rn
FROM
(SELECT 
    pizza_types.category,pizza_types.name,
    ROUND(SUM(order_details.quantity * pizzas.price),2) AS revenue
FROM
    pizza_types
        LEFT JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        LEFT JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizza_types.category,pizza_types.name) as sq) as sq
WHERE rn<=3;