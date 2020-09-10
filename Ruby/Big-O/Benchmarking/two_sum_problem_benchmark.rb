require 'benchmark'

def bad_two_sum?(arr,sum)
  # time complexity of O(n^2)
  sum_of_pairs = []

  i = 0
  while i < arr.length
    j = i+1
    while j < arr.length
      sum_of_pairs << arr[i] + arr[j]
      j += 1
    end
    i += 1
  end

  return sum_of_pairs.include?(sum)
end

def quick_sort(arr)

  if arr.length == 1 || arr.length.zero?
    return arr
  end

  pivot = arr.last
  left = []
  right = []

  i = 0
  while i < arr.length-1
    if arr[i] < pivot
      left << arr[i]
    elsif arr[i] >= pivot
      right << arr[i]
    end
    i += 1
  end

  return quick_sort(left) + [pivot] + quick_sort(right)
end

def okay_two_sum?(arr,sum)
  arr = quick_sort(arr)

  left = []
  right = []

  arr.each do |num|
    if num < sum
      left << num
    elsif num > sum
      right << sum
    end
  end

  sums = []

  i = 0
  while i < left.length
    j = i+1
    while j < left.length

      sums << left[i] + left[j]

      j += 1
    end
    i += 1
  end
  return sums.include?(sum)
end

def linear_two_sum?(arr,sum)
  hash = {}
  arr = quick_sort(arr)

  i = 0
  while i < arr.length-1
    hash[arr[i] + arr[i+1]] = true
    i += 1
  end

  hash.has_key?(sum)
end

# Benchmarks
arr = [0, 1, 5, 7]

Benchmark.bm do |x|
  x.report("bad_two_sum?:") { bad_two_sum?(arr,6) }
  x.report("okay_two_sum?:") { okay_two_sum?(arr,6) }
  x.report("linear_two_sum?:") { linear_two_sum?(arr,6) }
end