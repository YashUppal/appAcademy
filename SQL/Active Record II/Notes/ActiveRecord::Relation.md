# ActiveRecord::Relation

## What is an ActiveRecord::Relation

* Whenever a query is fired on a model, an ActiveRecord Relation object is reversed. It is similar to an array in the way it can be iterated and accessed like an array, but it is a different class altogether.

## Characteristics of ActiveRecord::Relation

* A Relation object is **lazy** and **cached**. Relation is not evaluated unless needed, this helps in building complex queries. Is cached, which prevents firing database queries very frequently.

## Count VS Length VS Size

* Count - Will fire a SQL query to return the count of records.
* Length - Will load the relation into memory, convert it into array, and then return the length.
* Size - A combination of both. If Relation is already loaded, then it will return the length, else it will fire up a query and return the count