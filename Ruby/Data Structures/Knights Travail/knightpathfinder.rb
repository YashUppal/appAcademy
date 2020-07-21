require_relative 'skeleton/lib/00_tree_node.rb'

class KnightPathFinder

  attr_reader :root_node, :considered_positions
  attr_writer :considered_positions

  def self.valid_moves(pos)
    x,y = pos
    valid_moves = []

    [-2,-1,1,2].each do |num|
      if num.abs == 1
        valid_moves << [x+num,y-2]
        valid_moves << [x+num,y+2]
      elsif num.abs == 2
        valid_moves << [x+num,y-1]
        valid_moves << [x+num,y+1]
      end
    end
    return self.within_board(valid_moves)
  end

  def self.within_board(moves)
    moves.select do |idx|
      x,y = idx
      idx if (x < 8 && x >= 0) && (y < 8 && y >= 0)
    end
  end

  def initialize(pos)
    @root_node = PolyTreeNode.new(pos)
    @considered_positions = [pos]
    self.build_move_tree
  end

  def new_move_positions(pos)
    move_positions = KnightPathFinder.valid_moves(pos)
    filtered =  move_positions.reject do |position|
      position if self.considered_positions.include?(position)
    end
    self.considered_positions += filtered
    return filtered
  end

  def build_move_tree
    queue = []
    queue << self.root_node

    while !queue.empty?
      popped = queue.shift
      nodes = self.new_move_positions(popped.value).map { |pos| PolyTreeNode.new(pos) }
      nodes.each do |node|
        popped.add_child(node)
      end
      queue += popped.children
    end
  end

  def find_path(end_pos)
    self.trace_path_back(self.root_node.bfs(end_pos))
  end

  def trace_path_back(node)
    values = []

    while !node.nil?
      values.unshift(node.value)
      node = node.parent
    end

    values
  end
end