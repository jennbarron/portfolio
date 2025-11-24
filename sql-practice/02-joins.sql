-- 02-joins.sql
-- Understanding INNER JOIN, LEFT JOIN, and JOIN behavior
-- Using ChaosOS-style domain + events tables

-- Imagine two tables:

-- chaos_events
-- (event_id, domain_id, severity, created_at, description)

-- chaos_domains
-- (domain_id, domain_name, owner_agent)

------------------------------------------------------------
-- 1. INNER JOIN
-- Only returns rows where the domain_id exists in BOTH tables.
-- “Give me all events that belong to valid domains.”
------------------------------------------------------------

SELECT 
    e.event_id,
    d.domain_name,
    e.severity,
    e.created_at,
    e.description
FROM chaos_events e
INNER JOIN chaos_domains d
    ON e.domain_id = d.domain_id;

------------------------------------------------------------
-- 2. LEFT JOIN
-- Returns ALL events — even if the domain is missing/broken.
-- Useful for detecting data quality problems or unassigned events.
------------------------------------------------------------

SELECT 
    e.event_id,
    d.domain_name,
    e.severity,
    e.created_at,
    e.description
FROM chaos_events e
LEFT JOIN chaos_domains d
    ON e.domain_id = d.domain_id
ORDER BY d.domain_name IS NULL DESC;

-- The ORDER BY trick puts “missing domains” on top.

------------------------------------------------------------
-- 3. RIGHT JOIN
-- Opposite of LEFT JOIN.
-- Return ALL domains, even if they have no events.
-- Rare in practice, but good to understand.
------------------------------------------------------------

SELECT 
    d.domain_name,
    d.owner_agent,
    e.event_id,
    e.severity
FROM chaos_events e
RIGHT JOIN chaos_domains d
    ON e.domain_id = d.domain_id;

------------------------------------------------------------
-- 4. PRACTICAL ChaosOS CASE:
-- “Show me all high-severity events AND point out any events
-- that were logged to an invalid/missing domain.”
------------------------------------------------------------

SELECT
    e.event_id,
    d.domain_name,
    e.severity,
    e.description,
    CASE 
        WHEN d.domain_name IS NULL THEN '⚠ Missing domain mapping'
        ELSE 'OK'
    END AS domain_status
FROM chaos_events e
LEFT JOIN chaos_domains d
    ON e.domain_id = d.domain_id
WHERE e.severity = 'HIGH';
