# Write a method same_char_collapse that takes in a string and returns a collapsed version of the string. To collapse the string, we repeatedly delete 2 adjacent characters that are the same until there are no such adjacent characters. If there are multiple pairs that can be collapsed, delete the leftmost pair. For example, we take the following steps to collapse "zzzxaaxy": zzzxaaxy -> zxaaxy -> zxxy -> zy

def same_char_collapse(str)
  to_collapse = str
  while(collapsible(to_collapse))
    to_collapse = collapse(to_collapse)
  end
  return to_collapse
end

def collapsible(str)
  str.each_char.with_index do |char, idx|
    if str[idx] == str[idx+1]
      return true
    end
  end
  return false
end

def collapse(str)
  char_arr = str.split("")
  char_arr.each_with_index do |char, idx|
    if char_arr[idx] == char_arr[idx+1]
      char_arr[idx] = ""
      char_arr[idx+1] = ""
    end
  end
  return char_arr.join("")
end

puts same_char_collapse("zzzxaaxy")   #=> "zy"
# because zzzxaaxy -> zxaaxy -> zxxy -> zy


puts same_char_collapse("uqrssrqvtt") #=> "uv"
# because uqrssrqvtt -> uqrrqvtt -> uqqvtt -> uvtt -> uv