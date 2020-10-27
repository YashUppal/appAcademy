class MaxIntSet

  attr_reader :store

  def initialize(max)
    @max = max
    @store = Array.new(max,false)
  end

  def insert(num)
    if !(0...@max).to_a.include?(num)
      raise "Out of bounds"
    end
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    idx = num % 20
    @store[idx] << num
  end

  def remove(num)
    idx = num % 20
    @store[idx].delete(num)
  end

  def include?(num)
    idx = num % 20
    @store[idx].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)

    if num > (num % self.num_buckets)
      self.resize!
    end

    idx = num % self.num_buckets
    if !@store[idx].include?(num)
      @store[idx] << num
      @count += 1
    end

  end

  def remove(num)
    idx = num % self.num_buckets
    if @store[idx].include?(num)
      @store[idx].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    idx = num % self.num_buckets
    @store[idx].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_buckets = Array.new(2 * self.num_buckets) { Array.new }
    @store.each do |bucket|
      bucket.each do |num|
        idx = num % (2 * self.num_buckets)
        new_buckets[idx] << num
      end
    end
    @store = new_buckets
  end

end
