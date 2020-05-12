# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.

def coprime?(num_1, num_2)

  num_1_divisors = (1...num_1).select do |div|
    div if num_1 % div == 0
  end

  num_2_divisors = (1...num_2).select do |div|
    div if num_2 % div == 0
  end

  common = []
  common = num_1_divisors.select do |num|
    num if num_2_divisors.include? num
  end

  if common.length == 1 && common.first == 1
    return true
  else
    return false
  end

end


 p coprime?(25, 12)    # => true
 p coprime?(7, 11)     # => true
 p coprime?(30, 9)     # => false
 p coprime?(6, 24)     # => false
