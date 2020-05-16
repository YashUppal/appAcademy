def select_even_nums(nums)
  nums.select(&:even?) # convert 'even?' method to object using &
end

def reject_puppies(dog_hash_arr)
  dog_hash_arr.reject { |hash| hash["age"] <= 2 }
end

def count_positive_subarrays(arr)
  arr.count { |arr| arr.sum > 0 }
end

def aba_translate(str)
  translated = ""
  vowels = "aeiou"
  str.each_char do |char|
    if vowels.include?(char)
      translated += char + "b" + char
    else
      translated += char
    end
  end
  translated
end

def aba_array(words)
  words.map { |word| aba_translate(word)}
end