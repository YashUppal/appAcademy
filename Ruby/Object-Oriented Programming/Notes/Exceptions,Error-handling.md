# Exceptions, error handling

## Exception Handling

* In Ruby, Exceptions can be raised using the ```raise``` keyword.

```ruby
def sqrt(num)
    if num < 0
        raise ArgumentError.new "No negative numbers"
    end

    Math.sqrt(num)
end
```

* In Ruby, Exceptions can be handled (caught) using the ```begin-rescue-end``` block

```ruby
def do_something
    begin
        n = gets.chomp.to_i
        sqrt(n)
    # exception handling
    rescue ArgumentError => e
        puts "An exception occured, message : #{e.message}"
    end
end
```

* In the above scenario, the rescue block has caugh an ```ArgumentError``` in a variable ```e```

## Ensure

* ```ensure``` block is used to run some code, regardless and expection is found or not. Closing files is a very common example

```ruby
def some_file_operation
    begin
        f = File.open
        f << some_operations
    rescue StandardError => e
        puts "Exception :("
    ensure
    # make sure file is closed regardless
        f.close
    end
end
```

## Retry

* ```retry``` keyword will run the code again, starting from the ```begin``` block

```ruby
def something
    begin
        # do something
    rescue
        # rescued exception
        retry
    end
end
```

## Implicit Begin Blocks

* Method and Class definitions have implicit exception handling blocks, so only the retry and rescue statements are explicitly required

```ruby
def some_method
    # some operation
rescue ArgumentError => e
    retry
    nil
end
```