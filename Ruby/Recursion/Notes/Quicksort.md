# Quicksort

## What is Quicksort

* Sorting algorithm, very efficient and also easy to understand. Used by Ruby under the hood for its ```.sort``` method.

## Algorithm

1) select the last element of ```arr``` as a ```pivot```.
2) create two subarrays, ```left``` and ```right```
3) move elements < ```pivot``` to ```left``` array, move elements > ```pivot``` to ```right``` array
4) recursively quick sort the ```left``` and ```right``` subarrays and combine them


## Quicksort using recursion

```ruby
def quicksort(arr)

  arr = arr.dup # no mutating the argument

  return arr if arr.length <= 1

  pivot = arr.pop
  left,right = [],[]

  arr.each do |ele|
    left << ele if ele < pivot
    right << ele if ele >= pivot
  end

  quicksort(left) + [pivot] + quicksort(right)
end
```
