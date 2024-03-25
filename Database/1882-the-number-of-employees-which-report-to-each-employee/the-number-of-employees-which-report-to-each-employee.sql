SELECT
    e.employee_id,
    e.name,
    COUNT(r.employee_id) AS reports_count,
    ROUND(AVG(r.age), 0) AS average_age
FROM
    Employees e
LEFT JOIN
    Employees r ON r.reports_to = e.employee_id
WHERE
    e.employee_id IN (SELECT reports_to FROM Employees WHERE reports_to IS NOT NULL)
GROUP BY
    e.employee_id, e.name
ORDER BY
    e.employee_id;

    