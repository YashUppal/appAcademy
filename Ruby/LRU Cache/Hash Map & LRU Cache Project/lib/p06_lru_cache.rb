require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if !@map.include?(key)
      val = @prc.call(key)
      @store.append(key,val)
      # node = @store[key]
      @map.set(key,@store.last)
      
      if self.count > @max
        self.eject!
      end

      return @store.get(key)
    else
      node = @store[key]
      val = @store.get(key)
      @store.remove(key)
      @store.append(key,val)
      @map.set(key,@store.last)
      return @store.get(key)
    end
  end
  
  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end
  
  private
  
  def calc!(key)
    # suggested helper method; insert an (un-cached) key
  end
  
  def update_node!(node)
    # suggested helper method; move a node to the end of the list
  end
  
  def eject!    
    first_item = @store.first
    @store.remove(first_item.key)
    @map.delete(first_item.key)
  end
end
