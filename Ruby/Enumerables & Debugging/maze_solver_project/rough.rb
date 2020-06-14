# def travel(maze)
#   start_index = find_start(maze)
#   current_index = start_index
#   end_index = find_end(maze)
#   # possibles = ["left","right","up","down"]
#   possibles = {
#     "sense_left" => 0,
#     "sense_right" => 0,
#     "sense_up" => 0,
#     "sense_down" => 0
#   }

#   while start_index != end_index

#     print_maze(maze)
#     possibles.keys.each do |direction|
#       case direction
#       when "sense_left"
#         # puts "LEFT"
#         current_index = sense_left(start_index,maze)
#         possibles["sense_left"] = delta(current_index,maze)
#       when "sense_right"
#         # puts "RIGHT"
#         current_index = sense_right(start_index,maze)
#         possibles["sense_right"] = delta(current_index,maze)
#       when "sense_up"
#         # puts "UP"
#         current_index = sense_up(start_index,maze)
#         possibles["sense_up"] = delta(current_index, maze)
#       when "sense_down"
#         # puts "DOWN"
#         current_index = sense_down(start_index,maze)
#         possibles["sense_down"] = delta(current_index,maze)
#       end
#     end
#     # # p possibles
#     # p start_index
#     start_index =  eval possibles.max.first + "(start_index,maze)"
#     # # print start_index

#     print possibles

#     sleep(1)
#   end
#   # return start_index

#   # print possibles
# end


# # Translate maze to array 2d array form
# traversable = translate_maze(maze)
# print_maze(traversable)
# start_idx = find_start(traversable)
# puts
# # last_index = sense_up(start_idx,traversable)
# # last_index = sense_right(last_index, traversable) 
# # last_index = sense_down(last_index,traversable)
# # print last_index
# # sense_left(last_index,traversable)
# print_maze(traversable)
# travel(traversable)
# # p delta([6,1],traversable)

def delta(index,maze)
  # traversable = translate_maze(maze)
  # end_idx = find_end(maze)
  start_index = find_start(maze)
  # print end_idx

  # return ((start_index.first - index.first) + (start_index.last - index.last)).abs
  # return ((end_idx.first - index.first) + (end_idx.last - index.last)).abs

  # x = (end_idx.first - index.first)**2
  # y = (end_idx.last - index.last)**2

  # return Math.sqrt(x+y)

  # return ((end_idx.first - index.first) + (end_idx.last - index.last)).abs

  return ((index.first - start_index.first) + (index.last - start_index.last)).abs

end


# V2


def travel(maze)
  travelled = []
  prev_operation = ""
  hash = {
    "sense_up" => 0,
    "sense_down" => 0,
    "sense_left" => 0,
    "sense_right" => 0
  }
  while true
    print_maze(maze)
    start = find_start(maze)
    hash.keys.each do |key|
      case key
      when "sense_up"
        if sense_up(start,maze) == start 
        hash[key] = 10000000
        else
          hash[key] = delta_close(sense_up(start,maze),maze)
        end
        print hash[key]

      when "sense_down" 
        if sense_down(start,maze) == start 
        hash[key] = 10000000
        else
          hash[key] = delta_close(sense_down(start,maze),maze)
        end
      when "sense_left"
        if sense_left(start,maze) == start 
        hash[key] = 10000000
        else
          hash[key] = delta_close(sense_left(start,maze),maze)
        end

      when "sense_right"
        if sense_right(start,maze) == start 
        hash[key] = 10000000
        else
          hash[key] = delta_close(sense_right(start,maze),maze)
        end
      end
    end 
    print hash
    puts
    hash = hash.sort_by{|k,v| v}
    operation = hash.first.first
    print hash
    puts
    prev_operation = operation
    move_index = eval operation + "(start,maze)"
    travelled << move_index
    print travelled
    puts
    move(start,move_index,maze)

    hash = {
      "sense_up" => 0,
      "sense_down" => 0,
      "sense_left" => 0,
      "sense_right" => 0
    }
    sleep(1)
  end
