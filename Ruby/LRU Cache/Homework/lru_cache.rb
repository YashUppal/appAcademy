class LRUCache

  attr_reader :cache
  attr_writer :cache

  def initialize(size)
    @cache = Array.new(size)
  end

  def count
    # returns number of elements currently in cache
    self.cache.compact.length
  end

  def add(el)
    # adds element to cache according to LRU principle
    if self.exists?(el)
      @cache.delete(el)
      @cache.unshift(el)
    else
      @cache.pop
      @cache.unshift(el)
    end
    return 0
  end

  def show
    # shows the items in the cache, with the LRU item first
    self.cache.reverse
  end

  private
  # helper methods go here!

  def exists?(element)
    if self.cache.include?(element)
      return true
    end
    return false
  end
end