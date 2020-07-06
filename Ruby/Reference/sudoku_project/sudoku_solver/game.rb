require_relative 'board.rb'
require_relative 'solver.rb'
require 'colorized_string'

class Game

  attr_reader :board, :solver

  def initialize(filename)
    @board = Board.new(filename)
    @solver = Solver.new(board)
  end


  def play
    puts "Solver will solve your Sudoku"
    print "\nDo you want to see the process? : "
    inp = gets.chomp
    vis = false
    (inp.include?("Y"))?(vis = true):(vis = false);
    self.solver.input(vis)
    print ColorizedString["\nCongrats, Puzzle Solved using Backtracking:)\n\n"].colorize(:light_cyan)
    print ColorizedString["\nThank you for playing!\n\n"].colorize(:light_cyan)
  end

  def valid_input?(val,pos)
    return true if ((pos.first >= 0 && pos.first < 9) && (pos.last >= 0 && pos.last < 9)) && (val > 0 && val < 9)
    return false
  end
end