# Supply Chain Analytics — Late Delivery Analysis

> 🚧 **Work in progress.** This project is being built session by session as a learning project. Insights and dashboard come at the end.

## What this is

An end-to-end analytics project on the [DataCo Smart Supply Chain dataset](https://www.kaggle.com/datasets/shashwatwork/dataco-smart-supply-chain-for-big-data-analysis) (~180k order rows): loading raw data into PostgreSQL, modelling it into related tables, answering business questions in SQL, deepening the analysis in Python, and communicating the result in a Tableau dashboard.

**Central question:** what drives late deliveries — which shipping modes, product categories, and regions are the problem?

## Stack

| Tool | Used for |
|---|---|
| PostgreSQL 16 (in Docker) | the database |
| DBeaver | SQL client |
| Python — Pandas, SQLAlchemy, matplotlib | ETL and analysis |
| Jupyter | notebooks |
| Tableau | final dashboard |

## Repo structure

```
├── data/        # raw CSV (gitignored — download from Kaggle link above)
├── etl/         # scripts that load the CSV into Postgres
├── sql/         # one file per business question
├── notebooks/   # study notes + analysis notebooks
└── docs/        # roadmap and documentation
```

## Progress

See [docs/learning-roadmap.md](docs/learning-roadmap.md) for the full phase-by-phase plan.

- [x] **Phase 0** — Postgres running in Docker, DBeaver connected, dataset downloaded
- [ ] **Phase 1** — Load CSV into Postgres, first exploration in Pandas
- [ ] **Phase 2** — Model the data into `customers` / `products` / `orders`
- [ ] **Phase 3** — SQL analysis: filtering → joins → aggregation → CTEs → window functions
- [ ] **Phase 4** — Python analysis and visualisation
- [ ] **Phase 5** — Tableau dashboard + findings

## Running it yourself

Start the database:

```bash
docker run --name supply-chain-db \
  -e POSTGRES_PASSWORD=learnsql \
  -e POSTGRES_DB=supplychain \
  -p 5432:5432 \
  -v supply_chain_pgdata:/var/lib/postgresql/data \
  -d postgres:16
```

Then connect on `localhost:5432`, database `supplychain`, user `postgres`.

---

*Findings and recommendations will be added here as the analysis progresses.*
