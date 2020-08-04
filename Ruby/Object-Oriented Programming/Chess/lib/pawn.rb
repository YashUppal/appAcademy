require_relative 'piece'

class Pawn < Piece
  attr_reader :color,:board,:pos
  def initialize(color,board,pos)
    super
    if self.color == :black
      @symbol = " ♟ "
    else
      @symbol = " ♙ "
    end
  end

  def symbol
    return @symbol
  end

  def move_dirs
    return [:pawn]
  end

  private
  def at_start_row?
    self.pos.first == 1 || self.pos.first == 6
  end

  def forward_dir
    if self.color == :black
      return 1
    else
      return -1
    end
  end

  def forward_steps
    if x == 1
      return [[x,y+1],[x,y+2]]
    elsif x == 6
      return [[x,y-1],[x,y-2]]
    end
    x,y = pos
    y += self.forward_dir

    return [x,y] if self.board[x,y].instance_of?(NullPiece)
  end

  def side_attacks
    attack_points = Array.new
    if self.color == :black
      attack_points << [x+1,y-1]
      attack_points << [x+1,y+1]
    else
      attack_points << [x-1,y-1]
      attack_points << [x-1,y+1]
    end

    attack_points.select { |idx| (x >= 0 && x <= 7) && ( y >= 0 && y <= 7) }
  end
end