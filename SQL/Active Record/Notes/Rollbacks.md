# Rollback

## What is Rollback

* Rollback is the process of reverting (rolling back) our last migration, if something needs to be changes.

```ruby
    rails db:rollback
```

## Points to node

1) Rollbacks are **highly discouraged** in production environments.

2) Start editing after rolling back.