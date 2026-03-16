-- ============================================
-- 06_advanced_queries.sql
-- Advanced SQL demonstrating CTEs and subqueries
-- ============================================

-- CTE: Identify substances with below-average completion rates
-- and high episode volume (most actionable for intervention)
WITH substance_stats AS (
    SELECT
        sub1 AS substance,
        COUNT(*) AS total_episodes,
        ROUND(AVG(completed) * 100, 1) AS completion_rate_pct
    FROM teds_discharges
    WHERE sub1 IS NOT NULL
    GROUP BY sub1
),
overall_avg AS (
    SELECT ROUND(AVG(completed) * 100, 1) AS avg_completion_rate
    FROM teds_discharges
)
SELECT
    s.substance,
    s.total_episodes,
    s.completion_rate_pct,
    o.avg_completion_rate,
    ROUND(s.completion_rate_pct - o.avg_completion_rate, 1) AS gap_from_average
FROM substance_stats s
CROSS JOIN overall_avg o
WHERE s.completion_rate_pct < o.avg_completion_rate
    AND s.total_episodes > 10000
ORDER BY s.total_episodes DESC;


-- Subquery: Age groups with completion rates above overall average
SELECT
    age AS age_group,
    total_episodes,
    completion_rate_pct
FROM (
    SELECT
        age,
        COUNT(*) AS total_episodes,
        ROUND(AVG(completed) * 100, 1) AS completion_rate_pct
    FROM teds_discharges
    WHERE age IS NOT NULL
    GROUP BY age
) age_summary
WHERE completion_rate_pct > (
    SELECT ROUND(AVG(completed) * 100, 1)
    FROM teds_discharges
)
ORDER BY completion_rate_pct DESC;