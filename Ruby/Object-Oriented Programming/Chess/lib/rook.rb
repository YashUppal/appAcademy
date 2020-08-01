require_relative 'slideable'

class Rook < Piece
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
    return [:horizontal]
  end
end