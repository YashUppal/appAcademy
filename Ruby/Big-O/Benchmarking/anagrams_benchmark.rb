require 'benchmark'

def anagrams(string)
  if string.length == 2
    return [string, string.reverse]
  end
  
  anagrams = []
  string.each_char do |char|
    anagrams += anagrams(string.delete(char)).map do |sub|
      char + sub
    end
  end
  return anagrams
end

def first_anagram?(first,second)
  # time complexity -> O(n^2)
  # execution time increases with input length

  first_anagrams = anagrams(first)

  return first_anagrams.include?(second)
end

def second_anagram?(first,second)
  # time complexity -> O(n)
  # faster than first_anagram?

  second = second.split("")
  first.each_char do |char|
    second_idx = second.find_index(char)
    break if second_idx.nil?
    second.delete_at(second_idx)
  end
  second.empty?
end

def third_anagram?(first,second)
  # time complexity => O(1)
  # faster than previous two algorithms

  first.split("").sort == second.split("").sort
end

def fourth_anagram?(first,second)

  # time complexity => O(1)
  # fast

  first_hash = Hash.new(0)
  second_hash = Hash.new(0)

  first.each_char do |char|
    first_hash[char] += 1
  end

  second.each_char do |char|
    second_hash[char] += 1
  end

  first_hash == second_hash
end

def fourth_anagram_bonus?(first,second)
  hash = Hash.new(0)

  first.each_char do |char|
    hash[char] += 1
  end

  second.each_char do |char|
    hash[char] += 1
  end

  hash.values.all? { |val| val == 2 }
end

Benchmark.bmbm do |x|
  x.report("first_anagram?:") { first_anagram?("elvis", "lives") }
  x.report("second_anagram?:") { second_anagram?("elvis", "lives") }
  x.report("third_anagram?:") { third_anagram?("elvis", "lives") }
  x.report("fourth_anagram?:") { fourth_anagram?("elvis", "lives") }
  x.report("fourth_anagram_bonus?:") { fourth_anagram_bonus?("elvis", "lives") }
end