# Write a method is_palindrome(word) that takes in a string word and returns the true if the word is a palindrome, false otherwise. A palindrome is a word that is spelled the same forwards and backwards.

def is_palindrome(word)
  
  reversed_string = ""
  
  iterator = 0
  
  while iterator < word.length
    reversed_string = word[iterator] + reversed_string
    iterator = iterator + 1
  end
  
  if reversed_string == word
    return true
  else
    return false
  end
end

puts is_palindrome("racecar")  # => true
puts is_palindrome("kayak")    # => true
puts is_palindrome("bootcamp") # => false