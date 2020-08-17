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
    let(:shuffled_deck) { Deck.new }
    it "shuffles the deck" do
      expect(deck.deck.shuffle) != shuffled_deck.deck
    end
  end
end