class PolyTreeNode

  attr_reader :value, :parent, :children
  # attr_writer :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = Array.new
  end

  def parent=(parent_node)
    if !parent_node.nil?
      if !@parent.nil?
        @parent.children.delete(self)
      end
      parent_node.children << self if !parent_node.children.include?(self)
    end
    @parent = parent_node
  end

  def add_child(child_node)
    child_node.parent=(self)
  end

  def remove_child(child_node)
    raise if child_node.parent.nil?
    child_node.parent=(nil)
  end

  def dfs(val)
    return self if @value == val
    found = nil
    self.children.each do |child_node|
      found = child_node.dfs(val)
      return found if !found.nil?
    end
    return found
  end

  def bfs(val)
    queue = Array.new
    queue << self

    while !queue.empty?
      shifted = queue.shift
      if shifted.value == val
        return shifted
      else
        queue += shifted.children
      end
    end

  end

end