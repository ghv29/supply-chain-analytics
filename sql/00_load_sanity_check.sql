-- Q: How many order rows do we have in total?
-- A: 180,519 order rows. Matches the source CSV exactly (verified against len(df) in pandas).
SELECT COUNT(*) as Total_rows FROM stg_orders;