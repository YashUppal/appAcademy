# Write a method pick_primes that takes in an array of numbers and returns a new array containing only the prime numbers.

def pick_primes(numbers)
  return numbers.select do |num|
    is_prime?(num)
  end
end

def is_prime?(number)
  if number < 2
    return false
  end
  
  (2...number).each do |div|
    if number % div == 0
      return false
    end
  end
  
  return true
end

print pick_primes([2, 3, 4, 5, 6]) #=> [2, 3, 5]
puts
print pick_primes([101, 20, 103, 2017]) #=> [101, 103, 2017]
puts