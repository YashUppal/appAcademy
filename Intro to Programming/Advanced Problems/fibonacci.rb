# The fibonacci sequence is a sequence of numbers whose first and second elements are 1. To generate further elements of the sequence we take the sum of the previous two elements. For example the first 6 fibonacci numbers are 1, 1, 2, 3, 5, 8. Write a method fibonacci that takes in a number length and returns the fibonacci sequence up to the given length.

def fibonacci(length)
  fibonacci_sequence = []
  iterator = 0
  while iterator < length
    if iterator == 0 || iterator == 1
      fibonacci_sequence << 1
    else
      fibonacci_sequence << fibonacci_sequence[-1] + fibonacci_sequence[-2]
    end
    iterator += 1
  end
  return fibonacci_sequence
end

print fibonacci(0) # => []
puts
print fibonacci(1) # => [1]
puts
print fibonacci(6) # => [1, 1, 2, 3, 5, 8]
puts
print fibonacci(8) # => [1, 1, 2, 3, 5, 8, 13, 21]
puts