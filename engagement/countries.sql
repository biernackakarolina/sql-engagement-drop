SELECT sub.location,
       SUM(CASE WHEN sub.time_id = '2014-06-28 00:00:00' THEN sub.weekly_active_users END) AS june,
       SUM(CASE WHEN sub.time_id = '2014-08-01 00:00:00' THEN sub.weekly_active_users END) AS august,
       SUM(CASE WHEN sub.time_id = '2014-08-01 00:00:00' THEN sub.weekly_active_users END) -  SUM(CASE WHEN sub.time_id = '2014-06-28 00:00:00' THEN sub.weekly_active_users END) AS difference
FROM
(SELECT 
       e.location,
       drp.time_id,
       COUNT(DISTINCT e.user_id) AS weekly_active_users
  FROM benn.dimension_rollup_periods drp
  LEFT JOIN tutorial.yammer_events e
    ON e.occurred_at >= drp.pst_start
   AND e.occurred_at < drp.pst_end
   AND e.event_type = 'engagement'
   AND e.event_name = 'login'
 WHERE drp.period_id = 1007
   AND drp.time_id = '2014-06-28'
   OR drp.time_id = '2014-08-01'
 GROUP BY 1, 2) sub
 
 GROUP BY 1
 ORDER BY 4 DESC
LIMIT 100
