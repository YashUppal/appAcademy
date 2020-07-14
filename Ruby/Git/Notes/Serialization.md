# Serialization

## What is Serialization?

* Serialization is the process of converting Ruby objects to a form that can be saved somewhere or sent over a network.

## JSON

* JSON stands for **JavaScript Object Notation** and is a popular format for serialization. We can convert Ruby objects like hashs to json

```ruby
require 'json'
{"a"=>"always",
 "b"=>"be",
 "c"=>"closing"
}.to_json

JSON.parse({"a"=>"always","b"=>"be","c"=>"closing"})
```

* Problem is, we cannot serialize more complex objects in Ruby using JSON

```ruby
Cat.new("Whisker",8,"blue").to_json
=> '"#<Cat:0x007fb87c81b398>"'
```

## YAML

* YAML stands for **YAML Ain't a Markup Language**, and is used to serialize and deserialize Ruby Objects

```ruby
require 'yaml'

# Serialize
c = Cat.new("Whisker",8,"blue")

puts c.to_yaml 

# --- !ruby/object:Cat
# name: Breakfast
# age: 8
# city: San Francisco
# => nil

# Deserialize
serialized_cat = c.to_yaml
YAML::load(serialized_cat)
=> #<Cat:0x007ff4348098e8 @age=8, @city="San Francisco", @name="Breakfast">
```