--count of distict users for engagement event types per week
SELECT sub.date, 
       SUM(CASE WHEN sub.event_name = 'home_page' THEN sub.users END) AS home_page,
       SUM(CASE WHEN sub.event_name = 'login' THEN sub.users END) AS login,
       SUM(CASE WHEN sub.event_name = 'send_message' THEN sub.users END) AS message
FROM
--subquery counting distinct users per event type per week
    (SELECT DATE_TRUNC('week', occurred_at) AS date,
            event_name,
            COUNT(DISTINCT user_id) AS users
    FROM tutorial.search_events
    WHERE event_type = 'engagement'
    GROUP BY 1, 2) sub
    
GROUP BY 1
ORDER BY 1
