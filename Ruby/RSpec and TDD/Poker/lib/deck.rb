require_relative 'card.rb'

class Deck

  attr_reader :deck

  def initialize
    # 52 card deck
    @deck = Array.new
    self.populate
  end

  def populate
    # spades
    @deck << Card.new(:spade,:ace)
    @deck << Card.new(:spade,:jack)
    @deck << Card.new(:spade,:queen)
    @deck << Card.new(:spade,:king)
    i = 2
    while i <= 10
      @deck << Card.new(:spade, i)
      i += 1
    end

    # diamonds
    @deck << Card.new(:diamond,:ace)
    @deck << Card.new(:diamond,:jack)
    @deck << Card.new(:diamond,:queen)
    @deck << Card.new(:diamond,:king)
    i = 2
    while i <= 10
      @deck << Card.new(:diamond, i)
      i += 1
    end

    # hearts
    @deck << Card.new(:heart,:ace)
    @deck << Card.new(:heart,:jack)
    @deck << Card.new(:heart,:queen)
    @deck << Card.new(:heart,:king)
    i = 2
    while i <= 10
      @deck << Card.new(:heart, i)
      i += 1
    end
    
    # spades
    @deck << Card.new(:spade,:ace)
    @deck << Card.new(:spade,:jack)
    @deck << Card.new(:spade,:queen)
    @deck << Card.new(:spade,:king)
    i = 2
    while i <= 10
      @deck << Card.new(:heart, i)
      i += 1
    end
  end

  def shuffle
    @deck = @deck.shuffle
  end
end