-- ============================================
-- 01_overview.sql
-- Dataset summary and overall completion rate
-- ============================================

-- Total records in dataset
SELECT COUNT(*) AS total_episodes
FROM teds_discharges;

-- Overall treatment completion rate
SELECT 
    ROUND(AVG(completed) * 100, 1) AS completion_rate_pct,
    SUM(completed) AS total_completed,
    COUNT(*) - SUM(completed) AS total_not_completed
FROM teds_discharges;

-- Breakdown of all discharge reasons
SELECT 
    CASE reason
        WHEN 1 THEN 'Treatment Completed'
        WHEN 2 THEN 'Dropped Out'
        WHEN 3 THEN 'Terminated by Facility'
        WHEN 4 THEN 'Transferred'
        WHEN 5 THEN 'Incarcerated'
        WHEN 6 THEN 'Death'
        WHEN 7 THEN 'Other'
    END AS discharge_reason,
    COUNT(*) AS total,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 1) AS pct_of_total
FROM teds_discharges
GROUP BY reason
ORDER BY total DESC;