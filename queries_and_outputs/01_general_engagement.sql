-- selecting the number of engaged users in June - Septemper 2014
SELECT drp.time_id,
       COUNT(DISTINCT e.user_id) AS weekly_active_users
  FROM benn.dimension_rollup_periods drp
  LEFT JOIN platform_events e
    ON e.occurred_at >= drp.pst_start
   AND e.occurred_at < drp.pst_end
   AND e.event_type = 'engagement'
 WHERE drp.period_id = 1007
   AND drp.time_id >= '2014-06-01'
   AND drp.time_id < '2014-09-01'
 GROUP BY 1
 ORDER BY 1
