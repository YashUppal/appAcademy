def hipsterfy(word)
  iterator = word.length - 1
  vowels = "aeiou"
  while iterator > 0
    if vowels.include?(word[iterator])
      word[iterator] = ""
      word.split("").join("")
      return word

      # alternate
      # return word[0...iterator] + word[iterator+1..-1]
    end
    iterator = iterator - 1
  end
  word
end

def vowel_counts(str)
  count_hash = Hash.new(0)
  vowels = "aeiou"
  str.downcase.each_char do |char|
    count_hash[char] += 1 if vowels.include?(char)
  end
  count_hash
end

def caesar_cipher(msg, n)
  encrypted = ""
  alphabets = "abcdefghijklmnopqrstuvwxyz"
  msg.each_char.with_index do |char,idx|
    if alphabets.include?(char)
      # msg[idx] = alphabets[(alphabets.index(char) + n) % 26]
      encrypted += alphabets[(alphabets.index(char) + n) % 26]
    else
      encrypted += char
    end
  end
  # msg
  encrypted
end