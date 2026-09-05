# Session 4 — Data Modeling: splitting the flat file (Phase 2.1)

> Write every answer in your own words. Clumsy and correct beats polished and copied.
> Rule of thumb: if you couldn't say it out loud to another junior analyst without reading, it's not yours yet.

## 1. Granularity — "what is one row?"
One row of the data, what it represents. Htere in stg_orders one row does not represent a whole order, as a single order can have multiple products, so the same order id is repeated with different products. a 3-product order will repeat the same order with 3 different products. Order Item Id is the one that's unique per row.
<!-- In stg_orders, does one row represent a whole order or something smaller? Which column proved it? What does a 3-product order look like in the raw file? -->

## 2. Primary key
It is the unique number or information which does not get repeated. it should be unique and not null. Order Id cant be the primary key as it will repeat till each product in the order is mentioned. A surrogate key is like an invented index, which keeps a unique number for each row. 
<!-- Your own definition. What two rules must a primary key column obey? Why can't "Order Id" be the primary key of the order-level table? What is a surrogate key? -->

## 3. Foreign key
It is the key which is connected to another tables primary key, it links the tables together. it can be repeated unlike PK. Customer_id could be a primary key in the Customers table, but it could be a FK in Orders table, which could be repeated and links the customer's information to orders.so when a customer has multiple orders, only the customer_id is repeated in the orders table which links to their information.  
<!-- Your own definition. How is it different from a primary key? Is a foreign key allowed to repeat? Give the customers/orders example in your words. -->

## 4. Why split one flat file into many tables?
we split to avoid repeated values in the rows and it is easier to update information in one place rather than multiple rows. If a fact is stored in 500 rows and you update 499, your data now contradicts itself, thats "Update anomaly" Splitting into multiple tables keep the data structured, seperate and yet connected with each other. WIth the help of joins, we can still link the data together and get the information needed. Also a product is a valid row in products table whether or not it has been ordered. In a flat file, it could exist only if it was ordered.
<!-- 3-4 sentences. Cover: repeated values, "update anomaly" (data contradicting itself), things existing on their own, and how JOIN puts it back together. -->

## 5. How I decided which columns to drop
The columns were dropped, if the information was duplicated ( as in two columns showing the same data), some columns were dropped as the business questions did not require such information. Also most importantly, the stg_orders table still exists, which means the raw data would not be affected. From Customers column, i dropped the private information which was not needed, especially for the business questions. 
<!-- What was the test for keeping vs dropping a column? Why is it safe to be aggressive about dropping? (hint: stg_orders still exists) Which columns did you drop from customers and why? -->

## 6. The final design

Fill in every table. Mark PK, and list FKs with what they point to.

| Table | Primary key | Foreign key(s) → target |
|---|---|---|
| `customers`  | ID| -|
| `orders` | Order ID|Order Customer Id →customers |
| `order_items`|Item Id |order_id → orders, product_card_id → products |
| `products` |product_card_id | category_id → categories|
| `categories` |Category Id | Department Id → Department|
| `departments` |department_id | |

<!-- Sketch image saved at: docs/________ -->

## 7. Decisions I made (and why)
Splitting department/category was so that the reduncany is eliminated as well as to keep the data easier to manage.The reason behind spliting products into categories and department was that it was 120 products repeating throughout.Also, department & category can exist without a product giving it a reference. On  the other hand, splitting shipping mode off orders was avoided as it was only 4 values repeating and was not worth a whole extra table and a join, but a 2 level product hierarchy is.
<!-- e.g. splitting department/category into their own lookup tables instead of leaving them as text on products — what did you choose and what was the reasoning? Any judgement calls an interviewer might ask about. -->

## 8. What confused me / open questions
The whole splitting the table was challenging, with so many columns. The ERD / crow's-foot notation was new this session. the grain discovery was the big "aha".
<!-- Honest list. What tripped you up about grain, keys, or the split? What do you want to double-check next session? -->
