class StaticArray
  attr_reader :store

  def initialize(capacity)
    @store = Array.new(capacity)
  end

  def [](i)
    validate!(i)
    self.store[i]
  end

  def []=(i, val)
    validate!(i)
    self.store[i] = val
  end

  def length
    self.store.length
  end

  private

  def validate!(i)
    raise "Overflow error" unless i.between?(0, self.store.length - 1)
  end
end

class DynamicArray
  include Enumerable
  attr_accessor :count

  def initialize(capacity = 8)
    @store = StaticArray.new(capacity)
    @count = 0
  end

  def [](i)
    if i < 0
      i = self.count + i
    end

    if (i.between?(-Float::INFINITY,-1))
      return nil
    end

    @store[i]
  end

  def []=(i, val)

    if i > self.capacity
      self.resize!
    end
    
    if i < 0
      i = self.count + i
    end

    if (i.between?(-Float::INFINITY,-1))
      return nil
    end

    @store[i] = val
  end

  def capacity
    @store.length
  end

  def include?(val)
    i = 0
    while i < self.count
      return true if @store[i] == val
      i += 1
    end
    return false
  end

  def push(val)
    if self.capacity == self.count
      self.resize!
    end
    
    @store[self.count] = val
    @count += 1
  end

  def unshift(val)

    if self.capacity-1 == self.count
      self.resize!
    end

    unshifted = StaticArray.new(self.capacity)
    unshifted[0] = val

    i = 1
    while i < self.capacity
      unshifted[i] = @store[i-1]
      i += 1
    end
    @count += 1

    @store = unshifted
    
  end

  def pop

    if self.count.zero?
      return nil
    end

    popped = @store[self.count-1]
    @store[self.count-1] = nil
    @count -= 1
    return popped
  end

  def shift
    shifted = @store[0]
    @store[0] = nil
    i = 1
    while i < self.capacity
      @store[i-1] = @store[i]
      i += 1
    end
    @count -= 1
    return shifted
  end

  def first
    return @store[0]
  end

  def last
    return @store[self.count-1]
  end

  def each
    i = 0
    while i < self.count
      yield(@store[i])
      i += 1
    end
  end

  def to_s
    "[" + inject([]) { |acc, el| acc << el }.join(", ") + "]"
  end

  def ==(other)
    return false unless [Array, DynamicArray].include?(other.class)
    # ...
    i = 0
    while i < self.count
      return false if other[i] != @store[i]
      i += 1
    end
    return true
  end

  alias_method :<<, :push
  [:length, :size].each { |method| alias_method method, :count }

  private

  def resize!
    new_store = StaticArray.new(2 * self.capacity)
    i = 0
    self.each do |val|
      new_store[i] = val
      i += 1
    end
    @store = new_store
  end
end
