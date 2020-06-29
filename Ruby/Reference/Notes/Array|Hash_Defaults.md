# Array / Hash Defaults

## Array within Array

* If we want to create an array, that has arrays as it's default values, what we could do is

```ruby
arr = Array.new(3,[])
p arr # [[],[],[]]
```

* But there is a small bug

```ruby
arr = Array.new(3,[])
p arr # [[],[],[]]
arr[0] << "abcd"
p arr # [["abcd"],["abcd"],["abcd"]]
```

* The reason for this happening is because while creating the ```arr```, we are passing the same reference to an empty array ```[]``` three times, instead of creating three empty arrays. To fix this, what we could do is pass a block.

```ruby
arr = Array.new(3) { Array.new }
p arr # [[],[],[]]
arr[0] << "abcd"
p arr #[["abcd"],[],[]]
```

## Mutable vs Immutable

* Above, we have seen that arrays store references to objects. If all the elements are referencing a single object, mutating a single reference will cause the mutation to be reflected in all references.

```ruby
arr2 = Array.new(3,1)
# create an array arr2 with three 'ones'

p arr2 # [1,1,1]

arr2[0] += 1

p arr2 # [2,1,1]
```

* In the above code, the mutation was not reflected in other indices of the array. To understand this, we need to break it down.

```ruby
arr2[0] += 1
# is same as 
arr2[0] = arr2[0] + 1
```

0) Evaluate ```arr2[0]```, which results in ```1```
1) Add ```1``` to it. This leads to creation of a new ```Integer``` object ```2```
2) ```=``` makes the index 0 of the ```arr2``` point to this new object ```2```

* Under the hood, we never mutate an object. We create a new one and reset the pointer for the first index. Thus, there is no mutation, so no reflection of the said mutation

* ```Integer/Float``` Objects are immutable. ```nil``` is another example of immutable objects.

* Story would've been different however, if we were working with a mutable object, like string.

```ruby
arr3 = Array.new(3,"hello")
p arr3 # ["hello","hello","hello"]

arr3[0] << "world"
p arr3 # ["helloworld","helloworld","helloworld"]
```

## Default values for Hash

* We can set up a default value for a hash, by passing a block with two block parameters. Each for a key and a value.

```ruby
hash = Hash.new { |key,value| key[value] = Array.new }

hash[:key1] << "hello"
hash[:key1] << "world"
hash[:key2]

p hash # {:key1 => ["hello","world"], :key2 => []}
```