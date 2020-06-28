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