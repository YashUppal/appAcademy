module Stepable

  def moves
    move_points = Array.new
    self.move_diffs.each do |move|
      case move
      when :king
        move_points += self.king_moves
      when :knight
        move_points += self.knight_moves
      end

    end
    return move_points
  end

  def king_moves
    moves = Array.new

    x,y = self.pos

    x = x - 1
    while x < x + 2
      y = y - 1
      while y < y + 2
        moves << [x,y] if self.within_bounds([x,y])
        y += 1
      end
      x += 1
    end
    return moves
  end

  def knight_moves
    moves = Array.new

    x,y = self.pos

    [-2,-1,1,2].each do |sub|
      if sub.abs == 1
        moves << [x+sub,y-2]
        moves << [x+sub,y+2] 
      if sub.abs == 2
        moves << [x+sub, y-1] 
        moves << [x+sub, y+1]
    end

    return moves.select { |point| self.within_bounds(point) }
  end

  def within_bounds(point)
    x,y = point
    return (x < 8 && x > 0) && (y < 8 && y > 0)
  end

  private
  def move_diffs
    # overwritten by subclass
  end