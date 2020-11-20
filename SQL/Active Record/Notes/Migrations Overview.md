# Migrations Overview

## What are Migrations?

* A Migration is a file that states any changes that are made to our database. It could be addition/deletion of a table/column or some other operation.

## Why are Migrations useful?

* While developing our application, our database might evolve overtime. There could be changes in the database schema, and It's a good idea to track these changes. Also, we might use differing databases in production and development environments, so we need a way to reflect the changes in different environments as well. Migrations solves that problems.