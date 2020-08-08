class Array
  def my_uniq
    duplicated = []
    self.each do |ele|
      duplicated << ele if !duplicated.include?(ele)
    end
    return duplicated
  end
  
  def two_sum
    pairs = []
    i = 0
    while i < self.length
      j = i
      while j < self.length
        if (self[i] + self[j]).zero? && !(self[i].zero? || self[j].zero?)
          pairs << [i,j]
        end
        j += 1
      end
      i += 1
    end
    return pairs
  end

  
end