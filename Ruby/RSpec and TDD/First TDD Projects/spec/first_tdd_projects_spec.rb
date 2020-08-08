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

  
end