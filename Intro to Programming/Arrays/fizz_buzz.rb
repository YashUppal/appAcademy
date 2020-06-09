# Write a method fizz_buzz(max) that takes in a number max and returns an array containing all numbers greater than 0 and less than max that are divisible by either 4 or 6, but not both.

def fizz_buzz(max)
  fizz_buzz = []
  
  iterator = 1
  
  while iterator < max
    
    if (iterator % 4 == 0 || iterator % 6 == 0) && !(iterator % 4 == 0 && iterator % 6 == 0)
      fizz_buzz << iterator
    end
    
    iterator = iterator + 1
  end
  return fizz_buzz
end

print fizz_buzz(20) # => [4, 6, 8, 16, 18]
puts
print fizz_buzz(15) # => [4, 6, 8]