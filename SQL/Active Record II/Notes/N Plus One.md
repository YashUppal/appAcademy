# N Plus One

## What's N+1

* N+1 Queries is an 'inefficient' way of querying the SQL database, where the database is queried N + 1 Times.

## How to avoid the N+1 Problem?

* To prefetch (eager load) the data using ``.includes``

* To use ``joins``

