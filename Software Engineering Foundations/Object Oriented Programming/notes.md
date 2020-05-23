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

 ## Syntactic Sugar

 * Syntactic Sugar is code or shortcut in code that makes our code more elegant and readable.

 Let's take a look at an example of syntactic sugar in terms of classes.

 ```ruby
class Person
  def initialize(first_name, last_name, age)
    @first_name = first_name
    @last_name = last_name
    @age = age
  end

  def first_name
    @first_name
  end

  def last_name
    @last_name
  end

  def age
    @age
  end
end
 ```

 * In the above class, we have to write the getters for the attributes of the class. If we were to add setters as well, It would make our code more crowded and less elegant. Let's add some 'Syntactic Sugar'

 ```ruby
class Person
  attr_reader :first_name, :last_name, :age # syntactic sugar

  def initialize(first_name, last_name, age)
    @first_name = first_name
    @last_name = last_name
    @age = age
  end
end
 ```

* This is much more elegant and readable.

* Now let's try to define a class ```Person``` having instance method ```Person#==``` that will compare two ```Person``` instances on the basis of last name.

```ruby
class Person
  attr_reader :first_name, :last_name, :age

  def initialize(first_name, last_name, age)
    @first_name = first_name
    @last_name = last_name
    @age = age
  end

  def ==(other_person)
    self.last_name == other_person.last_name
  end
end

p1 = Person.new("John","Doe",30)
p2 = Person.new("Jane","Doe",26)
p3 = Person.new("Cafafsazv", "Zxtyuizxe", 56)

# without syntactic sugar
p1.==(p2) # true
p2.==(p3) # false

# with syntactic sugar
p1 == p2 # true
p2 == p3 # false
```

* Let's try to define another method ```[]```, that is used to index to a position. Implementing a Queue class.

```ruby
class Queue
# queue - first in, first out
  def initialize
    @line = []
  end

  def add(ele)
    @line.push(ele) # add to the back
  end

  def remove
    @line.shift # remove from the front
  end

  def [](position)
    @line[position]
  end
end

q = Queue.new

q.add("John")
q.add("Jane")
q.add("Mario")

q # => #<Thread::Queue:0x000055ef59cf2530 @line=["John", "Jane", "Mario"]>

q.remove # "John"

q # => #<Thread::Queue:0x000055ef59cf2530 @line=["Jane", "Mario"]>

# without syntactic sugar
q.[](0) # "Jane"
q.[](1) # "Mario"

# with syntactic sugar
q[0] # "Jane"
q[1] # "Mario"
```

* We can also implement a ```Queue#[]=``` method to set a value at a specific index.


```ruby
class Queue
# queue - first in, first out
  def initialize
    @line = []
  end

  def add(ele)
    @line.push(ele) # add to the back
  end

  def remove
    @line.shift # remove from the front
  end

  def [](position)
    @line[position]
  end

  def []=(position, value)
    @line[position] = value
  end
end

q = Queue.new

q.add("John")
q.add("Jane")
q.add("Mario")

# without syntactic sugar
q.[]=(0, "Jack")
q.[]=(1, "Luigi")
q # => #<Thread::Queue:0x000055ef59c6c430 @line=["Jack", "Luigi", "Mario"]>

# with syntactic sugar
q[0] = "X"
q[1] = "Y"
q # => #<Thread::Queue:0x000055ef59c6c430 @line=["X", "Y", "Mario"]>
```
* Using syntactic sugar makes our code much more expressive. We have been doing this with arrays.

```ruby
# with syntactic sugar
arr = [1,2,3,4,5]
p arr # [1,2,3,4,5]
arr[0] # 1
arr[1] # 2
arr[0] = 99
p arr #[99,2,3,4,5]

# without synactic sugar
arr = [1,2,3,4,5]
p arr #[1,2,3,4,5]
arr.[](0) # 1
arr.[](1) # 2
arr.[]=(0,99)
p arr # [99,2,3,4,5]
```