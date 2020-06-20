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

  def starting_point
    maze.each_with_index do |row,row_idx|
      row.each_with_index do |ele,col_idx|
        return [row_idx,col_idx] if ele == "S"
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

  def recur(hash)
    return [] if hash[:loc].instance_of?(Integer)
    [hash[:loc]] + recur(hash[:parent])
  end

  def h_cost(index)
    end_index = find_end
    return ((end_index.first - index.first).abs + (end_index.last - index.last).abs)
  end

  def is_diag(node_1, node_2)
    if (node_2.first - node_1.first).abs == 1 && (node_2.last - node_1.last).abs == 1
      return true
    end
    false
  end


  def search
    node = Hash.new(0)
    node = {
      :loc => self.starting_point,
      :parent => node,
      :g_cost => 0
    }

    # add starting square to fringe
    @open_list.push(node)

    
    # scan nodes around the starting point

    (node[:loc].first-1..node[:loc].first+1).each do |out_idx|
      (node[:loc].last-1..node[:loc].last+1).each do |in_idx|
        if !is_diag([out_idx,in_idx],node[:loc])
          if node[:loc] != [out_idx,in_idx]
            adj_node = Hash.new(0)
            adj_node = {
              :loc => [out_idx, in_idx],
              :parent => @open_list.first,
              :g_cost => 0
            }

            if maze[out_idx][in_idx] != "*"
              if !open_list.include?(adj_node)
                @open_list << adj_node
              end
            end
          end
        end
      end
    end

    # remove starting node from open list
    @open_list.delete(node)
    # add to closed list
    @closed_list.push(node)

    @open_list.each do |adj_node|
      # g cost calc

      if is_diag(adj_node[:loc],node[:loc])
        adj_node[:g_cost] = 14 + adj_node[:parent][:g_cost]
      else
        adj_node[:g_cost] = 10 + adj_node[:parent][:g_cost]
      end

      # H cost calc
      adj_node[:h_cost] = self.h_cost(adj_node[:loc])

      # F cost calc
      adj_node[:f_cost] = adj_node[:h_cost] + adj_node[:g_cost]

    end

    #-------Continuing the search----------------#
    while true
      lowest_f = @open_list.sort_by {|node| node[:f_cost] }.first

      # drop it from open list
      @open_list.delete(lowest_f)

      # add to closed list
      @closed_list.push(lowest_f)

      (lowest_f[:loc].first-1..lowest_f[:loc].first+1).each do |out_idx|
        (lowest_f[:loc].last-1..lowest_f[:loc].last+1).each do |in_idx|
          if !is_diag([out_idx,in_idx], lowest_f[:loc])
            if lowest_f[:loc] != [out_idx,in_idx]
              adj_node = Hash.new(0)
              adj_node = {
                :loc => [out_idx, in_idx],
                :parent => lowest_f,
                :g_cost => 0
              }

              # g cost calc
              if is_diag(adj_node[:loc],lowest_f[:loc])
                adj_node[:g_cost] = 14 + adj_node[:parent][:g_cost]
              else
                adj_node[:g_cost] = 10 + adj_node[:parent][:g_cost]
              end

              # H cost calc
              adj_node[:h_cost] = self.h_cost(adj_node[:loc])

              # F cost calc
              adj_node[:f_cost] = adj_node[:h_cost] + adj_node[:g_cost]

              if maze[adj_node[:loc].first][adj_node[:loc].last] != "*"
                if !@closed_list.any? {|node| node[:loc] == adj_node[:loc]}
                  if !@open_list.any? {|node| node[:loc] == adj_node[:loc]}
                    @open_list.push(adj_node)
                  end
                end
              end
            end
          end
        end
      end
      break if @open_list.any? { |node| node[:loc] == find_end }

    puts
    puts

    end
    path = recur(@open_list.first)
    # removing starting and ending point index
    path.shift
    path.pop
    # reversing to demonstrate from start to end
    path.reverse.each do |step|
      maze[step.first][step.last] = "X"
      self.print_maze
      sleep(1)
    end
    print_maze
  end
end