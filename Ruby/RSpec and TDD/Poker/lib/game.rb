require_relative 'deck.rb'

class Game
  attr_reader :deck, :pot
  def initialize(p1,p2,p3,p4)
    @deck = Deck.new.deck
    @pot = 0
    @players = []

    4.times do
      hand = Array.new
      5.times do
        rand_card = @deck.sample
        hand << rand_card
        @deck.delete(rand_card)
      end

      player = Player.new(hand,10)
      @players << player
    end
  end

  def play
    while true
      @players.each do |player|
        res = player.action
        if res == :fold
          @players.delete(player)
        elsif res == 1
          @pot += 1
        end
      end
      
      if @players.length == 1
        break
      end
    end
  end
end