-- 06-case-logic.sql
-- Purpose: Practice CASE expressions for classification & analytics
-- Focus: Labeling, bucketing, multi-condition logic

------------------------------------------------------------
-- Example table
-- chaos_events (event_id, domain_id, severity, created_at)
------------------------------------------------------------

------------------------------------------------------------
-- 1. Simple CASE – Create severity labels
------------------------------------------------------------

SELECT
    event_id,
    severity,
    CASE severity
        WHEN 'LOW' THEN '🟢 Low Priority'
        WHEN 'MEDIUM' THEN '🟡 Medium Priority'
        WHEN 'HIGH' THEN '🔴 High Priority'
        ELSE '⚠ Unknown'
    END AS severity_label
FROM chaos_events;


------------------------------------------------------------
-- 2. Searched CASE – More flexible conditions
-- “Classify events into operational tiers.”
------------------------------------------------------------

SELECT
    event_id,
    severity,
    created_at,
    CASE 
        WHEN severity = 'HIGH' THEN 'CRITICAL'
        WHEN severity = 'MEDIUM' AND created_at > DATE('2024-01-01') THEN 'RECENT MEDIUM'
        WHEN severity = 'LOW' THEN 'INFO'
        ELSE 'UNDEFINED'
    END AS ops_bucket
FROM chaos_events;


------------------------------------------------------------
-- 3. Multi-condition CASE – Risk scoring
------------------------------------------------------------

SELECT
    e.event_id,
    e.severity,
    d.domain_name,

    CASE
        WHEN e.severity = 'HIGH' AND d.domain_name = 'finance' 
            THEN 100
        WHEN e.severity = 'HIGH' 
            THEN 80
        WHEN e.severity = 'MEDIUM'
            THEN 50
        ELSE 10
    END AS risk_score

FROM chaos_events e
JOIN chaos_domains d
    ON e.domain_id = d.domain_id;


------------------------------------------------------------
-- 4. CASE inside aggregations
-- “Count high-risk events by domain.”
------------------------------------------------------------

SELECT
    d.domain_name,

    SUM(
        CASE WHEN e.severity = 'HIGH' THEN 1 ELSE 0 END
    ) AS high_severity_events,

    SUM(
        CASE WHEN e.severity = 'MEDIUM' THEN 1 ELSE 0 END
    ) AS medium_severity_events

FROM chaos_domains d
LEFT JOIN chaos_events e
    ON d.domain_id = e.domain_id
GROUP BY d.domain_name
ORDER BY high_severity_events DESC;

