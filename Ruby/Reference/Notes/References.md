# References

## Variables

* In Ruby, variables are pointers to memory locations. Using ```=``` we can make a variable point to a location in memory, where some data is stored.

```ruby
x = 5

-----------------
|  | 5 |  |  |  |
-----------------
     ↑
     x
```

* If we assign a variable to another variable, using ```=```, we are merely making that new variable point to the same memory location that the earlier variable was pointing to

```ruby
x = 5
y = x

-----------------
|  | 5 |  |  |  |
-----------------
    ⤴ ↖
   x    y 
```

* If we were to make some changes to ```x``` using ```=``` , the ```x``` will be pointing to another memory location.


```ruby
x = 5
y = x

-----------------
|  | 5 |  |  |  |
-----------------
    ⤴ ↖
   x    y 

x = 10

-------------------
| 10 | 5 |  |  |  |
--------------------
   ↑   ↑
   x   y 
```

## = Operator

* The ```=``` operator will merely re-assign the 'variable' to point to a different memory location.
It does not mutate (modify) the object, it merely re-assigns the variable to point to (refer) another object.

```ruby
x = 10
x.object_id # => 21

x = 100
x.object_id # => 201

x = 443341
x.object_id # => 886683
```


## Immutable and Mutable Objects

* In Ruby, Immutable objects are objects that cannot be mutated. On the other hand, mutable objects are objects that can be mutated.

* Immutable objects in Ruby are Integers, Mutable objects are things like strings, arrays etc. There are no operators to mutate Integers (Fixnum)

```ruby
x = 'john'
y = x

p x # 'john'
p y # 'john'

x << 'doe'

p x # 'johndoe'
p y # 'johndoe'
```

## Mutating Strings

```ruby
x = "Donatello"
y = x

x << " the TMNT"

p x # "Donatello the TMNT"
p y # "Donatello the TMNT"
```

## Declaring an Array, with Empty Array as default value

```ruby
h = Array.new(3,[]) # seems fair

p h # [[],[],[]]

h[0] << "hello"

p h # [["hello"],["hello"],["hello"]]

# Under the hood, all the three 'empty arrays' are pointing to a single instance of array. To overcome this bug, we can pass in a block, that creates a new instance of array for each distinct element.

h = Array.new(3) { [] }

p h # [[],[],[]]

h[0] << "hello"

p h #[["hello"],[],[]]
```
## Syntactic Sugar

* Syntactic sugar is a shortcut, or a way of writing code that makes it more readable and elegant. Examples of syntactic sugar

```ruby
hash = {}
hash[:key] = "value"
# is same as
hash.[]=(:key,"value")

a != b # !(a==b)
a += b # a = a + b
```

## OR || Trick

* OR (||) works in Ruby as follows

```ruby
a || b

# 1) If a is truthy, return a
# 2) If a is falsy, return b
```

* In Ruby, everything other than ```nil``` and ```false``` is a truthy value