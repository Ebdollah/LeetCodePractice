
-- SELECT DISTINCT v.visit_id, v.customer_id
-- FROM Visits v
-- LEFT JOIN Transactions t ON v.visit_id = t.visit_id
-- WHERE t.visit_id IS NULL;


SELECT v.customer_id, Count(v.customer_id) AS count_no_trans
FROM Visits v
LEFT JOIN Transactions t ON v.visit_id = t.visit_id
WHERE t.visit_id IS NULL
Group by v.customer_id

-- SELECT v.customer_id, COUNT(v.customer_id)
-- FROM Visits v
-- LEFT JOIN Transactions t ON v.visit_id = t.visit_id
-- WHERE t.visit_id IS NULL
-- GROUP BY v.customer_id;


