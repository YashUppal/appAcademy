require 'rspec'
require 'first_tdd_projects'

describe Array do
  describe  "#my_uniq" do
    subject(:arr) { Array.new([1,2,3,1,2,5]) }
    it "is called on an array" do
      expect {arr.my_uniq}.to_not raise_error
    end

    it "returns uniq elements only" do
      expect(arr.my_uniq).to eq([1,2,3,5])
    end
  end

  describe "#two_sum" do
    subject(:arr) { Array.new([-1,0,2,-2,1]) }
    it "is called on an array" do
      expect {arr.two_sum}.to_not raise_error
    end

    it "it returns pairs of positions, where elements sum to zero" do
      expect(arr.two_sum).to eq([[0,4],[2,3]])
    end
  end

  describe "#my_transpose" do
    subject(:arr) { Array.new([[0,1,2],[3,4,5],[6,7,8]]) }
    it "is called on an array" do
      expect {arr.my_transpose}.to_not raise_error
    end

    it "transpose the given matrix" do
      expect(arr.my_transpose).to eq([[0,3,6],[1,4,7],[2,5,8]])
    end
  end
end

describe TowerOfHanoi do
  describe "#initialize" do
    subject(:tower) { TowerOfHanoi.new }
    it "initializes three piles" do
      expect(tower.pile_one).to eq([4,3,2,1])
      expect(tower.pile_two).to be_empty
      expect(tower.pile_three).to be_empty
    end
  end

  describe "#move" do
    subject(:tower) { TowerOfHanoi.new }
    it "moves topmost disc from one pile to another" do
      expect(tower.pile_one.last).to eq(1)
      tower.move("pile_one","pile_two")
      expect(tower.pile_one.last).to eq(2)
      expect(tower.pile_two.last).to eq(1)
    end
    
    it "raises error if trying to place bigger disc on smaller" do
      tower.move("pile_one","pile_two")
      expect{tower.move("pile_one","pile_two")}.to raise_error(ArgumentError)
    end
  end
  
  describe "#won?" do
  subject(:tower) { TowerOfHanoi.new }
  it "checks whether any pile is correctly arranged" do
    tower.move("pile_one","pile_two")
    expect(tower.won?).to be false
    tower.move("pile_two","pile_one")
    expect(tower.won?).to be true
    end
  end
end