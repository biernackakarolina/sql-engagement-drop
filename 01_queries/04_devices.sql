-- QUERY1: selecting distict devide name for later categorization
SELECT DISTINCT device
    FROM tutorial.platform_events
    WHERE event_name = 'login'

-- QUERY2: count of active users by device type
-- summing up the number of users that logged in by device type
SELECT sub.date, 
       SUM(CASE WHEN sub.device ILIKE '%desktop%' OR sub.device ILIKE '%mac%' THEN sub.users END) AS desktop,
       SUM(CASE WHEN sub.device ILIKE '%book%' OR sub.device ILIKE '%pad%' OR sub.device ILIKE '%tablet%' THEN sub.users END) AS tablet,
       SUM(CASE WHEN sub.device ILIKE '%phone%' OR sub.device ILIKE '%nokia%' OR sub.device ILIKE '%s4%' THEN sub.users END) AS phone
FROM
    --subquery calculating number of distinct users that logged in by device name
    (SELECT DATE_TRUNC('week', occurred_at) AS date,
            device,
           COUNT(DISTINCT user_id) AS users
    FROM tutorial.platform_events
    WHERE event_name = 'login'
    GROUP BY 1, 2) sub 
    
    GROUP BY 1
    ORDER BY 1
