def quick_sort(arr)
  return arr if arr.length <= 1
  duped = arr.dup
  pivot = duped.pop
  left,right = [],[]
  duped.each do |ele|
    left << ele if ele < pivot
    right << ele if ele >= pivot
  end
  quick_sort(left) + [pivot] + quick_sort(right)
end
