# Write a function add_numbers(nums_array) that takes in an array of Integers and returns the sum of those numbers. Write this method recursively.

def add_numbers(nums_array)
  return nums_array[0] if nums_array.length == 1
  return nil if nums_array.empty?

  nums_array[0] + add_numbers(nums_array[1..-1])
end

p add_numbers([1,2,3,4]) # => returns 10
p add_numbers([3]) # => returns 3
p add_numbers([-80,34,7]) # => returns -39
p add_numbers([]) # => returns nil