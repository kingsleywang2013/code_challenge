require 'rails_helper'

RSpec.describe Trade, type: :model do
  it 'reference to offer and bid' do
    bid = Bid.create(season: 2019, grade: 'Test', price: 500, quantity: 25)
    offer = Offer.create(season: 2019, grade: 'Test', price: 455, quantity: 20)
    trade = Trade.create(bid: bid, offer: offer)

    expect(trade.offer).to eq offer
    expect(trade.bid).to eq bid
  end

  it 'get price from bid' do
    bid = Bid.create(season: 2019, grade: 'Test', price: 500, quantity: 25)
    offer = Offer.create(season: 2019, grade: 'Test', price: 455, quantity: 20)
    trade = Trade.create(bid: bid, offer: offer)
    expect(trade.price).to eq bid.price
  end

  it 'get quantity from offer' do
    bid = Bid.create(season: 2019, grade: 'Test', price: 500, quantity: 25)
    offer = Offer.create(season: 2019, grade: 'Test', price: 455, quantity: 20)
    trade = Trade.create(bid: bid, offer: offer)
    expect(trade.quantity).to eq offer.quantity
  end
end
