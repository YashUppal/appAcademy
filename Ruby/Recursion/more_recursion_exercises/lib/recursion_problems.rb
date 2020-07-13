#Problem 1: 
#You have array of integers. Write a recursive solution to find the sum of the integers.
def sum_recur(array)
  return array.first if array.length == 1
  array[0] + sum_recur(array[1..-1])
end

#Problem 2: 
#You have array of integers. Write a recursive solution to determine whether or not the array contains a specific value.
def includes?(array, target)
  
  return false if array.empty?

  middle_ele = array[array.length/2]

  if middle_ele == target
    return true
  elsif middle_ele > target
    includes?(array[0...array.length/2],target)
  elsif middle_ele < target
    includes?(array[array.length/2+1..-1],target)
  end
end

# Problem 3: 
# You have an unsorted array of integers. Write a recursive solution to count the number of occurrences of a specific value.
def num_occur(array, target)
  count = 0
  first_ele = array[0]
  count += 1 if first_ele == target

  return count if array.empty?

  count += num_occur(array[1..-1],target)
  count
end

# Problem 4: 
# You have array of integers. Write a recursive solution to determine whether or not two adjacent elements of the array add to 12.

def add_to_twelve?(array)
  return false if array.empty? || array.length == 1

  first,second = array[0],array[1]

  return true if first + second == 12

  add_to_twelve?(array[1..-1])
end

# Problem 5: 
# You have array of integers. Write a recursive solution to determine if the array is sorted.
def sorted?(array)
  return true if array.empty? || array.length == 1

  first,second = array[0],array[1]

  return false if second < first

  sorted?(array[1..-1])
end

# Problem 6: 
# Write a recursive function to reverse a string. Don't use any built-in #reverse methods!
def reverse(string)
  return string if string.empty?

  reverse(string[1..-1]) + string[0]
end
