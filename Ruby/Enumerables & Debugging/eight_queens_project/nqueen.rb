class NQueens

  attr_reader :board, :attacked_points, :time

  def initialize(n,time)
    @board = Array.new(n){ Array.new(n,"_") }
    @queens_on_board = []
    @time = time
  end

  def bprint
    board.each do |row|
      puts row.join(" ")
    end
    true
  end

  def under_attack
    attacked = []
    @queens_on_board.each do |queen|
      attacked += queen.values.first
    end
    return attacked
  end

  def queen_attacks(index)
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

        # diag
        if (j - index.first).abs == (i - index.last).abs
          attacked << [j,i] 
        end

        j+= 1
      end
      i += 1
    end
    return attacked.uniq
  end

  def place
    i = 0
    already_placed = []
    already_tried = []

    while i < board.length
      j = 0
      queen_placed = false
      while j < board.length

        puts
        self.bprint
        puts
        sleep(time)
        # print self.under_attack


        # print "#{under_attack}\n"
        # print "#{already_placed}\n"
        # print "#{already_tried}\n"

        if !under_attack.include?([i,j]) && !already_placed.include?([i,j]) && !already_tried.include?([i,j]) 
          board[i][j] = "♛"
          queen = {
            [i,j] => self.queen_attacks([i,j])
          }
          already_placed << [i,j]
          # already_tried << [i,j]
          @queens_on_board << queen
          queen_placed = true
          break
        end
        j += 1        
      end

      if !queen_placed
        @queens_on_board.pop
        
        i -= 1
        
        board[already_placed.last.first][already_placed.last.last] = "_"
        already_tried << already_placed.pop

      else
        i += 1
        already_tried.each_with_index do |point,idx|
          if point.first == i
            already_tried.delete_at(idx)
          end
        end
        # j = 0
      end
    end

    self.bprint
  end
end

