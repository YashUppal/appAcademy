# Write a method no_dupes?(arr) that accepts an array as an arg and returns an new array containing the elements that were not repeated in the array.

# # Examples
# no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# no_dupes?([true, true, true])            # => []

def no_dupes?(arr)
  arr.select do |ele|
    arr.count(ele) == 1
  end
end

# Write a method no_consecutive_repeats?(arr) that accepts an array as an arg. The method should return true if an element never appears consecutively in the array; it should return false otherwise.
 
# Examples
# no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# no_consecutive_repeats?(['x'])                              # => true

def no_consecutive_repeats?(arr)
  iterator = 0
  while iterator < arr.length-1
    return false if arr[iterator] == arr[iterator+1]
    iterator += 1
  end
  true
end


# Write a method char_indices(str) that takes in a string as an arg. The method should return a hash containing characters as keys. The value associated with each key should be an array containing the indices where that character is found.

# Examples
# char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def char_indices(str)
  indices_hash = Hash.new { |hash, key| hash[key] = Array.new }
  str.each_char.with_index do |char, index|
    indices_hash[char] << index
  end
  indices_hash
end

# Write a method longest_streak(str) that accepts a string as an arg. The method should return the longest streak of consecutive characters in the string. If there are any ties, return the streak that occurs later in the string.

# Examples
# longest_streak('a')           # => 'a'
# longest_streak('accccbbb')    # => 'cccc'
# longest_streak('aaaxyyyyyzz') # => 'yyyyy
# longest_streak('aaabbb')      # => 'bbb'
# longest_streak('abc')         # => 'c'

def longest_streak(str)
  streaks = []
  iterator = 0
  streak = ""

  while iterator < str.length
    if streak.empty? || streak[-1] == str[iterator]
      streak += str[iterator]
    else
      streaks << streak
      streak = ""
      streak << str[iterator]
    end
    iterator += 1
    
  end
  streaks << streak

  largest = streaks.inject do |acc, ele|
    if ele.length >= acc.length
      ele
    else
      acc
    end
  end
end

# Write a method bi_prime?(num) that accepts a number as an arg and returns a boolean indicating whether or not the number is a bi-prime. A bi-prime is a positive integer that can be obtained by multiplying two prime numbers.

# For Example:

# 14 is a bi-prime because 2 * 7
# 22 is a bi-prime because 2 * 11
# 25 is a bi-prime because 5 * 5
# 24 is not a bi-prime because no two prime numbers have a product of 24

# Examples
# bi_prime?(14)   # => true
# bi_prime?(22)   # => true
# bi_prime?(25)   # => true
# bi_prime?(94)   # => true
# bi_prime?(24)   # => false
# bi_prime?(64)   # => false

def bi_prime?(num)
  primes = []
  (2..num).each do |fact|
    primes << fact if is_prime?(fact)
  end

  primes.each do |num1|
    primes.each do |num2|
      return true if num1 * num2 == num
    end
  end

  return false
end

def is_prime?(num)
  (2...num).each do |fact|
    return false if (num % fact).zero?
  end
  true
end


# A Caesar cipher takes a word and encrypts it by offsetting each letter in the word by a fixed number, called the key. Given a key of 3, for example: a -> d, p -> s, and y -> b.

# A Vigenere Cipher is a Caesar cipher, but instead of a single key, a sequence of keys is used. For example, if we encrypt "bananasinpajamas" with the key sequence 1, 2, 3, then the result would be "ccqbpdtkqqcmbodt":

# Message:  b a n a n a s i n p a j a m a s
# Keys:     1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1
# Result:   c c q b p d t k q q c m b o d t

# Write a method vigenere_cipher(message, keys) that accepts a string and a key-sequence as args, returning the encrypted message. Assume that the message consists of only lowercase alphabetic characters.

# # Examples
# vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# vigenere_cipher("yawn", [5, 1])             # => "dbbo"

def vigenere_cipher(message, keys)
  alphabets = ("a".."z").to_a
  vigenered = ""
  message.each_char.with_index do |char, idx|
    vigenered += alphabets[(alphabets.index(char) + keys[idx % keys.length]) % 26]
  end
  return vigenered
end


# Write a method vowel_rotate(str) that accepts a string as an arg and returns the string where every vowel is replaced with the vowel the appears before it sequentially in the original string. The first vowel of the string should be replaced with the last vowel.

# Examples
# vowel_rotate('computer')      # => "cempotur"
# vowel_rotate('oranges')       # => "erongas"
# vowel_rotate('headphones')    # => "heedphanos"
# vowel_rotate('bootcamp')      # => "baotcomp"
# vowel_rotate('awesome')       # => "ewasemo"

