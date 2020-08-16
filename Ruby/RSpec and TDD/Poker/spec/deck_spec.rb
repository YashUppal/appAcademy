require "deck"
require "rspec"

describe "Deck" do
  subject(:deck) {Deck.new}
  describe "#initialize" do
    it "initializes a 52 card deck" do
      expect(deck.deck.length).to eq(52)
    end
  end

  describe "#shuffle" do
    it "shuffles the deck of cards" do
      deck.shuffle
      expect(deck.deck) != ["🂡","🂢", "🂣", "🂤", "🂥", "🂦", "🂧", "🂨", "🂩", "🂪", "🂫", "🂭", "🂮","🂱", "🂲", "🂳", "🂴", "🂵", "🂶", "🂷", "🂸", "🂹", "🂺", "🂻", "🂽", "🂾","🃁", "🃂", "🃃", "🃄", "🃅", "🃆", "🃇", "🃈", "🃉", "🃊", "🃋", "🃍", "🃎","🃑", "🃒", "🃓", "🃔", "🃕", "🃖", "🃗", "🃘", "🃙", "🃚", "🃛", "🃝", "🃞"]
    end
  end
end