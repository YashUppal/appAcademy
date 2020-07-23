# Information Hiding / Encapsulation

## Private methods

* We can create private methods in classes, using the ```private``` keyword. Private methods are methods which can be called within the class, they cannot be used by the users of the class.

```ruby
class Aircraft
    def fly
        self.start_engine
        # code for flying...
    end

    private
    def start_engine
        # code to start engine...
    end
end
```

* Every method after the ```private``` keyword will be private, and users will not be able to use them.

* Instance variables are private by default, since they are not methods. In order to access the instance variables, we have to explicitly create getters/setters.

* Private methods are useful for "data-hiding", we might want to abstract away the lower level details for a method, hence we could privatise that method, or maybe for security reasons.
