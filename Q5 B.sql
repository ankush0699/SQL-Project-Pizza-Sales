-- Q5: List the top 5 most ordered pizza types along with their quantities.


SELECT 
    pizza_types.name, SUM(order_details.quantity) AS quantity
FROM
    pizza_types
        LEFT JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        LEFT JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizza_types.name
ORDER BY quantity DESC
LIMIT 5;


