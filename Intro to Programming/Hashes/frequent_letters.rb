# Write a method frequent_letters that takes in a string and returns an array containing the characters that appeared more than twice in the string.

def frequent_letters(string)
  
  count_hash = Hash.new(0)
  char_arr = []
  
  string.each_char do |char|
    count_hash[char] += 1
  end
  
  count_hash.each do |key, value|
    if value > 2
      char_arr << key
    end
  end
  
  return char_arr
  
end

print frequent_letters('mississippi') #=> ["i", "s"]
puts
print frequent_letters('bootcamp') #=> []
puts