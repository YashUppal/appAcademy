# Scope

## What is Scope?

* In computer programming, scope refers to the 'visibility' of a named entity, like a variable, in a certain area of the source code.

* Outer Scope -> Scope outside a block
* Inner Scope -> Scope of a block (inside)

**General rule is that a variable defined in the outer scope will be usable in the inner scope, but not vice-versa**

```ruby
# Correct code
x = 4

4.times do
    x += 1
end

p x # 8
```

```ruby
# Incorrect code
def meth
    x = 4
end

p x # Error
```

## If/While Statements

* If/While blocks are different from other blocks in Ruby, they're still treated as a part of the outer scope. Variables defined inside if/while blocks will be usable outside the blocks. The below code snippets work just fine in Ruby.

```ruby
if true
  x = 2
end

p x # 2
```

Or

```ruby
while true
  x = 4
  break
end

p x # 4
```

## Scope Gates

* In Ruby, a method, class or a module, have their own scopes. They open up what is called a 'scope gate'. We lose access to previously defined local variables and create a new context, with access to variables inside the method/class/module and parameters.

```ruby
x = 4

def print_that
  puts x
end

print_that # Error: Undefined variable x
```

* To make the above code work, we need to refactor it to accept a parameter.

```ruby
x = 4

def print_that(num)
  puts num
end

print_that(x) # 4
```

## Methods calling other methods

* In Ruby, we can call methods defined in the top level scope, inside methods defined in the top level scope. The reason being that the methods get defined on an object call ```main```. The same reason, why we can call instance methods inside other instance methods in a class.

```ruby
def fourth_power(i)
    square(i) * square(i)
end

def square(num)
    num * num
end

p fourth_power(2) # => 16
```

## Global variables

* Variables which can be accessed anywhere in the source code. Can be defined using ```$``` prefix. Not a good idea usually, use with caution!