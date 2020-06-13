require_relative 'player.rb'
require_relative 'aiplayer.rb'
require 'set'

class Game
  attr_reader :dictionary, :losses

  def initialize(names)
    @players = []
    @fragment = ""
    @dictionary = IO.readlines("dictionary.txt", chomp: true).to_set
    @losses = Hash.new(0)

    names.each do |name, is_ai|
      if is_ai
        @players << AiPlayer.new(name,dictionary)
      else
        @players << Player.new(name)
      end
    end
  end

  def self.new_game
    players = Hash.new

    print "\nWelcome to GHOST Game!!!\n"
    print "\nEnter your players! type 'done' when you're done!\n"
    print "\nEnter players: "

    while true
      print "\nEnter 'player_name ai' for CPU\n"
      print "\nEnter 'player_name hu' for Multiplayer\n"
      print "Input: "
      input = gets.chomp.split

      if input.first == "done"
        break
      end

      if input.last == "ai"
        players[input.first] = true
      elsif input.last == 'hu'
        players[input.first] = false
      end
    end

    players

  end

  def run
    while @players.length != 1
      self.play_round
    end

    self.display_scoreboard
    print "\n#{previous_player.name} has WON the game!\n"
  end

  def play_round
    self.display_scoreboard
    self.reset_fragment    

    while !self.lose?    
      print "\n#{current_player.name}'s Turn'"
      self.take_turn(current_player)
      self.next_player!
      puts @fragment
    end

    print "\n#{previous_player.name} lost this round :(\n"

    losses[previous_player] += 1

    @players.each do |player|
      @players.delete(player) if losses[player] == 5
      if losses[player] == 5
        print "\nIts game over for #{player.name} :(\n"
        @players.delete(player)
      end
    end
  end

  def lose?
    if @dictionary.include?(@fragment)
      return true
    end
    return false
  end

  def reset_fragment
    @fragment = ""
  end

  def current_player
    @players.first
  end

  def previous_player
    @players.last
  end

  def next_player!
    @players.rotate!
  end

  def take_turn(player)

    print "\nGuess a letter! : "
    if player.ai
      guess = player.guess(@players.length, @fragment)
    else
      guess = player.guess
    end
  
    while !valid_play?(guess)
      puts "Invalid input :("
      puts @fragment
      print "\nGuess a letter! : "

      if player.ai
        guess = player.guess(@players.length, @fragment)
      else
        guess = player.guess if !player.ai
      end

    end
    @fragment += guess
  end

  def valid_play?(guess)
    
    if !current_player.alert_invalid_guess(guess) && @dictionary.any? {|word| word.start_with?(@fragment+guess.downcase)}
      return true
    end
    return false
  end

  def translate(player)
    "GHOST"[0...losses[player]]
  end

  def display_scoreboard
    print "\n#{"".ljust(40,"-")}\n"
    print "#{"SCOREBOARD".rjust(25," ")}#{"".rjust(15," ")}"
    print "\n#{"".ljust(40,"-")}\n"
    @players.each do |player|
      print "#{player.name.ljust(25," ")}#{translate(player).to_s.rjust(15," ")}\n"
    end
    print "#{"".ljust(40,"-")}\n"
  end
end

if __FILE__ == $PROGRAM_NAME
  players = Game.new_game
  Game.new(players).run
end