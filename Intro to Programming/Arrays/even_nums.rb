# Write a method even_nums(max) that takes in a number max and returns an array containing all even numbers from 0 to max

def even_nums(max)
  even_arr = []
  iterator = 0
  
  while iterator <= max
    
    if iterator % 2 == 0
      even_arr << iterator
    end
    iterator = iterator + 1
  end
  return even_arr
end

print even_nums(10) # => [0, 2, 4, 6, 8, 10]
puts
print even_nums(5)  # => [0, 2, 4]