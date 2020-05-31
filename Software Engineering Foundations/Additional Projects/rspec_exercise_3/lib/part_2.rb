def element_count(arr)
  counter_hash = Hash.new(0)
  arr.each do |ele|
    counter_hash[ele] += 1
  end
  counter_hash
end

def  char_replace!(str,hash)
  str.each_char.with_index do |char, idx|
    if hash.has_key?(char)
      str[idx] = hash[char]
    end
  end
  str
end

def product_inject(nums)
  nums.inject do |acc, ele|
    acc * ele
  end
end