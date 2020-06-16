class MazeSolver
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



end




