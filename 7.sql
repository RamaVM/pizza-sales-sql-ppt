-- determine the distribution of  orders by hours of the day

SELECT 
    *
FROM
    orders;
SELECT 
    HOUR(order_time), COUNT(order_id) AS order_count
FROM
    orders
GROUP BY HOUR(order_time)
ORDER BY order_count DESC
