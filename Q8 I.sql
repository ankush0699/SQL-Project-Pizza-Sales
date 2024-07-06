--  Q8: Join relevant tables to find the category-wise 
-- 	    distribution of pizzas(count pizzas).

SELECT 
    category, COUNT(name)
FROM
    pizza_types
GROUP BY category;