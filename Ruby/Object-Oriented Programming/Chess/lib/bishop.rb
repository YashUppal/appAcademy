require_relative 'slideable'

class Bishop < Piece
  include Slideable
  attr_reader :board, :pos, :color

  def initialize(color,board,pos)
    super
    if self.color == :black
      @symbol = " ♝ "
    else
      @symbol = " ♗ "
    end
  end

  def symbol
    return @symbol
  end

  protected
  def move_dirs
    return [:diagonal]
  end
end