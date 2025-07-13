-- total quantity of each pizza category

-- category
-- we need category from pizza_types and quantity from order_details,
-- but we dont have any common things in both ,
-- but we have pizza_type_id in pizza_types and pizzas,
-- we combine both after that we can it with pizza_tye using pizza_id to order_details 

SELECT 
    pizza_types.category,
    SUM(order_details.quantity) AS quantity
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY quantity DESC;
