# Write a method first_in_array that takes in an array and two elements, the method should return the element that appears earlier in the array.

def first_in_array(arr, el1, el2)
  
  # short one
  # return el1 if arr.index(el1) < arr.index(el2)
  # el2
  
  el1_index = arr.index(el1)
  el2_index = arr.index(el2)
  
  if el1_index < el2_index
    return el1
  else
    return el2
  end
end

puts first_in_array(["a", "b", "c", "d"], "d", "b"); # => "b"
puts first_in_array(["cat", "bird" ,"dog", "mouse" ], "dog", "mouse"); # => "dog"