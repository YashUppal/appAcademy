# Heredoc

## What is Heredoc?

* A heredoc is a convenient way to write multi line strings. It's especially useful when we need to embed SQL code in Ruby program.

```ruby
query = <<-SQL
    SELECT
        *
    FROM
        student
    WHERE
        name = 'John Doe'
SQL
```

* ```<<-SQL``` will be replaced by the lines, starting just below it upto the matching ```SQL```  at the end.

## Another variant

* We can also use heredocs as below

```ruby
db.execute(<<-SQL,post_id)
    SELECT
        *
    FROM
        posts
    WHERE
        posts.id = ?
SQL
```
* In the above query, the ```?``` (Interpolation mark) will be replaced by the ```post_id``` passed argument. Key-Value pairs can also be used.

```ruby
db.execure(<<-SQL,post_id_key: post_id)
    SELECT
        *
    FROM
        posts
    WHERE
        posts.id = :post_id_key
SQL
```
* In the above scenario, the ```:post_id_key``` key will be replaced by corresponding ```post_id``` value.

## Difference between ? (interpolation mark) and key-value pair

* Usage of interpolation mark in heredocs will result in the values matching positionally. The order of passed arguments will correspond to the order of ```?``` interpolation marks, Whereas the key-value pair will be matched according to the key and values.

## Why use Interpolation marks/key-value pairs

* When we use ```?``` or key-value pairs to pass variables to a SQL query, the variables will be sanitised in order to prevent SQL injection attack