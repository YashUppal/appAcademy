# Phase 1

# duos ✅

# Write a method duos that accepts a string as an argument and returns the count of the number of times the same character appears consecutively in the given string.

# Examples 

# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0

def duos(str)
  duos_count = 0
  iterator = 0
  while iterator < str.length-1
    duos_count += 1 if str[iterator] == str[iterator+1]
    iterator = iterator + 1
  end
  duos_count
end

# -----------------------------------------------------------------------------

# sentence_swap ✅

# Write a method sentence_swap that accepts a sentence and a hash as arguments. The method should return a new sentence where every word is replaced with it's corresponding value in the hash. If a word does not exist as a key of the hash, then it should remain unchanged.

# Examples

# p sentence_swap('anything you can do I can do',
#     'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) # 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#     'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) # 'make a happy ad'

# p sentence_swap('keep coding okay',
#     'coding'=>'running', 'kay'=>'pen'
# ) # 'keep running okay'

def sentence_swap(sent, hash)
  swapped = []
  sent.split.each do |word|
    if hash[word]
      swapped << hash[word]
    else
      swapped << word
    end
  end
  swapped.join(" ")
end


# -----------------------------------------------------------------------------

# hash_mapped ✅

# Write a method hash_mapped that accepts a hash, a proc, and a block. The method should return a new hash where each key is the result of the original key when given to the block. Each value of the new hash should be the result of the original values when passed into the proc.

# Examples

# double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# # {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# # {25=>"q", 36=>"w"}

def hash_mapped(hash, prc, &blc)
  mapped_hash = {}
  hash.each do |key,value|
    mapped_hash[blc.call(key)] = prc.call(value)
  end
  mapped_hash
end

# -----------------------------------------------------------------------------

# counted_characters ✅

# Write a method counted_characters that accepts a string as an argument. The method should return an array containing the characters of the string that appeared more than twice. The characters in the output array should appear in the same order they occur in the input string.

# Examples

# p counted_characters("that's alright folks") # ["t"]
# p counted_characters("mississippi") # ["i", "s"]
# p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
# p counted_characters("runtime") # []

def counted_characters(str)
  counted_chars = []
  str.each_char do |char|
    counted_chars << char if (str.count(char) > 2)
  end
  counted_chars.uniq
end

# -----------------------------------------------------------------------------

# triplet_true? ✅ 

# Write a method triplet_true? that accepts a string as an argument and returns a boolean indicating whether or not the string contains three of the same character consecutively.

# Examples

# p triplet_true('caaabb')        # true
# p triplet_true('terrrrrible')   # true
# p triplet_true('runninggg')     # true
# p triplet_true('bootcamp')      # false
# p triplet_true('e')             # false

def triplet_true?(str)
  iterator = 0
  while iterator < str.length - 2
    return true if str[iterator] == str[iterator + 1] && str[iterator] == str[iterator + 2]
    iterator += 1
  end
  false
end

# -----------------------------------------------------------------------------

# energetic_encoding ✅

# Write a method energetic_encoding that accepts a string and a hash as arguments. The method should return a new string where characters of the original string are replaced with the corresponding values in the hash. If a character is not a key of the hash, then it should be replaced with a question mark ('?'). Space characters (' ') should remain unchanged.

# Examples

# p energetic_encoding('sent sea',
#     'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
# ) # 'zimp ziu'

# p energetic_encoding('cat',
#     'a'=>'o', 'c'=>'k'
# ) # 'ko?'

# p energetic_encoding('hello world',
#     'o'=>'i', 'l'=>'r', 'e'=>'a'
# ) # '?arri ?i?r?'

# p energetic_encoding('bike', {}) # '????'

def energetic_encoding(str, hash)
  encoded = []
  str.split.each do |word|
    encoded_word = ""
    word.each_char do |char|
      if hash[char]
        encoded_word += hash[char]
      else
        encoded_word += "?"
      end
    end
    encoded << encoded_word
  end
  return encoded.join(" ")
end

# -----------------------------------------------------------------------------

# uncompress ✅

# Write a method uncompress that accepts a string as an argument. The string will be formatted so every letter is followed by a number. The method should return an "uncompressed" version of the string where every letter is repeated multiple times given based on the number that appears directly after the letter.