end



  while true
    print_maze(maze)
    start = find_start(maze)
    hash.keys.each do |key|

        case key
        when "sense_up"
          if sense_up(start,maze) == start 
            pos_hash[key] = false
          hash[key] = 10000000
          else
            hash[key] = delta_close(sense_up(start,maze),maze)
          end

        when "sense_down" 
          if sense_down(start,maze) == start 
            pos_hash[key] = false
          hash[key] = 10000000
          else
            hash[key] = delta_close(sense_down(start,maze),maze)
          end

        when "sense_left"
          if sense_left(start,maze) == start 
            pos_hash[key] = false
          hash[key] = 10000000
          else
            hash[key] = delta_close(sense_left(start,maze),maze)
          end

        when "sense_right"
          if sense_right(start,maze) == start 
            pos_hash[key] = false
          hash[key] = 10000000
          else
            hash[key] = delta_close(sense_right(start,maze),maze)
          end
        end

    end 
    print hash
    puts
    hash = hash.sort_by{|k,v| v}
    operation = hash.first.first
    # print hash
    # puts
    prev_operation = operation
    move_index = eval operation + "(start,maze)"
    last_move = move_index
    puts
    print prev_operation

    travelled << move_index
    # print travelled
    puts
    move(start,move_index,maze)

    hash = {
      "sense_up" => 0,
      "sense_down" => 0,
      "sense_left" => 0,
      "sense_right" => 0
    }
    sleep(1)
  end

      hash.keys.each do |key|
      case key
        when "sense_up"
          pos_hash[key] = false if sense_up(start,maze) == start

        when "sense_down"
          pos_hash[key] = false if sense_up(start,maze) == start

        when "sense_left"
          pos_hash[key] = false if sense_up(start,maze) == start

        when "sense_righ"
          pos_hash[key] = false if sense_up(start,maze) == start
      end
    end

    travelled = []
  prev_operation = ""
  last_move = []
  hash = {
    "sense_up" => 0,
    "sense_down" => 0,
    "sense_left" => 0,
    "sense_right" => 0
  }

  pos_hash = {
    "sense_up" => true,
    "sense_down" => true,
    "sense_left" => true,
    "sense_right" => true
  }
  
  start = find_start(maze)



  while true
    print_maze(maze)
    start = find_start(maze)

    pos_hash.each do |key,value|
      # if (key == "sense_up" && value == false)
      #   pos_hash["sense_down"] = false
      # elsif (key == "sense_down" && value == false)
      #   pos_hash["sense_up"] = false
      # elsif (key == "sense_left" && value == false)
      #   pos_hash["sense_right"] = false
      # elsif (key == "sense_right" && value == false)
      #   pos_hash["sense_left"] = false
      # end
      if key == prev_operation
        pos_hash[opposite(key)] = false
      end
    end
    print pos_hash

    hash.keys.each do |key|
      case key
      when "sense_up"
        if sense_up(start,maze) == start 
          hash[key] = 10000000
          pos_hash[key] = false
        # else
        #   hash[key] = delta_close(sense_up(start,maze),maze)
        end

      when "sense_down" 
        if sense_down(start,maze) == start 
          hash[key] = 10000000
          pos_hash[key] = false
        # else
        #   hash[key] = delta_close(sense_down(start,maze),maze)
        end

      when "sense_left"
        if sense_left(start,maze) == start 
          hash[key] = 10000000
          pos_hash[key] = false
        # else
        #   hash[key] = delta_close(sense_left(start,maze),maze)
        end

      when "sense_right"
        if sense_right(start,maze) == start 
          hash[key] = 10000000
          pos_hash[key] = false
        # else
        #   hash[key] = delta_close(sense_right(start,maze),maze)
        end
      end
    end 

    pos_hash.each do |key,value|
      if value
        hash[key] = eval "delta_close(#{eval key + "(start,maze)"},maze)"
      end
    end

    print hash
    puts
    # print pos_hash
    puts
    hash = hash.sort_by{|k,v| v}
    operation = hash.first.first
    # print hash
    # puts
    prev_operation = operation
    move_index = eval operation + "(start,maze)"
    last_move = move_index
    puts
    print prev_operation

    travelled << move_index
    # print travelled
    puts
    move(start,move_index,maze)

    pos_hash = {
    "sense_up" => true,
    "sense_down" => true,
    "sense_left" => true,
    "sense_right" => true
    }

    hash = {
      "sense_up" => 0,
      "sense_down" => 0,
      "sense_left" => 0,
      "sense_right" => 0
    }
    sleep(1)
  end

  



# def delta(index,maze)
#   start_index = find_start(maze)
#   # return ((index.first - start_index.first) + (index.last - start_index.last)).abs
#   return Math.sqrt(((index.first - start_index.first)**2 + (index.last - start_index.last)**2))
# end

# def delta_origin(index,maze)
#   start_index = find_start(maze)
#   # return ((index.first - start_index.first) + (index.last - start_index.last)).abs
#   return Math.sqrt(((index.first - start_index.first)**2 + (index.last - start_index.last)**2))
# end

