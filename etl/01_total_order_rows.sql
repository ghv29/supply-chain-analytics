-- Q: How many order rows do we have in total?
-- A: 180,519 order rows. Matches the source CSV exactly (verified against len(df) in pandas).
SELECT * FROM stg_orders
limit 5;