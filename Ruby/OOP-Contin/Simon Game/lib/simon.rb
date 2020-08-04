class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = Array.new
  end

  def play
    puts "Welcome to Simon, the color memory game"
    puts "Starting in 3..2..1"
    sleep(3)
    until self.game_over
      self.take_turn
    end

    self.game_over_message
    self.reset_game
  end

  def take_turn
    self.show_sequence
    system("clear")
    puts "Enter your sequence:"
    self.require_sequence 

    if !game_over
      self.round_success_message
      sleep(1)
      self.sequence_length += 1
    end
  end
  
  def show_sequence
    self.add_random_color
    self.seq.each do |col|
      system("clear")
      print col
      sleep(1)
    end
  end

  def require_sequence
    i = 0
    while i < self.seq.length
      inp = gets.chomp
      if self.seq[i] != inp
        self.game_over = true
        break
      end
      i += 1
    end

  end

  def add_random_color
    seq.push(COLORS.sample)
  end

  def round_success_message
    system("clear")
    puts "Round completed :)"
    sleep(1)
  end

  def game_over_message
    puts "Game Over :("
  end

  def reset_game
    self.seq = Array.new
    self.game_over = false
    self.sequence_length = 1
  end
end
