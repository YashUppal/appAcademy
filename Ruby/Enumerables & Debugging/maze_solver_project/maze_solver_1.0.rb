class MazeSolver

  attr_reader :open_list, :maze

  def initialize(maze)
    @maze = Array.new(maze)
    @open_list = Array.new
    @closed_list = Array.new
  end

  def translate
    @maze.each_with_index do |line,idx|
      @maze[idx] = line.split("")
    end
    true
  end

  def print_maze
    @maze.each do |line|
      puts line.join("")
    end
    true
  end

  def find_start
    @maze.each_with_index do |line,idx_row|
      line.each_with_index do |ele,idx_col|
        if ele == "S" || ele == "s"
          return [idx_row,idx_col]
        end
      end
    end
    false
  end

  def g_score(node_index)

  end

  def is_diag(node_1, node_2)
    if (node_2.first - node_1.first).abs == 1 && (node_2.last - node_1.last).abs == 1
      return true
    end
    false
  end


  def scan_around(node_hash)
    node_index = []
    node_index << node_hash[:current].first
    node_index << node_hash[:current].last
    
    (node_index.first-1..node_index.first+1).each do |outer_idx|
      (node_index.last-1..node_index.last+1).each do |inner_idx|
        # print [outer_idx,inner_idx]
        # puts
        adjacent_node_hash = {
          :current => [outer_idx,inner_idx],
          :parent => open_list.first[:parent]
          }

        if is_diag(node_index,[outer_idx,inner_idx])
          # print [outer_idx, inner_idx]
          adjacent_node_hash[]
        end
        

        if maze[outer_idx][inner_idx] != "*"
          if !open_list.include?(adjacent_node_hash)
            open_list << adjacent_node_hash
          end
        end
        # open_list << adjacent_node_hash if !open_list.include?(adjacent_node_hash)
      end
    end
  end

  def find_path

    start = {
      :current => [],
      :parent => [],
      :g_cost => 0
    }

    start[:current] = self.find_start
    start[:parent] = start[:current]

    open_list << start
    
    scan_around(start)

    # p @open_list
    # @closed_list.push(@open_list.shift)
    # @close_list << @open_list.delete(start)
    # p @open_list
  end



end




