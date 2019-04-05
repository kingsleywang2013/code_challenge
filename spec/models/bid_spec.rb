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

  describe '#find_match' do
    context 'must match grade and season' do
      it 'not match both conditions' do
        offer = Offer.new
        offer.price = 455
        offer.quantity = 12
        offer.season = 2019
        offer.grade = 'Test1'
        bid = Bid.create(season: 2018, grade: 'Test2', price: 455, quantity: 12)
        expect(Bid.find_match(offer)).not_to eq(bid)
      end

      it 'not match grade' do
        offer = Offer.new
        offer.price = 455
        offer.quantity = 12
        offer.season = 2019
        offer.grade = 'Test1'
        bid = Bid.create(season: 2019, grade: 'Test2', price: 455, quantity: 12)
        expect(Bid.find_match(offer)).not_to eq(bid)
      end

      it 'not match season' do
        offer = Offer.new
        offer.price = 455
        offer.quantity = 12
        offer.season = 2019
        offer.grade = 'Test'
        bid = Bid.create(season: 2018, grade: 'Test', price: 455, quantity: 12)
        expect(Bid.find_match(offer)).not_to eq(bid)
      end

      it 'match both conditions' do
        offer = Offer.new
        offer.price = 455
        offer.quantity = 12
        offer.season = 2019
        offer.grade = 'Test'
        bid = Bid.create(season: 2019, grade: 'Test', price: 455, quantity: 12)
        expect(Bid.find_match(offer)).to eq(bid)
      end
    end

    context 'quantity must greater than offers' do
      it 'quantity less than offers' do
        offer = Offer.new
        offer.price = 455
        offer.quantity = 12
        offer.season = 2019
        offer.grade = 'Test'
        bid = Bid.create(season: 2019, grade: 'Test', price: 455, quantity: 10)
        expect(Bid.find_match(offer)).not_to eq(bid)
      end

      it 'quantity equal than offers' do
        offer = Offer.new
        offer.price = 455
        offer.quantity = 12
        offer.season = 2019
        offer.grade = 'Test'
        bid = Bid.create(season: 2019, grade: 'Test', price: 455, quantity: 12)
        expect(Bid.find_match(offer)).to eq(bid)
      end

      it 'quantity greater than offers' do
        offer = Offer.new
        offer.price = 455
        offer.quantity = 12
        offer.season = 2019
        offer.grade = 'Test'
        bid = Bid.create(season: 2019, grade: 'Test', price: 455, quantity: 20)
        expect(Bid.find_match(offer)).to eq(bid)
      end
    end

    context 'price must greater than offers' do
      it 'price less than offers' do
        offer = Offer.new
        offer.price = 455
        offer.quantity = 12
        offer.season = 2019
        offer.grade = 'Test'
        bid = Bid.create(season: 2019, grade: 'Test', price: 400, quantity: 12)
        expect(Bid.find_match(offer)).not_to eq(bid)
      end

      it 'price equal to offers' do
        offer = Offer.new
        offer.price = 455
        offer.quantity = 12
        offer.season = 2019
        offer.grade = 'Test'
        bid = Bid.create(season: 2019, grade: 'Test', price: 455, quantity: 12)
        expect(Bid.find_match(offer)).to eq(bid)
      end

      it 'price greater than offers' do
        offer = Offer.new
        offer.price = 455
        offer.quantity = 12
        offer.season = 2019
        offer.grade = 'Test'
        bid = Bid.create(season: 2019, grade: 'Test', price: 500, quantity: 12)
        expect(Bid.find_match(offer)).to eq(bid)
      end
    end

    it 'matches with the highest bid' do
      offer = Offer.new
      offer.price = 455
      offer.quantity = 12

      # bids
      highest_bid = Bid.create(price: 485, quantity: 50)
      second_bid = Bid.create(price: 475, quantity: 50)
      last_bid = Bid.create(price: 465, quantity: 50)

      expect(Bid.find_match(offer)).to eq(highest_bid)
      expect(Bid.find_match(offer)).not_to eq(second_bid)
      expect(Bid.find_match(offer)).not_to eq(last_bid)
    end

    it 'choose first create bid if max prices are the same' do
      offer = Offer.new
      offer.price = 455
      offer.quantity = 12
      offer.season = 2019
      offer.grade = 'Test'

      # bids
      first_create_highest_bid = Bid.create(season: 2019, grade: 'Test', price: 485, quantity: 50)
      second_create_highest_bid = Bid.create(season: 2019, grade: 'Test', price: 485, quantity: 50)
      last_bid = Bid.create(season: 2019, grade: 'Test', price: 465, quantity: 50)

      expect(Bid.find_match(offer)).to eq(first_create_highest_bid)
      expect(Bid.find_match(offer)).not_to eq(second_create_highest_bid)
      expect(Bid.find_match(offer)).not_to eq(last_bid)
    end
  end
end
