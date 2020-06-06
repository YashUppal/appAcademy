require_relative 'human_player.rb'
require_relative 'board.rb'

class Game

  attr_reader :board, :current_player
  attr_writer :current_player

  def initialize(player_1_mark, player_2_mark)
    @player_1 = HumanPlayer.new(player_1_mark)
    @player_2 = HumanPlayer.new(player_2_mark)
    @board = Board.new
    @current_player = @player_1
  end

  def switch_turn
    if @current_player == @player_2
      @current_player = @player_1
    elsif @current_player == @player_1
      @current_player = @player_2
    end
  end

  def play
    while board.empty_positions?
      board.print_board

      pos_current = current_player.get_positon
      self.switch_turn if board.place_mark(pos_current,current_player.mark)
      if board.win?(current_player.mark)
        puts "Hooray! #{current_player.mark} has won!"
        return
      else
        # TODO
        # Switch turn only if mark-placing has been successful
        # self.switch_turn 
      end
    end
    puts "No one has won, its a DRAW :|"
  end
end