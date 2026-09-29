create table if not exists departments(
department_id smallint primary key,
department_name text not null
);


create table if not exists categories(
category_id smallint primary key,
department_id smallint not null references departments(department_id),
category_name text not null 
);

create table if not exists customers(
customer_id integer primary key,
customer_city text not null,
customer_country text not null,
customer_segment text not null
);


create table if not exists products(
product_card_id smallint primary key,
category_id smallint not null references categories(category_id),
product_name text not null,
product_price numeric(6,2) not null
);

create table if not exists orders(
order_id int primary key,
order_customer_id int not null references customers(customer_id),
order_date date not null,
order_city text not null,
order_country text not null,
order_region text not null,
order_status text not null,
shipping_date date not null,
shipping_mode text not null,
actual_shipping_days smallint not null,
scheduled_shipment_days smallint not null,
delivery_status text not null,
late_delivery_risk boolean not null,
market text not null
);

Create table if not exists order_items(
order_item_id int Primary Key,
order_id int not null references orders(order_id),
product_card_id smallint not null references products(product_card_id),
price numeric(6,2) not null,
quantity smallint not null,
discount_rate numeric(3,2) not null,
discount_amount numeric(5,2) not null,
profit_ratio numeric(5,2) not null, 
order_profit numeric(7,2)  not null
);