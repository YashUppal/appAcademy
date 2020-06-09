# Write a method prime? that takes in a number and returns a boolean, indicating whether the number is prime. A prime number is only divisible by 1 and itself.

def prime?(num)
  (2...num).each do |div|
    if num % div == 0
      return false # means, it has a factor other than 1 and num itself
    end
  end
  
  if num < 2
    return false
  else
    return true
  end
  
end

puts prime?(2)  #=> true
puts prime?(5)  #=> true
puts prime?(11) #=> true
puts prime?(4)  #=> false
puts prime?(9)  #=> false
puts prime?(-5) #=> false