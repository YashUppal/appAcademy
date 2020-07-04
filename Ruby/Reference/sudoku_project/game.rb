require_relative 'board.rb'

class Game

  attr_reader :board

  def initialize(filename)
    @board = Board.new(filename)
  end

  def play
    system("clear")
    print "Welcome to Sudoku!\n\n"
    sleep(3)
    until board.solved?
      system("clear")
      self.board.render
      print "Enter the position you would like to change (e.g 1,2) : "
      pos = gets.chomp.split(",").map(&:to_i)
      print "\n\nEnter a value as well : "
      val = gets.chomp.to_i
      print val

      self.board.update_at(val,pos)
    end

  end

end