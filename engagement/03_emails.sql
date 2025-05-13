-- count of distinct users for different action types towards emails in July-August 2014
SELECT sub.date, 
       SUM(CASE WHEN sub.action = 'sent_weekly_digest' THEN sub.users END) AS digest_sent,
       SUM(CASE WHEN sub.action = 'email_open' THEN sub.users END) AS open,
       SUM(CASE WHEN sub.action = 'email_clickthrough' THEN sub.users END) AS link_clicked
FROM
-- subquery couting distinct users actions in July-August 2014
    (SELECT DATE_TRUNC('week', occurred_at) AS date,
            action,
            COUNT(DISTINCT user_id) AS users
    FROM tutorial.search_emails
    WHERE occurred_at > '2014-07-01' AND occurred_at < '2014-09-01'
    GROUP BY 1, 2) sub
    
GROUP BY 1
ORDER BY 1
