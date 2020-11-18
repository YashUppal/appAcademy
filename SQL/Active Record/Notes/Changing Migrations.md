# Changing Migrations

## Add a new migration

* We can simply add a new migration to a database using 

```ruby
    bundle exec rails generate migration addSomethingToTable
```

## Rollback

* Rollback the last migration, make changes to that and then migrate (discouraged method)