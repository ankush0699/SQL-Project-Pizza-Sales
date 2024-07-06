-- Q11: Calculate the percentage contribution of each pizza type(category) to total revenue.

SELECT 
    pizza_types.category,
    ROUND(ROUND(SUM(order_details.quantity * pizzas.price),
                    2) / (SELECT 
                    ROUND(SUM(order_details.quantity * pizzas.price),
                                2)
                FROM
                    pizzas
                        LEFT JOIN
                    order_details ON pizzas.pizza_id = order_details.pizza_id) * 100,
            2) AS revenue
FROM
    pizza_types
        LEFT JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        LEFT JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizza_types.category
ORDER BY revenue DESC;