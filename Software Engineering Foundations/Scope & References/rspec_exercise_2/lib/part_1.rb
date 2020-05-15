def partition(arr,num)

  # partition_arr = Array.new(2)
  # partition_arr[0] = arr.select { |ele| ele < num }
  # partition_arr[-1] = arr.select { |ele| ele >= num }
  # partition_arr

  # concise
  [arr.select { |ele| ele < num}, arr.select { |ele| ele >= num }]

end

def merge(hash1, hash2)
  merged_hash = {}

  hash1.each do |key, value|
    merged_hash[key] = value
  end

  # hash1 key-value pair will be overwritted by hash2 key-value pair
  hash2.each do |key, value|
    merged_hash[key] = value
  end

  return merged_hash
end


def censor(sent,curse)
  sent.split.map do |word|
    if curse.include?(word.downcase)
      vowel_replace(word)
    else
      word
    end
  end.join(" ")
end

def vowel_replace(curse_word)
  vowels = "aeiouAEIOU"
  curse_word.each_char.with_index do |char, idx|
    if vowels.include?(char)
      curse_word[idx] = "*"
    end
  end
  curse_word
end

def power_of_two?(num)
  powers = []
  i = 1
  while i <= num
    powers << i
    i = i * 2
  end
  powers.include?(num)
end