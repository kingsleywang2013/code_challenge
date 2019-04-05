require 'rails_helper'

RSpec.describe Offer, type: :model do
  it 'price should greater than 0' do
    offer = Offer.create(price: -10)
    expect(offer).not_to be_valid
  end

  it 'quantity should greater than 0' do
    offer = Offer.create(quantity: -10)
    expect(offer).not_to be_valid
  end

  it 'price should less than 10_000' do
    offer = Offer.create(price: 10_001)
    expect(offer).not_to be_valid
  end

  it 'quantity should greater than 10_000' do
    offer = Offer.create(quantity: 10_001)
    expect(offer).not_to be_valid
  end
end
