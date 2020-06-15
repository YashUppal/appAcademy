def translate_maze(maze)
  traversable_maze = Array.new
  maze.each do |line|
    traversable_maze << line.split("")
  end
  traversable_maze
end

def print_maze(maze)
  maze.each do |line|
    print line.join("")
    puts
  end
end

def og_start(maze)
  $og_start = find_start(maze)
end

def find_start(maze)
  start_index = []
  maze.each_with_index do |line,line_idx|
    start_index = [line_idx,line.index("S")] if line.index("S")
  end
  start_index
end

def find_end(maze)
  end_idx = []
  maze.each_with_index do |line, line_idx|
    end_idx = [line_idx,line.index("E")] if line.index("E")
  end
  end_idx
end

def delta_close(index,maze)
  end_index = find_end(maze)

  return 0 if index.first == 0 && index.last == 0

  return Math.sqrt(((end_index.first - index.first)**2 + (end_index.last - index.last)**2))
end

def sense_up(start_index,maze)
  y_index = start_index.first
  x_index = start_index.last
  while true
    break if (maze[y_index][x_index]) == "*" || (maze[y_index][x_index]) == "E"
    y_index -= 1
  end
  # Prev index is returned
  return [y_index+1,x_index]
end

def sense_right(start_index,maze)
  y_index = start_index.first
  x_index = start_index.last
  while true
    break if (maze[y_index][x_index]) == "*" || (maze[y_index][x_index]) == "E"
    x_index += 1
  end
  return [y_index,x_index-1]
end

def sense_down(start_index,maze)
  y_index = start_index.first
  x_index = start_index.last
  while true
    break if (maze[y_index][x_index]) == "*" || (maze[y_index][x_index]) == "E"
    y_index += 1
  end
  return [y_index-1, x_index]
end

def sense_left(start_index,maze)
  y_index = start_index.first
  x_index = start_index.last
  while true
    break if maze[y_index][x_index] == "*" || (maze[y_index][x_index]) == "E"
    x_index -= 1
  end
  return [y_index,x_index+1]
end 

def opposite(input)
  case input
  when "sense_up"
    return "sense_down"
  when "sense_down"
    return "sense_up"
  when "sense_left"
    return "sense_right"
  when "sense_right"
    return "sense_left"
  end
end

def move(old_index,move_index,maze)
  maze[old_index.first][old_index.last] = " "
  maze[move_index.first][move_index.last] = "S"
end


def travel(maze)
  prev_move = ""
  while true
    puts
    print_maze(maze)
    puts
    start = find_start(maze)

    sense_hash = {
      "sense_up" => 0,
      "sense_down" => 0,
      "sense_right" => 0,
      "sense_left" => 0
    }

    sense_hash.each do |key,value|
      sensed_index = eval key + "(start,maze)"
      sense_hash[key] = delta_close(sensed_index,maze) if sensed_index != start
    end

    possible_navs = []

    possible_navs << sense_hash.select do |key,value|
      if !value.zero?
        if key != prev_move
          if key != opposite(prev_move)
            key
          end
        end
      end
    end

    possible_navs = possible_navs.first.sort_by {|key,value| value }

    if possible_navs == []
      return maze
      break
    end


    operation = possible_navs.first.first
    move_index = eval operation + "(start,maze)"
    prev_move = operation
    move(start,move_index,maze)
    sleep(0.7)

  end
end

def backtrace(maze)
  puts "backtraced"
  prev_move = ""
  while true
    puts
    print_maze(maze)
    puts
    start = find_start(maze)

    sense_hash = {
      "sense_up" => 0,
      "sense_down" => 0,
      "sense_right" => 0,
      "sense_left" => 0
    }

    sense_hash.each do |key,value|
      sensed_index = eval key + "(start,maze)"
      sense_hash[key] = delta_close(sensed_index,maze) if sensed_index != start
    end

    possible_navs = []

    possible_navs << sense_hash.select do |key,value|
      if !value.zero?
        if key != prev_move
          if key != opposite(prev_move)
            key
          end
        end
      end
    end

    possible_navs = possible_navs.first.sort_by {|key,value| value }

    if possible_navs == []
      break
    end

    operation = possible_navs.last.first
    move_index = eval operation + "(start,maze)"
    prev_move = operation
    move(start,move_index,maze)

    if move_index == $og_start
      print_maze(maze)
      sleep(0.7)
      break
    end

    sleep(0.7)
  end
end

if __FILE__ == $PROGRAM_NAME
  puts
  puts "Enter A Maze file: "
  puts
  input = gets.chomp

  maze = IO.readlines(input,chomp: true)
  og_start(maze)
  maze = travel(translate_maze(maze))

  print "Do you want to backtrace? (y/n) :"
  back = gets.chomp
  backtrace(maze) if back.downcase == "y" 
end