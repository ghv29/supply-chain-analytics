# Session 3 — CSV → Postgres via Python (Phase 1.2)

> Write every answer in your own words. Clumsy and correct beats polished and copied.
> Rule of thumb: if you couldn't say it out loud to another junior analyst without reading, it's not yours yet.

## 1. What is a database "driver"?
Driver is the library for the specific database, which knows the protocols of the database.
psycopg2 is the driver for PostgresDB, it knows the commands and workings of it, and helps python to communicate to it

<!-- What is psycopg2? Why does Python need it to talk to Postgres specifically? -->

## 2. What is a SQLAlchemy "engine"?
SQLAlchemy is a SQL toolkit and Object relational mapping library for python to connect relational databases. It creates a connection between python and the database.
create_engine() works as a connector between python and Database, it works as an intermediate. it creates multiple channels with the database once and reserve for future, so that every query does not need to reconnect and hence saves time

<!-- What does create_engine() give you? Why don't you open/close connections by hand? -->

## 3. The connection string, decoded

```
dialect+driver://username:password@host:port/database
```

| Part | What it means (my words) | My project's value |
|---|---|---|
| `dialect` |database |postgresql |
| `driver` |library of the specific database | psycopg2 |
| `username` |username of the database |postgres |
| `password` |Pw of the database |learnsql |
| `host` |the name of the host  |localhost |
| `port` | the gate to connect |5432 |
| `database` |name of the database |supplychain|

## 4. Loading a DataFrame into a table

dataframe.to_sql function is used to write data from a dataframe and store it in SQL. it has parameters like con to specify the engine_connection and if_exists to make sure the dataframe is unqiue in the SQL and if not, we can replace, append or delete the table itself or just show fail to inform it already exists. 
Staging table means keeping the data as it is to prevent any mistakes to occur especially during cleaning. it seperates the data cleaning and data loading  
<!-- Which pandas method writes a DataFrame to a SQL table? What is a "staging table" and why load the CSV as-is first? -->

## 5. Keeping the password out of the code

.env is a seperate file for the credentials which the script will read, it is gitignored for safety of your passwords. whereas the .env.example is used as an example so that others can insert their credentials in the same manner for the script to function.
<!-- What is a .env file? Why is it gitignored? What is .env.example for? -->

## 6. What confused me / open questions

Things that tripped me up this session (write my own understanding next to each during revision):

- **`if_exists`** — I thought it checked whether the DataFrame was "unique". It doesn't — it only decides what to do IF a table with that name already exists (`fail` / `replace` / `append`).
- **`to_sql` return value** — it printed `31`, I expected the row count. The return value is unreliable; the real check is `SELECT COUNT(*)` in the database (returned 180519, so the load worked).
- **File paths in the script** — relative paths (`..\data\...`) depend on where I run the script from. Anchored it with `Path(__file__).parent` instead.
- **Reading `.env` values** — putting `"DB_USER"` in a string is just literal text. Have to read it with `os.getenv("DB_USER")`.
- **Docker vs DBeaver vs the Python script** — I thought the script "made the database run in Python". It doesn't. The Postgres *server* always runs inside the Docker container. DBeaver and the Python script are both just *clients* that dial into port 5432 and send SQL.
- **"Already loaded" CSV** — I thought the CSV was already in the container. It wasn't. The script was the first load. On disk: the CSV file. In Postgres: the `stg_orders` table.
- **`supplychain` vs `stg_orders`** — I thought these were two databases. `supplychain` is the *database*; `stg_orders` is a *table inside* it. Hierarchy: server → database → schema (`public`) → table → rows.

Open questions to carry forward:
- MySQL vs PostgreSQL — still owe myself this from Session 1.

