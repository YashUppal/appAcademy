# Classes

## What are classes and why we use them?
* Classes are the blueprints used to model an object. They contain attributes and methods. Instance of a class is called an object.

```ruby
# class name should begin with a capital letter
class Cat
    # initializer
    def initialize(name, color, age)
        @name = name # attributes
        @color = color
        @age = age
    end
end
```

* We can create an instance of a class using the ```new``` keyword.

```ruby
class Cat
    # initializer
    def initialize(name, color, age)
        @name = name # attributes
        @color = color
        @age = age
    end
end

cat_1 = Cat.new("Tom","grey",4)
p cat_1 # => <Cat:0x000055c95c934a10 @name="Tom", @color="grey", @age=4>
```
* To access an attribute of some value, we can create a getter method, that returns the value of an attribute

```ruby
class Cat
    # initializer
    def initialize(name, color, age)
        @name = name # attributes
        @color = color
        @age = age
    end

    # getter
    def name
        @name
    end

    # getter
    def color
        @color
    end
end

cat_1 = Cat.new("Tom","grey",4)
p cat_1 # => <Cat:0x000055c95c934a10 @name="Tom", @color="grey", @age=4>

cat_1.name # "Tom"
cat_1.color # "grey"
```

* To modify a value of an attribute, we cannot assign it to the getter call. We have to create a setter method.
```ruby
class Cat
    # initializer
    def initialize(name, color, age)
        @name = name # attributes
        @color = color
        @age = age
    end

    # getter
    def name
        @name
    end

    # getter
    def color
        @color
    end

    # setter
    def name=(name)
        @name = name
    end

    # setter
    def color=(color)
        @color = color
    end
end

cat_1 = Cat.new("Tom","grey",2)

cat_1.name # "Tom"
cat_1.color # "grey"

cat_1.name = "Garfield"
cat_1.color = "orange"

cat_1.name # "Garfield"
cat_1.color # "orange"

# parantheses are often optional in ruby
cat_1.name=("Garfield")
# is same as
cat_1.name= "Garfield"
```

* We can also create versatile methods inside our classes
```ruby
class Cat
    # initializer
    def initialize(name, color, age)
        @name = name # attributes
        @color = color
        @age = age
    end

    # getter
    def name
        @name
    end

    # getter
    def color
        @color
    end

    # setter
    def name=(name)
        @name = name
    end

    def purr
        if @name == "Tom"
            return "purrrrrr..."
        elsif @name == "Garfield"
            return "Į̷͗M̵̭͐ ̷͓̒S̴̡̍Ö̶̗́R̴̫͐R̴̬̄Y̶̾͜ ̵̣̃J̴̣́O̷̻͊N̸̖͛"
        end
    end
end

tom = Cat.new("Tom","grey",2)
tom.purr # purrrrrr...

garf = Cat.new("Garfield","orange",10000)
garf.purr # Į̷͗M̵̭͐ ̷͓̒S̴̡̍Ö̶̗́R̴̫͐R̴̬̄Y̶̾͜ ̵̣̃J̴̣́O̷̻͊N̸̖͛
```

## Class methods and Instance methods

### Instance methods

* Instance methods are methods that are called on instances of a class. It is denoted by Class#method

```ruby
class Dog
    def initialized(name, bark)
        @name = name
        @bark = bark
    end

    def name
        @name
    end

    def bark
        @bark
    end

    # instance method
    def greet
        puts "#{@name} says #{bark}"
    end
end

dog_1 = Dog.new("Fido","bhow..")
dog_1.greet # "Fido says bhow.."
```
* Instance method will be denoted as ```Dog#greet```

### Class methods

* Class methods are methods that are called on classes directly. Don't need instances to be called.

```ruby
class Dog
    def initialized(name, bark)
        @name = name
        @bark = bark
    end

    def name
        @name
    end

    def bark
        @bark
    end

    # class method
    def self.growl
        puts "Grrrrrr....."
    end
end

Dog.growl # "Grrrrrr....."

instance_dog = Dog.new("Fido","bhow")
instance_dog.growl # Error 'undefined method growl'
```
* In the above scenario, the class method will be denoted as ```Dog::growl```

## Instance and Class variables

## Instance Variable

* Instance variable is a variable that is part of an instance of a class.
```ruby
class Car
    def initialize(color)
        @color = color
    end

    def color
        @color
    end
end

car_1 = Car.new("red")
p car_1.color # red
```
## Class variables

* Class variable is a variable that is a part of the class (the blueprint itself) and it is shared among all the instances of the class.

```ruby
class Car

    # Class variable
    @@num_wheels = 4

    def initialize(color)
        @color = color
    end

    # Class method
    def self.upgrade
        @@num_wheels = 0
    end

    def color
        @color
    end

    def num_wheels
        @@num_wheels
    end
end

car_1 = Car.new("red")
car_2 = Car.new("silver")

car_1.num_wheels # 4
car_2.num_wheels # 4

Car.upgrade # Class method

car_1.num_wheels # 0
car_2.num_wheels # 0

car_3 = Car.new("black")
car_3.num_wheels # 0

```

## Class Constants

* Class constants are constants of a class, they are like class variables, shared among all instances but cannot be changed.

```ruby
class Car

    # Class variable
    NUM_WHEELS = 4

    def initialize(color)
        @color = color
    end

    def self.upgrade
        NUM_WHEELS = 0 # Error
    end

    def color
        @color
    end

    def num_wheels
        NUM_WHEELS
    end
end

car = Car.new("red")
Car.upgrade
```
**Class constants are shared among all the instances of the class and cannot be re-assigned**

## Creating a Hash with a default value as an array.

* By default, hashes have ```nil``` as the default value. If we want to have a hash with a default value other than nil, we can pass that value to the ```Hash#new``` method

```ruby
grades = {}
grades[:john] = 10

p grades # {:john => 10}
p grades[:john] # 10
p grades[:jane] # nil

grades_default = Hash.new(0) # Pass '0' as default value

p grades_default # {}

grades_default[:john] = 10

p grades_default # {:john => 10}

p grades_default[:john] # 10
p grades_default[:jane] # 0
```

* In order to have a hash, where default value is an empty array, we attempt something like

```ruby
grades = Hash.new([])
```

* But the above code results in a bug.

```ruby
grades = Hash.new([])

grades[:john] # []

grades[:john] << 75
grades[:john] << 80
grades[:john] << 85

p grades[:john] # [75,80,85]

# ??? ¯\_(ツ)_/¯
grades[:jane] # [75,80,85]
# should be []

# grades = Hash.new([]) causes every key to refer to that single array. Hence, the above code is bugged.
```

* To overcome this issue, we can pass a block to ```Hash.new``` that will create a new array each time, as a default value

```ruby
# block takes a variable 'hash' that referes to the hash itself, and a variable 'key' that refers to the key. Upon referencing the corresponding key in the hash, a new array is created (for each distinct key)
grades_improved = Hash.new {|hash, key| hash[key] = Array.new }

p grades_improved[:john] # []

grades_improved[:john] << 75
grades_improved[:john] << 80
grades_improved[:john] << 90

p grades_improved[:john] # [75,80,90]

p grades_improved[:jane] # []

# Nice
```