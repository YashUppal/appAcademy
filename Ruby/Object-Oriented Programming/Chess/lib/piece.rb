class Piece
  attr_reader :pos, :board
  def initialize(color,board,pos)
    @color = color
    @board = board
    @pos = pos
  end

  def symbol
    # overwritten by subclass
  end
end