def reverser(str, &block)
  # new_str = ""
  block.call(str.reverse)
end

def word_changer(sentence, &block)
  new_sentence = []
  sentence.split.each do |word|
    new_sentence << block.call(word)
  end
  new_sentence.join(" ")
end

def greater_proc_value(num, prc1, prc2)
  [prc1.call(num),prc2.call(num)].max
end

def and_selector(arr, prc1, prc2)
  new_arr = Array.new
  arr.each do |ele|
    new_arr << ele if prc1.call(ele) && prc2.call(ele)
  end
  new_arr
end

def alternating_mapper(arr, prc1, prc2)
  new_arr = []
  arr.each_with_index do |ele, idx|
    idx.even? ? new_arr << prc1.call(ele) : new_arr << prc2.call(ele)
  end
  new_arr
end