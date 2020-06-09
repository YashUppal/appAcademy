# Write a method count_e(word) that takes in a string word and returns the number of e's in the word

def count_e(word)
  e_count = 0
  iterator = 0
  while iterator < word.length
    if word[iterator] == 'e'
      e_count += 1
    end
    iterator += 1
  end
  
  return e_count
end

puts count_e("movie") # => 1
puts count_e("excellent") # => 3