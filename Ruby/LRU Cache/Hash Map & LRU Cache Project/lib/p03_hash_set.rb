class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    key_hash = key.hash
    idx = key_hash % self.num_buckets

    if @store[idx].length >= 1
      self.resize!
    end

    if !@store[idx].include?(key)
      @store[idx] << key
      @count += 1
    end
  end

  def include?(key)
    key_hash = key.hash
    idx = key_hash % self.num_buckets
    @store[idx].include?(key)
  end

  def remove(key)
    key_hash = key.hash
    idx = key_hash % num_buckets
    if @store[idx].include?(key)
      @store[idx].delete(key)
      @count -= 1
    end
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
      bucket.each do |val|
        val_hash = val.hash
        new_idx = val_hash % (2 * num_buckets)
        new_buckets[new_idx] << val
      end
    end
    @store = new_buckets
    print @store
  end
end
