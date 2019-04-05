class Trade < ApplicationRecord
  belongs_to :offer
  belongs_to :bid

  def price
    bid.price
  end

  def quantity
    offer.quantity
  end
end
