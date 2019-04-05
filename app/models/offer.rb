class Offer < ApplicationRecord
  module Constants
    MAX_QUANTITY = 10_000
    MAX_PRICE = 10_000
  end

  has_many :trades

  validates :quantity, numericality: { greater_than: 0, less_than_or_equal_to: Constants::MAX_QUANTITY }
  validates :price, numericality: { greater_than: 0, less_than_or_equal_to: Constants::MAX_PRICE }
  validates :season, numericality: { greater_than: 0, only_integer: true }
end
