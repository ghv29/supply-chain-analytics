# Session 5 — CREATE TABLE + types (Phase 2.2)

> Write every answer in your own words. Clumsy and correct beats polished and copied.
> Rule of thumb: if you couldn't say it out loud to another junior analyst without reading, it's not yours yet.

## 1. What a CREATE TABLE statement actually does
<!-- The three things you're telling Postgres before any data goes in. What does Postgres do with a row that breaks one of the rules? -->

## 2. Picking a type for a column
<!-- The type families you used. Two hard rules you learned: (a) what type must money always be, and why not float? (b) how do you get an auto-incrementing surrogate key — do you type the numbers in yourself? -->

## 3. PRIMARY KEY
<!-- What two guarantees does it give you in one keyword? How many per table? What is a composite primary key and where in your schema did you use one? -->

## 4. NOT NULL vs UNIQUE
<!-- Difference in one line each. Can a UNIQUE column hold NULL? Can a table have more than one UNIQUE column? -->

## 5. FOREIGN KEY
<!-- What does it check on INSERT? What happens if you try to delete a parent row that child rows still point to? Why does this constraint force you to CREATE the tables in a particular order? -->

## 6. Columns I dropped (final call)
<!-- Carry from Session 4, now locked in. List the dropped columns per table + a one-line reason each. Why is it safe to be aggressive about dropping here? -->

## 7. The DDL I wrote
<!-- Link to the .sql file. Did anything change from the Session 4 paper design once you had to commit to real types? -->

## 8. What confused me / open questions
<!-- Honest list. Types you weren't sure about, constraint behaviour that surprised you, anything to double-check next session. -->
