-- 99-mini-capstone.sql
-- Full pipeline-style SQL challenge
-- Demonstrates JOINs, aggregates, window functions, CTEs, case logic, and subqueries.
-- Theme: Operational event analysis (ChaosOS-style dataset)


------------------------------------------------------------
-- DATA MODEL (assume tables exist in your practice DB)
--
-- chaos_events(
--     event_id INT,
--     domain_id INT,
--     severity VARCHAR,
--     created_at DATETIME,
--     value NUMERIC
-- )
--
-- chaos_domains(
--     domain_id INT,
--     domain_name VARCHAR,
--     owner_agent VARCHAR
-- )
------------------------------------------------------------


------------------------------------------------------------
-- 1. GOAL:
-- Find the top 5 domains with the highest weighted severity
-- over the past 30 days AND flag any domains with missing data.
--
-- Weighted rules:
-- HIGH = 3 points
-- MEDIUM = 2 points
-- LOW = 1 point
------------------------------------------------------------


WITH recent_events AS (
    SELECT
        e.* 
    FROM chaos_events e
    WHERE e.created_at >= DATE('now', '-30 days')
),

severity_scores AS (
    SELECT
        event_id,
        domain_id,
        CASE
            WHEN severity = 'HIGH'   THEN 3
            WHEN severity = 'MEDIUM' THEN 2
            WHEN severity = 'LOW'    THEN 1
            ELSE 0
        END AS severity_score
    FROM recent_events
),

scores_by_domain AS (
    SELECT
        domain_id,
        COUNT(*) AS event_count,
        SUM(severity_score) AS total_score
    FROM severity_scores
    GROUP BY domain_id
),

joined_results AS (
    SELECT
        d.domain_name,
        d.owner_agent,
        s.event_count,
        s.total_score,
        CASE
            WHEN s.domain_id IS NULL THEN '⚠ Unmapped domain'
            ELSE 'OK'
        END AS data_quality
    FROM scores_by_domain s
    LEFT JOIN chaos_domains d
        ON s.domain_id = d.domain_id
)

SELECT
    *
FROM joined_results
ORDER BY total_score DESC
LIMIT 5;
