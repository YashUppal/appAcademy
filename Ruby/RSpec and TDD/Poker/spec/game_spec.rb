require 'game'
require 'rspec'

describe "Game" do

# [ace_of_spade,jack_of_spade,king_of_spade,queen_of_spade,ten_of_spade]
# [eight_of_club,seven_of_club,six_of_club,five_of_club,four_of_club]
# [jack_of_heart,jack_of_diamond,jack_of_club,jack_of_spade,seven_of_diamond]
# [ten_of_heart,ten_of_diamond,ten_of_spade,nine_of_club,nine_of_diamond]

  let(:p1) { double("p1",:hand => [], :pot => 10) }
  let(:p2) { double("p2",:hand => [], :pot => 10) }
  let(:p3) { double("p3",:hand => [], :pot => 10) }
  let(:p4) { double("p4",:hand => [], :pot => 10) }
  
  subject(:game) { Game.new(p1,p2,p3,p4) }
  describe "#initialize" do
    it "initializes a deck" do
      expect(game.deck.length).to eq(52) 
    end

    it "initializes a pot" do
      expect(game.pot).to eq(0)
    end
  end
end