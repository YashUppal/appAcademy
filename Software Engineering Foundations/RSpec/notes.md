# RSpec

## Intro to Testing Notes

### What is TDD?

* TDD stands for test-driven development. Software Development driven by the intention of passing test cases.

    1) Write test cases
    2) Check for test failure
    3) Write code to pass the test
    4) Repeat if more test coverage is needed

* Tests sets up an expectation of some behaviour from your code and and checks that your code meets the expectation.

## Rspec Notes

### What is Rspec?

* Rspec is a testing library, using tu test ruby code. 'spec' is another name for a test. 

* Basic Rspec keywords:
    
    1) **describe** : names the method being tested
    2) **context** : describe the scenario
    3) **it** : expresses the expected behavior of code being tested
    4) **expect** : show how the behaviour is tested

## Exceptions

### What is an exception?

* Exception is an unexpected event or behaviour.

### Exception handling in ruby.

* We ```begin``` running some code and if something goes wrong, we jump to ```rescue``` it.

```ruby
num = 0

begin
    puts "dividing 10 by #{num}"
    ans = 10/num
    puts "ans is #{ans}"
rescue
    puts "there was some problem with the division"
end

puts "finished"
```
Evaluates to 
```ruby
"dividing 10 by 0"
"there was some problem with the division"
```
### Raising exceptions in Ruby

* We can raise exceptions using the ```raise``` keyword.
```ruby
def format_name(first_name, last_name)
    if !(first_name.instance_of?(String) && last_name.instance_of?(String))
        raise "arguments must be string"
    end

    first_name.capitalize + " " + last_name.capitalize
end

p format_name("JoHn","DOE") # John Doe
p format_name(32,true) # RuntimeError (arguments must be string)
```

**Aside: to check the data-type of something, we can used the ```instance_of?()``` method.**

```ruby
name = "John"
name.instance_of?(String) # true
name.instance_of?(Integer) # false
```

* We can combine raising and handling expections

```ruby
def format_name(first_name, last_name)
    if !(first_name.instance_of?(String) && last_name.instance_of?(String))
        raise "arguments must be string"
    end

    first_name.capitalize + " " + last_name.capitalize
end

first_name = 42
last_name = true

begin
    format_name(first_name,last_name) # John Doe
rescue
    puts "there was an exception"
end

```

```begin...rescue``` **is how we handle any exception, ```raise``` is how we create an exception**

