class Bid < ApplicationRecord
  has_many :trades

  validates :quantity, numericality: { greater_than: 0 }
  validates :price, numericality: { greater_than: 0 }

  scope :match_season_grade, ->(offer) { where(season: offer.season).where(grade: offer.grade) }
  scope :match_quantity_rule, ->(offer) { where('quantity >= ?', offer.quantity) }
  scope :match_price_rule, ->(offer) { where('price >= ?', offer.price) }
  scope :order_by_max_price_first_create, -> { order(price: :desc).order(created_at: :asc) }

  class << self
    def find_match(offer)
      Bid.match_season_grade(offer)
          .match_quantity_rule(offer)
          .match_price_rule(offer)
          .order_by_max_price_first_create.first
    end
  end
end
