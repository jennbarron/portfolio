-- 01-basic-queries.sql
-- Purpose: Foundational SELECT / WHERE / ORDER BY patterns
-- Example table: chaos_events
--   chaos_events(id, customer_id, event_type, event_timestamp, value)

-- 1) View all events (raw log)
SELECT
    id,
    customer_id,
    event_type,
    event_timestamp,
    value
FROM chaos_events
ORDER BY event_timestamp;

-- 2) Filter by event type (e.g., payments only)
SELECT
    id,
    customer_id,
    event_type,
    event_timestamp,
    value
FROM chaos_events
WHERE event_type = 'payment'
ORDER BY event_timestamp;

-- 3) Filter by date range (recent events)
SELECT
    id,
    customer_id,
    event_type,
    event_timestamp,
    value
FROM chaos_events
WHERE event_timestamp >= '2025-01-03'
ORDER BY event_timestamp;

-- 4) Show unique event types
SELECT DISTINCT
    event_type
FROM chaos_events
ORDER BY event_type;

-- 5) Top 5 highest-value events
SELECT
    id,
    customer_id,
    event_type,
    event_timestamp,
    value
FROM chaos_events
ORDER BY value DESC
LIMIT 5;
