class MazeSolver

  attr_reader :open_list, :maze, :closed_list

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

  def g_cost
    return 10
  end

  def h_cost(index)
    end_index = find_end
    return ((end_index.first - index.first).abs + (end_index.last - index.last).abs)
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

  def find_end
    @maze.each_with_index do |line,idx_row|
      line.each_with_index do |ele,idx_col|
        if ele == "E" || ele == "e"
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
          :parent => closed_list.last[:current],
          # :parent => open_list.sort_by{ |hash| hash[:f_cost] }.first[:current],
          :g_cost => 0,
          :f_cost => 0,
          :h_cost => 0
          }

        if maze[outer_idx][inner_idx] != "*" && !closed_list.any? {|hash| hash[:current] == adjacent_node_hash[:current]}
          if !open_list.include?(adjacent_node_hash)
            if [outer_idx, inner_idx] != node_index

              # adjacent_node_hash[:h_cost] = (self.h_cost([outer_idx, inner_idx]) + adjacent_node_hash[:g_cost])*10
              adjacent_node_hash[:h_cost] = (self.h_cost([outer_idx, inner_idx]))*10

              if is_diag(node_index,[outer_idx,inner_idx])
                # adjacent_node_hash[:g_cost] = closed_list.last[:g_cost] + (1.4 * g_cost).to_int
                # adjacent_node_hash[:g_cost] = node_hash[:g_cost] + (g_cost * 1.4).to_int
                adjacent_node_hash[:g_cost] = node_hash[:g_cost] + (g_cost * 1.4).to_int
              else
                # adjacent_node_hash[:g_cost] = closed_list.last[:g_cost] + g_cost
                adjacent_node_hash[:g_cost] = node_hash[:g_cost] + g_cost
              end
                
              
              if !is_diag(node_index,[outer_idx,inner_idx])
                open_list << adjacent_node_hash
              end
            end
          end
        end
        # open_list << adjacent_node_hash if !open_list.include?(adjacent_node_hash)
      end
    end

    @open_list.each do |hash|
      hash[:f_cost] = hash[:g_cost] + hash[:h_cost]
    end

  end



  def find_123path
    start = {
      :current => [],
      :parent => [],
      :g_cost => 0,
      :f_cost => 0,
      :h_cost => 0
    }

    start[:current] = self.find_start
    start[:parent] = start[:current]

    while true

    open_list.unshift(start)
    
    
    @closed_list.push(@open_list.shift)

    scan_around(start)


    @open_list.each do |hash|
      hash[:f_cost] = hash[:g_cost] + hash[:h_cost]
    end

    # @open_list = @open_list.sort_by { |hash| hash[:f_cost] }
    start = @open_list.sort_by { |hash| hash[:f_cost] }.first

    puts
    puts
    p open_list
    puts
    puts

    # start = @open_list.first
    @open_list = []
    # @open_list.unshift(start)
    # @closed_list.push(@open_list.shift)

    puts
    puts
    # p @closed_list
    print 


    maze[start[:current].first][start[:current].last] = "X"

    self.print_maze



    sleep(1)
    end
  end

  def find_path

    start = {
      :current => [],
      :parent => [],
      :g_cost => 0,
      :f_cost => 0,
      :h_cost => 0
    }

    start[:current] = self.find_start
    start[:parent] = start[:current]
    @open_list.unshift(start)

    #repeat
    while true
    self.print_maze
    # current_node = @open_list.sort_by {|hash| hash[:f_cost]}.first
    @open_list = @open_list.sort_by {|hash| hash[:f_cost]}
    current_node = @open_list.first

    @open_list = []
    

    @open_list.delete(current_node)
     @closed_list << current_node
    scan_around(current_node)    
   
    maze[current_node[:current].first][current_node[:current].last] = "X"
    puts @open_list
    puts
    puts @closed_list
    break if @closed_list.any? { |hash| hash[:current] == find_end }

    sleep(0.5)
    end

  end



end




