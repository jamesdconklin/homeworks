require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)!
 Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:brownie) { Dessert.new("brownie", 100) }
  let(:fancy_brownie) do
    fancy = Dessert.new("brownie", 125)
    ings = ['coconut', 'caramel', 'chocolate syrup', 'toffee_chips']
    ings.each { |ing| fancy.add_ingredient(ing) }
    fancy.mix!
    fancy
  end

  describe "#initialize" do
    it "sets a type" do
      expect(brownie.type).to eq("brownie")
    end

    it "sets a quantity" do
      expect(brownie.quantity).to eq(100)
    end

    it "starts ingredients as an empty array" do
      expect(brownie.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cake", "tons") }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      brownie.add_ingredient('coconut')
      expect(brownie.ingredients).to contain_exactly('coconut')
    end
  end

  describe "#mix!" do
    # I'll accept the rare shuffle-into-same-list false negative.
    it "shuffles the ingredient array" do

      expect(fancy_brownie.ingredients).to contain_exactly(
        'coconut', 'caramel', 'chocolate syrup', 'toffee_chips'
      )
      expect(fancy_brownie.ingredients).to_not eq(
        ['coconut', 'caramel', 'chocolate syrup', 'toffee_chips']
      )
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      brownie.eat(25)
      expect(brownie.quantity).to eq(75)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { brownie.eat(125) }.to raise_error("not enough left!")
    end
  end
end
