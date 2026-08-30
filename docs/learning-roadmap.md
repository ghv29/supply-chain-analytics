# Learning Roadmap — Supply Chain Analytics

The spine of the whole project. Not a course sitting next to the project — the project **is** the course.

## How to use this map (the loop)

For every concept below, do the same three steps in order:

1. **LEARN** — work through the linked free resource until the idea makes basic sense. Don't aim for mastery, aim for "I get the shape of it."
2. **DRILL** — do the resource's own exercises (pgexercises / SQLBolt run in your browser, no setup). This is your reps on toy data.
3. **APPLY** — answer the project business question against *your* DataCo dataset, in a real `.sql` file in `/sql`. This is where it sticks.

Rules that don't change:
- **You write every query.** Claude reviews, hints, and debugs — never hands you the solution.
- One `.sql` file per business question in `/sql`. Start each file with the question in plain English (comment), and once solved, your one-sentence answer.
- After each concept, tell Claude the idea back in your own words before moving on.
- Stuck? Bring your attempt + error to the chat. "I tried X, expected Y, got Z" beats "how do I do this."

Status key: ⬜ not started · 🔄 in progress · ✅ can explain it back

---

## PHASE 0 — Setup ✅ (done in Session 1)

Postgres in Docker, DBeaver connected, dataset downloaded, repo on GitHub. See [session-01 note](../notebooks/session-01-docker-postgres.md).

---

## PHASE 1 — Get the data in & first look

Goal: raw CSV loaded into Postgres, first exploration done. You write the load script.

