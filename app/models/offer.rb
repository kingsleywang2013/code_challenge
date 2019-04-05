class Offer < ApplicationRecord
  module Constants
    MAX_QUANTITY = 10_000
    MAX_PRICE = 10_000
  end

  validates :quantity, numericality: { greater_than: 0, less_than_or_equal_to: Constants::MAX_QUANTITY }
  validates :price, numericality: { greater_than: 0, less_than_or_equal_to: Constants::MAX_PRICE }
end
