# Class Monkey Patching

## What is 'self' ?

* Self is a way to refer to the instance of a class on which a method is being called.

```ruby
class Test
  def initialize(test)
    @test = test
  end  
  def refer
    p "self is #{self}"
  end  
end  
=> :refer
new = Test.new("asdf")
=> #<Test:0x000055d7aa6f31a0 @test="asdf">
new
=> #<Test:0x000055d7aa6f31a0 @test="asdf">
new.refer
"self is #<Test:0x000055d7aa6f31a0>"
=> "self is #<Test:0x000055d7aa6f31a0>"
```
## What is monkey patching?

* Adding additional methods to existing class is called monkey patching.

```ruby
class String
    def is_upcase?
        self == self.upcase
    end
end

"hello".is_upcase? # false
"HELLO".is_upcase? # true
```