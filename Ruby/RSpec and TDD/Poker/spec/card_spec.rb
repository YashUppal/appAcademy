require 'rspec'
require 'card'

describe "Card" do
  subject(:ace_of_spade) {Card.new("🂡	")}
  describe "#initialize"  do
    it "stores a representation of a card" do
      expect(ace_of_spade.card).to eq("🂡	")
    end
  end
end