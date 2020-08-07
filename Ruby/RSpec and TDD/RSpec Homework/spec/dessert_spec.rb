require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:cake) { Dessert.new("cake",3,chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(cake.type).to eq("cake")
    end

    it "sets a quantity" do
      expect(cake.quantity).to eq(3)
    end 

    it "starts ingredients as an empty array" do
      expect(cake.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect do
        subject(:cake) { Cake.new("cake","a lot",chef) }
      end.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    let(:chef) { double("chef") }
    subject(:cake) { Dessert.new("cake",3,chef) }

    it "adds an ingredient to the ingredients array" do
      cake.add_ingredient("milk")
      cake.add_ingredient("flour")
      expect(cake.ingredients).to include("flour") and include("milk")
    end
  end

  describe "#mix!" do
    let(:ingredients)  { cake.ingredients }
    it "shuffles the ingredient array" do
      cake.mix!
      expect(:ingredients).to_not eq(cake.ingredients)
    end
  end

  describe "#eat" do
    let(:quantity) { cake.quantity }
    
    it "subtracts an amount from the quantity" do
      cake.eat(1)
      expect(cake.quantity).to_not eq(:quantity)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect do
        cake.eat(100)
      end.to raise_error(RuntimeError)
    end
  end

  describe "#serve" do
    let(:chef) { double("John Doe", :titleize => "John Doe", :bake => nil) }
    subject(:cake) { Dessert.new("cake",4,chef) }

    it "contains the titleized version of the chef's name" do
      expect(cake.serve).to include("John Doe")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(cake)
      cake.make_more
    end
  end
end
