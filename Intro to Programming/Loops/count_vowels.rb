# Write a method, count_vowels(word), that takes in a string word and returns the number of vowels in the word. Vowels are the letters a, e, i, o, u.

def count_vowels(word)
  iterator = 0
  vowel_count = 0
  while iterator < word.length
    
    if word[iterator] == 'a' || word[iterator] == 'e' || word[iterator] == 'i' || word[iterator] == 'o' || word[iterator] == 'u'
      vowel_count += 1
    end
    
    if word[iterator] == 'A' || word[iterator] == 'E' || word['iterator'] == 'I' || word['iterator'] == 'O' || word['iterator'] == 'U'
      vowel_count += 1
    end
    iterator = iterator + 1
  end
  return vowel_count
end

puts count_vowels("bootcamp")  # => 3
puts count_vowels("apple")     # => 2
puts count_vowels("pizza")     # => 2