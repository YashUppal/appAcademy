# Input/Output 

## Requiring Files

Lets try to create a class PetHotel that can check-in cats.

```ruby
class PetHotel
    def initialize(name)
        @name = name
        @guests = []
    end

    def checkin(guest)
        @guests << guest
    end
end

class Cat
    def initialize(name)
        @name = name
    end
end

hotel = PetHotel.new("Animal Inn!")
# => #<PetHotel:0x000055f77604bf28 @guests=[], @name="Animal Inn!">
cat_1 = Cat.new("Garfield")
# => #<Cat:0x000055f776072510 @name="Garfield">
hotel.checkin(cat)
# => [#<Cat:0x000055f776072510 @name="Garfield">]
p hotel
# => #<PetHotel:0x000055f77604bf28
#  @guests=[#<Cat:0x000055f776072510 @name="Garfield">],
#  @name="Animal Inn!">
```

* Above code seems fine, but what if our classes were more complex? Or we would like our hotel to house more animals?

* What we can do is separate our code into separate files. This is called ***Separation of Concerns***.

```ruby
# root_folder
#  - pethotel.rb
#  - cat.rb
#  - other_animals
#    - dog.rb
```

```ruby
# pethotel.rb

class PetHotel
    def initialize(name)
        @name = name
        @guests = []
    end

    def checkin(guest)
        @guests << guest
    end
end
```

```ruby
class Cat
    def initialize(name)
        @name = name
    end
end
```

```ruby
class Dog
    def initialize(name)
        @name = name
    end
end
```

* In order to connect the above files, we can ```'require-relative'``` them.

```ruby
# pethotel.rb

require_relative "./cat.rb"
require_relative "./other_animals/dog.rb"

class PetHotel
    def initialize(name)
        @name = name
        @guests = []
    end

    def checkin(guest)
        @guests << guest
    end
end

hotel = PetHotel.new("Animal Inn!")
animal_1 = Cat.new("Garfield")
animal_2 = Dog.new("Snoopy")

hotel.checkin(animal_1)
hotel.checkin(animal_2)
```

## require_relative

* ```require_relative``` is used to provide a relative path to a ruby file.

## User Input

* To take input from the user, we can use ```gets``` keyword.

```ruby
p "enter your name"
name = gets # asdf
print "hello " + name # "hello asdf"
```

* The problem with ```gets``` is that it takes string as an agrument, and appends a newline character (\n) at the end of every input.

```ruby
p "enter your name"
name = gets # John
print "hello " + name + "..."
# => "hello John"
# => "..."
p name # "John\n"
```

* To get rid of the newline (\n) characters at the end of string, we can use the ```chomp``` method.

```ruby
name = gets # John
p name # "John\n"
p name.chomp # "John"

"something\n".chomp  # => "something"
```

* Another caveat is that, ```gets``` accepts user input as strings. If we try to enter numbers, they will be taken as Strings, not numbers.

```ruby
num = gets # 12

p num.instance_of?(Integer) # false
p num.instance_of?(String) # true
```

* To convert string to integer, we can use the ruby method ```to_i```

```ruby
num = gets # 12

p num.instance_of?(Integer) # false
p num.instance_of?(String) # true

num = num.to_i

p num.instance_of?(Integer) # true
p num.instance_of?(String) # false

```