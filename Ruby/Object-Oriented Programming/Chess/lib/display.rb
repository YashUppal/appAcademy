require 'colorize'
require_relative 'board.rb'
require_relative 'cursor.rb'

class Display
  attr_reader :cursor
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0],@board)
  end 

  def render
    @board.rows.each_with_index do |row,row_idx|
      row.each_with_index do |ele, col_idx|
        colors = {}
        # colors[:color] = ele.color
        if (row_idx + col_idx).even?
          colors[:background] = :white
          colors[:color] = :black 
        else
          colors[:background] = :black
          colors[:color] = :white
        end

        if @cursor.cursor_pos == [row_idx,col_idx]
          colors[:background] = :light_green
          if @cursor.selected
            colors[:background] = :light_blue
          end
        end

        
        print ele.symbol.colorize(colors)
      end
      puts
    end
    nil
  end

  def run
    # loop and render
    input = nil
    while true
      system("clear")
      self.render
      input = @cursor.get_input
      break if !input.nil?
    end
    return input
  end
end
