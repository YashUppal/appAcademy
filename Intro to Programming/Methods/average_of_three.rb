# Write a method average_of_three(num1, num2, num3) that returns the average of three numbers

def average_of_three(num1, num2, num3)
  sum = num1 + num2 + num3
  average = sum / 3.0
  return average
end

puts average_of_three(3, 7, 8)   # => 6.0
puts average_of_three(2, 5, 17)  # => 8.0
puts average_of_three(2, 8, 1)   # => 3.666666