require "hand"
require "rspec"

describe "Hand" do
  let(:ace_of_spade) { double("ace_of_spade",:suit => :spade, :rank => :ace) }
  let(:jack_of_spade) { double("jack_of_spade",:suit => :spade, :rank => :jack) }
  let(:king_of_spade) { double("king_of_spade",:suit => :spade, :rank => :king) }
  let(:queen_of_spade) { double("queen_of_spade",:suit => :spade, :rank => :queen) }
  let(:ten_of_spade) { double("ten_of_spade",:suit => :spade, :rank => 10) }

  let(:eight_of_club) { double("eight_of_club",:suit => :club, :rank => 8)}
  let(:seven_of_club) { double("seven_of_club",:suit => :club, :rank => 7)}
  let(:six_of_club) { double("six_of_club",:suit => :club, :rank => 6)}
  let(:five_of_club) { double("five_of_club",:suit => :club, :rank => 5)}
  let(:four_of_club) { double("four_of_club",:suit => :club, :rank => 4)}

  let(:jack_of_heart) { double("jack_of_heart",:suit => :heart, :rank => :jack) }
  let(:jack_of_diamond) { double("jack_of_diamond",:suit => :diamond, :rank => :jack) }
  let(:jack_of_club) { double("jack_of_club",:suit => :club, :rank => :jack) }
  let(:jack_of_spade) { double("jack_of_spade",:suit => :spade, :rank => :jack) }
  let(:seven_of_diamond) { double("seven_of_diamond",:suit => :diamond, :rank => :seven) }

  let(:ten_of_heart) { double("ten_of_heart", :suit => :heart, :rank => 10) }
  let(:ten_of_diamond) { double("ten_of_diamond", :suit => :diamond, :rank => 10) }
  let(:ten_of_spade) { double("ten_of_spade", :suit => :spade, :rank => 10) }
  let(:nine_of_club) { double("nine_of_club", :suit => :club, :rank => 9) }
  let(:nine_of_diamond) { double("nine_of_diamond", :suit => :diamond, :rank => 9) }

  let(:four_of_spade) { double("four_of_spade",:suit => :spade, :rank => 4) }
  let(:jack_of_spade) { double("jack_of_spade",:suit => :spade, :rank => :jack) }
  let(:eight_of_spade) { double("eight_of_spade",:suit => :spade, :rank => 8) }
  let(:two_of_spade) { double("two_of_spade",:suit => :spade, :rank => 2) }
  let(:nine_of_spade) { double("nine_of_spade",:suit => :spade, :rank => 9) }

  let(:nine_of_club) { double("nine_of_club",:suit => :club, :rank => 9) }
  let(:eight_of_diamond) { double("eight_of_diamond",:suit => :diamond, :rank => 8) }
  let(:seven_of_spade) { double("seven_of_spade",:suit => :spade, :rank => 7) }
  let(:six_of_diamond) { double("six_of_diamond",:suit => :diamond, :rank => 6) }
  let(:five_of_heart) { double("five_of_heart",:suit => :heart, :rank => 5) }

  let(:seven_of_club) { double("seven_of_club",:suit => :club, :rank => 7) }
  let(:seven_of_diamond) { double("seven_of_diamond",:suit => :diamond, :rank => 7) }
  let(:seven_of_spade) { double("seven_of_spade",:suit => :spade, :rank => 7) }
  let(:king_of_club) { double("king_of_club",:suit => :club, :rank => :king) }
  let(:three_of_diamond) { double("three_of_diamond",:suit => :diamond, :rank => 3) }

  let(:four_of_club) { double("four_of_club",:suit => :club, :rank => 4) }
  let(:four_of_spade) { double("four_of_spade",:suit => :spade, :rank => 4) }
  let(:three_of_club) { double("three_of_club",:suit => :club, :rank => 3) }
  let(:three_of_diamond) { double("three_of_diamond",:suit => :diamond, :rank => 3) }
  let(:queen_of_club) { double("queen_of_club",:suit => :club, :rank => :queen) }

  let(:ace_of_heart) { double("ace_of_heart", :suit => :heart, :rank => :ace) }
  let(:ace_of_diamond) { double("ace_of_diamond", :suit => :diamond, :rank => :ace) }
  let(:eight_of_club) { double("eight_of_club", :suit => :club, :rank => 8) }
  let(:four_of_spade) { double("four_of_spade", :suit => :spade, :rank => 4) }
  let(:seven_of_heart) { double("seven_of_heart", :suit => :heart, :rank => 7) }


  let(:three_of_diamond) { double("three_of_diamond", :suit => :diamond, :rank => 3) }
  let(:jack_of_club) { double("jack_of_club", :suit => :club, :rank => :jack) }
  let(:eight_of_spade) { double("eight_of_spade", :suit => :spade, :rank => 8) }
  let(:four_of_heart) { double("four_of_heart", :suit => :heart, :rank => 4) }
  let(:two_of_spade) { double("two_of_spade", :suit => :spade, :rank => 2) }
  

  subject(:royal_flush) {Hand.new([ace_of_spade,jack_of_spade,king_of_spade,queen_of_spade,ten_of_spade])}
  subject(:straight_flush) {Hand.new([eight_of_club,seven_of_club,six_of_club,five_of_club,four_of_club])}
  subject(:four_of_a_kind) { Hand.new([jack_of_heart,jack_of_diamond,jack_of_club,jack_of_spade,seven_of_diamond]) }
  subject(:full_house) { Hand.new([ten_of_heart,ten_of_diamond,ten_of_spade,nine_of_club,nine_of_diamond]) }
  subject(:flush) { Hand.new([four_of_spade,jack_of_spade,eight_of_spade,two_of_spade,nine_of_spade]) }
  subject(:straight) { Hand.new([nine_of_club,eight_of_diamond,seven_of_spade,six_of_diamond,five_of_heart]) }
  subject(:three_of_a_kind) { Hand.new([seven_of_club,seven_of_diamond,seven_of_spade,king_of_club,three_of_diamond]) }
  subject(:two_pair) { Hand.new([four_of_club,four_of_spade,three_of_club,three_of_diamond,queen_of_club]) }
  subject(:pair) { Hand.new([ace_of_heart,ace_of_diamond,eight_of_club,four_of_spade,seven_of_heart]) }
  subject(:high_card) { Hand.new([three_of_diamond,jack_of_club,eight_of_spade,four_of_heart,two_of_spade]) }
  

  describe "#initialize" do
    it "is a collection of 5 cards" do
      expect(royal_flush.hand.length).to eq(5)
    end
  end

  describe "#rank" do
    it "calculates the rank of the hand" do
      expect(royal_flush.rank).to eq(:royal_flush)
      expect(straight_flush.rank).to eq(:straight_flush)
      expect(four_of_a_kind.rank).to eq(:four_of_a_kind)
      expect(full_house.rank).to eq(:full_house)
      expect(flush.rank).to eq(:flush)
      expect(straight.rank).to eq(:straight)
      expect(three_of_a_kind.rank).to eq(:three_of_a_kind)
      expect(two_pair.rank).to eq(:two_pair)
      expect(pair.rank).to eq(:pair)
      expect(high_card.rank).to eq(:jack)
      expect(royal_flush.beats).to include(:high_card)
      expect(high_card.beats).to_not include(:straigh_flush)
    end

  end
end