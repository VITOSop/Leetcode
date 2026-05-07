WITH daily AS (
    SELECT 
        visited_on,
        SUM(amount) AS daily_amount
    FROM Customer
    GROUP BY visited_on
),

windowed AS (
    SELECT 
        visited_on,
        SUM(daily_amount) OVER (
            ORDER BY visited_on
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS total_amount,
        COUNT(*) OVER (
            ORDER BY visited_on
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS cnt_days
    FROM daily
)

SELECT 
    visited_on,
    total_amount AS amount,
    ROUND(total_amount / 7, 2) AS average_amount
FROM windowed
WHERE cnt_days = 7
ORDER BY visited_on;
