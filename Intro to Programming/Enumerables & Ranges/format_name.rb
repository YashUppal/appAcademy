# Write a method format_name that takes in a name string and returns the name properly capitalized.

# Hint: use str.upcase and str.downcase
# "abc".upcase # => "ABC"

def format_name(str)
  
  formatted_name = []
  
  str.split.each do |word|
    formatted_word = word.downcase
    formatted_word[0] = formatted_word[0].upcase
    formatted_name.push(formatted_word)
  end
  return formatted_name.join(" ")
end

puts format_name("chase WILSON") # => "Chase Wilson"
puts format_name("brian CrAwFoRd scoTT") # => "Brian Crawford Scott"