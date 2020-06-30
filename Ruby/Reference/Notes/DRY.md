# Don't Repeat Yourself

## DRY Principle

* DRY, Don't Repeat Yourself is a principle by virtue of which code should not be repeated. If a piece of code is being copied/pasted in multiple places, It's better to convert it into a method, or find a way to fix the repetition.

* If a faulty piece of code is copied in multiple places, we will get bugs in mulitple places and we'll have to fix the faulty code separately.

```ruby
def valid_email(email)
    if email.include?("@")
        return true
    else
        return false
    end
end

def valid_confirm_email(email)
    if email.include?("@")
        return true
    else
        return false
    end
end

# Repeated code, not good. Let's refactor it below.
```

```ruby
def includes_at(email)
    return true if email.include?("@")
    false
end

def valid_email(email)
    return includes_at(email)
end

def valid_confirm_email(email)
    return includes_at(email)
end
```