class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    return self.join.bytes.join.to_i.hash
  end
end

class String
  def hash
    return self.bytes.join.to_i.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    # return self.to_a.sort.join.bytes.join.to_i.hash
    return self.to_a.sort.hash
  end
end
