def permutations(array)

  if array.length == 2
    return array.reverse
  end

  # permed = []

  # array.length.times do 
  #   permed += [array] + [[array.first] + permutations(array[1..-1])]
  #   array = array.rotate
  # end

  # permed

  pe = []
  array.length.times do
    pe += [[array[0]] + permutations(array[1..-1])]
    array = array.rotate
  end
  pe
end