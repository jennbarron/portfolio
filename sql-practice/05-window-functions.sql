-- 05-window-functions.sql
-- Purpose: Practice window functions used in analytics & operations
-- Focus: Ranking, running totals, partitions, moving averages

------------------------------------------------------------
-- Example tables (same ChaosOS-style schema concept)
--
-- chaos_events (event_id, domain_id, severity, created_at)
-- chaos_domains (domain_id, domain_name)
------------------------------------------------------------

------------------------------------------------------------
-- 1. ROW_NUMBER()
-- “Show the first event logged for each domain.”
------------------------------------------------------------

SELECT
    e.event_id,
    d.domain_name,
    e.created_at,
    ROW_NUMBER() OVER (
        PARTITION BY e.domain_id
        ORDER BY e.created_at ASC
    ) AS first_event_rank
FROM chaos_events e
JOIN chaos_domains d
    ON e.domain_id = d.domain_id;


------------------------------------------------------------
-- 2. RANK() vs DENSE_RANK()
-- “Rank domains by number of events.”
------------------------------------------------------------

SELECT
    d.domain_name,
    COUNT(e.event_id) AS event_count,
    RANK() OVER (ORDER BY COUNT(e.event_id) DESC) AS rank_standard,
    DENSE_RANK() OVER (ORDER BY COUNT(e.event_id) DESC) AS rank_dense
FROM chaos_domains d
LEFT JOIN chaos_events e
    ON d.domain_id = e.domain_id
GROUP BY d.domain_name;


------------------------------------------------------------
-- 3. RUNNING TOTAL
-- “How many events have happened cumulatively over time?”
------------------------------------------------------------

SELECT
    created_at,
    severity,
    COUNT(*) AS events_this_day,
    SUM(COUNT(*)) OVER (
        ORDER BY created_at
    ) AS cumulative_events
FROM chaos_events
GROUP BY created_at, severity
ORDER BY created_at;


------------------------------------------------------------
-- 4. MOVING AVERAGE (7-day window)
-- “Track the rolling average number of events.”
------------------------------------------------------------

SELECT
    created_at,
    COUNT(*) AS events_today,
    AVG(COUNT(*)) OVER (
        ORDER BY created_at
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS moving_avg_7day
FROM chaos_events
GROUP BY created_at
ORDER BY created_at;


------------------------------------------------------------
-- 5. LAG() – Compare to previous row
-- “Did severity increase or decrease compared to prior event?”
------------------------------------------------------------

SELECT
    event_id,
    created_at,
    severity,
    LAG(severity) OVER (
        ORDER BY created_at
    ) AS previous_severity
FROM chaos_events
ORDER BY created_at;

