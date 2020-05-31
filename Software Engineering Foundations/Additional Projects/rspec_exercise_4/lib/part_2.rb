def proper_factors(num)
  factors = []
  (1...num).each do |fact|
    factors << fact if (num % fact).zero?
  end
  return factors
end

def aliquot_sum(num)
  # proper_factors(num).sum
  proper_factors(num).inject do |acc, ele|
    acc + ele
  end
end

def perfect_number?(num)
  num == aliquot_sum(num)
end

def ideal_numbers(n)
  ideal_nums = []
  iterator = 1
  while ideal_nums.length < n
    ideal_nums << iterator if perfect_number?(iterator)
    iterator += 1
  end
  ideal_nums
end