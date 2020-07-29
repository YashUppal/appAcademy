require_relative 'piece.rb'

class Board
  attr_reader :rows
  attr_writer :rows

  def initialize
    @rows = Array.new(8) { Array.new(8) }
    [0,1,6,7].each do |idx|
      @rows[idx].map! { |piece| piece = Piece.new }
    end
    nil
  end

  def move_piece(start_pos, end_pos)
    raise ArgumentError.new "No piece at #{end_pos}" if self.rows[start_pos.first][start_pos.last].nil?

    piece_to_move = self.rows[start_pos.first][start_pos.last]
    self.rows[start_pos.first][start_pos.last] = nil
    self.rows[end_pos.first][end_pos.last] = piece_to_move

  rescue ArgumentError => e
    puts "An Exception occured :( : #{e.message}"
  end

  def [](*pos)
    return self.rows[pos.first][pos.last]
  end

  def []=(*pos,val)
    self.rows[pos.first][pos.last] = val
  end
end