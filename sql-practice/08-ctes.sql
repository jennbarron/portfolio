-- 08-ctes.sql
-- Purpose: Practice Common Table Expressions (CTEs)
-- Focus: Breaking complex logic into readable steps

------------------------------------------------------------
-- Example tables:
-- chaos_events(event_id, domain_id, severity, created_at, value)
-- chaos_domains(domain_id, domain_name)
------------------------------------------------------------


------------------------------------------------------------
-- 1. Basic CTE – Pre-aggregate, then filter
-- Question:
-- "Which domains generated more than 100 events in 2024?"
------------------------------------------------------------

WITH events_per_domain_2024 AS (
    SELECT
        e.domain_id,
        COUNT(*) AS event_count
    FROM chaos_events e
    WHERE e.created_at BETWEEN '2024-01-01' AND '2024-12-31'
    GROUP BY e.domain_id
)
SELECT
    d.domain_name,
    e.event_count
FROM events_per_domain_2024 e
JOIN chaos_domains d
    ON e.domain_id = d.domain_id
WHERE e.event_count > 100
ORDER BY e.event_count DESC;


------------------------------------------------------------
-- 2. Multi-step CTE – Severity scoring pipeline
-- Question:
-- "Score domains by weighted severity and show the top ones."
------------------------------------------------------------

WITH event_scores AS (
    SELECT
        e.domain_id,
        CASE
            WHEN e.severity = 'HIGH'   THEN 3
            WHEN e.severity = 'MEDIUM' THEN 2
            WHEN e.severity = 'LOW'    THEN 1
            ELSE 0
        END AS severity_score
    FROM chaos_events e
),

scores_by_domain AS (
    SELECT
        domain_id,
        SUM(severity_score) AS total_score
    FROM event_scores
    GROUP BY domain_id
)

SELECT
    d.domain_name,
    s.total_score
FROM scores_by_domain s
JOIN chaos_domains d
    ON s.domain_id = d.domain_id
ORDER BY s.total_score DESC;


------------------------------------------------------------
-- 3. CTE + Window functions
-- Question:
-- "For each domain, show total events AND its rank by volume."
------------------------------------------------------------

WITH events_per_domain AS (
    SELECT
        e.domain_id,
        COUNT(*) AS event_count
    FROM chaos_events e
    GROUP BY e.domain_id
)

SELECT
    d.domain_name,
    e.event_count,
    RANK() OVER (ORDER BY e.event_count DESC) AS volume_rank
FROM events_per_domain e
JOIN chaos_domains d
    ON e.domain_id = d.domain_id
ORDER BY volume_rank;


------------------------------------------------------------
-- 4. CTE for cleaning / flagging data
-- Question:
-- "Detect suspicious events with missing domain OR zero/negative value."
------------------------------------------------------------

WITH flagged_events AS (
    SELECT
        e.event_id,
        e.domain_id,
        e.value,
        e.created_at,
        CASE
            WHEN e.domain_id IS NULL THEN 'MISSING_DOMAIN'
            WHEN e.value <= 0       THEN 'NON_POSITIVE_VALUE'
            ELSE 'OK'
        END AS quality_flag
    FROM chaos_events e
)

SELECT
    *
FROM flagged_events
WHERE quality_flag <> 'OK'
ORDER BY created_at DESC;


------------------------------------------------------------
-- 5. CTE chain – Funnel-style logic
-- Question:
-- "Show daily event volume, then filter to days with unusually high volume."
------------------------------------------------------------

WITH daily_counts AS (
    SELECT
        DATE(created_at) AS event_date,
        COUNT(*)         AS event_count
    FROM chaos_events
    GROUP BY DATE(created_at)
),

daily_stats AS (
    SELECT
        event_date,
        event_count,
        AVG(event_count) OVER () AS avg_events,
        MAX(event_count) OVER () AS max_events
    FROM daily_counts
)

SELECT
    event_date,
    event_count,
    avg_events,
    max_events
FROM daily_stats
WHERE event_count > avg_events * 1.5
ORDER BY event_date;
