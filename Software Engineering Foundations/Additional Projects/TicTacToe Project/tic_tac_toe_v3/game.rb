require_relative 'human_player.rb'
require_relative 'computer_player.rb'
require_relative 'board.rb'

class Game

  attr_reader :board, :current_player
  attr_writer :current_player

  def initialize(size,marks)
    # @player_1 = HumanPlayer.new(player_1_mark)
    # @player_2 = HumanPlayer.new(player_2_mark)
    @players = Array.new
    marks.each do |key, value|
      if value
        @players << ComputerPlayer.new(key)
      else
        @players << HumanPlayer.new(key)
      end
    end
    @board = Board.new(size)
    @current_player = @players.first
  end

  def switch_turn
    @players.rotate!
    @current_player = @players.first
  end

  def play
    while board.empty_positions?
      board.print_board
      was_correct = false
      pos_current = current_player.get_position(board.legal_positions)
      
      # Fake Thinking Technology
      sleep([1,2,3,4].sample) if current_player.instance_of?(ComputerPlayer)

      was_correct = board.place_mark(pos_current,current_player.mark)
      if board.win?(current_player.mark)
        print "\nHooray! #{current_player.mark} has won!\n"
        board.print_board
        return
      else
        # TODO
        # Switch turn only if mark-placing has been successful
        self.switch_turn if was_correct
      end
    end
    puts "No one has won, its a DRAW :|"
  end
end