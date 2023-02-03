-- When was the earliest order ever placed? You only need to return the date.
SELECT MIN(occurred_at) AS earliest_order
FROM orders;

-- Try performing the same query as in question 1 without using an aggregation function.
SELECT occurred_at AS earliest_order
FROM orders
ORDER BY occurred_at
LIMIT 1;

-- When did the most recent (latest) web_event occur?
SELECT MAX(occurred_at) AS latest_web_event
FROM web_events;

-- Try to perform the result of the previous query without using an aggregation function.
SELECT occurred_at AS latest_web_event
FROM web_events
ORDER BY occurred_at DESC
LIMIT 1;

/* Find the mean (AVERAGE) amount spent per order on each paper type, as well as the mean amount of each paper
type purchased per order. Your final answer should have 6 values - one for each paper type for the average number
of sales, as well as the average amount.*/
SELECT AVG(standard_amt_usd) AS standard_amt_avg, AVG(gloss_amt_usd) AS gloss_amt_avg,
AVG(poster_amt_usd) AS poster_amt_avg, AVG(standard_qty) AS standard_avg, AVG(poster_qty) AS poster_avg,
AVG(gloss_qty) AS gloss_avg
FROM orders;

-- What is the MEDIAN total_usd spent on all orders?
SELECT AVG(total_amt_usd) AS avg
FROM (SELECT total_amt_usd
      FROM (SELECT total_amt_usd
            FROM orders
            ORDER BY total_amt_usd
            LIMIT 3457) AS table1
      ORDER BY total_amt_usd DESC
      LIMIT 2) AS table2;