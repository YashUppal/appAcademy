# Advanced Ruby Notes

## Common Enumerables

1) all? - returns true when all elements result in true when passed into block
2) any? - returns true when atleast one element result in true
3) none? - returns true when none elements return true when passed into block
4) one? - returns true when exactly one element return true
5) count - returns the count of element that result in true when passed into a block
6) max - return the max element
7) min - return the min element
8) flatten - converts 2D array to 1D array

## Symbols

1) Symbols are like string, only difference being symbols are immutable and dont reference different memory locations.
```
:hello # symbol

"hello" # string

 str = "string" 
    str[0] = "x" # "xtring" 

 sym = :symbol
    sym[0] = "x" # throws error`

 # valid 

 hash_sym = { 
    :name => "John",
    :age => 23,
    :awesome => true
}

 # valid as well`

 hash_sym = {
    name: "John",
    age: 23,
    awesome: true
}
```


Viable use case for symbols are as keys in hashes.
Efficient to lookup, reference and compare.

## Default Arguments and Optional Hashes

1) Methods can have parameters with some default value, in case an argument is not passed, the default value can be used instead.

```
def greet(person="John")
"hi " + person
end

p greet # "hi John"

p greet("Jack") # "hi Jack"
```

2) If a method accepts a hash as an argument, the curly braces can be omitted

```
def hash_accept(key,hash)
    hash[key]
end
 
p hash_accept(:name,{:name => "John", :age => 23}) # John
p hash_accept(:name,:name => "John", :age => 23) # John

```
## Splat Operator

Used to bundle together some values.

In the code snippet below, we try to pass more arguments than the method expects.

```ruby
def some_method(arg)
   p arg
end  

some_method(1,2,3,4)
ArgumentError: wrong number of arguments (given 4, expected 1)
from (pry):10:in `some_method'
```

To get around this, we can use the splat operator in the parameter, so that it can handle multiple arguments

```ruby
def some_method(*arg)
  p arg
end  

some_method(1,2,3,4)
[1, 2, 3, 4]
=> [1, 2, 3, 4]
```

Splat operator is very versatile.

```ruby
def some_method(first_arg,*extras)
 puts "first arg: "+first_arg
 p "extras: " + extras.to_s
end

some_method("John",1,2,3,4)
first arg: John
"extras: [1, 2, 3, 4]"
```


## Inject / Reduce

Used to iterate over array, using an accumulator. Pass a block into inject and accumulator equals the result of block.

```
arr = [1,2,3,4,5]

arr.inject { |acc, el| acc + el } # 15

```
We can pass some initial value to the accumulator. Find sum of all even numbers in array using Inject

```
arr = [1,2,3,4,5]

arr.inject(0) { |acc, el| 
   if el.even?
      acc += el
   else
      acc
   end
} #  => 6

