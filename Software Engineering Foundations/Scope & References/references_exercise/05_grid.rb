# Write a method, grid(n, m), that accepts two numbers as args.
# The method should return a 2D array with n rows and m columns (this means that there are n subarrays, each of length m).

def grid(n, m)

  # way one 
  # grid = Array.new(n)
  # grid.each_with_index do |ele, idx|
  #   grid[idx] = Array.new(m)
  # end
  # grid

  # Concise way
  grid = Array.new(n) { Array.new(m) } # outer array length n => n rows

end

result_1 = grid(2, 3)
p result_1              # => [[nil, nil, nil], [nil, nil, nil]]
result_1[0][0] = "X"
p result_1              # => [["X", nil, nil], [nil, nil, nil]]


result_2 = grid(4, 2)
p result_2              # => [[nil, nil], [nil, nil], [nil, nil], [nil, nil]]
result_2[0][0] = "Q"
p result_2              # => [["Q", nil], [nil, nil], [nil, nil], [nil, nil]]