| # | Concept | LEARN (free resource) | APPLY — your task |
|---|---------|----------------------|-------------------|
| 1.1 | Pandas first contact | Your Ironhack `Pandas_Cheat_Sheet.pdf` + [Kaggle Learn: Pandas](https://www.kaggle.com/learn/pandas) (lessons 1–2) | ⬜ Load the CSV in a Jupyter notebook. Run `head`, `info`, `shape`, `describe`. Write 3 things you notice about the data (nulls? weird columns? types?). |
| 1.2 | CSV → Postgres via Python | Your Ironhack `hands-on/4.7_connecting_python_sql.ipynb` + [SQLAlchemy engine basics](https://docs.sqlalchemy.org/en/20/core/engines.html) (connection string only) | ⬜ Write a small script in `/etl` that loads the CSV into a **staging table** `stg_orders` (all columns as-is). |
| 1.3 | Sanity-check the load | — | ⬜ In DBeaver: does `SELECT COUNT(*) FROM stg_orders;` match the CSV row count? A stakeholder question you can now answer: *"How many order rows do we have in total?"* |

---

## PHASE 2 — Model the data

Goal: turn one flat table into clean, related tables. Design first, then build.

| # | Concept | LEARN | APPLY — your task |
|---|---------|-------|-------------------|
| 2.1 | Keys & relationships | [SQLBolt Lessons 1–3](https://sqlbolt.com) + concept chat with Claude | ⬜ On paper/whiteboard: propose splitting the flat file into `customers`, `products`, `orders`. What's the primary key of each? Bring it to Claude to challenge. |
| 2.2 | `CREATE TABLE` + types | [PostgreSQL data types](https://www.postgresql.org/docs/current/datatype.html) (skim) | ⬜ Write `CREATE TABLE` for your three tables with sensible types and keys. (Also: which columns should you **drop**? Look at `Customer Password`…) |
| 2.3 | `INSERT … SELECT` | [Mode: INSERT](https://mode.com/sql-tutorial/sql-insert/) | ⬜ Populate your clean tables from `stg_orders`. Stakeholder Q: *"How many unique customers and unique products do we actually have?"* |

---

## PHASE 3 — SQL core (the heart of the project)

Goal: answer rising-difficulty stakeholder questions. This is the skill employers test. Primary resource: **[pgexercises.com](https://pgexercises.com)** (interactive, runs on real PostgreSQL — your exact database).

| # | Concept | LEARN + DRILL | APPLY — stakeholder question (→ one `.sql` file each) |
|---|---------|---------------|--------------------------------------------------------|
| 3.1 | `SELECT` / `WHERE` / filtering | [pgexercises: Basic](https://pgexercises.com/questions/basic/) + [SQLBolt 1–6](https://sqlbolt.com) | ⬜ *"Show me every order shipped to a given market that was flagged as late-delivery risk."* |
| 3.2 | `ORDER BY`, `LIMIT`, `DISTINCT` | pgexercises: Basic (cont.) | ⬜ *"What are the 10 most recent orders, and how many distinct shipping modes do we offer?"* |
| 3.3 | Aggregation: `COUNT/SUM/AVG` | [pgexercises: Aggregation](https://pgexercises.com/questions/aggregates/) + [Mode: Aggregation](https://mode.com/sql-tutorial/sql-aggregate-functions/) | ⬜ *"What's our total sales and average order profit overall?"* |
| 3.4 | `GROUP BY` | [Mode: GROUP BY](https://mode.com/sql-tutorial/sql-group-by/) | ⬜ **The headline question:** *"Which shipping mode has the worst late-delivery rate?"* |
| 3.5 | `JOIN`s (your weak spot — go slow) | [pgexercises: Joins](https://pgexercises.com/questions/joins/) + [SQLBolt 6–9](https://sqlbolt.com/lesson/select_queries_with_joins) | ⬜ *"Which product categories drive the most late deliveries?"* (needs orders + products joined) |
| 3.6 | `HAVING` (filter groups) | [Mode: HAVING](https://mode.com/sql-tutorial/sql-having/) | ⬜ *"Which customer segments placed more than 5,000 orders?"* |
| 3.7 | `CASE` (conditional logic) | [Mode: CASE](https://mode.com/sql-tutorial/sql-case/) | ⬜ *"Bucket orders into 'On time' / 'Slightly late' / 'Very late' and count each."* |
| 3.8 | Dates & time | [pgexercises: Dates](https://pgexercises.com/questions/date/) | ⬜ *"What's the monthly order volume trend across the dataset?"* |
| 3.9 | CTEs (`WITH`) | [Mode: WITH](https://mode.com/sql-tutorial/sql-cte/) | ⬜ *"How does each region's late-delivery rate compare to the company-wide average?"* |
| 3.10 | Window functions | [Mode: Window Functions](https://mode.com/sql-tutorial/sql-window-functions/) + [pgexercises: Recursive/Window](https://pgexercises.com/questions/aggregates/) | ⬜ *"Rank products by sales within each category, and show month-over-month sales change."* |

---

## PHASE 4 — Python analysis

Goal: questions better answered in Pandas than SQL — trends, drivers, visuals.

| # | Concept | LEARN | APPLY — your task |
|---|---------|-------|-------------------|
| 4.1 | Query Postgres from Pandas | Your `4.7_connecting_python_sql.ipynb` | ⬜ Pull a query result straight into a DataFrame. |
| 4.2 | Groupby / pivot in Pandas | [Kaggle Learn: Pandas](https://www.kaggle.com/learn/pandas) (lessons 3–6) | ⬜ *"What are the top late-delivery drivers?"* — explore with groupby. |
| 4.3 | Visualization | Your `cheatsheets/matplotlib.pdf` + [Kaggle: Data Viz](https://www.kaggle.com/learn/data-visualization) | ⬜ Chart the monthly late-delivery trend and the worst shipping modes. |

---

## PHASE 5 — Communicate

Goal: the portfolio payload.

| # | Task |
|---|------|
| 5.1 | ⬜ Build a Tableau dashboard from your findings (use `Tableau/` bootcamp material). |
| 5.2 | ⬜ Write the README: 3 concrete insights + 1 recommendation, **in your own voice**. Claude helps structure, you supply the findings. |

---

## Parking lot (open questions to resolve as they come up)

- MySQL vs PostgreSQL — what actually differs? (from Session 1 note)
- What is `--` for in SQL? (Session 1 follow-up)
- PII in the dataset: which columns must never ship to GitHub or a dashboard?
