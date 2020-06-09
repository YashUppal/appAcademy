# Write a method factors_of(num) that takes in a num and returns an array of all positive numbers less than or equal to num that can divide num.

def factors_of(num)
  
  factors_arr = []
  
  iterator = 1
  
  while iterator <= num
    if num % iterator == 0
      factors_arr << iterator
    end
    iterator = iterator + 1
  end
  return factors_arr
end

print factors_of(3)   # => [1, 3]
puts
print factors_of(4)   # => [1, 2, 4]
puts
print factors_of(8)   # => [1, 2, 4, 8]
puts
print factors_of(9)   # => [1, 3, 9]
puts
print factors_of(16)  # => [1, 2, 4, 8, 16]