def range(st, fin)
  return [] if fin < st
  range(st, fin-1) + [fin]
end

def sum(arr)
  return arr[0] if arr.length == 1
  arr[0] + sum(arr[1..-1])
end

def sum_iter(arr)
  iterator = 0
  sum = 0
  while iterator < arr.length
    sum += arr[iterator]
    iterator = iterator + 1
  end
  return sum
end
