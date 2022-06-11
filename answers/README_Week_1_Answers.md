# Week 1 Project: Q&A

[Week 1 Project Page](https://corise.com/course/analytics-engineering-with-dbt/module/week1-project-submission#corise_cl0pt8hqn00093e6c7loaedhp)

---

**Q1:**
> How many users do we have? 

**A:** `130`

**Code:**
``` sql
SELECT 
  COUNT(DISTINCT user_id) AS n_users
FROM dbt_alex_l.stg_users
```

---

**Q2:**
> On average, how many orders do we receive per hour? 

**Ans:** `7.5` per hour (approx.)

**Code:**
``` sql
WITH hourly_counts 
AS (
  SELECT 
    DATE_TRUNC('hour', created_at) AS hour, 
    COUNT(DISTINCT order_id) as order_count
  FROM dbt_alex_l.stg_orders
  GROUP BY hour
)

SELECT 
  AVG(order_count) as avg_order_per_hour
FROM hourly_counts
```

---

**Q:** 
> On average, how long does an order take from being placed to being delivered? 

**Ans:** `3 days 21 hours` (approx.)

**Code**:
``` sql
SELECT 
	AVG(delivered_at - created_at)
FROM dbt_alex_l.stg_orders
WHERE 
  delivered_at IS NOT NULL
  AND created_at IS NOT NULL
```


---

**Q:** 
> How many users have only made one purchase? Two purchases? Three+ purchases? 

**Ans:** 
- 1 purchase: `25`
- 2 purchases: `28`
- 3 or more: `71`

**Code**:
``` sql
WITH order_count_by_user
AS (
  SELECT 
    user_id, 
    count(DISTINCT order_id) as order_count
  FROM dbt_alex_l.stg_orders
  GROUP BY user_id
)

SELECT 
  CASE 
    WHEN order_count = 1 THEN 1
    WHEN order_count = 2 THEN 2
    WHEN order_count >= 3 THEN 3
    ELSE NULL 
  END AS order_count_category,
  COUNT(DISTINCT user_id)
FROM order_count_by_user
GROUP BY order_count_category
```

---

**Q:** 
> On average, how many unique sessions do we have per hour?

**Ans:** `16.3`

**Code**:
``` sql
WITH sessions_per_hour 
AS (
  SELECT
    DATE_TRUNC('hour', created_at) AS hour, 
    COUNT(DISTINCT session_id) as unique_session
  FROM dbt_alex_l.stg_events
  GROUP BY hour
)

SELECT 
	AVG(unique_session)
FROM sessions_per_hour
```
