class Bid < ApplicationRecord
  validates :quantity, numericality: { greater_than: 0 }
  validates :price, numericality: { greater_than: 0 }

  class << self
    def find_match(offer)
      Bid.where(price: offer.price).first
    end
  end
end
