-- 07-filtering-logic.sql
-- Purpose: Master WHERE, AND/OR, NULL logic, pattern matching
-- Focus: Common pitfalls + realistic analytics filtering

------------------------------------------------------------
-- Example table for ChaosOS domain
-- chaos_events(event_id, domain_id, severity, created_at, description)
------------------------------------------------------------

------------------------------------------------------------
-- 1. Basic WHERE
-- “Get all HIGH severity events”
------------------------------------------------------------

SELECT *
FROM chaos_events
WHERE severity = 'HIGH';


------------------------------------------------------------
-- 2. AND / OR with parentheses
-- Parentheses matter more than people think.
------------------------------------------------------------

-- WRONG (returns too many events)
SELECT *
FROM chaos_events
WHERE severity = 'HIGH' OR severity = 'MEDIUM' AND domain_id = 3;

-- RIGHT
SELECT *
FROM chaos_events
WHERE (severity = 'HIGH' OR severity = 'MEDIUM')
  AND domain_id = 3;


------------------------------------------------------------
-- 3. NULL logic (critical)
------------------------------------------------------------

-- Find events missing domain mapping
SELECT *
FROM chaos_events
WHERE domain_id IS NULL;

-- Find events where description is NOT missing
SELECT *
FROM chaos_events
WHERE description IS NOT NULL;


------------------------------------------------------------
-- 4. Pattern matching (LIKE)
------------------------------------------------------------

-- Find events with “error” in description (case-sensitive)
SELECT *
FROM chaos_events
WHERE description LIKE '%error%';

-- “Starts with” and “ends with”
SELECT *
FROM chaos_events
WHERE description LIKE 'fail%';

SELECT *
FROM chaos_events
WHERE description LIKE '%timeout';


------------------------------------------------------------
-- 5. IN and NOT IN
------------------------------------------------------------

-- Filter specific severities
SELECT *
FROM chaos_events
WHERE severity IN ('HIGH', 'MEDIUM');

-- Exclude specific severities
SELECT *
FROM chaos_events
WHERE severity NOT IN ('LOW');


------------------------------------------------------------
-- 6. Date filtering
------------------------------------------------------------

-- Events from last 30 days
SELECT *
FROM chaos_events
WHERE created_at >= DATE('now', '-30 day');

-- Events from 2024 only
SELECT *
FROM chaos_events
WHERE created_at BETWEEN '2024-01-01' AND '2024-12-31';


------------------------------------------------------------
-- 7. Combined: Complex real-life filtering
-- “Find all high or medium events in the finance domain from 2024”
------------------------------------------------------------

SELECT
    event_id,
    severity,
    description
FROM chaos_events
WHERE (severity = 'HIGH' OR severity = 'MEDIUM')
  AND domain_id = (
        SELECT domain_id
        FROM chaos_domains
        WHERE domain_name = 'finance'
    )
  AND created_at >= '2024-01-01';


------------------------------------------------------------
-- 8. Combined: Detect data quality issues
------------------------------------------------------------

SELECT
    event_id,
    severity,
    CASE
        WHEN domain_id IS NULL THEN '⚠ Missing domain'
        WHEN description LIKE '%test%' THEN '⚠ Test event'
        ELSE 'OK'
    END AS quality_flag
FROM chaos_events
WHERE created_at >= '2024-01-01';
