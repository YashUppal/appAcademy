# Write a method reverse(word) that takes in a string word and returns the word with its letters in reverse order.

def reverse(word)
  reversed_string = ""
  iterator = 0
  while iterator < word.length
    reversed_string = word[iterator] + reversed_string
    
    iterator = iterator + 1
  end
  return reversed_string
end

puts reverse("cat")          # => "tac"
puts reverse("programming")  # => "gnimmargorp"
puts reverse("bootcamp")     # => "pmactoob"
puts reverse("racecar")      # => "racecar"