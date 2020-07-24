# Modules

## What are modules

* Modules are like classes, but they are not instantiated. They are commonly used to pack methods together, that might be used by multiple classes, to keep our code DRY.

```ruby
module Greet
    def hello
        puts " hello from #{self.name}"
    end

    def good_morning
        puts "good morning from #{self.name}"
    end
end

class Human
    include Greet

    attr_reader :name

    def initialize
        @name = "Dan"
    end
end

class Robot
    include Greet
    
    attr_reader :name

    def initialize
        @name = "T400"
    end
end

h = Human.new
r = Robot.new

h.hello #  hello from Dan
r.hello # hello from T400
```

## include vs extend

* We can create instance methods from modules using ```include```. We can also create class methods from module using ```extend```

```ruby
module Fly
    def aviate
        puts "3..2..1..takeoff"
    end
end

class Aircraft
    extend Fly
    def initialize(model)
        @model = model
    end
end

Aircraft.aviate # "3..2..1..takeoff"
```

## Multiple Inheritance vs Mixin

* Ruby does not support multiple inheritance ( one class inheriting from mulitple parent classes ). Instead, we can use module mix ins. We can write some code and pack it into a module and then ```include``` that module in multiple classes.

```ruby
module Weapon
    def fire
        puts "#{self.name} goes RATATATATATA..."
    end
end

class AssaultRifle
    include Weapon
    attr_reader :name
    def initialize(name)
        @name = name
    end
end

class MachineGun
    include Weapon
    attr_reader :name
    def initialize(name)
        @name = name
    end
end

ak = AssaultRifle.new("ak47")
m249 = MachineGun.new("m249")

ak.fire # ak47 goes RATATATATATA...
m249.fire # m249 goes RATATATATATA...
```
# Namespace

* Suppose we have two files, A.rb and B.rb, both having a method ```some_method```. If we were to require both files and call ```some_method```, it would result in confusion due to name conflicts and will be a bad idea overall. To circumvent this, we can use modules

```ruby
# A.rb

module A
    def some_method
        # does something cool
    end
end

# B.rb
module B
    def some_method
        # does something cooler
    end
end
```

* Here is our code file, where we require both A.rb and B.rb

```ruby
require_relative 'A.rb'
require_relative 'B.rb'

cool_stuff = A.some_method
cooler_stuff = B.some_method

# No naming conflicts, every module has a different definition of the method
```