require 'rails_helper'

RSpec.describe OffersController, type: :controller do
  it '#index as root path' do
    expect(get: root_url(subdomain: nil)).to route_to(controller: 'offers', action: 'index')
  end
end
