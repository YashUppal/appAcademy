# Write a method factorial(num) that takes in a number num and returns the product of all numbers from 1 up to and including num.

def factorial(num)
  iterator = 1
  fact = 1
  while iterator <= num
    fact = fact * iterator
    iterator = iterator + 1
  end
  return fact
end

puts factorial(3) # => 6, because 1 * 2 * 3 = 6
puts factorial(5) # => 120, because 1 * 2 * 3 * 4 * 5 = 120
puts factorial(10)