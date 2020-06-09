# Write a method doubler(numbers) that takes an array of numbers and returns a new array
# where every element of the original array is multiplied by 2.

def doubler(numbers)
  double_arr = []
  
  iterator = 0
  while iterator < numbers.length
    double_arr << numbers[iterator] * 2
    iterator = iterator + 1
  end
  return double_arr
end

print doubler([1, 2, 3, 4]) # => [2, 4, 6, 8]
puts
print doubler([7, 1, 8])    # => [14, 2, 16]