def permutations(array)
  if array.length == 2
    return array.reverse
  end
  permd = []
  
  array.each_with_index do |ele,idx|
    if array[1..-1].length > 2
      permd +=  array_mult(array.first,permutations(array[1..-1]))
    else
      permd << array
      permd << array[0..0] + permutations(array[1..-1])
    end
    array = array.rotate
  end
  permd
end

def array_mult(val,arr)
  arr.map do |subarr|
    subarr.unshift(val)
  end
end