# Examples

# uncompress('a2b4c1') # 'aabbbbc'
# uncompress('b1o2t1') # 'boot'
# uncompress('x3y1x2z4') # 'xxxyxxzzzz'

def uncompress(str)
  uncompressed_str = ""

  iterator = 0 
  while iterator < str.length-1
    str[iterator+1].to_i.times do 
      uncompressed_str += str[iterator]
    end
    iterator += 1
  end
  uncompressed_str
end

# -----------------------------------------------------------------------------

# Phase 2

# -----------------------------------------------------------------------------

# conjunct_select ✅

# Write a method conjunct_select that accepts an array and one or more procs as arguments. The method should return a new array containing the elements that return true when passed into all of the given procs.

# Examples

# is_positive = Proc.new { |n| n > 0 }
# is_odd = Proc.new { |n| n.odd? }
# less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

def conjunct_select(arr,*procs)
  arr.select do |ele|
    procs.all? { |proc| proc.call(ele) }
  end
end

# -----------------------------------------------------------------------------

# convert_pig_latin ✅

# Write a method convert_pig_latin that accepts a sentence as an argument. The method should translate the sentence according to the following rules:

# words that are shorter than 3 characters are unchanged
# words that are 3 characters or longer are translated according to the following rules:
# if the word begins with a vowel, simply add 'yay' to the end of the word (example: 'eat'->'eatyay')
# if the word begins with a non-vowel, move all letters that come before the word's first vowel to the end of the word and add 'ay' (example: 'trash'->'ashtray')
# Note that if words are capitalized in the original sentence, they should remain capitalized in the translated sentence. Vowels are the letters a, e, i, o, u.

# Examples

# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

def convert_pig_latin(sent)
  translation = []
  vowels = "aeiouAEIOU"

  sent.split.each do |word|
    if word.length < 3
      translation << word
    elsif word.length >= 3
      if vowels.include?(word[0])
        translation << word + "yay"
      else
        vow_idx = first_vowel_idx(word)
        if word == word.capitalize
          translation << (word[vow_idx..-1] + word[0...vow_idx] + "ay").capitalize
        else
          translation << (word[vow_idx..-1] + word[0...vow_idx] + "ay")
        end
      end
    end
  end
  translation.join(" ")
end

def first_vowel_idx(word)
  vowels = "aeiou"
  word.each_char.with_index do |word, idx|
    if vowels.include?(word)
      return idx
    end
  end
end

# -----------------------------------------------------------------------------
# reverberate ✅

# Write a method reverberate that accepts a sentence as an argument. The method should translate the sentence according to the following rules:

# words that are shorter than 3 characters are unchanged
# words that are 3 characters or longer are translated according to the following rules:
# if the word ends with a vowel, simply repeat the word twice (example: 'like'->'likelike')
# if the word ends with a non-vowel, repeat all letters that come after the word's last vowel, including the last vowel itself (example: 'trash'->'trashash')
# Note that if words are capitalized in the original sentence, they should remain capitalized in the translated sentence. Vowels are the letters a, e, i, o, u.

# Examples

# p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"

def reverberate(sent)
  translated = []
  vowels = "aeiou"

  sent.split.each do |word|
    if word.length < 3
      translated << word
    else
      if vowels.include?(word[-1])
        translated << word + word.downcase
      else
        last_vowel = last_vowel_index(word)
        translated << word + word[last_vowel..-1]
      end
    end
  end
  translated.join(" ")
end

def last_vowel_index(word)
  vowels = "aeiou"
  last_vow = 0
  word.each_char.with_index do |char, idx|
    if vowels.include?(char)
      last_vow = idx
    end
  end
  last_vow
end

# -----------------------------------------------------------------------------

# disjunct_select ✅

# Write a method disjunct_select that accepts an array and one or more procs as arguments. The method should return a new array containing the elements that return true when passed into at least one of the given procs.

# Examples

# longer_four = Proc.new { |s| s.length > 4 }
# contains_o = Proc.new { |s| s.include?('o') }
# starts_a = Proc.new { |s| s[0] == 'a' }

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) # ["apple", "teeming"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) # ["dog", "apple", "teeming", "boot"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ) # ["ace", "dog", "apple", "teeming", "boot"]

