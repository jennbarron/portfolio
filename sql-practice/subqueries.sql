-- 04-subqueries.sql
-- Purpose: Practice subqueries and correlated subqueries
-- Focus: Realistic analytics / ops questions

-- Example tables (conceptual):
-- customers(id, name, segment)
-- orders(id, customer_id, order_date, amount)


------------------------------------------------------------
-- 1. Customers whose total spend is ABOVE the average
-- Question:
-- "Which customers spend more than the average customer overall?"
------------------------------------------------------------

SELECT
    customer_id,
    SUM(amount) AS total_spend
FROM orders
GROUP BY customer_id
HAVING SUM(amount) >
(
    -- Subquery: average total spend per customer
    SELECT AVG(customer_total)
    FROM (
        SELECT
            customer_id,
            SUM(amount) AS customer_total
        FROM orders
        GROUP BY customer_id
    ) t
)
ORDER BY total_spend DESC;


------------------------------------------------------------
-- 2. Customers whose LATEST order is above $200
-- Question:
-- "Which customers placed a recent high-value order?"
------------------------------------------------------------

SELECT
    o.customer_id,
    o.id          AS order_id,
    o.order_date,
    o.amount
FROM orders o
WHERE o.amount > 200
  AND o.order_date =
  (
      -- Subquery: latest order_date for this customer
      SELECT MAX(order_date)
      FROM orders o2
      WHERE o2.customer_id = o.customer_id
  )
ORDER BY o.order_date DESC;


------------------------------------------------------------
-- 3. Customers with MORE orders than the average customer
-- Question:
-- "Who is generating more volume (activity) than normal?"
------------------------------------------------------------

SELECT
    customer_id,
    COUNT(*) AS order_count
FROM orders
GROUP BY customer_id
HAVING COUNT(*) >
(
    -- Subquery: average number of orders per customer
    SELECT AVG(order_per_customer)
    FROM (
        SELECT
            customer_id,
            COUNT(*) AS order_per_customer
        FROM orders
        GROUP BY customer_id
    ) x
)
ORDER BY order_count DESC;


------------------------------------------------------------
-- 4. Correlated subquery:
-- Flag each order as that customer's LARGEST or not.
-- Question:
-- "For each order, tell me if this is their max order."
------------------------------------------------------------

SELECT
    o.id          AS order_id,
    o.customer_id,
    o.order_date,
    o.amount,
    CASE
        WHEN o.amount =
        (
            -- Correlated subquery: max amount for this customer_id
            SELECT MAX(o2.amount)
            FROM orders o2
            WHERE o2.customer_id = o.customer_id
        )
        THEN 'Largest order for this customer'
        ELSE 'Not largest'
    END AS order_size_flag
FROM orders o
ORDER BY o.customer_id, o.amount DESC;


------------------------------------------------------------
-- 5. Bonus: Same "latest order per customer" using a CTE
-- (This is not a full window function example yet — just
-- showing a cleaner pattern that you’ll reuse later.)
------------------------------------------------------------

WITH latest_order_per_customer AS (
    SELECT
        customer_id,
        MAX(order_date) AS latest_order_date
    FROM orders
    GROUP BY customer_id
)
SELECT
    o.customer_id,
    o.id          AS order_id,
    o.order_date,
    o.amount
FROM orders o
JOIN latest_order_per_customer l
    ON o.customer_id = l.customer_id
   AND o.order_date  = l.latest_order_date
ORDER BY o.order_date DESC;
