require_relative 'board.rb'
require 'colorized_string'

class Game

  attr_reader :board

  def initialize(filename)
    @board = Board.new(filename)
  end

  def play
    # main play loop
    system("clear")
    print ColorizedString["Welcome to Sudoku!\n\n"].colorize(:light_cyan)
    sleep(3)
    until board.solved?
      system("clear")
      puts ColorizedString["Sudoku"].colorize(:light_cyan)
      self.board.render
      print "Enter the position you would like to change (e.g 1,2) : "
      pos = gets.chomp.split(",").map(&:to_i)
      print "\n\nEnter a value as well : "
      val = gets.chomp.to_i
      if self.valid_input?(val,pos)
        print "\nInvalid Position :(\n";sleep(1) if !self.board.update_at(val,pos)
      else
        print "\nInvalid Input :(\n"
        sleep(1)
      end
    end
  end

  def valid_input?(val,pos)
    return true if (pos.first > 0 && pos.first < 9) && (pos.last > 0 && pos.last < 9)
    return true if val > 0 && val < 9
    return false
  end
end