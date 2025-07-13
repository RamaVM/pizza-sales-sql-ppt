-- analyze the ccumulated revenue over time 
-- day 1 100  100
-- day 2 200  300
-- day 3 300 600
-- day 4 400 1000

select order_date,round(sum(revenue) over(order by order_date)) as cum_revenue 
from (select orders.order_date,sum(order_details.quantity * pizzas.price)
 as revenue
from order_details join pizzas 
on order_details.pizza_id=pizzas.pizza_id 
join orders 
on orders.order_id=order_details.order_id
group by orders.order_date ) as rev_per_day;