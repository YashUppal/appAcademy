# Write a method abbreviate_sentence that takes in a sentence string and returns a new sentence where every word longer than 4 characters has all of it's vowels removed.

def abbreviate_sentence(sent)
  vowels = "aeiou"
  abb_sent = []
  
  sent.split.each do |word|
    if word.length > 4
      word.each_char.with_index do |char,idx|
        if vowels.include?(char)
          word[idx] = " "
        end
      end
    end
    abb_sent << word.split.join
  end
  return abb_sent.join(" ")
end

puts abbreviate_sentence("follow the yellow brick road") # => "fllw the yllw brck road"
puts abbreviate_sentence("what a wonderful life")        # => "what a wndrfl life"