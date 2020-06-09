# Write a method most_vowels that takes in a sentence string and returns the word of the sentence that contains the most vowels.

def most_vowels(sentence)
  
  vowel_count_hash = Hash.new(0)
  
  sentence.split.each do |word|
    vowel_count_hash[word] = 0
  end
  
  vowels = "aeiou"
  
  sentence.split.each do |word|
    vowel_count = 0
    word.each_char do |char|
      if vowels.include? char
        vowel_count += 1
      end
    end
    vowel_count_hash[word] = vowel_count # set corresponding vowel count as values to key
  end
  return vowel_count_hash.sort_by { |key, value| value }[-1][0]
end

print most_vowels("what a wonderful life") #=> "wonderful"