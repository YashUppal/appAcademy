def zip(*args)
  zipped = []
  outer_iterator = 0
  while outer_iterator < args.first.length
    inner_iterator = 0
    zip = []
    while inner_iterator < args.length
      zip << args[inner_iterator][outer_iterator]
      inner_iterator += 1
    end
    zipped << zip
    outer_iterator += 1
  end
  zipped
end

def prizz_proc(arr, prc1, prc2)
  new_arr = []
  arr.each do |ele|
    new_arr << ele if (prc1.call(ele) || prc2.call(ele)) && !(prc1.call(ele) && prc2.call(ele))
  end
  new_arr
end

def zany_zip(*args)
  zany_zipped = []
  outer_iterator = 0
  longest_array_length = 0
  args.each do |ele|
    if ele.length > longest_array_length
      longest_array_length = ele.length
    end
  end
  # p longest_array_idx

  while outer_iterator < longest_array_length
    zip = []
    inner_iterator = 0
    while inner_iterator < args.length
      zip << args[inner_iterator][outer_iterator]
      inner_iterator += 1
    end
    zany_zipped << zip
    outer_iterator += 1
  end
  zany_zipped
end

def maximum(arr, &prc)
  arr.inject do |acc, ele|
    if prc.call(acc) > prc.call(ele)
      acc
    else
      ele
    end
  end
end

def my_group_by(arr, &prc)
  grouped_hash = Hash.new { |hash,key| hash[key] = Array.new }
  arr.each do |ele|
    grouped_hash[prc.call(ele)] << ele
  end
  grouped_hash
end

def max_tie_breaker(arr, prc, &blck)
  arr.inject do |acc, ele|
    if blck.call(acc) == blck.call(ele)
      if prc.call(acc) == prc.call(ele)
        acc
      elsif prc.call(acc) > prc.call(ele)
        acc
      else
        ele
      end
    elsif blck.call(acc) > blck.call(ele)
      acc
    else
      ele
    end
  end
end

VOWELS = "aeiou"

def silly_syllables(sent)

  new_sentence = []
  sent.split.each do |word|
    if count_vowels(word) >= 2
      start_idx = first_vowel_idx(word)
      end_idx = last_vowel_idx(word)
      new_sentence << word[start_idx..end_idx]
    else
      new_sentence << word
    end
  end
  new_sentence.join(" ")
end

def count_vowels(word)
  count = 0
  word.each_char do |char|
    if VOWELS.include?(char)
      count += 1
    end
  end
  count
end

def first_vowel_idx(word)
  word.each_char.with_index do |char, idx|
    return idx if VOWELS.include?(char)
  end
end

def last_vowel_idx(word)
  vowel_index = 0
  word.each_char.with_index do |char, idx|
    vowel_index = idx if VOWELS.include?(char)
  end
  vowel_index
end