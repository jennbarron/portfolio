-- 03-aggregations.sql
-- COUNT, GROUP BY, HAVING using ChaosOS-style event logs

-- We keep using the same mental model:
-- chaos_events(event_id, domain_id, severity, created_at, description)

------------------------------------------------------------
-- 1. How many events do we have in total?
-- (Baseline check – "how noisy is the system?")
------------------------------------------------------------

SELECT 
    COUNT(*) AS total_events
FROM chaos_events;

------------------------------------------------------------
-- 2. How many events per domain?
-- "Which areas of life/system generate the most chaos?"
------------------------------------------------------------

SELECT 
    domain_id,
    COUNT(*) AS events_per_domain
FROM chaos_events
GROUP BY domain_id
ORDER BY events_per_domain DESC;

------------------------------------------------------------
-- 3. How many HIGH severity events per domain?
-- This is where Ops / DEC starts paying attention.
------------------------------------------------------------

SELECT 
    domain_id,
    COUNT(*) AS high_severity_events
FROM chaos_events
WHERE severity = 'HIGH'
GROUP BY domain_id
ORDER BY high_severity_events DESC;

------------------------------------------------------------
-- 4. Use HAVING to filter groups:
-- "Show me only domains with at least 5 high-severity events."
------------------------------------------------------------

SELECT 
    domain_id,
    COUNT(*) AS high_severity_events
FROM chaos_events
WHERE severity = 'HIGH'
GROUP BY domain_id
HAVING COUNT(*) >= 5
ORDER BY high_severity_events DESC;

------------------------------------------------------------
-- 5. Bucket events by day:
-- "How many events happened per day?"
------------------------------------------------------------

SELECT 
    DATE(created_at) AS event_date,
    COUNT(*) AS events_that_day
FROM chaos_events
GROUP BY DATE(created_at)
ORDER BY event_date DESC;

------------------------------------------------------------
-- 6. Bucket by severity + day:
-- "On each day, how many HIGH vs MEDIUM vs LOW?"
------------------------------------------------------------

SELECT 
    DATE(created_at) AS event_date,
    severity,
    COUNT(*) AS events_count
FROM chaos_events
GROUP BY DATE(created_at), severity
ORDER BY event_date DESC, 
         CASE severity
             WHEN 'HIGH' THEN 1
             WHEN 'MEDIUM' THEN 2
             WHEN 'LOW' THEN 3
             ELSE 4
         END;

------------------------------------------------------------
-- 7. Combine domain + severity:
-- "Which domains are consistently high-severity?"
------------------------------------------------------------

SELECT 
    domain_id,
    severity,
    COUNT(*) AS events_count
FROM chaos_events
GROUP BY domain_id, severity
ORDER BY severity DESC, events_count DESC;
