class Card
  attr_reader :suit, :rank, :color

  def initialize(suit,rank)
    @suit = suit
    @rank = rank
    if suit == :club || suit == :spade
      @color = :black
    else
      @color = :red
    end
  end
end