# Method decomposition and design

## Methods should be atomic

* A method should perform just one task, methods should be atomic in nature. This is sometimes called the _Single Responsibility Principle_. A program should have multiple atomic methods, each accomplishing a single task, instead of one large method that does everything.

## Do not use global state

* It's a good idea to treat your methods like mathematical functions, methods should take and input and produce some output, without side effects and without depending on something outside the method.

* As a rule of thumb, **Only way in should be through arguments (from parameters) and only way out should be through return values.**

* Use Global Variables $ with a lot of caution, or better, don't use them at all.

## Don't modify arguments

* Your method should not destroy the callers arguments, i.e, should not directly mutate the arguments itself, unless absolutely necessary or it's expected by the caller.

```ruby
def something(arr)
    doubled_arr = []
    arr.length.times do
        doubled_arr << arr.pop * 2
    end
    return doubled_arr
end

arr = [1,2,3]
p arr # [1,2,3]
p something(arr) # [6,4,2]
p arr # []
```

* The above method directly mutates the passed argument arr on a memory level, this was unintended, but the consequences could be severe.

## Side Effects

* In Computer Programming, an operation, method or expression is said to have a side-effect when that method's invocation causes modification of a variable outside the method's local environment.

## Destructuring

* Desctructuring, simply put, is assinging a set of variables, a set of values.

```ruby
arr = [1,2,3,4,5]

def min_max(arr)
    [arr.min,arr.max]
end

min,max = min_max(arr)

p min # 1
p max # 5
```