class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    return @head.next
  end

  def last
    return @tail.prev
  end

  def empty?
    (@head.next == @tail && @tail.prev == @head)
  end

  def get(key)
    self.each do |node|
      if node.key == key
        return node.val
      end
    end
  end

  def include?(key)
    self.each do |node|
      if node.key == key
        return true
      end
    end
    return false
  end

  def append(key, val)
    new_node = Node.new(key,val)
    self.last.next = new_node
    new_node.next = @tail
    new_node.prev = self.last
    @tail.prev = new_node
    # @head.next = new_node
    # new_node.next = @tail
    # @tail.prev = new_node
    
  end

  def update(key, val)
    self.each do |node|
      if node.key == key
        node.val = val
      end
    end
  end

  def remove(key)
    self.each do |node|
      if node.key == key
        node.val = nil
        node.prev.next = node.next
        node.next.prev = node.prev
      end
    end
  end

  def each
    current_node = self.first
    while true
      break if current_node.next.nil?
      yield(current_node)
      current_node = current_node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
