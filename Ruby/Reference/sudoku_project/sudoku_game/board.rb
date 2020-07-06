require_relative 'tile.rb'
require 'colorized_string'

class Board

  attr_reader :grid
  attr_reader :grid

  def self.from_file(file)
    # import the passed file and parse it
    grid = IO.readlines(file,chomp: true)
    grid = Board.parse(grid)
    return grid
  end

  def self.parse(grid)
    # parse the passed grid into a usable form
    parsed_grid = []
    grid.each do |ele|
      row = []
      ele.split("").map(&:to_i).each do |val|
        if val.zero?
          tile = Tile.new(val,false)
        else
          tile = Tile.new(val,true)
        end
        row << tile
      end
      parsed_grid << row
    end
    return parsed_grid
  end

  def initialize(file)
    @grid = Board.from_file(file)
  end

  def color(tile)
    # returns the appropriate color for tile based on given/!given
    if tile.given
      ColorizedString[tile.value.to_s].colorize(:light_red)
    else
      ColorizedString[tile.value.to_s].colorize(:light_blue)
    end
  end

  def render
    # render the board in a slightly aesthetic form
    puts
    row_count = 0
    self.grid.each do |row|
      if row_count == 3
        puts "".rjust(14,"⸻")
        row_count = 0
      end

      prc = Proc.new { |ele| (ele.value.zero?)?(" "):(self.color(ele)); }

      print " #{row[0...3].map(&prc).join("")} ⎟ #{row[3...6].map(&prc).join("")} ⎟ #{row[6...9].map(&prc).join("")}\n"
      row_count += 1
    end
    puts
  end

  def update_at(value,position)
    # update the tile at given position with given value
    x,y = position

    if !self.grid[x][y].given
      self.grid[x][y].value = value
      return true
    end
    return false
  end
  
  def block
    # return array containing individual blocks as arrays
    row_count = 0
    blocked_grid = []
    block_a, block_b, block_c = [],[],[]
    self.grid.each do |row|
      
      block_a += row[0...3].map(&:value)
      block_b += row[3...6].map(&:value)
      block_c += row[6...9].map(&:value)
      
      row_count += 1

      if row_count == 3
        blocked_grid << block_a
        blocked_grid << block_b
        blocked_grid << block_c

        block_a, block_b, block_c = [],[],[]
        row_count = 0
      end
    end
    return blocked_grid
  end

  def solved?
    # returns true if entire board is solved, false otherwise
    self.all_rows? && self.all_columns? && self.all_blocks?
  end

  def all_rows?
    # returns true if all rows are solved, false otherwise
    self.all_solved?(self.grid)
  end

  def all_columns?
    # returns true if all columns are solved, false otherwise
    self.all_solved?(self.grid.transpose)
  end

  def all_blocks?
    # returns true if all individual grids are solved, false otherwise
    self.block.all? do |row|
      row.sort == (1..9).to_a
    end  
  end

  def all_solved?(passed_grid)
    # returns true if passed grid is solved, false otherwise (doesn't work for ind. blocks)
    passed_grid.all? do |row|
      row.map(&:value).sort == (1..9).to_a
    end
  end
end