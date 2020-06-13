require_relative 'player.rb'

class Game
  attr_reader :dictionary, :losses

  def initialize(*names)
    @players = []
    names.each do |name|
      @players << Player.new(name)
    end
    @fragment = ""
    @dictionary = IO.readlines("dictionary.txt", chomp: true)
    @losses = Hash.new(0)
  end

  def run
    # while !losses.values.include?(5)
    #   self.play_round
    # end

    while @players.length != 1
      self.play_round
    end

    self.display_scoreboard
    print "\n#{previous_player.name} has WON the game!"
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

    losses[previous_player] += 1

    @players.each do |player|
      @players.delete(player) if losses[player] == 5
    end

  end

  def lose?
    if @dictionary.include?(@fragment)
      # puts "#{previous_player.name} has LOST "
      # @losses[previous_player] += 1
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
    guess = player.guess

    while !valid_play?(guess)
      puts "Invalid input :("
      puts @fragment
      print "\nGuess a letter! : "
      guess = player.guess
    end
    @fragment += guess
  end

  def valid_play?(guess)
    if !current_player.alert_invalid_guess(guess.downcase) && @dictionary.any? {|word| word.start_with?(@fragment+guess.downcase)}
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