# Write a method sum_elements(arr1, arr2) that takes in two arrays. The method should return a new array containing the results of adding together corresponding elements of the original arrays. You can assume the arrays have the same length.

def sum_elements(arr1, arr2)
  elements_sum = []
  
  iterator = 0
  while iterator < arr1.length
    elements_sum << arr1[iterator] + arr2[iterator]
    iterator = iterator + 1
  end
  return elements_sum
end

print sum_elements([7, 4, 4], [3, 2, 11])                            # => [10, 6, 15]
puts
print sum_elements(["cat", "pizza", "boot"], ["dog", "pie", "camp"]) # => ["catdog", "pizzapie", "bootcamp"]