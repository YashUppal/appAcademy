class Board
  attr_reader :grid

  def initialize(n)
    @grid = Array.new(n) { Array.new(n,"_") }
  end

  def valid?(pos)
    grid[pos.first]
  end

  def empty?(pos)
    grid[pos.first][pos.last] == "_"
  end

  def place_mark(pos,mark)
    begin
      if self.valid?(pos) && self.empty?(pos)
        grid[pos.first][pos.last] = mark
      else
        raise 'Invalid Position :('
      end
    rescue
      print "\nInvalid Position :(\n"
    end
  end

  def print_board
    print "\n"
    @grid.each do |row|
        print (row.join(" "))
        puts
    end
    print "\n"
  end

  def win_row?(mark)
    self.grid.each do |row|
      return true if row.all?(mark)
    end
    false
  end

  def win_col?(mark)
    self.grid.transpose.each do |row|
      return true if row.all?(mark)
    end
    return false
  end

  def win_diagonal?(mark)
    diagonal = []
    anti_diagonal = []

    outer = 0
    while outer < self.grid.length
      inner = 0
      while inner < self.grid.length

        diagonal << self.grid[outer][inner] if outer == inner
        anti_diagonal << self.grid[outer][inner] if outer+inner == self.grid.length-1

        inner += 1
      end
      outer += 1
    end
    diagonal.all?(mark) || anti_diagonal.all?(mark)
  end

  def win?(mark)
    win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
  end
  
  def empty_positions?
    self.grid.each do |row|
      return true if row.any?("_")
    end
    false
  end
end