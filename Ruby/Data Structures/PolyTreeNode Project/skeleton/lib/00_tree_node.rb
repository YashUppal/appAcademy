class PolyTreeNode
  attr_reader :parent, :children, :value

  def initialize(value)
    @value = value
    @parent = nil
    @children = Array.new
  end

  def parent=(new_parent)
    if new_parent.nil?
      @parent = new_parent
      return
    else
      unless new_parent.children.include?(self)
        @parent.children.delete(self) if !@parent.nil?
        @parent = new_parent
        new_parent.children << self if !new_parent.nil?
      end
    end
  end

  def add_child(child_node)
    @children << child_node
    child_node.parent = self
  end

  def remove_child(child_node)
    if child_node.parent.nil?
      raise "Not a child node"
    end
    @children.delete(child_node)
    child_node.parent = nil
  end

  def dfs(target_value)
    found = nil
    if self.value == target_value
      return self
    else
      self.children.each do |child_node|
        found = child_node.dfs(target_value)
        return found if found
      end
    end
    return found
  end

  def bfs(target_value)
    queue = Array.new
    queue.push(self)

    until queue.empty?
      popped = queue.shift
      if popped.value == target_value
        return popped
      else
        popped.children.each do |child_node|
          queue.push(child_node)
        end
      end
    end
  end
end
