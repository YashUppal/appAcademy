require 'rspec'
require 'card'

describe "Card" do
  subject(:ace_of_spade) {Card.new(:spade,:ace)}
  describe "#initialize"  do
    it "has a suit" do
      expect(ace_of_spade.suit).to eq(:spade)
    end

    it "has a rank" do
      expect(ace_of_spade.rank).to eq(:ace)
    end

    it "has a color" do
      expect(ace_of_spade.color).to eq(:black)
    end
  end
end