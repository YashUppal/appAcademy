require_relative 'p04_linked_list'

class HashMap
  include Enumerable

  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    idx = self.index_calc(key)
    return @store[idx].include?(key)
  end

  def set(key, val)
    
    idx = self.index_calc(key)
    if @store[idx].include?(key)
      @store[idx].update(key,val)
    else
      if @count == self.num_buckets
        self.resize!
      end
      @store[idx].append(key,val)
      @count += 1
    end

  end

  def get(key)
    idx = self.index_calc(key)
    @store[idx].get(key)
  end

  def delete(key)
    idx = self.index_calc(key)
    @store[idx].remove(key)
    @count -= 1
  end

  def each
    @store.each do |bucket|
      bucket.each do |node|
        yield(node.key,node.val)
      end
    end 
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_buckets = Array.new(2*num_buckets) { LinkedList.new }

    @store.each do |bucket|
      bucket.each do |node|
        key,val = node.key,node.val
        idx = key.hash % (2*self.num_buckets)
        if new_buckets[idx].include?(key)
          new_buckets[idx].update(key,val)
        else
          new_buckets[idx].append(key,val)
        end
      end
    end

    @store = new_buckets
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
    idx = key.hash % self.num_buckets
    return store[idx]
  end

  def index_calc(key)
    return key.hash % self.num_buckets
  end
end