def vowel_rotate(str)
  vowels = "aeiou"
  vowels_arr = []
  rotated = ""

  str.each_char do |char|
    if vowels.include?(char)
      vowels_arr << char
    end
  end

  vowels_arr.unshift(vowels_arr.pop) # rotate the vowels

  str.each_char.with_index do |char, idx|
    if vowels.include?(char)
      rotated += vowels_arr.shift
    else
      rotated += char
    end
  end
  return rotated
end


# Proc Problems

# String#select

# Extend the string class by defining a String#select method that accepts a block. The method should return a new string containing characters of the original string that return true when passed into the block. If no block is passed, then return the empty string. Do not use the built-in Array#select in your solution.

# Examples
# "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
# "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
# "HELLOworld".select          # => ""

class String
  def select(&prc)
    new_str = ""
    return "" if !prc
    self.each_char do |char|
      new_str += char if prc.call(char)
    end
    new_str
  end
end

# Extend the string class by defining a String#map! method that accepts a block. The method should modify the existing string by replacing every character with the result of calling the block, passing in the original character and it's index. Do not use the built-in Array#map or Array#map! in your solution.

# Examples

# word_1 = "Lovelace"
# word_1.map! do |ch| 
#     if ch == 'e'
#         '3'
#     elsif ch == 'a'
#         '4'
#     else
#         ch
#     end
# end
# p word_1        # => "Lov3l4c3"

# word_2 = "Dijkstra"
# word_2.map! do |ch, i|
#     if i.even?
#         ch.upcase
#     else
#         ch.downcase
#     end
# end
# p word_2        # => "DiJkStRa"

class String
  def map!(&prc)
    iterator = 0
    while iterator < self.length
      self[iterator] = prc.call(self[iterator],iterator)
      iterator = iterator + 1
    end
  end
end

# Recursion problems

# Write a method multiply(a, b) that takes in two numbers and returns their product.

# You must solve this recursively (no loops!)
# You must not use the multiplication (*) operator

# Examples
# multiply(3, 5)        # => 15
# multiply(5, 3)        # => 15
# multiply(2, 4)        # => 8
# multiply(0, 10)       # => 0
# multiply(-3, -6)      # => 18
# multiply(3, -6)       # => -18
# multiply(-3, 6)       # => -18

def multiply(a, b)
  
  if b == 1
    return a
  end
  
  if b == 0
    return 0
  end
  
  if b < 0 
    multiply(-a,1) + multiply(a, b+1) 
  elsif b > 0
     multiply(a,1) + multiply(a,b-1)
  end
end

# The Lucas Sequence is a sequence of numbers. The first number of the sequence is 2. The second number of the Lucas Sequence is 1. To generate the next number of the sequence, we add up the previous two numbers. For example, the first six numbers of the sequence are: 2, 1, 3, 4, 7, 11, ...

# Write a method lucasSequence that accepts a number representing a length as an arg. The method should return an array containing the Lucas Sequence up to the given length. Solve this recursively.

# Examples
# lucas_sequence(0)   # => []
# lucas_sequence(1)   # => [2]    
# lucas_sequence(2)   # => [2, 1]
# lucas_sequence(3)   # => [2, 1, 3]
# lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]

def lucas_sequence(length)
  if length == 0
    return []
  elsif length == 1
    return [2]
  elsif length == 2
    return [2,1]
  end

 lucas_sequence(length-1) + [lucas_sequence(length-1)[-1]  + lucas_sequence(length-2)[-1]]
end

# The Fundamental Theorem of Arithmetic states that every positive integer is either a prime or can be represented as a product of prime numbers.

# Write a method prime_factorization(num) that accepts a number and returns an array representing the prime factorization of the given number. This means that the array should contain only prime numbers that multiply together to the given num. The array returned should contain numbers in ascending order. Do this recursively.

# Examples
# prime_factorization(12)     # => [2, 2, 3]
# prime_factorization(24)     # => [2, 2, 2, 3]
# prime_factorization(25)     # => [5, 5]
# prime_factorization(60)     # => [2, 2, 3, 5]
# prime_factorization(7)      # => [7]
# prime_factorization(11)     # => [11]
# prime_factorization(2017)   # => [2017]

def prime_factorization(num)

  if prime?(num)
    return [num]
  end

  smallest_fact = smallest_factor(num)

  [smallest_fact] + prime_factorization(num / smallest_fact)
end

def prime?(num)
  (2...num).each do |fact|
    return false if (num % fact).zero?
  end
  true
end

def smallest_factor(num)
  (2..num).each do |fact|
    return fact if (num % fact).zero?
  end
end
