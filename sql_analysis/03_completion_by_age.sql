-- ============================================
-- 03_completion_by_age.sql
-- Treatment completion rates by age group
-- ============================================

SELECT
    age AS age_group,
    COUNT(*) AS total_episodes,
    SUM(completed) AS total_completed,
    ROUND(AVG(completed) * 100, 1) AS completion_rate_pct
FROM teds_discharges
WHERE age IS NOT NULL
GROUP BY age
ORDER BY completion_rate_pct DESC;