# Inheritance

## What is Inheritance

* Inheritance is a property by which a class can 'inherit' the code of another class (methods and variables). The **child** class inherits from **parent** class. **parent*** class is also known as **superclass**, **child** class is also known as **subclass**

```ruby
class Godzilla
    def initialize
        @height = 50 
    end

    def attack
        puts "Atomic Ray ======== "
    end

    def jump
        puts "Jumping..."
    end
end

class MechaGodzilla < Godzilla
    def initialize
        @height = 50
    end

    def attack
        puts "Laser Cannon -----------"
    end

    def jump
        puts "Flying..."
    end
end

goji = Godzilla.new
mecha = MechaGodzilla.new

goji.attack # Atomic Ray ======== 
mecha.attack # Laser Cannon -----------

goji.jump # Jumping...
mecha.jump # Flying...
```

* The sub class overwrites the method definition of superclass, and thus the subclass method definition is executed.

* **super** keyword can be used to trigger the superclass definition of a particular method.

```ruby
class MechaGodzilla < Godzilla
    def initialize
        @height = 50
    end

    def attack
        puts "Laser Cannon -----------"
    end

    def jump
       super
    end
end

mecha = MechaGodzilla.new
mecha.jump # Jumping...
```

## Why Inheritance?

* Inheritance allows code reuse and helps in avoiding code duplication.

## Calling a Super Method

* We can call the superclass definition of a method inside of the subclass, using the **super** keyword. There are two ways to use super, implictly passing arguments or explicitly passing them.

* calling ```super``` without any arguments will pass the arguments passed on to method, to the super method

```ruby

class Weapon

    attr_reader :damage

    def initialize(damage=2)
        @damage = damage
    end

    def attack
        puts "attack..-#{self.damage}"
    end
end

class Knife < Weapon
    def initialize(damage)
        super
    end
end

k = Knife.new(10)
k.attack # attacking..-10
```

* Explicitly we can pass arguments like ```super(arg1,arg2)``` and the superclass definition of the method would be called with arguments passed explicitly