# Object Oriented Programming

## Abstraction

* Abstraction is the process of exposing only essential details to the user and abstracting away the complex login. An example would be, a driver might not know the complex mechanism behind a steering wheel, but he can still use the steering wheel to drive a car. The logic is abstracted from the driver and only the feature (steering wheel) meaningful to the user is exposed.

## Encapsulation

* Encapsulation is the process of binding together data and methods. Avoiding giving direct access to some data to the user, in order to enforce security and/or prevent misuse of the data. Example - In classes, we would define getters and setters for data we think is safe to expose to user.

## Attr Methods

### attr_reader

 * ```attr_reader``` is method that is used to define getters for attributes in a class.

 ```ruby
class Dog
  attr_reader :name, :age # creates #name and #age getters
    def initialize(name, age)
        @name = name
        @age = age
    end
 end
 ```

 * ```attr_writer``` is a method that is used to create setters for attributes in a class.

 ```ruby
class Dog
  attr_writer :name, :age # creates #name= and #age= setters
    def initialize(name, age)
        @name = name
        @age = age
  end
 end
 ```

 * ```attr_accessor``` is a method that is combination of ```attr_reader``` and ```attr_writer```.

 ```ruby
 class Dog
  attr_accessor :name, :age # creates #name and #age getters and #name= and #age= setters
    def initialize(name, age)
        @name = name
        @age = age
  end
 end
 ```