# Write a method count_a(word) that takes in a string word and returns the number of a's in the word. The method should count both lowercase (a) and uppercase (A)

def count_a(word)
  a_count = 0
  iterator = 0
  while iterator < word.length
    if word[iterator] == 'a' || word[iterator] == 'A'
      a_count += 1
    end
    iterator += 1
  end
  return a_count
end

puts count_a("application")  # => 2
puts count_a("bike")         # => 0
puts count_a("Arthur")       # => 1
puts count_a("Aardvark")     # => 3