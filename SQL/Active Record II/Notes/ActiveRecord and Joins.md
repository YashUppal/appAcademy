# ActiveRecord and Joins

## Joining Tables

* Using the ``joins`` query, tables can be joined to associations.

```ruby
  User.joins(:posts) 
  # Joins 'users' table to 'posts' association
```

* Multiple tables can be joined by calling joins on a model and passing a ``through`` association.

## Select and Joins

* By default, the columns from the **primary** table will be **SELECTED**, in order to access the columns from secondary ( table being joined), we need to explicitly use .select method

```ruby
  User.joins(:posts).select("users.*, posts.*")
```

## Alias in SELECT

* We can select a column as an alias, and later reference that column through that alias

```ruby
  User.joins(:posts).select("posts.title as post_title")
```
