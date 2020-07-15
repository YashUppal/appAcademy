require_relative 'board.rb'


class Game
  attr_reader :board

  def initialize(size)
    @board = Board.new(size)
  end


  def run
    self.board.seed_bombs

    until self.game_over?
      system("clear")

      self.board.render
      puts
      print "Enter a command (e.g f 01 or r 23 or uf 55) :  "
      inp = gets.chomp
      command = inp.split.first
      idx = inp.split.last.split("").map(&:to_i)

      if command == "f"
        self.board.flag(idx)
      elsif command == "uf"
        self.board.unflag(idx)
      elsif command == "r"
        self.board.reveal(idx)
      end
    end

    print "\nCongrats! You've won\n"
  end

  def game_over?
    boxes = Array.new

    self.board.grid.each do |row|
      row.each do |tile|
        if tile.value != "💣"
          boxes << tile
        end
      end
    end
    boxes.map(&:covered).none? { |covered| covered }
  end

end