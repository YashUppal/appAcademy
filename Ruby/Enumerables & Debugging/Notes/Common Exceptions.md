# Common Exceptions

## Name Error

* Occurs when we try to access a variable that doesn't exist yet.

```ruby
    print doesnt_exists # NameError
```

## Unitialized Constant

* Occurs when we try to access a class or a constant that is not defined yet. Since Classes and Constants start with a capital letter, exception is thrown referring to a constant or class.

```ruby
print Doesnt_Exists # NameError..Unitialized Constant
```

## NoMethodError

* Occurs when we try to access a method that doesn't exists.

```ruby
"Some String".my_fantasy_method # NoMethodError
```

## ArgumentError

* Occurs when we try to pass wrong number of arguments to a method.
A method expects 1 argument and we pass 2 argumens

```ruby
def meth(arg)
    puts "hello " + arg
end

meth(1,2,3,4) # ArgumentError
```

## TypeError

* Occurs when we try to pass wrong types of things to method, or try to work agains type-constraints. Example 1 + "" throws TypeError, since Strings and Integers cannot be coerced.

```ruby
"" + 2 # TypeError
```

## LoadError

* Occurs when we try to load a file that doesn't exist, or require a gem that isn't installed, or the path provided is incorrect, since ```require``` needs a relative path

```ruby
require 'file.rb' # Wrong
require './file.rb' 
require './path/to/the/file.rb'
```

## SyntaxError 

* Occurs when there is a 'grammatical' error in our code, maybe a typo or something which the interpreter cannot understand. Error is limited to the synatic realm of our code.

```ruby
def meth
    puts "hello"
end
end # SyntaxError
```