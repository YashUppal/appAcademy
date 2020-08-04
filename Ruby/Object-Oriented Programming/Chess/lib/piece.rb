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

  def move_into_check?(end_pos)
    duplicate_board = @board.dup
    duplicate_board.move_piece!(pos,end_pos)
    return duplicate_board.in_check?(@color)
  end

  def valid_moves
    valids = Array.new
    valids = self.moves.reject do |points|
      self.move_into_check?(points)
    end
    return valids
  end
end