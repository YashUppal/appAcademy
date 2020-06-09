# Write a method that takes in a string and returns the number of times that the same letter repeats twice in a row.

def double_letter_count(string)
  char_prev = ""
  consec_count = 0
  string.each_char do |char|
    if char == char_prev
      consec_count += 1
    end
    char_prev = char
  end
  return consec_count
end

puts double_letter_count("the jeep rolled down the hill") #=> 3
puts double_letter_count("bootcamp") #=> 1