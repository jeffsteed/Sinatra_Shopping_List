CREATE DATABASE shop_to_it;

\c shop_to_it

CREATE TABLE items (id SERIAL PRIMARY KEY, name VARCHAR(150), qty INTEGER);

CREATE TABLE accounts (id SERIAL PRIMARY KEY, user_name VARCHAR(255), user_email VARCHAR(255), password_digest VARCHAR(255), is_admin BOOLEAN);
