class Piece
  attr_reader :pos, :board
  def initialize(color,board,pos)
    @color = color
    @board = board
    @pos = pos
  end
end