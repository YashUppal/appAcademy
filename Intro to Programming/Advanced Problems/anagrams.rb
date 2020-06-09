# Write a method anagrams? that takes in two words and returns a boolean indicating whether or not the words are anagrams. Anagrams are words that contain the same characters but not necessarily in the same order. Solve this without using .sort

def anagrams?(word1, word2)
  word1_hash = Hash.new(0)
  word2_hash = Hash.new(0)
  
  word1.each_char do |char|
    word1_hash[char] += 1
  end
  
  word2.each_char do |char|
    word2_hash[char] += 1
  end
  
  word1_hash.each do |key, value|
    if word2_hash[key] != word1_hash[key] || word1_hash.length != word2_hash.length
      return false
    end
  end
  return true
  
  # also works -> return word1_hash == word2_hash
end

puts anagrams?("cat", "act")          #=> true
puts anagrams?("restful", "fluster")  #=> true
puts anagrams?("cat", "dog")          #=> false
puts anagrams?("boot", "bootcamp")    #=> false