# Write a method select_odds(numbers) that takes in an array of numbers and returns a new array containing the odd numbers of the original array.

def select_odds(numbers)
  odd_arr = []
  
  iterator = 0
  
  while iterator < numbers.length
	if !(numbers[iterator] % 2 == 0) # if it is not even
      odd_arr << numbers[iterator] # shovel it in the odd_arr array
    end
    iterator = iterator + 1
  end
  return odd_arr
end

print select_odds([13, 4, 3, 7, 6, 11]) # => [13, 3, 7, 11]
puts
print select_odds([2, 4, 6])            # => []