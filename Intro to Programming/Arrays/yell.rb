# # Write a method yell(words) that takes in an array of words and returns a
# new array where every word from the original array has an exclamation point after it.

def yell(words)
  yell_arr  = [] 
  iterator = 0
  
  while iterator < words.length
    yell_arr << words[iterator] + "!"
    iterator = iterator + 1
  end
  return yell_arr
end

print yell(["hello", "world"]) # => ["hello!", "world!"]
puts
print yell(["code", "is", "cool"]) # => ["code!", "is!", "cool!"]
puts
print yell(["BOHEMIA","is","a","legend"])