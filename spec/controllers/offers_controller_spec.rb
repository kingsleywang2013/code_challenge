require 'rails_helper'

RSpec.describe OffersController, type: :controller do
  it '#index as root path' do
    expect(get: root_url(subdomain: nil)).to route_to(controller: 'offers', action: 'index')
  end

  context '#destroy' do
    before :each do
      @offer = Offer.create(season: 2019, price: 200, quantity: 20, grade: 'Test')
      delete :destroy, params: { id: @offer.id }
    end

    it 'destroys role' do
      expect(Offer.all.size).to be 0
    end
  end

  context '#update' do
    before :each do
      @offer = Offer.create(season: 2019, price: 200, quantity: 20, grade: 'Test')
    end

    it 'update with invalid data' do
      put :update, params: { id: @offer.id, offer: { season: 2019.1 } }
      expect(flash[:error]).to match(/Sorry, your update failed/)
    end

    it 'update with valid data' do
      patch :update, params: { id: @offer.id, offer: { season: 2018 } }
      expect(flash[:success]).to match(/You have updated successfully/)
    end
  end
end
