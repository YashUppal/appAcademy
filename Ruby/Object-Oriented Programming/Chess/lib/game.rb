require_relative "board.rb"
require_relative "humanplayer.rb"
require_relative "display.rb"


class Game
  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @player1 = HumanPlayer.new(:black,@display)
    @player2 = HumanPlayer.new(:white,@display)
    @current_player = @player1
  end

  def play
    puts "A very primitive"
    puts "

  /$$$$$$  /$$                                   
 /$$__  $$| $$                                   
| $$  \\__/| $$$$$$$   /$$$$$$   /$$$$$$$ /$$$$$$$
| $$      | $$__  $$ /$$__  $$ /$$_____//$$_____/
| $$      | $$  \\ $$| $$$$$$$$|  $$$$$$|  $$$$$$ 
| $$    $$| $$  | $$| $$_____/ \\____  $$\\____  $$
|  $$$$$$/| $$  | $$|  $$$$$$$ /$$$$$$$//$$$$$$$/
 \\______/ |__/  |__/ \\_______/|_______/|_______/ 
"

puts "\n\n\n1) Arrow keys for moving cursor.\n2) 'space' or 'enter' to select a piece. \n3) 'space' or 'enter' to place a piece."

    sleep(5)

    while true
      # @display.run
      move = @current_player.make_move
      @board.move_piece!(move.first,move.last)
      self.swap_turn!
      move = []
    end
  end

  private
  def swap_turn!
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end
end