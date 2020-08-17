class Player
  attr_reader :hand, :pot
  def initialize(hand,pot)
    @hand = hand
    @pot = pot
  end

  def discard
    hand_render = Array.new
    @hand.each do |card|
      hand_render << "#{card.rank} of #{card.suit}"
    end
    puts hand_render
    puts "Which cards would you like to discard?"
    dis = gets.chomp.split(",").map(&:to_i)

    dis.each do |i|
      @hand[i] = "X"
    end

    @hand.delete("X")
  end

  def action
    puts "What would you like to do?"
    action = gets.chomp

    if action == "fold"
      @hand = []
      @pot = 0
    elsif action == "bet"
      @pot -= 1
    end
  end
end