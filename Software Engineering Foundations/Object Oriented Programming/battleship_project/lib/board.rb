class Board
  # PART 1

  attr_reader :size

  def initialize(n)
    @grid = Array.new(n) { Array.new(n,:N) }
    @size = n * n
  end

  def [](position)
    @grid[position.first][position.last]
    # alternate syntax
    # row, col = position
  end

  def []=(position, value)
    # @grid[position.first][position.last] = value
    @grid[position.first][position.last] = value
  end

  def num_ships
    @grid.flatten.count(:S)
  end

  # PART 2

  def attack(position)
    if self[position] == :S
      self[position] = :H
      puts 'you sunk my battleship'
      return true
    else
      self[position] = :X
      return false
    end
  end

  def place_random_ships
    n = @grid.length
    quarter = size / 4
    count = 0

    while count < quarter
      random_position = [rand(0...n), rand(0...n)]
      if self[random_position] != :S
        self[random_position] = :S
        count += 1
      end
    end
  end

  def hidden_ships_grid
    hidden_grid = @grid.map do |subarr|
      subarr.map do |ele|
        if ele == :S
          :N
        else
          ele
        end
      end
    end
    return hidden_grid
  end

  def self.print_grid(grid)
    grid.each do |row|
      print row.join(" "), "\n"
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(self.hidden_ships_grid)
  end
end
