# Write a method vowel_cipher that takes in a string and returns a new string where every vowel becomes the next vowel in the alphabet.

def vowel_cipher(string)
  vowels = "aeiou"
  encrypted = ""
  
  string.each_char do |char|
    if vowels.include?(char)
      vowel_index = vowels.index(char)
      vowel_index = (vowel_index + 1) % 5
      encrypted += vowels[vowel_index]
    else
      encrypted += char
    end
  end
  return encrypted
end

puts vowel_cipher("bootcamp") #=> buutcemp
puts vowel_cipher("paper cup") #=> pepir cap