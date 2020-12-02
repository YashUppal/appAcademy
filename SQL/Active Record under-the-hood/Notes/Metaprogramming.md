# Metaprogramming

## send

* ```send``` is a method that takes in a symbol as method name, and calls that method on the object.

```ruby
[].send(:count) # => 0
['a','b','c'].send(:length) # => 3
```

## define_method

* ```define_method``` is a method that can be used to create a macro. A macro is a method that defines more methods.

```ruby
class Dog
    def self.make_methods(method_name)
        # macro. adds a new method with name `method_name` that does the thing in the block when that method is called
        define_method(method_name) { puts "#{method_name}" }
    end

    make_methods(:woof)
    make_methods(:bark)
    make_methods(:growl)
    make_methods(:jump)
end

dog = Dog.new
dog.woof # woof
dog.bark # bark
dog.growl # growl
dog.jump # jump
dog.haha # NoMethodError: undefined method 'haha' for #<Dog:0x0000564eac18fcf8>

```

## method_missing

* When we call a method on an object, Ruby searches for the method in the object. If the method is missing, the name of the method is passed as a symbol to ```method_missing``` along with the arguments. Normally, ```method_missing``` raises and exception, but we can overwrite the default behaviour.

```ruby
class Cat
    def method_missing(*args)
        p args
    end
end

c = Cat.new
c.asdfsafas("asfas","asdfas") # => [:asdfsafas, "asfas", "asdfas"]
```

* This is very powerfull. ```method_missing``` gives us infinite expressibility. We can do things like:

```ruby
class Dragon
    def do(something)
        puts "Dragon is #{something}ing"
    end

    def method_missing(method_name)
        method_name = method_name.to_s
        self.do(method_name)
    end
end

zork = Dragon.new
zork.do("roar") # => Dragon is roaring
zork.do("fly") # => Dragon is flying

# even though Dragon#cry doesn't exist.
zork.cry # => Dragon is crying
```

