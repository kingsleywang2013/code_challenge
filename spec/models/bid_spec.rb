require 'rails_helper'

RSpec.describe Bid, type: :model do
  subject { described_class.new }

  it 'raises an error when the price is negative' do
    subject.price = -12; subject.quantity = 12;
    expect(subject).to_not be_valid
  end

  it 'does not raise an error when the price is positive' do
    subject.price = 12; subject.quantity = 12;
    expect(subject).to be_valid
  end

  describe "find_match" do

    it 'matches with the highest bid' do
      offer = Offer.new
      offer.price = 455
      offer.quantity = 12
      bid = Bid.create(price: 455, quantity: 12)
      expect(Bid.find_match(offer)).to eq(bid)
    end

    it 'matches with the highest bid' do
      offer = Offer.new
      offer.price = 455
      offer.quantity = 12

      # bids
      highest_bid = Bid.create(price: 485, quantity: 50)
      Bid.create(price: 475, quantity: 50)
      Bid.create(price: 465, quantity: 50)

      expect(Bid.find_match(offer)).to eq(highest_bid)
    end

  end
end
