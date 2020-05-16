# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.



require 'byebug'

# returns true if a num is prime, false otherwise
def is_prime?(num)
  (2...num).each do |div|
    if num % div == 0
      return false
    end
  end
  return true
end

# returns largest prime factor of a num
def largest_prime_factor(num)
  # debugger
  iterator = num
  while iterator > 0
    if num % iterator == 0 && is_prime?(iterator)
      return iterator
    end
    iterator = iterator - 1
  end
end

# returns true if passed string has unique chars, false otherwise
def unique_chars?(str)
  str.split("").uniq == str.split("")
end

def dupe_indices(arr)

  dupe_hash = {}
  # debugger
  arr.each_with_index do |ele, idx|
    dupe_hash[ele] = []
  end

  arr.each_with_index do |ele, idx|
    dupe_hash[ele] << idx
  end
  
  only_dupes = {}

  dupe_hash.each do |key, value|
    only_dupes[key] = value if value.length > 1
  end
  
  return only_dupes

end


def ana_array(arr_1, arr_2)
  # (arr_1 + arr_2).uniq.each do |ele|
  #   # return false if !(arr_1.include?(ele)) || !(arr_2.include?(ele))
  #   return false if !(arr_1.include?(ele) && (arr_2.include?(ele))) # return false, if either array has uncommon element.
  # end
  # true

  hash_1 = Hash.new(0)
  hash_2 = Hash.new(0)

  arr_1.each do |ele|
    hash_1[ele] += 1
  end

  arr_2.each do |ele|
    hash_2[ele] += 1
  end

  hash_1 == hash_2
end

# ["cat", "dog", "cat"], ["dog", "cat", "mouse"]