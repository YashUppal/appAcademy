require_relative 'piece.rb'
require_relative 'knight.rb'
require_relative 'king.rb'
require_relative 'bishop.rb'
require_relative 'rook.rb'
require_relative 'pawn.rb'
require_relative 'queen.rb'
require_relative 'null_piece.rb'

class Board
  attr_reader :rows
  attr_writer :rows

  def initialize
    @rows = Array.new(8) { Array.new(8) { |p| NullPiece.instance } }
    
    @rows[0][0] = Bishop.new(:black,@rows,[0,0])
    @rows[0][7] = Bishop.new(:black,@rows,[0,7])
    @rows[7][0] = Bishop.new(:white,@rows,[7,0])
    @rows[7][7] = Bishop.new(:white,@rows,[7,7])

    @rows[0][1] = Knight.new(:black,@rows,[0,1])
    @rows[0][6] = Knight.new(:black,@rows,[0,6])
    @rows[7][1] = Knight.new(:white,@rows,[7,1])
    @rows[7][6] = Knight.new(:white,@rows,[7,6])

    @rows[0][2] = Rook.new(:black,@rows,[0,2])
    @rows[0][5] = Rook.new(:black,@rows,[0,5])
    @rows[7][2] = Rook.new(:white,@rows,[7,2])
    @rows[7][5] = Rook.new(:white,@rows,[7,5])

    @rows[0][3] = Queen.new(:black,@rows,[0,3])
    @rows[0][4] = King.new(:black,@rows,[0,4])
    @rows[7][3] = Queen.new(:white,@rows,[7,3])
    @rows[7][4] = King.new(:white,@rows,[7,4])

    @rows[1].map.with_index do |ele,idx|
      @rows[1][idx] = Pawn.new(:black,@rows,[1,idx])
    end

    @rows[6].map.with_index do |ele,idx|
      @rows[6][idx] = Pawn.new(:white,@rows,[6,idx])
    end
    nil
  end

  def move_piece(start_pos, end_pos)
    raise ArgumentError.new "No piece at #{end_pos}" if self.rows[start_pos.first][start_pos.last].nil?

    piece_to_move = self.rows[start_pos.first][start_pos.last]
    self.rows[start_pos.first][start_pos.last] = NullPiece.instance
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

  def show
    self.rows.each do |row|
      print row.map(&:symbol)
      puts
    end
    nil
  end


  def valid_pos?(pos)
    x,y = pos
    (x < 8 && x >= 0) && (y < 8 && y >= 0)
  end

  def in_check?(color)
    king = nil
    king_pos = nil
    @rows.each_with_index do |row,row_idx|
      row.each_with_index do |ele,col_idx|
        if ele.is_a?(King) && ele.color == color
          king = ele
          king_pos = [row_idx,col_idx]
        end
      end
    end
    
    @rows.each do |row|
      row.each do |ele|
        if ele.color != color
          if ele.moves.include?(king_pos)
            return true
          end
        end
      end
    end
    return false
  end

  def checkmate(color)
    player_moves = Array.new
    if self.in_check?(color)
      @rows.each do |row|
        row.each do |ele|
          if ele.color == color
            player_moves += ele.moves
          end
        end
      end
      if player_moves.empty?
        return true
      end
    end
    return false
  end

end