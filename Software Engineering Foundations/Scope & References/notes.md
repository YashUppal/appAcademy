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
