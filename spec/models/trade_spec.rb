require 'rails_helper'

RSpec.describe Trade, type: :model do
  it 'reference to offer and bid' do
    bid = Bid.create(season: 2019, grade: 'Test', price: 500, quantity: 25)
    offer = Offer.create(season: 2019, grade: 'Test', price: 455, quantity: 20)
    trade = Trade.create(bid: bid, offer: offer)
    expect(trade.offer).to include offer
    epxect(trade.bid).to include bid
  end
end
