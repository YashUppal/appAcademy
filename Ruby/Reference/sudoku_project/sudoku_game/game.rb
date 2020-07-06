require_relative 'board.rb'
require 'colorized_string'

class Game

  attr_reader :board

  def initialize(filename)
    @board = Board.new(filename)
  end

  def play
    # main play loop
    until board.solved?
      system("clear")
      puts ColorizedString["Sudoku"].colorize(:light_cyan)
      self.board.render
      print "Enter the position you would like to change (e.g 1,2) : "
      pos = gets.chomp.split(",").map(&:to_i)
      print "\n\nEnter a value as well : "
      val = gets.chomp.to_i
      if self.valid_input?(val,pos)
        res = self.board.update_at(val,pos)
        if !res
          print "\nInvalid Position :(\n"
          sleep(1)
        end
      else
        print "\nInvalid Input :(\n"
        sleep(1)
      end
    end

    system("clear")
    puts ColorizedString["Sudoku"].colorize(:light_cyan)
    self.board.render
    print ColorizedString["\nCongrats, Puzzle Solved :)\n\n"].colorize(:light_green)
    print ColorizedString["\nThank you for playing!\n\n"].colorize(:light_green)
  end

  def valid_input?(val,pos)
    return true if ((pos.first >= 0 && pos.first < 9) && (pos.last >= 0 && pos.last < 9)) && (val > 0 && val < 9)
    return false
  end
end