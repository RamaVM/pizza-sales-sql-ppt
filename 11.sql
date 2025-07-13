-- calculate the percentage contribution of each pizza type to total revenue

SELECT 
    pizza_types.category,
    (SUM(order_details.quantity * pizzas.price) / (SELECT 
            SUM(order_details.quantity * pizzas.price) AS total_sales
        FROM
            order_details
                JOIN
            pizzas ON order_details.pizza_id = pizzas.pizza_id)) * 100 AS revenue
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY category