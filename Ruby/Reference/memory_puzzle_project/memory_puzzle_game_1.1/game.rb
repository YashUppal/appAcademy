require_relative 'board.rb'
require_relative 'human_player.rb'
require_relative 'computer_player.rb'

class Game

  attr_reader :board, :previous_position, :player, :turns, :time
  attr_writer :previous_position, :turns

  def initialize(size,ai,turns=size*2,bombs)
    if ai
      @player = ComputerPlayer.new(size-1)
      @turns = 1000000
      @time = 0.4
    else
      @player = HumanPlayer.new
      @turns = turns
      @time = 1
    end
    @board = Board.new(size,bombs)
    board.populate
    @previous_position = nil
  end

  def play
    # main play loop
    system("clear")
    print "\nTurns remaining  #{turns}\n\n"
    self.board.bomb_position
    sleep(5)


    until self.over?
      system("clear")

      print "\nTurns remaining  #{turns}\n\n"

      if turns == 0
        print "Exhausted all turns :(\n"
        print "GAME OVER\n"
        break
      end

      while true
        board.render
        player.prompt
        pos = player.get_input

        if self.board.within_bounds?(pos)
          break
        else
          print "\nEnter a valid index :(\n"
        end
      end

      if !self.card_at(pos).face_up
        self.make_guess(pos)
        if self.card_at(pos).value == "🕱"
          system("clear")
          self.board.render
          puts "Oops...You flipped a bomb card. GAME OVER :("
          break
        end

        player.receive_revealed_card(pos,self.card_at(pos).value)
      else
         print "\nInvalid Index\n"
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
        self.turns -= 1
      end
      self.previous_position = nil
    end
  end

  def invalid_match(pos)
    # invalid match logic
    self.reveal_and_render(pos)
    print "\nInvalid Match\n\n"
    sleep(time)
    self.hide_both_guesses(pos)
  end
  
  def valid_match(pos)
    # valid match logic
    self.reveal_and_render(pos)
    print "\nValid Match\n\n"
    sleep(time)
  end

  def reveal_and_render(pos)
    # reveal the card at pos and render board
    self.board.reveal(pos)
    system("clear")
    puts
    print "Turns remaining  #{turns}"
    print " \n\n"
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

