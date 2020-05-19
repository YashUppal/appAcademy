# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array

  # PART 1

  def span
    return nil if self.empty?
    self.max - self.min
  end
  
  def average
    return nil if self.empty?
    self.sum.to_f / self.length
  end

  def median
    # return self.sort[self.length/2] if self.length.odd?
    return nil if self.empty?
    self.length.odd? ? self.sort[self.length/2] : self.sort[(self.length/2)-1..(self.length/2)].sum / 2.0

    # Expanded
    # if self.length.odd?
    #   return self.sort[self.length/2]
    # else
    #   mid_ele = self.sort[(self.length/2)-1..(self.length/2)]
    #   return mid_ele.sum / 2.0
    # end
  end

  def counts
    count_hash = Hash.new(0)
    self.each do |ele|
      count_hash[ele] += 1
    end
    count_hash
  end

  # PART 2

  def my_count(value)
    count = 0
    self.each do |ele|
      count += 1 if ele == value
    end
    count
  end

  def my_index(value)
    value_idx = nil
    self.each_with_index do |ele, idx|
      return value_idx = idx if ele == value # will return index of value of first occurence, which will be smallest index
    end
    return value_idx
  end

  def my_uniq
    unique_arr = Array.new # => unique_arr = []
    self.each do |ele|
      unique_arr << ele if !(unique_arr.include?(ele))
    end
    unique_arr
  end

  def my_transpose
    transposed = Array.new(self.length) { Array.new }

    outer_iterator = 0
    while outer_iterator < self.length
      inner_iterator = 0

      while inner_iterator < self.length
        transposed[outer_iterator] << self[inner_iterator][outer_iterator]

        inner_iterator += 1
      end

      outer_iterator += 1
    end
    transposed
  end
  
end
