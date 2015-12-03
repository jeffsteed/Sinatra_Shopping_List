CREATE DATABASE shop_to_it;

\c shop_to_it

CREATE TABLE items (id SERIAL PRIMARY KEY, name VARCHAR(150), qty INTEGER);
