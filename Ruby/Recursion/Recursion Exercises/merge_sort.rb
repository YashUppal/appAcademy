def merge_sort(arr)
  return arr if arr.length == 1
  return [] if arr == []
  
  left_half = arr[0...(arr.length/2)]
  right_half = arr[(arr.length/2)..-1]

  merge(merge_sort(left_half), merge_sort(right_half))
end



def merge(arr1,arr2)
  merged = Array.new

  i = 0
  j = 0

  while i < arr1.length || j < arr2.length
    if arr1[i].nil?
      merged << arr2[j]
      j += 1
    elsif arr2[j].nil?
      merged << arr1[i]
      i += 1
    elsif arr1[i] < arr2[j]
      merged << arr1[i]
      i += 1
    else
      merged << arr2[j]
      j += 1
    end
  end
  return merged
end