def disjunct_select(arr, *procs)
  disjunct = []
  arr.each do |ele|
    procs.each do |proc|
      disjunct << ele if proc.call(ele) && !disjunct.include?(ele)
    end
  end
  disjunct
end

# -----------------------------------------------------------------------------
# alternating_vowel ✅

# Write a method alternating_vowel that accepts a sentence as an argument. The method should return a new sentence where the words alternate between having their first or last vowel removed. For example:

# the 1st word should be missing its first vowel
# the 2nd word should be missing its last vowel
# the 3rd word should be missing its first vowel
# the 4th word should be missing its last vowel
# ... and so on
# Note that words that contain no vowels should remain unchanged. Vowels are the letters a, e, i, o, u.

# Examples

# p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
# p alternating_vowel('code properly please') # "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"

VOWELS = "aeiou"

def alternating_vowel(sent)
  alternated = []

  sent.split.each_with_index do |ele, idx|
    if has_vowels?(ele)
      if idx % 2 == 0
        removed = ele[0...first_vowel_index(ele)] + ele[first_vowel_index(ele)+1..-1]
        alternated << removed
      else
        removed = ele[0...last_vowel_index(ele)] + ele[last_vowel_index(ele)+1 ..-1]
        alternated << removed
      end
    else
      alternated << ele
    end
  end
  return alternated.join(" ")
end

def first_vowel_index(word)
  word.each_char.with_index do |char, idx|
    return idx if VOWELS.include?(char)
  end
end

def last_vowel_index(word)
  last_index = 0
  word.each_char.with_index do |char,idx|
    last_index = idx if VOWELS.include?(char)
  end
  return last_index
end

def has_vowels?(word)
  word.each_char do |char|
    return true if VOWELS.include?(char)
  end
  return false
end

# -----------------------------------------------------------------------------
# silly_talk ✅

# Write a method silly_talk that accepts a sentence as an argument. The method should translate each word of the sentence according to the following rules:

# if the word ends with a vowel, simply repeat that vowel at the end of the word (example: 'code'->'codee')
# if the word ends with a non-vowel, every vowel of the word should be followed by 'b' and that same vowel (example: 'siren'->'sibireben')
# Note that if words are capitalized in the original sentence, they should remain capitalized in the translated sentence. Vowels are the letters a, e, i, o, u.

# Examples

# p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
# p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
# p silly_talk('They can code') # "Thebey caban codee"
# p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"

VOWELS = "aeiou"

def silly_talk(sent)
  translated = []
  sent.split.each do |word|
    if VOWELS.include?(word[-1])
      translated << repeat_end_vowel(word)
    else
      translated << append_b(word)
    end
  end
  translated.join(" ")
end

def repeat_end_vowel(word)
  return (word + word[-1])
end

def append_b(word)
  b_appended = ""
  word.each_char do |char|
    if VOWELS.include?(char.downcase)
      b_appended += char + "b" + char
    else
      b_appended += char
    end
  end
  if word == word.capitalize
    return b_appended.capitalize
  else
    return b_appended
  end
end

# -----------------------------------------------------------------------------
# compress ✅

# Write a method compress that accepts a string as an argument. The method should return a "compressed" version of the string where streaks of consecutive letters are translated to a single appearance of the letter followed by the number of times it appears in the streak. If a letter does not form a streak (meaning that it appears alone), then do not add a number after it.

# Examples

# p compress('aabbbbc')   # "a2b4c"
# p compress('boot')      # "bo2t"
# p compress('xxxyxxzzzz')# "x3yx2z4"

def compress(str)
  sub_strings = []
  iterator = 0
  subs = ""
  compressed = ""

  while iterator < str.length
    subs += str[iterator]
    if str[iterator] != str[iterator+1]
      sub_strings << subs
      subs = ""
    end
    iterator += 1
  end
  
  sub_strings.uniq.each do |sub|
    if sub.length == 1
      compressed += sub
    else
      compressed += sub[0] + sub.length.to_s
    end
  end

  compressed
end
# -----------------------------------------------------------------------------
