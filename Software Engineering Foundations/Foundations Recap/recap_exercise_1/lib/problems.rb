# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
def all_vowel_pairs(words)
	
	# could have used .all? method for checking all vowels are included in the pair

	vowels = ["a","e","i","o","u"]
	hash_arr = Array.new
	pairs = []

	words.each do |word|
		vowel_hash = Hash.new(0)
		word.each_char do |char|
			vowel_hash[char] += 1 if vowels.include?(char)
		end
		hash_arr << vowel_hash
	end

	i = 0
	while i < hash_arr.length
		j = i
		while j < hash_arr.length
			merged = hash_arr[i].merge(hash_arr[j])
			pairs << "#{words[i]} #{words[j]}" if merged.keys.uniq.sort == vowels
			j += 1
		end
		i += 1
	end
	pairs
end


# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
	(2...num).any? { |fact| (num % fact).zero? }
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
	bigrams.select do |bigram|
		bigram if str.include?(bigram)
	end
end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
			prc ||= Proc.new { |key, value| key == value }
			new_hash = Hash.new

			self.each do |key, value|
				new_hash[key] = value if prc.call(key,value)
			end
			new_hash
    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
		def substrings(length = nil)
				substrings = []
				
				i = 0
				while i < self.length
					j = i
					while j < self.length
						substrings << self[i..j]
						j += 1
					end
					i += 1
				end

				if length # length has default value 'nil' which is falsey.
					return (substrings.select { |subs| subs.length == length})
				else
					return substrings
				end
				
    end


    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
		def caesar_cipher(num)
			alphabets = ("a".."z").to_a
			cipherd = ""
			self.each_char do |char|
				cipherd += alphabets[(alphabets.index(char) + num) % 26]
			end
			cipherd
    end
end
