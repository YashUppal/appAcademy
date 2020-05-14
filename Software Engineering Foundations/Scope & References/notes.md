# Score & References

## Bubble Sort

* Sorting algorithm, not very efficient (probably one of the slowest), but simple and easy to understand. Derives its name from the fact that bigger elemens 'bubble' to the top of list.

    ![](https://upload.wikimedia.org/wikipedia/commons/0/06/Bubble-sort.gif)

## Scope Notes

### Scope
Defines area where a variable will be accessible.

### Lexical Scope
* How a variable evaluates in nested code. If a variable is defined outside the scope of a method, method will not be able to access it. 
* Similarly, if a variable is defined inside the scope of a method, it cannot be accessed outside the method.

```ruby
def hello
    message = "hello world"
    p message
end

hello() # method call, prints "hello world"
p message # Throws Error
```

### Global Scope
* Variables defined in global scope are accessible everywhere in the program

```ruby
variable = "this is a variable"
$global_variable = "variables going global"
```
* Global variables can also be defined inside methods.

```ruby
def some_method
  $global = "Global variables are cool"
  p $global
end

some_method # method call, prints "Global variables are cool"
p $global # prints global variable '$global'
```
### Constants
* Variables which cannot be reassigned. Defined using uppercase name

```ruby
FOOD = "ramen"
FOOD = "rice" # Throws Warning
```
* Constants cannot be reassigned, but can still be mutated.
```ruby
FOOD = "chicken"
FOOD[0] = "X"
p FOOD # "Xhicken"
```

**CONSTANTS exist in global scope**

**Blocks, Conditional and Loops don't have their own scope, They're part of the contating scope.**

## References

* Variables are just named memory locations.
```ruby
var_1 = "cat"
var_2 = var_1

var_1.object_id # 200
var_2.object_id # 200
```
* In the example above, var_2 is pointing to the same memory location that var_1 is pointing to.

```ruby
var_1 ---> [0x200 "cat"] <--- var_2
```

* Modifying one variable will lead to changes in other, since they point to the same memory location.
```ruby
p var_1 # "cat"
p var_2 # "cat"

var_1[0] = "m"

p var_1 # "mat"
p var_2 # "mat"
```

## Array.new()

* Array.new() is a built in method in ruby that let's you create an array of some fixed length and some default value.

```ruby
cool_arr = Array.new(5,"?")

p cool_arr # ["?","?","?","?","?"]
```

* Lets try to create a grid (2D Array) using Array#new

```ruby
grid = Array.new(3,Array.new(3))

p grid # [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]

# weird bug

grid[0][0] = "X"

p grid # [["X", nil, nil], ["X", nil, nil], ["X", nil, nil]]
```
* In the grid, every sub-array's first element is changed to "X" because while creating the grid, we pass 'Array.new(3)' as the default value, under the hood all the three sub arrays are referencing to the same memory location. Changing one leads to changing all, since they're all the same

* To overcome this,

```ruby
# passing in a block results in a new subarray being created

grid = Array.new(3) { Array.new(3) } 

p grid # [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]

grid[0][0] = "X"

p grid # [["X", nil, nil], [nil, nil, nil], [nil, nil, nil]]
```
* Since passing the block results in a new (sub)array getting created, the above code works as intended.

* Variation
```ruby
grid = Array.new(3) # creates an array of length 3

p grid # [nil,nil,nil]

grid.map! do |ele|
    ele = Array.new(3)
end

p grid # [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]

grid[0][0] = "X"

p grid # [["X", nil, nil], [nil, nil, nil], [nil, nil, nil]]

# Very cool

```

## Intro to Testing Notes

### What is TDD?

* TDD stands for test-driven development. Software Development driven by the intention of passing test cases.

    1) Write test cases
    2) Check for test failure
    3) Write code to pass the test
    4) Repeat if more test coverage is needed

* Tests sets up an expectation of some behaviour from your code and and checks that your code meets the expectation.

## Rspec Notes

### What is Rspec?

* Rspec is a testing library, using tu test ruby code. 'spec' is another name for a test. 

* Basic Rspec keywords:
    
    1) **describe** : names the method being tested
    2) **context** : describe the scenario
    3) **it** : expresses the expected behavior of code being tested
    4) **expect** : show how the behaviour is tested

## Exceptions

### What is an exception?

* Exception is an unexpected event or behaviour.

### Exception handling in ruby.

* We ```begin``` running some code and if something goes wrong, we jump to ```rescue``` it.

```ruby
num = 0

begin
    puts "dividing 10 by #{num}"
    ans = 10/num
    puts "ans is #{ans}"
rescue
    puts "there was some problem with the division"
end

puts "finished"
```
Evaluates to 
```ruby
"dividing 10 by 0"
"there was some problem with the division"
```
### Raising exceptions in Ruby

* We can raise exceptions using the ```raise``` keyword.
```ruby
def format_name(first_name, last_name)
    if !(first_name.instance_of?(String) && last_name.instance_of?(String))
        raise "arguments must be string"
    end

    first_name.capitalize + " " + last_name.capitalize
end

p format_name("JoHn","DOE") # John Doe
p format_name(32,true) # RuntimeError (arguments must be string)
```

**Aside: to check the data-type of something, we can used the ```instance_of?()``` method.**

```ruby
name = "John"
name.instance_of?(String) # true
name.instance_of?(Integer) # false
```

* We can combine raising and handling expections

```ruby
def format_name(first_name, last_name)
    if !(first_name.instance_of?(String) && last_name.instance_of?(String))
        raise "arguments must be string"
    end

    first_name.capitalize + " " + last_name.capitalize
end

first_name = 42
last_name = true

begin
    format_name(first_name,last_name) # John Doe
rescue
    puts "there was an exception"
end

```