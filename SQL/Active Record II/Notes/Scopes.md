# Scopes

## What are Scopes

* Fancy name for class methods that define all or part of a SQL query.

```ruby
class Post < ApplicationRecord
  def self.by_popularity
    self
      .select('posts.*, COUNT(*) AS comment_count')
      .joins(:comments)
      .group('posts.id')
      .order('comment_count DESC')
  end
end
```
