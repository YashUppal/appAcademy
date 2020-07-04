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
    print "\nInvalid Position :(\n";sleep(1) if !self.board.update_at(val,pos)
    end
  end
end