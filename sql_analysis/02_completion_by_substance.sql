-- ============================================
-- 02_completion_by_substance.sql
-- Treatment completion rates by primary substance
-- ============================================

SELECT
    sub1 AS primary_substance,
    COUNT(*) AS total_episodes,
    SUM(completed) AS total_completed,
    ROUND(AVG(completed) * 100, 1) AS completion_rate_pct
FROM teds_discharges
WHERE sub1 IS NOT NULL
GROUP BY sub1
ORDER BY completion_rate_pct DESC;
