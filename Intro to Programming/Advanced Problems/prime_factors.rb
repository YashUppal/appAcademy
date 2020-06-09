# Write a method prime_factors that takes in a number and returns an array containing all of the prime factors of the given number.

def prime_factors(num)
  return (2...num).select do |numb|
    num % numb == 0 && is_prime?(numb)
  end
end

def is_prime?(num)
  if num < 2
    return false
  end
  
  (2...num).each do |div|
    if num % div == 0
      return false
    end
  end
  
  return true
end

print prime_factors(24) #=> [2, 3]
puts
print prime_factors(60) #=> [2, 3, 5]
puts