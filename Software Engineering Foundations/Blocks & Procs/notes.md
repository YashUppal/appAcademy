# Blocks & Procs
One of the main features of Ruby.

## Blocks
* Blocks are chunks of code, passed into methods to be executed.
* Are somewhat similar to methods, difference being blocks don't need a return statment.

## Using methods as blocks

We can use methods in blocks

```ruby
["a","b","c"].map { |ele| ele.upcase } # ["A","B","C"]
```

Ruby provides an efficient way to achieve the same effect, pass a method as a block.

```ruby
["a","b","c"].map { |ele| ele.upcase } # ["A","B","C"]
["a","b","c"].map(&:upcase) # ["A","B","C"]
```

**Explanation:** ```:upcase``` is a symbol reffering to the String#upcase method. ```&``` is used to convert the 'method' into an object that can be passed to map. Since we cannot directly pass a method into a method in Ruby, we package it as an object usin ```&```.

## Procs
* A proc is an object that contains a block.
* Procs allow us to save code in variables, so that we can use them later.

## Creating a Proc

Think of a proc as a wrapper.
```ruby
doubler = Proc.new { |num| num * 2 }
```

We have to wrap the block to save it into a variable.
```ruby
doubler = {|num| num * 2 } # Incorrect
```

## Calling a Proc

```ruby
doubler = Proc.new { |num| num * 2 }
p doubler.call(2) # => 4
p doubler.call(7) # => 14
```

## Passing Proc to method

```ruby
def method(num1,num2,proc)
    sum = num1 + num2
    p proc.call(sum)
end

doubler = Proc.new {|num| num * 2}
method(1,2,doubler) # => 6

square = Proc.new {|num| num * num }
method(2,3,square) # => 25

```

## Using & to wrap

* ```&``` can be used to wrap a block and turn it into a proc, or unwrap a proc and turn it into a block

```ruby
# passing a block to a method, using '&'
def method(num1, num2, &prc)
    sum = num1 + num2
    prc.call(sum)
end

p method(2,3) { |num| num * 2 } # => 10

# passing a proc and turning it into a block using '&'
def method_2(num1, num2, &prc)
    sum = num1 + num2
    prc.call(sum)
end

doubler = Proc.new { |num| num * 2}
p method_2(2,4,&doubler) # => 12
```

* Occurence of an '&' in the code most certainly points to the process of either wrapping or unwrapping ( & does look like a knot though )

```ruby
def some_method(num1, num2, &proc) # 3. wrapping the block to a proc again
    sum = num1 + num2
    proc.call(sum) # 4. so that it can be used here
end

doubler = Proc.new { |num| num * 2 } # 1.wrapping a block to a proc
p some_method(2,4,&doubler) # 2.un-wrapping a proc to a block

# => 12
```

**To Summarise, in Ruby, a method cannot accept a block of code as an argument, unless it is wrapped in a Proc. A Proc can be passed to a method. To wrap a block into a proc or to unwrap a proc to get a block, use '&'**