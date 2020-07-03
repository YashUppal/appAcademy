require_relative 'board.rb'
require_relative 'human_player.rb'
require_relative 'computer_player.rb'

class Game

  attr_reader :board, :previous_position, :player
  attr_writer :previous_position

  def initialize
    # @player = HumanPlayer.new
    @player = ComputerPlayer.new
    @board = Board.new
    board.populate
    @previous_position = nil
  end

  def play
    until self.over?
      system("clear")
      board.render
      player.prompt
      pos = player.get_input
      sleep(0.4)

      if !self.card_at(pos).face_up
        self.make_guess(pos)
        player.receive_revealed_card(pos,self.card_at(pos).value)
      else
        puts "Invalid Index"
      end
    end
  end

  def over?
    # return true if player has won
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
        # keep the pair face up
        self.valid_match(pos)
      else
        # put the pair face down
        self.invalid_match(pos)
      end
      self.previous_position = nil
    end
  end

  def invalid_match(pos)
    # invalid match logic
    self.reveal_and_render(pos)
    puts "Invalid Match"
    sleep(0.4)
    self.hide_both_guesses(pos)
  end
  
  def valid_match(pos)
    # valid match logic
    self.reveal_and_render(pos)
    puts "Valid Match"
    sleep(0.4)
  end

  def reveal_and_render(pos)
    # reveal the card at pos and render board
    self.board.reveal(pos)
    system("clear")
    self.board.render
  end

  def hide_both_guesses(pos)
    # hide cards at pos and previous_position
    self.card_at(pos).hide
    self.card_at(previous_position).hide
  end

  def card_at(pos)
    # return card at the give index (pos)
    return self.board.grid[pos.first][pos.last]
  end



end