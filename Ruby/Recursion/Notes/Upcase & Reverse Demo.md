# Upcase and Reverse

## Upcase

* Program to upcase a string, recursively

```ruby
def recursive_upcase(str)
  return str.upcase if str.length == 1 # Base
  str[0].upcase + recursive_upcase(str[1..-1])
end

p recursive_upcase("hello world") # "HELLO WORLD
```

## Reverse

* Program to reverse a string, recursively

```ruby
def recursive_reverse(str)
  return str if str.length == 1
  recursive_reverse(str[1..-1]) + str[0]
end

p recursive_reverse("hello") # "olleh"
```