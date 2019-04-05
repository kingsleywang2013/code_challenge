class AddBidOfferReferencesToTrades < ActiveRecord::Migration[5.2]
  def change
    add_reference :trades, :offer, index: true
    add_foreign_key :trades, :offers
    add_reference :trades, :bid, index: true
    add_foreign_key :trades, :bids
  end
end
