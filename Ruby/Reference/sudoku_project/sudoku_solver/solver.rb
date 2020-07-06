
class Solver
  # provides a position and a value

  attr_reader :board, :valid_points

  def initialize(board)
    @board = board
    @valid_points = Array.new
    self.valid_positions
  end

  def input(vis)
    i = 0
    val = 1
    while i < self.valid_points.length
      if vis
        self.board.render
        sleep(0.1)
        system("clear")
      end

      placed = false  

      idx = self.valid_points[i]
      x,y = idx
            
      val = self.board.grid[x][y].previously_guessed.last
      while val <= 9
        if self.legal_move?(idx,val)
          self.board.update_at(val,idx)
          placed = true
          i += 1
          break
        else
          val += 1
        end
      end

      if !placed
        self.board.grid[x][y].value = 0
        self.board.grid[x][y].previously_guessed = [1] if i != 0
        i -= 1
      end
    end
    self.board.render
  end

  def legal_move?(idx,val)
    self.legal_row?(idx.first,val) && self.legal_col?(idx.last,val) && self.legal_block?(idx,val) && !self.board.grid[idx.first][idx.last].given
  end

  def legal_row?(row,val)
    !self.board.grid[row].map(&:value).include?(val)
  end

  def legal_col?(col,val)
    !self.board.grid.transpose[col].map(&:value).include?(val)
  end

  def legal_block?(idx,val)
    block_idx = self.block_from_index(idx)

    !self.board.block[block_idx].include?(val)
  end

  def block_from_index(idx)
    block_idx = 0
    x,y = idx

    if (0..2).include?(x) && (0..2).include?(y)
      block_idx = 0
    elsif (0..2).include?(x) && (3..5).include?(y)
      block_idx = 1
    elsif (0..2).include?(x) && (6..8).include?(y)
      block_idx = 2
    elsif (3..5).include?(x) && (0..2).include?(y)
      block_idx = 3
    elsif (3..5).include?(x) && (3..5).include?(y)
      block_idx = 4
    elsif (3..5).include?(x) && (6..8).include?(y)
      block_idx = 5
    elsif (6..8).include?(x) && (0..2).include?(y)
      block_idx = 6
    elsif (6..8).include?(x) && (3..5).include?(y)
      block_idx = 7
    elsif (6..8).include?(x) && (6..8).include?(y)
      block_idx = 8
    end

    return block_idx
  end

  def valid_positions
    i = 0
    while i < self.board.grid.length
      j = 0
      while j < self.board.grid.first.length
        @valid_points << [i,j] if !self.board.grid[i][j].given
        j += 1
      end
      i += 1
    end
  end

end