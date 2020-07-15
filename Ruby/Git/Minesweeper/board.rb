require_relative 'tile.rb'

class Board
  attr_reader :grid

  def initialize(size)
    @grid = Array.new(size) { Array.new(size) { Tile.new("_") } }
  end

  def render
    self.grid.each do |row|
      prow = row.map do |tile|
        if tile.flagged
          "?"
        elsif tile.covered
          "□"
          # tile.value
        else
          tile.value
        end
      end
      print "\n#{prow.join(" ")}\n"
    end
    nil
  end

  def seed_bombs
    bomb_count = 0

    while bomb_count < self.grid.first.length
      x,y = self.random_index
      if self.grid[x][y].value != "☠"
        self.grid[x][y].value = "☠"
        bomb_count += 1
      end
    end
  end
  

  def random_index
    [(0...self.grid.length).to_a.sample,(0...self.grid.length).to_a.sample]
  end

  def reveal(idx)
    x,y = idx

    if self.grid[x][y].flagged
      return
    end

    if self.grid[x][y].value == "☠"
      system("clear")
      self.grid[x][y].covered = false
      self.render
      puts
      puts "GAME OVER"
      exit
      return
    else


      self.grid[x][y].covered = false
      
      if self.adjacent(idx).any? { |adjidx| self.grid[adjidx.first][adjidx.last].value == "☠" }
        self.grid[x][y].value = self.adjacent_bomb_count(idx)
        return
      end

      if self.adjacent(idx).none? { |adjidx| self.grid[adjidx.first][adjidx.last].value == "☠" }
        self.adjacent(idx).each do |adjidx|
          reveal(adjidx)
        end
      end
    end
  end

  def flag(idx)
    x,y = idx
    self.grid[x][y].flagged = true
  end

  def unflag(idx)
    x,y = idx
    self.grid[x][y].flagged = false
  end

  def adjacent(idx)
    x,y = idx
    adjacent_indices = Array.new
    (x-1..x+1).each do |adjx|
      (y-1..y+1).each do |adjy|
        adjacent_indices << [adjx,adjy] if self.inbound([adjx,adjy]) && self.grid[adjx][adjy].covered
      end
    end
    adjacent_indices
  end

  def adjacent_bomb_count(idx)
    x,y = idx
    count = 0
    adjacent_indices = self.adjacent(idx)
    adjacent_indices.each do |adjidx|
      count += 1 if self.grid[adjidx.first][adjidx.last].value == "☠"
    end
    count
  end

  def inbound(idx)
    x,y = idx
    (x >= 0 && x < self.grid.length) && (y >= 0 && y < self.grid.length)
  end
end