class NQueens

  attr_reader :num_queens, :board, :queens_on_board
  attr_writer :attacked

  def initialize(n)
    @num_queens = n
    @board = Array.new(n) { Array.new(n,"_") }
    @attacked = []
    @queens_on_board = []
  end

  def print
    board.each do |row|
      puts row.join(" ")
    end
    true
  end

  def queen_attacks(index)
    attacked = []
    i = 0
    while i < board.length
      j = 0
      while j < board.length

        # ↔
        if i == index.first
          attacked << [i,j]
        end

        # ↕
        if j == index.last
          attacked << [i,j]
        end

        # diag
        if (j - index.first).abs == (i - index.last).abs
          attacked << [j,i] 
        end

        j+= 1
      end
      i += 1
    end
    return attacked.uniq
  end

  def attacked_spots(queens)
    attacked = []
    queens.each do queen
      attacked += queen.values.first
    end
  end

  def place
     i = 0
     while i < board.length
      j = 0
      while j < board.length

        

        j += 1
      end
      i+=1
     end
  end
end

q = NQueens.new(4)
q.print