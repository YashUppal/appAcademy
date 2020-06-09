# Write a method combinations that takes in an array of unique elements, the method should return a 2D array representing all possible combinations of 2 elements of the array.

def combinations(arr)
  two_d_arr = []
  
  arr.each_with_index do |ele, idx|
    arr.each_with_index do |ele2, idx2|
      if idx2 > idx
      	two_d_arr.push([ele,ele2])
      end
    end
  end
  return two_d_arr
end

print combinations(["a", "b", "c"]); # => [ [ "a", "b" ], [ "a", "c" ], [ "b", "c" ] ]
puts

print combinations([0, 1, 2, 3]); # => [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 1, 2 ], [ 1, 3 ], [ 2, 3 ] ]
puts