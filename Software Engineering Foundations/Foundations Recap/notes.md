# Foundations Recap

## Spaceship operator

* Spaceship operator ```<=>``` is used to compare two values. It combines ```>, < , >=, <=```.

```ruby
a <=> b

# returns -1 if a < b 
# returns 0 if a == b
# returns 1 if a > b
```

* Let's see it in action

```ruby
1 <=> 2 # -1
2 <=> 2 #  0
3 <=> 2 #  1
```

## Nil as Falsey

* In Ruby, there are booleans ```true``` and ```false```. But any data in Ruby can be evaluated to either true or false. Data values which can be evaluated to true are called ***truthy*** values, values which can be evaluated to false are called ***falsey*** values.

1) ```false``` and ```nil``` are the only falsey values.
2) Everything else is truthy

```ruby
!!nil # => false
!!false #=> false

!!true # => true
!!42 # => true
!!"somestring" # => true
!![1,2,4] # => true
!!0 # => true
```

## How Logical OR || works

* So far, we believe if one of the sides of || is true, it returns true. If both sides are false, we return false. But. logical OR || has more to it.

* Given two values ```a``` and ```b```, ```a || b``` will:
    1) If a is ***truthy***, return a
    2) If a is ***falsey***, return b

```ruby
true || 42 # true
42 || true # 42
0 || false # 0
false || 0 # 0
nil || "something" # "something"
nil || false # false

# Note || does not return 'true' or 'false' in above scenarios. it returns actual values.
```

## Default arguments

* We can have some default values for the arguments to be passed in the method. We can leverage the fact that nil is falsey, and use that to our advantage.

```ruby
def rest(order = nil)
    if order.nil?
        print "serving water"
    else
        print "serving #{order}"
    end
end

rest # "serving water"
rest("Cake") # "serving Cake"
```

* We can use logical OR to refactor our code.

```ruby
def rest(order = nil)
    order = order || "water"
    print "serving #{order}"
end

rest # serving water
rest("beer") # serving beer
```
* There's more. Let's throw in some syntactic sugar.

```ruby
# a = a || b is same as a ||= b

def rest(order=nil)
    order ||= "water"
    print "serving #{order}"
end

rest # serving water
rest "beer" # serving beer
```
## Default Procs

* The ||= pattern can be utilized for setting up default procs for methods.

```ruby
def def_proc_example(val, &prc)
    prc ||= Proc.new { |data| data.upcase + "!!" }
    prc.call(val)
end

def_proc_example("test") # => "TEST!!"
def_proc_example("test") { |data| data.reverse } # tset
```
## Lazy Initialization

* Lazy initialization is a design-strategy in which an object is created only when it is required.

* Below we have class for a Library

```ruby
class Library
    attr_reader :name, :books

    def initialize(name)
        @name = name
        @books = [ 'Head first Ruby', 'Rails guide', 'Ruby magic', 'How to become a rubyist']
    end
end

lib = Library.new("RubyLib")
lib # #<Library:0x00005589f1dd6230 @name="RubyLib", @books=["Head first Ruby", "Rails guide", "Ruby magic", "How to become a rubyist"]>
```

* Imagine if the ```@books``` attribute was a 10,000 element long array. It's creatiion would have been a very costly operation. We can use the lazy initialization strategy to optimize our code

```ruby
class Library
    attr_reader :name

    def initialize(name)
        @name = name
    end

    def books
        @books = [ 'Head first Ruby', 'Rails guide', 'Ruby magic', 'How to become a rubyist']
    end
end

rubylib = Library.new("RubyLib")
rubylib # => #<Library:0x00005589f1e13a68 @name="RubyLib">

rubylib.books
# => ["Head first Ruby", "Rails guide", "Ruby magic", "How to become a rubyist"]

rubylib # => #<Library:0x00005589f1e13a68 @name="RubyLib", @books=["Head first Ruby", "Rails guide", "Ruby magic", "How to become a rubyist"]>
```
