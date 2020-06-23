# ♛

class NQueen
  attr_reader :board

  def initialize(n)
    @num_queens = n
    @board = Array.new(n) { Array.new(n,"_") }
    @tried = []
  end

  def print_board
    @board.each do |row|
      print row.join(" ")
      puts
    end
    true
  end

  def flip(idx)
    popped = idx.pop
    return idx.unshift(popped)
  end

  def queen_count
    count = 0
    @board.each do |row|
      row.each do |ele|
        count += 1 if ele == "♛"
      end
    end
    count
  end

  def traverse(idx)
    # idx = self.flip(idx)
    # traverse up
    iterator = idx.first-1
    while iterator >= 0
      # @board[iterator][idx.last] = "."
      return true if @board[iterator][idx.last] == "♛"
      iterator -= 1
    end

    # traverse down
    iterator = idx.first+1
    while iterator < @board.length
      # @board[iterator][idx.last] = "."
      return true if @board[iterator][idx.last] == "♛"
      iterator += 1
    end

    # traverse left
    iterator = idx.last-1
    while iterator >= 0
      # @board[idx.first][iterator] = "."
      return true if @board[idx.last][iterator] == "♛"
      iterator -= 1
    end

    # traverse right
    iterator = idx.last+1
    while iterator < @board.length
      # @board[idx.first][iterator] = "."
      return true if @board[idx.last][iterator] == "♛"
      iterator += 1
    end

    # traverse diagonal upright
    x = idx.first-1
    y = idx.last+1

    while true
      break if @board[x] == nil || @board[y] == nil
      # @board[x][y] = "."
      return true if @board[x][y] == "♛"
      x -= 1
      y += 1
    end

    # traverse diagonal upleft
    x = idx.first-1
    y = idx.last-1
    while true
      # print [x,y]
      break if x < 0 || y < 0
      # @board[x][y] = "."
      return true if @board[x][y] == "♛"
      x -= 1
      y -= 1
    end

    # traverse diagonal downright
    x = idx.first + 1
    y = idx.last + 1
    while true
      break if @board[x] == nil || @board[y] == nil
      # @board[x][y] = "."
      return true if @board[x][y] == "♛"
      x += 1
      y += 1
    end

    # traverse diagonal downleft
    x = idx.first + 1
    y = idx.last - 1

    while true
      break if @board[x] == nil || @board[y] == nil
      # @board[x][y] = "."
      return true if @board[x][y] == "♛"
      x += 1
      y -= 1
    end

    return false
  end

  def anti_traverse(idx)
    # traverse up
    iterator = idx.first-1
    while iterator >= 0
      @board[iterator][idx.last] = "_"
      return true if @board[iterator][idx.last] == "♛"
      iterator -= 1
    end

    # traverse down
    iterator = idx.first+1
    while iterator < @board.length
      @board[iterator][idx.last] = "_"
      return true if @board[iterator][idx.last] == "♛"
      iterator += 1
    end

    # traverse left
    iterator = idx.last-1
    while iterator >= 0
      @board[idx.first][iterator] = "_"
      return true if @board[idx.last][iterator] == "♛"
      iterator -= 1
    end

    # traverse right
    iterator = idx.last+1
    while iterator < @board.length
      @board[idx.first][iterator] = "_"
      return true if @board[idx.last][iterator] == "♛"
      iterator += 1
    end

    # traverse diagonal upright
    x = idx.first-1
    y = idx.last+1

    while true
      break if @board[x] == nil || @board[y] == nil
      @board[x][y] = "_"
      return true if @board[x][y] == "♛"
      x -= 1
      y += 1
    end

    # traverse diagonal upleft
    x = idx.first-1
    y = idx.last-1
    while true
      # print [x,y]
      break if x < 0 || y < 0
      @board[x][y] = "_"
      return true if @board[x][y] == "♛"
      x -= 1
      y -= 1
    end

    # traverse diagonal downright
    x = idx.first + 1
    y = idx.last + 1
    while true
      break if @board[x] == nil || @board[y] == nil
      @board[x][y] = "_"
      return true if @board[x][y] == "♛"
      x += 1
      y += 1
    end

    # traverse diagonal downleft
    x = idx.first + 1
    y = idx.last - 1

    while true
      break if @board[x] == nil || @board[y] == nil
      @board[x][y] = "_"
      return true if @board[x][y] == "♛"
      x += 1
      y -= 1
    end

    return false
  end

  def threaten?(idx1,idx2)
    @board[idx1.first][idx1.last] = "♛"
    @board[idx2.first][idx2.last] = "♛"

    if self.traverse(idx1) && self.traverse(idx2)
      # @board[idx1.first][idx1.last] = nil
      # @board[idx2.first][idx2.last] = nil
      return true
    else
      return false
    end
  end

  def empty_spot(board)
    board.each_with_index do |row,row_idx|
      row.each_with_index do |col, col_idx|
        # if col == "_"
        #   return [row_idx,col_idx]
        # end
        if col == "_" && !self.traverse([col_idx,row_idx])
          return [row_idx,col_idx]
        end
      end
    end
    false
  end

  def scramble
    tried = []
    while true

      self.print_board
      sleep(1)

      # break if !empty_spot(board)

      empty_spot = empty_spot(board)
      puts
      print empty_spot
      puts
      print tried
      puts
      if !tried.include?(empty_spot)
        if !self.traverse(empty_spot)
          board[empty_spot.first][empty_spot.last] = "♛"
          tried << empty_spot
        end
        # self.traverse(empty_spot)
      end
    end
  end


end