-- Q7: Determine the distribution of orders by hour of the day.


SELECT 
    HOUR(order_time) AS order_hour, COUNT(order_id)
FROM
    orders
GROUP BY order_hour;