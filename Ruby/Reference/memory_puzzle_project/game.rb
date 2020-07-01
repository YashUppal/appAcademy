require_relative 'board.rb'

class Game

  attr_reader :board, :previous_position
  attr_writer :previous_position

  def initialize
    @board = Board.new
    board.populate
    @previous_position = nil
  end

  def play
    until self.over?
      board.render
      puts "Please enter the position of the card you would like to flip (eg 2,3)"
      pos = gets.chomp.split(",").map!(&:to_i)
      self.make_guess(pos)
    end
  end

  def over?
    if board.won?
      return true
    else
      return false
    end
  end

  def make_guess(pos)
    if !previous_position
      self.previous_position = pos
      self.board.reveal(pos)
    else
      # TODO
      # make Card#== work
      if self.card_at(pos).value == self.card_at(previous_position).value
        # leave both face up
        self.board.reveal(pos)
      else
        self.card_at(pos).hide
        self.card_at(previous_position).hide
      end
      self.previous_position = nil
    end
  end

  def card_at(pos)
    return self.board.grid[pos.first][pos.last]
  end

end