# Swap function

## Can you write a swap function in Ruby?

* There is a way to swap value of two variables in ruby

```ruby
x,y = y,x
```

* But, there is no way to create a method ```swap(x,y)``` such that

```ruby
x = 4
y = 3

swap(x,y)

# now x = 3 and y = 4
```

* Since there is no way for method to get access to names of arguments outside the method, so the method cannot rebind them.