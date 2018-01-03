require 'rails_helper'

describe Cart do
  describe "#total_count" do
    subject {Cart.new({"1" => 2, "2" => 3})}
    it "can calculate the total number of items it holds" do
      # cart = Cart.new({"1" => 2, "2" => 3})
      expect(subject.total_count).to eq(5)
    end
    it "can add a dog" do
      # cart = Cart.new({"1" => 2, "2" => 3})
      subject.add_dog(1)
      subject.add_dog(2)

      expect(subject.contents).to eq({"1" => 3, "2" => 4})
    end
    it "can count each dog" do
      expect(subject.count_of(1)).to eq(2)
      expect(subject.count_of(2)).to eq(3)
    end
  end
end