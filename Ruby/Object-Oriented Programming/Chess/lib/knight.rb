require_relative 'stepable'

class Knight < Piece
  include Stepable
  attr_reader :board, :pos, :color

  def initialize(color,board,pos)
    super
    if self.color == :black
      @symbol = " ♞ "
    else
      @symbol = " ♘ "
    end
  end

  def symbol
    return @symbol
  end

  protected
  def move_diffs
    return [:knight]
  end
end