def palindrome?(str)
  reversed = ""
  str.each_char {|char| reversed = char + reversed}
  reversed == str
end

def substrings(str)
  i = 0
  subs_arr = []
  while i < str.length
    j = i
    while j < str.length
      subs_arr << str[i..j]
      j += 1
    end

    i += 1
  end
  subs_arr
end

def palindrome_substrings(str)
  substrings(str).select do |subs|
    palindrome?(subs) if subs.length > 1
  end
end