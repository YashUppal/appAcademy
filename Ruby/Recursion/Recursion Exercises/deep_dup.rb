class Array
  def deep_dup

    return self.dup if self.length == 1

    deep_duped = Array.new
    
    self.each do |ele|
      if ele.is_a?(Array)
        deep_duped << ele.deep_dup
      else
        deep_duped << ele
      end
    end
    return deep_duped
  end
end
