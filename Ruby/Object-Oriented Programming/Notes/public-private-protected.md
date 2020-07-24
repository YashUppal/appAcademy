# Public/Private/Protected

## Public

* ```public``` is the default access specifier. methods defined as public can be accessed by anyone. We need not explicitly define a method as public. Initialise method is not public.

## Private

* ```private``` methods are methods which can only be accessed within the class. They cannot have an explicit receiver, not even self.

## Protected

* ```protected``` methods are methods which can only be accessed within the class and subclasses. Basically, access is kept within the family.

```ruby
class Human
    def initialize(name)
        @name = name
    end

    private
    def thoughts
        # thoughts are stored and processed here
    end

    protected
    def wealth
        # money and wealth stored here, might be inherited
    end
end
```

Note : Access Specifier are not for security, instead they are mostly used for creating and defining public interfaces for a class.