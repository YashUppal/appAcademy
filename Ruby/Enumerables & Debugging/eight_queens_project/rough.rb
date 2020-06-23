
  def scatter
    count = 1
    outer_iterator = 0
    while outer_iterator < board.length
      inner_iterator = 0
      while inner_iterator < board.length
        break if self.queen_count == @num_queens
        # threaten?([inner_iterator,outer_iterator],[outer_iterator + count, inner_iterator + count])

          # puts "#{[inner_iterator,outer_iterator]} #{[outer_iterator + count, inner_iterator + count]}"

          # if board[outer_iterator+count] != nil
          #   if inner_iterator+count < board.length
          #     # puts "#{[outer_iterator+count,inner_iterator+count]}"
          #     threaten?([inner_iterator,outer_iterator],[outer_iterator+count,inner_iterator+count])
          #   end
          # end

          if outer_iterator < board.length / 2
            # puts "#{[outer_iterator+count,inner_iterator+count]}"
            puts "#{[inner_iterator,outer_iterator]} #{[outer_iterator + count, inner_iterator + count]}"
            if threaten?([inner_iterator,outer_iterator],[outer_iterator+count,inner_iterator+count])
              # count += 1
            end
          end

        inner_iterator += 1
      end
      outer_iterator += 1
    end
  end

        if !empty_spot(board) && queen_count != @num_queens
        while true
          iterator = 0
          index = tried.reverse[iterator]
          board[index.first][index.last] = "_"
          self.anti_traverse(index)
          break if empty_spot(board)
        end
      end


#####

def safe?(onboard,index)
    onboard.each do |queen|

      # puts
      # p queen.values.first
      # puts

      if queen.values.first.include?(index)
        return false
      end
    end
    return true
  end

  def attacks(index)
    attacked = []
    i = 0
    while i < board.length
      j = 0
      while j < board.length

        # ↔
        if i == index.first
          attacked << [i,j]
        end

        # ↕
        if j == index.last
          attacked << [i,j]
        end

        # ↗↙
        if i + j == index.first + index.last
          attacked << [i,j]
        end

        # ↖↘
        if (j - i).abs  == (index.last - index.first).abs
          attacked << [i,j]
        end

        j+= 1
      end
      i += 1
    end
    return attacked.uniq
  end


  # def under_attack(index)
  #   $queens_onboard.each do |queen|
  #     return true if queen.values.first.include?(index)
  #   end
  #   return false
  # end

  def empty_space(column,already_placed,onboard)
    i = 0
    while i < board.length
      if self.safe?(onboard,[column,i]) && !already_placed.include?([column,i])
        return true
      end
      i += 1
    end
    return false
  end


  def place
    already_placed = []
    queens_onboard = []

    i = 0
    while i < board.length
      j = 0
      while j < board.length
        # debugger
        if safe?(queens_onboard,[j,i]) && !already_placed.include?([j,i])
          
          queen_attacks = self.attacks([j,i])
          queen = {
            [j,i] => queen_attacks
          }
          board[j][i] = "♛"
          queens_onboard << queen
          already_placed << [j,i]
          puts
          self.print
          puts
          # print queens_
          puts
        end

        j += 1
        
        if !empty_space(j,already_placed,queens_onboard)
          j -= 1
          board[j][i] = "_"
          queens_onboard.pop
          already_placed << [j,i]
          # i = 0
          next
        end

        

        sleep(0.7)

      end
      i += 1
    end

    #queens_onboard.each do |queen|
    #   puts queen
    # end

  end

#####

        # ↖↘
        # if i + j == (index.first + index.last)
        #   attacked << [i,j]
        # end

        # ↗↙
        # if (i-j).abs == (index.first - index.last).abs
        #   attacked << [i,j]
        # end

        # ↗
        if board[i-1] != nil && board[i-1][j+1] != nil
          attacked << [i-1,j+1]
        end

        # ↙
        if board[i+1] != nil && board[i+1][j-1] != nil
          attacked << [i+1 , j-1]
        end

        # ↖
        if board[i-1] != nil && board[i-1][j-1] != nil
          attacked << [i-1 , j-1]
        end

        # ↘
        if board[i + 1] != nil && board[i+1][j+1] != nil
          attacked << [i+1 , j+1]
        end



