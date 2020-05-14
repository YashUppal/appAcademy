def average(num1,num2)
  (num1 + num2)/2.0
end

def average_array(num_arr)
  num_arr.sum / (num_arr.length).to_f
end

def repeat(str, num)
  # repeated = ""
  # num.times { repeated += str }
  # repeated

  str * num # refactor
end

def yell(str)
  str.upcase + "!"
end

def alternating_case(sentence)
  sentence.split.map.with_index do |ele, idx|
    idx % 2 == 0 ? ele.upcase : ele.downcase
  end.join(" ")
end