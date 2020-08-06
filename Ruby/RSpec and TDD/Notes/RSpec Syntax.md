# RSpec

## Basic RSpec Test Case

* We can use ```describe``` and ```it``` blocks to setup the structure of the testcases. We then use ```expect``` to perform the tests.

```ruby
describe "#something" do
    it "is equal to something, when something" do
        expect(something).to eq("something")
    end
end
```

## before

* We can use the ```before``` block to run some code before the tests are performed. ```before``` can be used in two ways, ```before(:each)``` and ```before(:all)```. ```before(:each)``` will run the code within before block before each of the spec and will not share the state across the specs. ```before(:all)``` will share the state across the specs and the code will be run once only.

## Matching

* Matching is performed using ```to eq``` and ```to_not eq``` instead of ```==``` and ```!=```


