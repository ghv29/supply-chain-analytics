# Session 1 — Docker & PostgreSQL Setup

> Write every answer in your own words. Clumsy and correct beats polished and copied.
> Rule of thumb: if you couldn't say it out loud to another junior analyst without reading, it's not yours yet.

## 1. What is PostgreSQL?

<!-- 2-4 sentences. What is it, and what makes it different from a CSV file opened in Excel/Pandas? -->

## 2. What does "server" mean here?

<!-- Where does Postgres "run"? What is DBeaver, if it's not the database? What else will connect to Postgres later in this project? -->

## 3. What is a Docker container?

<!-- Your own analogy. Why did we use Docker instead of installing Postgres directly on Windows? -->

## 4. The command, decoded

```
docker run --name supply-chain-db -e POSTGRES_PASSWORD=learnsql -e POSTGRES_DB=supplychain -p 5432:5432 -v supply_chain_pgdata:/var/lib/postgresql/data -d postgres:16
```

| Part | What it does (my words) |
|---|---|
| `docker run` | |
| `--name supply-chain-db` | |
| `-e POSTGRES_PASSWORD=...` / `-e POSTGRES_DB=...` | |
| `-p 5432:5432` | |
| `-v supply_chain_pgdata:/var/lib/postgresql/data` | |
| `-d` | |
| `postgres:16` | |

## 5. The riddle I solved

<!-- Why did SELECT version() say "Debian ... linux-gnu" on a Windows laptop? -->

## 6. Commands I want to remember

<!-- e.g. how to check if the container runs, how to stop/start it, how to delete it. Test them if unsure. -->

## 7. What confused me / open questions

<!-- Honest list. These become the first thing we check next session. -->
