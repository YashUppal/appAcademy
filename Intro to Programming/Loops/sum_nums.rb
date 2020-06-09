# Write a method sum_nums(max) that takes in a number max and returns the sum of all numbers from 1 up to and including max.

def sum_nums(max)
  start = 1
  sum = 0
  while start <= max
    sum = sum + start
    start += 1
  end
  return sum
end

puts sum_nums(4) # => 10, because 1 + 2 + 3 + 4 = 10
puts sum_nums(5) # => 15
puts sum_nums(3)