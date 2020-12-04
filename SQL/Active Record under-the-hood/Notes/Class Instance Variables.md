# Class Instance Variables

## Class Instance Variables

* Since classes are objects too, we can store instance variables in ```Class``` objects, thus making them ```Class Instance Variables```.

```ruby
class Dog
    
    def self.all
        @dogs || @dogs = []
    end

    # elaborate
    # def self.all
    #     if @dogs.nil?
    #         @dogs = []
    #     else
    #         return @dogs
    #     end
    # end

    def initialize(name)
        @name = name
        self.class.all << self # push self into the @dogs class instance variable
    end
end

rocky = Dog.new("Rocky")
# => #<Dog:0x0000564eab8f5188 @name="Rocky">

tommy = Dog.new("Tommy")
# => #<Dog:0x0000564eab7234e0 @name="Tommy">

Dog.all
# => [#<Dog:0x0000564eab8f5188 @name="Rocky">,
 #<Dog:0x0000564eab7234e0 @name="Tommy">]


rocky.class.instance_variables # => [:@dogs]
```

* This is nothing special or new. It is simply and ***instance variable*** on a class. 

## Inheritance: @@

* If we were to write a subclass that inherits from ```Dog```, and assume that the objects of the subclass will be tracked in the ```@dogs``` class instance variable for ```Dog```, then we are mistaken. Example -

```ruby
class Corgi < Dog
    def initialize(name)
        super
    end
end

kiki = Corgi.new("Kiki")

# No Kiki here
Dog.all
# => [#<Dog:0x0000564eab8f5188 @name="Rocky">,
 #<Dog:0x0000564eab7234e0 @name="Tommy">]

# Kiki's here
Corgi.all
# => [#<Corgi:0x0000564eac2f6740 @name="Kiki">]
```

* The above happens, because afterall, ***classes are objects too***, and ```Corgi``` is an ***object***, just like ```Dog```, and they both have their own sets of ***class instance variables***. ```@dogs``` will not be shared among superclasses and subclasses.

* We can work around it by using a **class variable**, ```@@dogs```, which are shared among subclasses and superclasses.

```ruby
class Dog
    def self.all
        @@dogs ||= []
    end

    def initialize(name)
        @name = name
        self.class.all << self
    end
end

class Corgi < Dog
    def initialize(name)
        super
    end
end

Dog.all
# => []
Corgi.all
# => []
kiki = Corgi.new("Kiki")
# => #<Corgi:0x00005566f0e3d648 @name="Kiki">
Dog.all
# => [#<Corgi:0x00005566f0e3d648 @name="Kiki">]
Corgi.all
# => [#<Corgi:0x00005566f0e3d648 @name="Kiki">]
```

## Global Variables

* Global Variables are defined as ```$variable_name``` and they are have global scope. They're accessible in any class/method. Generally, It is advisable to avoid using global variables as they don't have any real utility and don't usually fit well into object oriented paradigm.

```ruby
# Example of Global Variables
# $stdin and $stdout

# can be used to detect if a used is running the code in a console or logging output to a file.

if $stdout.isatty
    puts 'I am on a console!'
else
    puts 'I am on a file!'
end
```