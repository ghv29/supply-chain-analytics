# Session 1 — Docker & PostgreSQL Setup

> Write every answer in your own words. Clumsy and correct beats polished and copied.
> Rule of thumb: if you couldn't say it out loud to another junior analyst without reading, it's not yours yet.

## 1. What is PostgreSQL?

PostgreSQL is a database server, it holds data separately systematically but still connected to each other. 
it is not a flat table like a CSV, it has constraints or rules which are maintained. 
it makes the database like a chat where one can ask the right question and it answers and SQL is the language in which we can ask the question
 <!-- 2-4 sentences. What is it, and what makes it different from a CSV file opened in Excel/Pandas? -->

## 2. What does "server" mean here?

Server is used to connect a chat client software like DBeaver. <!-- Where does Postgres "run"? What is DBeaver, if it's not the database? What else will connect to Postgres later in this project? -->

## 3. What is a Docker container?

Docker container is like running a Virtual machine on your windows, so that it eliminates messy issues of the installation process
using docker, we can contain the Postgres in a box and avoid any issues with installing any dependanies. <!-- Your own analogy. Why did we use Docker instead of installing Postgres directly on Windows? -->

## 4. The command, decoded

```
docker run --name supply-chain-db -e POSTGRES_PASSWORD=learnsql -e POSTGRES_DB=supplychain -p 5432:5432 -v supply_chain_pgdata:/var/lib/postgresql/data -d postgres:16
```

| Part | What it does (my words) |
|---|---|
| `docker run` | it runs the container |
| `--name supply-chain-db` | the name of the container  |
| `-e POSTGRES_PASSWORD=...` / `-e POSTGRES_DB=...` | -e means environment and name of the server and its password |
| `-p 5432:5432` | the port address ( left = the machine, right = the container) |
| `-v supply_chain_pgdata:/var/lib/postgresql/data` | volume, it stores data outside of the container, so that even if the container is deleted the data is safe |
| `-d` | detatch - so that the terminal is free, and can be used even the the container is running.  |
| `postgres:16` | the template of the container |

## 5. The riddle I solved

It shows Debain..linux-gnu in DBeaver as it is connected to the docker container, which is basically a linux VM<!-- Why did SELECT version() say "Debian ... linux-gnu" on a Windows laptop? -->

## 6. Commands I want to remember

docker ps <- to check if the container is running
docker run --name (name) <- to run the docker container 
SELECT --verison <- to check if the DBeaver is connected to the Docker Server<!-- e.g. how to check if the container runs, how to stop/start it, how to delete it. Test them if unsure. -->

## 7. What confused me / open questions
basically postgre is the warehouse with specific shelves to store data (with proper constrains that are maintined) which are related to each other, the DBeaver is the way to connect the shelves together however needed using SQL queries

the difference between MYSQL vs PostgreSQL 
<!-- Honest list. These become the first thing we check next session. -->
