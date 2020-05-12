# Reimplement the bubble sort outlined in the preceding lecture.
# The bubble_sort method should accept an array of numbers and arrange the elements in increasing order.
# The method should return the array.
# Do not use the built-in Array#sort

def bubble_sort(arr)
  sorted = false 
  while !sorted
    sorted = true
    (0...arr.length-1).each do |indx|
      if arr[indx] > arr[indx+1]
        arr[indx], arr[indx+1] = arr[indx+1], arr[indx]
        sorted = false # if a swap takes place during a pass, then list isn't sorted
      end
    end
  end
  return arr
end

p bubble_sort([2, 8, 5, 2, 6])      # => [2, 2, 5, 6, 8]
p bubble_sort([10, 8, 7, 1, 2, 3])  # => [1, 2, 3, 7, 8, 10]