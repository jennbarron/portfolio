-- 01-basic-queries.sql
-- Basic SELECT / WHERE / ORDER BY using a ChaosOS-style log table

-- Imagine a table that stores events ChaosOS tracks:
-- chaos_events(event_id, domain, severity, created_at, description)

-- 1. Get everything so we can see the raw data
SELECT *
FROM chaos_events;

-- 2. Only high-severity events (things ChaosOS would escalate)
SELECT event_id,
       domain,
       severity,
       created_at,
       description
FROM chaos_events
WHERE severity = 'HIGH';

-- 3. Filter by domain: legal events only
SELECT event_id,
       severity,
       created_at,
       description
FROM chaos_events
WHERE domain = 'LEG'
ORDER BY created_at DESC;

-- 4. Limit the noise: the 10 most recent events of any type
SELECT event_id,
       domain,
       severity,
       created_at
FROM chaos_events
ORDER BY created_at DESC
LIMIT 10;

-- 5. Combine filters: high-severity health issues in the last 30 days
SELECT event_id,
       domain,
       severity,
       created_at,
       description
FROM chaos_events
WHERE domain = 'HEA'
  AND severity = 'HIGH'
  AND created_at >= CURRENT_DATE - INTERVAL '30 day'
ORDER BY created_at DESC;

