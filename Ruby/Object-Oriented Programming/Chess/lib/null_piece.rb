require_relative 'piece'

class NullPiece < Piece
  
  include Singleton
  
  def initialize
    @symbol = " "
  end

  def symbol
    return self.symbol
  end

  def color
    return self.color
  end
  
end