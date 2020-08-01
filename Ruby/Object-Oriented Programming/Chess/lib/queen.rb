require_relative 'slideable'

class Queen < Piece
  include Slideable
  attr_reader :board, :pos

  def initialize(color,board,pos)
    super
  end

  def symbol
    return self.symbol
  end

  protected
  def move_dirs
    return [:horizontal, :diagonal]
  end
end