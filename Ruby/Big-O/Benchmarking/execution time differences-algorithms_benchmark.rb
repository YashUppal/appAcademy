require 'benchmark'

def my_min(list)
  # O(n^2) time complexity
  smallest = false
  list.each do |num_outer|
    smallest = true
    list.each do |num_inner|
      if num_inner < num_outer
        smallest = false
      end
    end
    if smallest
      return num_outer
    end
  end
  # return smallest
end

def my_min_better(list)
  # O(n) complexity
  smallest = list.first
  list.each do |ele|
    if ele < smallest
      smallest = ele
    end
  end
  return smallest
end

def largest_contiguous_subsum(list)
  # O(n^2) Time Complexity
  sub_arrays = []

  i = 0
  while i < list.length
    j = i
    while j < list.length
      sub_arrays << list[i..j]
      j += 1
    end
    i += 1
  end

  sub_arrays.map do |subarr|
    subarr.reduce(&:+)
  end.max
end 

def largest_contiguous_subsum_better(list)
  # O(n) time with O(1) memory

  max_sum = list.first

  i = 0
  while i < list.length
    j = i
    while j < list.length

      current_sum = list[i..j].reduce(&:+)

      if max_sum < current_sum
        max_sum = current_sum
      end

      j += 1
    end
    i += 1
  end
  return max_sum
end

# Benchmarks

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

Benchmark.bmbm do |x|
  x.report("my_min:") {my_min(list)}
  x.report("my_min_better:") {my_min_better(list)}
  x.report("largest_contiguous_subsum:") {largest_contiguous_subsum(list)}
  x.report("largest_contiguous_subsum_better") {largest_contiguous_subsum_better(list)}
end

# Conclusions -> better versions are faster