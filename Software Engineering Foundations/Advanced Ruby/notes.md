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
    

