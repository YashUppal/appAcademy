class Array
  def my_each(&blck)
    iterator = 0
    while iterator < self.length
      blck.call(self[iterator])
      iterator += 1
    end
    self
  end

  def my_select(&blck)
    selected = []
    self.my_each do |num|
      selected << num if blck.call(num)
    end
    selected
  end

  def my_reject(&blck)
    iterator = 0
    rejected = []
    while iterator < self.length
      rejected << self[iterator] if !(blck.call(self[iterator]))
      iterator += 1
    end
    rejected
  end

  def my_any?(&blck)
    iterator = 0
    while iterator < self.length
      return true if blck.call(self[iterator])
      iterator += 1
    end
    false
  end

  def my_all?(&blck)
    iterator = 0
    while iterator < self.length
      return false if !blck.call(self[iterator])
      iterator += 1
    end
    true
  end

  def my_flatten
    return [] if self == []
    last_ele = self[-1]
    if !last_ele.instance_of?(Array)
      return self[0...-1].my_flatten + [last_ele]
    end
    
    self[0...-1].my_flatten + self[-1].my_flatten
  end

  def my_zip(*args)
    outer_iterator = 0
    zipped = []
    while outer_iterator < self.length
      subzip = []
      subzip << self[outer_iterator]
      inner_iterator = 0
      while inner_iterator < args.length
        subzip << args[inner_iterator][outer_iterator]
        inner_iterator += 1
      end
      zipped << subzip
      outer_iterator += 1
    end
    zipped
  end

  def my_rotate(amt=1)
    rotated = Array.new(self)

    if amt < 0
      amt.abs.times do
        rotated = rotated[-1..-1] + rotated[0...-1]
      end
    else
      amt.times do 
        rotated = rotated[1..-1] + rotated[0..0]
      end
    end
    rotated
  end

  def my_join(separator="")
    iterator = 0
    joined_string = ""
    while iterator < self.length
      
      joined_string = joined_string + self[iterator]
      break if iterator == self.length-1
      joined_string += separator

      iterator += 1
    end
    return joined_string
  end

  def my_reverse
    reversed = []
    iterator = self.length-1
    while iterator >= 0
      reversed << self[iterator]
      iterator -= 1
    end
    reversed
  end
end
