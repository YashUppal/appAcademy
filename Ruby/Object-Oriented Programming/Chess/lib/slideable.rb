module Slideable

  def horizontal_dirs
    horizontal_points = Array.new
    pos = self.pos

    #left
    x,y = pos
    while true
      y -= 1
      break if self.board[x,y] || (y > 7 || y < 0)
      horizontal_points << [x,y]
    end

    #right
    x,y = pos
    while true
      y += 1
      break if self.board[x,y] || (y > 7 || y < 0)
      horizontal_points << [x,y]
    end

    #up
    x,y = pos
    while true
      x -= 1
      break if self.board[x,y]  || (x > 7 || x < 0)
      horizontal_points << [x,y]
    end

    #down
    x,y = pos
    while true
      x += 1
      break if self.board[x,y] || (x > 7 || x < 0)
      horizontal_points << [x,y]
    end

    return horizontal_points
  end

  def diagonal_dirs
    diagonal_points = Array.new

    i = 0
    while i < 8
      j = 0
      while j < 8
        if i - j == 0
          diagonal_points << [i,j]
        elsif
          i + j == 8
          diagonal_points << [i,j]
        end
        j += 1
      end
      i += 1
    end
    diagonal_points.delete(self.pos)

    return diagonal_points
  end

  def moves
    moves_points = Array.new
    self.move_dirs.each do |direction|
      case direction
      when :horizontal
        moves_points += horizontal_dirs #
      when :diagonal
        moves_points += diagonal_dirs
      end
    end
    return moves_points
  end

  private
  def move_dirs
    # overwritten by subclass
  end
end