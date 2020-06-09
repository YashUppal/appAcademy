# Write a method caesar_cipher that takes in a string and a number. The method should return a new string where every character of the original is shifted num characters in the alphabet.

# Feel free to use this variable:


def caesar_cipher(str, num)
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  encrypt = ""
  
  str.each_char do |char|
    alpha_index = alphabet.index(char)
    alpha_index = (alpha_index + num) % 26
    encrypt += alphabet[alpha_index]
  end
  return encrypt
end

puts caesar_cipher("apple", 1)    #=> "bqqmf"
puts caesar_cipher("bootcamp", 2) #=> "dqqvecor"
puts caesar_cipher("zebra", 4)    #=> "difve"