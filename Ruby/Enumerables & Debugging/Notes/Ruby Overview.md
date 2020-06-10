# Nontechnical Overview of Ruby

# Ruby

Elegant, object-oriented programming language, developed by 'Matz' in Japan, 1995. Ruby is Dynamic, Reflective, Object-oriented and multi-paradigm.

## Dynamic
 * In Dynamic programming languages like Ruby, the compilation-phase and runtime-phase is muddled. Things which usually happen during the compile time in static languages, take place in runtime in dynamic languages.

 * Things like type-constraints, take place in runtime in Ruby (Dynamic language) whereas it takes place in compilation in Java (Static language).

    ```ruby
    def erroneous_addition(x)
    if x > 99999
        print "Luckily I'm a valid statement!"
    else
        print "The Ruby interpreter is about to be a complainy-pants!" + x
    end
    end

    erroneous_addition(Float::INFINITY)
    ```

* Above code works fine in ruby, but the below code does not.

    ```ruby
    erroneous_addition(1) # TypeError...
    ```

* Because, the erroneous else conditions is encountered.

* On the other hand, a similar code in Java, will not even compile because the type-constraints are enforced at compile time.

    ```java
    class StaticallyTypedError {
    // Many statically typed programming languages require the programmer to specify variable types.
    // The first int refers to the type of the return value of the method.
    // The second refers to the type of the x parameter.
        public static int erroneousAddition(int x) {
        if (x > 99999)
        System.out.println("Luckily I'm a valid statement!");
        else
        System.out.println("Java is already angry!" + x);

        return "Java won't even let this method slide uninvoked!";
        }
    };
    ```
## Reflective

* A reflective programming language code has the ability to 'reflect' upon itself and change the code and structure during runtime, thus enabline metaprogramming.

```ruby
# nonreflective
obj = Foo.new
obj.hello

# reflective
class_name = "Foo"
method_name = :hello

# Program can inspect and modify source-code constructions and even convert strings and symbols to references to methods and classnames
obj = Object.const_get(class_name).new
obj.send method_name

# Program can evaluate a string as if it were source code at runtime.
eval "Foo.new.hello"
```

## Object Oriented

* Object oriented programming languages favour objects. As per OOP Every program consists of objects that have some data and methods that work on that data. Objects are instances of classes.

* Classes inherit from other classes in a 'is-a' relationship. Example, A Dog class might inherit from a Pet class. Child (inherited) classes inherit the data and methods from parent class and can overwrite/add/modify them.

* Encapsulation is a principle of object-oriented programming, in which code is bundled together (data and methods), and only the data relevant is exposed (information hiding.)

## Multi Paradigm

* Ruby is multiparadigm, which means other than object oriented, it supports Procedural And Functional programming paradigms.


# Philosophy

* Ruby is designed for programmer productivity and happiness.

# Vocabulary

## TDD - Test Driven Development

* Test Driven Development is a software-development strategy in which the workflow looks like:

    1) Write test cases
    2) Run tests and make sure the tests fail
    3) Write code
    4) Make test cases pass
    5) Refactor the code.

## BDD - Behaviour Driven Development

* Behaviour Driven Development (BDD) is an extension of TDD, in which software-development is driven by user-stories, users' account of how they interact and use a particular feature, then designing that feature accordingly.

## Unit Testing

* Unit testing is testing a smallest constituent of a program first. Mock objects can be used to test the 'unit' if code requires data.

## Integration Testing

* Integrating different parts of code to make sure they work together nicely.

## Test Coverage

* How thoroughly a program is tested. Could be measured by the amount of functions or statements tested.


