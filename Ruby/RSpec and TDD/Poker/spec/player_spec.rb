require 'rspec'
require 'player'

describe "Player" do
  let(:ace_of_spade) { double("ace_of_spade",:suit => :spade, :rank => :ace) }
  let(:jack_of_spade) { double("jack_of_spade",:suit => :spade, :rank => :jack) }
  let(:king_of_spade) { double("king_of_spade",:suit => :spade, :rank => :king) }
  let(:queen_of_spade) { double("queen_of_spade",:suit => :spade, :rank => :queen) }
  let(:ten_of_spade) { double("ten_of_spade",:suit => :spade, :rank => 10) }

  subject(:playa) { Player.new([ace_of_spade,jack_of_spade,king_of_spade,queen_of_spade,ten_of_spade],10) }
  describe "#initialize" do
    it "initializes with a hand" do
      expect(playa.hand).to eq([ace_of_spade,jack_of_spade,king_of_spade,queen_of_spade,ten_of_spade])
    end

    it "intializes with a pot" do
      expect(playa.pot).to eq(10)
    end
  end

  describe "#discard" do
    it "discards the asked cards" do
      allow(playa).to receive(:gets).and_return('0,1')
      playa.discard
      expect(playa.hand).to eq([king_of_spade,queen_of_spade,ten_of_spade])
    end
  end

  describe "#action" do
    it "folds" do
      allow(playa).to receive(:gets).and_return("fold")
      playa.action
      expect(playa.hand).to be_empty
      expect(playa.pot).to eq(0)
    end

    it "bets" do
      current = playa.pot
      allow(playa).to receive(:gets).and_return("bet")
      playa.action
      expect(playa.pot).to eq(9)
    end
  end
end